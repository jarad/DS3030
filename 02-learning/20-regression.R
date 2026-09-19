# author: Jarad Niemi
# date:   2026-09-01
# purpose: example of bias variance trade-off in regression
# ------------------------------------------------------------------------------
library("tidyverse"); theme_set(theme_bw())
library("MASS")

# Exploratory data analysis:
#   - observations are census tracks in Boston
#   - medv is the median value of owner-occupied homes in $1000s
#   - lstat is computed on a census track basis and is the average of 
#     - percentage of adults who do NOT have at least some high school education
#     - percentage of adults who are classified as laborers
# 
summary(Boston[c("lstat", "medv")])

g <- ggplot(Boston,
       aes(x = lstat, y = medv)) +
    geom_point() +
    geom_smooth(se = FALSE) +
    labs(
        x     = "Percent of lower status population",
        y     = "Median value of owner-occupied homes in $1000s",
        title = "Boston housing data"
    )

g


set.seed(20260902) # for reproducible results
n <- dim(Boston)[1]
train_index  <- sample.int(n, size = n / 2, replace = FALSE)
train_boston <- Boston[ train_index, ]
test_boston  <- Boston[-train_index, ]


# Fit models and calculate train and test MSE
# Fitting models of order 1 (linear) to order 9 in lstat
train_predict <- test_predict <- list()
for (i in 1:9) {
    m <- lm(medv ~ poly(lstat, i),      data = train_boston)
    train_predict[[i]] <- predict(m, newdata = train_boston)
    test_predict[[ i]] <- predict(m, newdata =  test_boston)
}


# Train MSE
mse_train <- train_boston |> 
  dplyr::select(lstat, medv) |>
  mutate(
    order1 = train_predict[[1]],
    order2 = train_predict[[2]],
    order3 = train_predict[[3]],
    order4 = train_predict[[4]],
    order5 = train_predict[[5]],
    order6 = train_predict[[6]],
    order7 = train_predict[[7]],
    order8 = train_predict[[8]],
    order9 = train_predict[[9]],
  ) |>
  pivot_longer(
    cols      = starts_with("order"),
    names_to  = "model",
    values_to = "prediction"
  ) |>
  group_by(model) |>
  summarize(
    mse = mean((medv-prediction)^2)         
  )


# Test MSE
mse_test <- test_boston |> 
  dplyr::select(lstat, medv) |>
  mutate(
    order1 = test_predict[[1]],
    order2 = test_predict[[2]],
    order3 = test_predict[[3]],
    order4 = test_predict[[4]],
    order5 = test_predict[[5]],
    order6 = test_predict[[6]],
    order7 = test_predict[[7]],
    order8 = test_predict[[8]],
    order9 = test_predict[[9]]
  ) |>
  pivot_longer(
    cols      = starts_with("order"),
    names_to  = "model",
    values_to = "prediction"
  ) |>
  group_by(model) |>
  summarize(
    mse = mean((medv-prediction)^2)         
  )


# Plot train and test MSE
mse <- bind_rows(
    mse_train |> mutate(type = "train"),
    mse_test  |> mutate(type = "test" )
)

g_bv <- ggplot(mse, aes(x = model, y = mse, 
                color = type, linetype = type, group = type)) +
    geom_line() + 
    theme(
      axis.text.x = element_text(angle = 45, hjust = 1),
      legend.position = "bottom") +
    labs(
        x     = "Flexibilty", 
        y     = "Mean squared error",    
        title = "Bias-variance tradeoff")

g_bv

ggsave(g_bv, filename = "02-2-regression-bias-variance-tradeoff.jpg", 
       width = 6, height = 4, dpi = 300)


# ------------------------------------------------------------------------------
# Alternative modeling approaches
# ------------------------------------------------------------------------------
# Sequential F-tests for model selection
m1 <- lm(medv ~ poly(lstat, 1), data = Boston)
m2 <- lm(medv ~ poly(lstat, 2), data = Boston)
m3 <- lm(medv ~ poly(lstat, 3), data = Boston)
m4 <- lm(medv ~ poly(lstat, 4), data = Boston)
m5 <- lm(medv ~ poly(lstat, 5), data = Boston)
m6 <- lm(medv ~ poly(lstat, 6), data = Boston)
m7 <- lm(medv ~ poly(lstat, 7), data = Boston)
m8 <- lm(medv ~ poly(lstat, 8), data = Boston)
m9 <- lm(medv ~ poly(lstat, 9), data = Boston)

# Each line indicates evidence to include the next higher order term in the model. 
# The p-value is the probability of observing the data if the null hypothesis is true 
# (i.e., if the lower order model is sufficient). 
# A small p-value (typically < 0.05) indicates that we reject the null hypothesis 
# and conclude that the higher order term significantly improves the model fit.
anova(m1, m2, m3, m4, m5, m6, m7, m8, m9)

# Exploratory analysis indicates curvature in the relationship between lstat and medv.
# Try taking logarithms. Logarithmic x-axis is more linear.
g + scale_x_log10() 

ml1 <- lm(medv ~ log(lstat), data = Boston)
ml2 <- lm(medv ~ poly(log(lstat), 2), data = Boston)
ml3 <- lm(medv ~ poly(log(lstat), 3), data = Boston)
ml4 <- lm(medv ~ poly(log(lstat), 4), data = Boston)

anova(ml1, ml2, ml3, ml4)

# Choosing to create log(x) (possibly including x) as a feature in the model 
# is an example of feature engineering.
