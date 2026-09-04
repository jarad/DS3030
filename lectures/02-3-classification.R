# author: Jarad Niemi
# date:   2026-09-04
# purpose: example of bias variance trade-off in classification
# ------------------------------------------------------------------------------
library("tidyverse"); theme_set(theme_bw())
# library("MASS") # not needed since we are using MASS::Boston and avoids conflict with select

# Create a binary response variable based on the median value of owner-occupied homes in $1000s
Boston <- MASS::Boston |>
  mutate(
    medv_class = ifelse(medv > median(medv), "high", "low"),
    medv_class = factor(medv_class, levels = c("low", "high"))
  ) |>
  select(-medv) |>
  select(medv_class, lstat, everything()) # reorder columns to put response variable first

# Exploratory data analysis:
g <- ggplot(Boston, aes(x = lstat, y = medv_class)) +
  geom_jitter(height = 0.1) +
  labs(
    x     = "Percent of lower status population",
    y     = "Median value of owner-occupied homes (binary)",
    title = "Boston housing data"
  )

g


set.seed(20260902) # for reproducible results
n <- dim(Boston)[1]
train_index  <- sample.int(n, size = n / 2, replace = FALSE)
train_boston <- Boston[ train_index, ]
test_boston  <- Boston[-train_index, ]


# Fit models and calculate train and test MSE
# Fitting models of order 1 (linear) to order 9 in lstat, analogous to the
# regression example, so that flexibility increases smoothly with i.
train_predict <- test_predict <- list()
for (i in 1:9) {
    # Fit a logistic regression model with an increasingly flexible
    # polynomial term in lstat
    m <- glm(medv_class == "high" ~ poly(lstat, i), data = train_boston, family = binomial)
  
    # Predictions are probabilities of "high"
    train_predict[[i]] <- predict(m, newdata = train_boston, type = "response")
    test_predict[[ i]] <- predict(m, newdata =  test_boston, type = "response")
  
    # Use Bayes rule to provide class predictions
    train_predict[[i]] <- ifelse(train_predict[[i]] > 0.5, "high", "low")
    test_predict[[ i]] <- ifelse(test_predict[[ i]] > 0.5, "high", "low")
}


# Train Error Rate
error_train <- train_boston |> 
  dplyr::select(medv_class) |>
  mutate(
    x1 = train_predict[[1]],
    x2 = train_predict[[2]],
    x3 = train_predict[[3]],
    x4 = train_predict[[4]],
    x5 = train_predict[[5]],
    x6 = train_predict[[6]],
    x7 = train_predict[[7]],
    x8 = train_predict[[8]],
    x9 = train_predict[[9]],
  ) |>
  pivot_longer(
    cols      = starts_with("x"),
    names_to  = "model",
    values_to = "prediction"
  ) |>
  mutate(
    prediction = factor(prediction, levels = c("low", "high"))
  ) |>
  group_by(model) |>
  summarize(
    error_rate = mean(medv_class != prediction)    
  )


# Test MSE
error_test <- test_boston |> 
  dplyr::select(medv_class) |>
  mutate(
    x1 = test_predict[[1]],
    x2 = test_predict[[2]],
    x3 = test_predict[[3]],
    x4 = test_predict[[4]],
    x5 = test_predict[[5]],
    x6 = test_predict[[6]],
    x7 = test_predict[[7]],
    x8 = test_predict[[8]],
    x9 = test_predict[[9]]
  ) |>
  pivot_longer(
    cols      = starts_with("x"),
    names_to  = "model",
    values_to = "prediction"
  ) |>
  mutate(
    prediction = factor(prediction, levels = c("low", "high"))
  ) |>
  group_by(model) |>
  summarize(
    error_rate = mean(medv_class != prediction)        
  )


# Plot train and test MSE
error_rate <- bind_rows(
    error_train |> mutate(type = "train"),
    error_test  |> mutate(type = "test" )
)

g_bv <- ggplot(error_rate, aes(x = model, y = error_rate, 
                color = type, linetype = type, group = type)) +
    geom_line() + 
    theme(
      axis.text.x = element_text(angle = 45, hjust = 1),
      legend.position = "bottom") +
    labs(
        x     = "Flexibilty", 
        y     = "Error rate",    
        title = "Bias-variance tradeoff")

g_bv


ggsave(g_bv, filename = "02-3-classification-bias-variance-tradeoff.jpg", 
       width = 6, height = 4, dpi = 300)