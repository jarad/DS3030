# author: Jarad Niemi
# date:   2026-09-01
# purpose: example of bias variance trade-off
################################################################################
library("tidyverse")
library("MASS")

theme_set(theme_bw())

summary(Boston$lstat)
# lstat is computed on a census track basis and is the average of 
#   percentage of adults who do not have at least some high school education
#   percentage of adults who are classified as laborers

# use lstat to predict housing median value
g <- ggplot(Boston, aes(x = lstat, y = medv)) +
  geom_point()

g

# Fit SLR, polynomial order 5, and polynomial order 9 models:
m1 = lm(medv~lstat,data=Boston)
m5 = lm(medv~poly(lstat,5),data=Boston)
m9 = lm(medv~poly(lstat,9),data=Boston)

# Create predictive data set
d <- Boston |> 
  dplyr::select(lstat) |>    # MASS::select() exists, so we need to be explicit
  mutate(
    linear = m1$fitted.values,
    order5 = m5$fitted.values,
    order9 = m9$fitted.values
  ) |>
  pivot_longer(
    cols = linear:order9,
    names_to = "model",
    values_to = "medv"
  )

# Add predictions to data
g + geom_line(data = d, aes(color = model, linetype = model))



# ------------------------------------------------------------------------------
# Evaluate models using train/test split
# ------------------------------------------------------------------------------

set.seed(20260902) # for reproducible results
n <- dim(Boston)[1]
train_index  <- sample.int(n, size = n / 2, replace = FALSE)
train_boston <- Boston[ train_index, ]
test_boston  <- Boston[-train_index, ]


train_m1 <- lm(medv ~      lstat,     data = train_boston)
train_m5 <- lm(medv ~ poly(lstat, 5), data = train_boston)
train_m9 <- lm(medv ~ poly(lstat, 9), data = train_boston)


## training MSE 
mse_train <- train_boston |> 
  dplyr::select(lstat, medv) |>
  mutate(
    # alternative to using $fitted.values
    linear = predict(train_m1, newdata = train_boston),
    order5 = predict(train_m5, newdata = train_boston),
    order9 = predict(train_m9, newdata = train_boston)
  ) |>
  pivot_longer(
    cols      = linear:order9,
    names_to  = "model",
    values_to = "prediction"
  ) |>
  group_by(model) |>
  summarize(
    mse = mean((medv-prediction)^2)                 # how do we compute the training MSE? 
  )


## test MSE
mse_test <- test_boston |> 
  dplyr::select(lstat, medv) |>
  mutate(
    # alternative to using $fitted.values
    linear = predict(train_m1, newdata = test_boston),
    order5 = predict(train_m5, newdata = test_boston),
    order9 = predict(train_m9, newdata = test_boston)
  ) |>
  pivot_longer(
    cols      = linear:order9,
    names_to  = "model",
    values_to = "prediction"
  ) |>
  group_by(model) |>
  summarize(
    mse = mean((medv-prediction)^2)                 # how do we compute the training MSE? 
  )



###########################
#### In-class Activity ####
###########################

## 1. Introduce yourself to your group members.

## 2. Fit 9 models of increasing complexity on the training set: 
##    m1 <- lm(medv ~ poly(lstat, 1), data = train_boston)
##    m2 <- lm(medv ~ poly(lstat, 2), data = train_boston)
##    m3 <- lm(medv ~ poly(lstat, 3), data = train_boston)
##    .
##    .
##    .
##    m9 <- lm(medv ~ poly(lstat, 9), data = train_boston)

## 3. Obtain the training MSE and test MSE for each of these models. 

## 4. Create a plot where the training and test MSE are on the y-axis 
##    in different colors and linetypes (only 6 possible linetypes) and the 
##    model complexity (1 - 9) is on the x-axis. 


