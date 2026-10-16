# =============================================================================
# DS 3030 - Cross-Validation in Practice: in-class activity
#
# Which Stack Overflow developers work remotely?
#
# Work in groups of 3 or 4. One person runs the script and shares the screen;
# everyone discusses. Run the script one Part at a time (in RStudio, select a
# Part and press Ctrl/Cmd + Enter), read the output, and talk through the
# QUESTIONs in the comments before moving on. Write your group's answers on
# paper or in a shared document, not in this file.
#
# Almost all of the code runs as given. Lines marked "YOUR TURN" are places
# where your group makes a choice; each has a sensible default, so the
# script still runs if you leave it alone.
#
# What you are practicing:
#   - splitting off test data before doing anything else,
#   - comparing classifiers by the area under the ROC curve (AUC), against
#     the benchmark AUC of 0.5, and by the error rate, against the benchmark
#     of always predicting the most common class,
#   - choosing among classifiers (logistic regression, LDA, KNN with several
#     K) by 10-fold cross-validation on the training data only, with every
#     data-dependent step (here, standardization) done inside the folds,
#   - refitting the chosen classifier to all the training data and evaluating
#     it once on the test data, and
#   - deciding which AUC and error rate to report, and why.
# =============================================================================


# -----------------------------------------------------------------------------
# Setup
# -----------------------------------------------------------------------------

# MASS is loaded before the tidyverse so that dplyr::select() is the select()
# you get; MASS also has a function called select().
library("MASS")       # lda()
library("tidyverse")
library("modeldata")  # the stackoverflow data
library("class")      # knn()
# yardstick::roc_auc_vec() computes the AUC; yardstick is installed with the
# tidymodels packages.

set.seed(20261016)

# The data: 5,594 developers in five countries who answered Stack Overflow's
# annual Developer Survey.
#
# Response variable
#   Remote              "Remote" or "Not remote": does the developer work
#                       remotely?
#
# Explanatory variables
#   Country             Canada, Germany, India, United Kingdom, United States
#   Salary              annual salary in US dollars
#   YearsCodedJob       years spent coding professionally
#   CompanySizeNumber   company size category, coded as a number of employees
#                       (1, 10, 20, 100, 500, 1,000, 5,000, or 10,000)
#   CareerSatisfaction  self-rated, 0 (lowest) to 10 (highest)
#   OpenSource          1 if the developer contributes to open source, else 0
#   Hobby               1 if the developer codes as a hobby, else 0
#   Data_scientist, ..., Web_developer
#                       13 indicators, 1 if the developer describes their
#                       work as that type (a developer can be several types)
data(stackoverflow, package = "modeldata")

so <- stackoverflow |>
  mutate(
    # Make "Not remote" the first level, so that glm() models the probability
    # of "Remote", the class of interest.
    Remote = fct_relevel(Remote, "Not remote"),
    # The company size codes run from 1 to 10,000 employees, four orders of
    # magnitude and right-skewed: the few largest categories would pull on the
    # linear predictor of logistic regression and LDA, and would be the
    # extreme values of a standardized KNN feature. Its base-10 logarithm
    # spreads the eight categories out more evenly, so it is used instead and
    # the raw column is dropped.
    # Salary stays on its raw scale.
    log10_CompanySize = log10(CompanySizeNumber)
  ) |>
  select(-CompanySizeNumber)

glimpse(so)


# -----------------------------------------------------------------------------
# Part 1: Split off the test data
# -----------------------------------------------------------------------------

# 80% of the developers become training data and 20% become test data. The
# test data stay untouched until Part 5: no plots of them, no counts, no
# fitting, no choosing. Everything in Parts 2, 3, and 4 uses `train` only.
test_id <- sample(nrow(so), round(0.2 * nrow(so)))
train <- so[-test_id, ]
test  <- so[test_id, ]

nrow(train)
nrow(test)


# -----------------------------------------------------------------------------
# Part 2: Look at the training data and compute the benchmarks
# -----------------------------------------------------------------------------

# How common is each class?
count(train, Remote) |>
  mutate(proportion = n / sum(n))

# Remote work by country.
ggplot(train, aes(x = Country, fill = Remote)) +
  geom_bar(position = "fill") +
  scale_fill_manual(values = c(`Not remote` = "grey70", Remote = "#D55E00")) +
  labs(y = "Proportion of training developers", fill = NULL)

# Salary for remote and non-remote developers. The lines inside each violin
# are the quartiles and the median.
ggplot(train, aes(x = Remote, y = Salary)) +
  geom_violin(fill = "grey90", scale = "width",
              quantiles = c(0.25, 0.5, 0.75), quantile.linetype = "solid") +
  labs(x = NULL, y = "Salary (US dollars)")

# YOUR TURN: make one more plot of Remote against an explanatory variable of
# your choice. Change YearsCodedJob below to another numeric column, such as
# CareerSatisfaction or log10_CompanySize. (For a 0/1 column such as Hobby,
# copy the Country bar chart above instead.)
ggplot(train, aes(x = Remote, y = YearsCodedJob)) +
  geom_violin(fill = "grey90", scale = "width",
              quantiles = c(0.25, 0.5, 0.75), quantile.linetype = "solid") +
  labs(x = NULL)

# The benchmark classifier ignores every explanatory variable and predicts
# the most common class, "Not remote", for every developer. Its error rate
# is the proportion of developers who are remote; this is the benchmark
# error rate for Part 4.
benchmark_error <- mean(train$Remote == "Remote")
benchmark_error

# The benchmark classifier gives every developer the same probability of
# being remote, so it cannot rank remote developers above non-remote ones:
# its AUC is 0.5, the benchmark AUC.
benchmark_auc <- 0.5

# QUESTION 1. The always-Not-remote benchmark is right for about 90% of
# developers. Why is 90% accuracy not impressive here? What error rate, and
# what AUC, would a classifier have to reach before you would call it useful?


# -----------------------------------------------------------------------------
# Part 3: Cross-validation helper code (provided; read it, no edits needed)
# -----------------------------------------------------------------------------

# Every classifier below is written as a function of two data sets:
#   classify(fit_data, new_data)
# It fits the classifier to `fit_data` and returns the estimated probability
# that each row of `new_data` is "Remote". Writing them all the same way lets
# one cross-validation function handle any of them.

# Logistic regression on all the explanatory variables. glm() turns Country
# into 4 indicator (dummy) variables, with Canada as the reference.
classify_logistic <- function(fit_data, new_data) {
  fit <- glm(Remote ~ ., family = binomial, data = fit_data)
  predict(fit, new_data, type = "response")
}

# LDA on all the explanatory variables: the posterior probability of
# "Remote".
classify_lda <- function(fit_data, new_data) {
  fit <- lda(Remote ~ ., data = fit_data)
  predict(fit, new_data)$posterior[, "Remote"]
}

# KNN needs a numeric matrix of features. model.matrix() turns Country into
# 4 indicator columns, as glm() does; [, -1] drops the intercept column.
knn_features <- function(data) {
  model.matrix(Remote ~ ., data = data)[, -1]
}

# make_knn(K) returns a KNN classifier with K neighbors. Standardization is
# part of the classifier: the means and standard deviations come from
# `fit_data` only and are then applied to `new_data`. Inside
# cross-validation, `fit_data` is the training folds, so the held-out fold
# never influences the scaling. knn(..., prob = TRUE) reports the proportion
# of the neighbors' votes won by the predicted class; the estimated
# probability of "Remote" is that proportion when the predicted class is
# "Remote" and one minus it otherwise.
make_knn <- function(K) {
  function(fit_data, new_data) {
    x_fit <- knn_features(fit_data)
    x_new <- knn_features(new_data)
    center <- colMeans(x_fit)
    spread <- apply(x_fit, 2, sd)
    cls <- knn(train = scale(x_fit, center, spread),
               test  = scale(x_new, center, spread),
               cl = fit_data$Remote, k = K, prob = TRUE)
    ifelse(cls == "Remote", attr(cls, "prob"), 1 - attr(cls, "prob"))
  }
}

# Error rate and AUC of estimated probabilities `p` of "Remote" for the
# classes `y`. A developer is classified as remote when p > 0.5.
error_rate <- function(y, p) mean((p > 0.5) != (y == "Remote"))
auc <- function(y, p) yardstick::roc_auc_vec(y, p, event_level = "second")

# k-fold cross-validation of a classifier. `fold` gives the fold (1, ..., k)
# of every row of `data`. For each fold, the classifier is fit to the other
# folds and predicts the held-out fold; the error rate and the AUC on the
# held-out fold are then averaged over the k folds.
cv_scores <- function(classify, data, fold) {
  scores <- map(sort(unique(fold)), \(l) {
    held_out <- fold == l
    p <- classify(data[!held_out, ], data[held_out, ])
    y <- data$Remote[held_out]
    c(error = error_rate(y, p), AUC = auc(y, p))
  })
  colMeans(do.call(rbind, scores))
}

# One random assignment of the TRAINING rows to 10 folds, used for every
# classifier, so all of them are compared on exactly the same held-out
# developers.
n_folds <- 10
fold <- sample(rep(1:n_folds, length.out = nrow(train)))
table(fold)


# -----------------------------------------------------------------------------
# Part 4: Compare classifiers by cross-validation on the training data
# -----------------------------------------------------------------------------

# The candidate classifiers: logistic regression, LDA, and KNN with each K in
# K_grid. With about 4,500 training developers, K up to a few hundred is
# reasonable.
# YOUR TURN: add or remove values of K. Keep them odd, to avoid tied votes,
# and below 500: for K of 501 or more, knn() stops with "too many ties".
K_grid <- c(1, 5, 15, 35, 75, 151, 301, 401)

candidates <- c(
  list(`Logistic regression` = classify_logistic,
       LDA = classify_lda),
  set_names(map(K_grid, make_knn), paste0("KNN, K = ", K_grid))
)

# Cross-validate every candidate (this takes a few seconds). The largest AUC
# is listed first.
cv_results <- map(candidates, cv_scores, data = train, fold = fold) |>
  map(as_tibble_row) |>
  list_rbind(names_to = "model") |>
  select(model, AUC, error) |>
  arrange(desc(AUC))
cv_results

# The cross-validation AUC of KNN against 1/K, with the benchmark AUC of 0.5
# as a dashed line.
cv_results |>
  filter(str_starts(model, "KNN")) |>
  mutate(K = parse_number(model)) |>
  ggplot(aes(x = 1 / K, y = AUC)) +
  geom_line() +
  geom_point() +
  geom_hline(yintercept = benchmark_auc, linetype = "dashed") +
  scale_x_log10() +
  labs(x = "Flexibility 1/K (log scale)",
       y = "10-fold cross-validation AUC",
       title = "KNN on the training data; dashed line: benchmark AUC of 0.5")

# Choose a classifier. By default this takes the largest cross-validation
# AUC.
# YOUR TURN: if your group prefers another candidate (for example, a simpler
# one whose AUC is almost as large), replace the right-hand side with its
# name in quotes, exactly as it appears in cv_results$model.
chosen <- cv_results$model[which.max(cv_results$AUC)]
chosen

# QUESTION 2. How do the cross-validation AUCs compare with the benchmark AUC
# of 0.5, and the cross-validation error rates with the always-Not-remote
# benchmark error rate on the training data? Which candidates are better
# than the benchmark by each measure, and by how much?
#
# QUESTION 3. Look at the predictions of the chosen classifier on the
# held-out folds (run the next lines). How many developers does it predict to
# be remote? What does that tell you about where its errors come from, and
# about why the error rates in Part 4 differ so little?
cv_prob <- numeric(nrow(train))
for (l in 1:n_folds) {
  held_out <- fold == l
  cv_prob[held_out] <- candidates[[chosen]](train[!held_out, ],
                                            train[held_out, ])
}
cv_predicted <- factor(if_else(cv_prob > 0.5, "Remote", "Not remote"),
                       levels = levels(train$Remote))
table(predicted = cv_predicted, actual = train$Remote)


# -----------------------------------------------------------------------------
# Part 5: Refit to all the training data and evaluate once on the test data
# -----------------------------------------------------------------------------

# Refit the chosen classifier to all the training data and predict the test
# developers. Run this once, after your group has made its choice in Part 4.
chosen
test_prob <- candidates[[chosen]](train, test)
test_auc <- auc(test$Remote, test_prob)
test_error <- error_rate(test$Remote, test_prob)

test_predicted <- factor(if_else(test_prob > 0.5, "Remote", "Not remote"),
                         levels = levels(test$Remote))
table(predicted = test_predicted, actual = test$Remote)

chosen_cv <- filter(cv_results, model == chosen)
tibble(
  quantity = c("Cross-validation (training data), chosen classifier",
               "Test data, chosen classifier",
               "Test data, always-Not-remote benchmark"),
  AUC = c(chosen_cv$AUC, test_auc, benchmark_auc),
  error = c(chosen_cv$error, test_error, mean(test$Remote == "Remote"))
)


# -----------------------------------------------------------------------------
# Part 6: Discussion
# -----------------------------------------------------------------------------

# QUESTION 4. How do the test AUC and test error rate of the chosen
# classifier compare with the benchmark AUC of 0.5 and the always-Not-remote
# benchmark error rate? Would you deploy the chosen classifier?
#
# QUESTION 5. How far is the cross-validation AUC of the chosen classifier
# from its test AUC? In which direction would you expect the difference to
# go, and why? (Think about how the chosen classifier was chosen.)
#
# QUESTION 6. Suppose your group had tried 100 more candidate classifiers
# (more values of K, other sets of explanatory variables) and again kept the
# one with the largest cross-validation AUC. What would you expect to happen
# to that largest cross-validation AUC? To the test AUC of the classifier it
# picks?
#
# QUESTION 7. List every choice made in this script: the transformation in
# Setup, the candidate list, K_grid, the chosen classifier. Which of them
# used the test data? Which used the training data? Which used neither?
#
# QUESTION 8. You have one number to report for how well your classifier will
# work on developers it has not seen. Which number do you report, and what
# else would you report alongside it? If, after seeing the test AUC, you went
# back to Part 4 and chose a different classifier, could you still report
# that test AUC in the same way?


# -----------------------------------------------------------------------------
# Try this (if your group finishes early)
# -----------------------------------------------------------------------------

# 1. Add a feature. For example, add an interaction or a squared term to
#    logistic regression by writing a new function like classify_logistic()
#    with a different formula, e.g. Remote ~ . + YearsCodedJob:Salary,
#    add it to `candidates`, and rerun Part 4.
#
# 2. Change the number of folds: set n_folds to 5 (or 20), rebuild `fold`,
#    and rerun Part 4. Does the choice change? Do the AUCs and error rates?
#
# 3. Repeat with another seed: change the number in set.seed() at the top and
#    rerun everything. Which numbers change, and by how much? Does the chosen
#    classifier change?
#
# 4. Lower the threshold. The error rate counts both kinds of mistakes
#    equally, and with about 10% remote developers a threshold of 0.5 rarely
#    predicts "Remote". In error_rate(), replace 0.5 by 0.1 (or by the
#    training proportion of remote developers), rerun Parts 3 and 4, and look
#    at the confusion matrix in Question 3. Which column of cv_results
#    changes, and which does not? Why?
