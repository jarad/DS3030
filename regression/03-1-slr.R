# author: Jarad Niemi
# date: 2026-09-07
# purpose: Simple linear regression examples using the
#          capital asset pricing model (CAPM).
# ------------------------------------------------------------------------------

library("tidyverse")
library("quantmod")

theme_set(theme_bw())

# ------------------------------------------------------------------------------
# Get data
# ------------------------------------------------------------------------------

# Define date range
start_date <- "2000-01-01"
end_date <- Sys.Date()

# Download Equity data from Yahoo Finance
getSymbols("AAPL", from = start_date, to = end_date, auto.assign = TRUE)
getSymbols("SPY", from = start_date, to = end_date, auto.assign = TRUE)
getSymbols("^IRX", from = start_date, to = end_date, auto.assign = TRUE) # 13-Week T-Bill Yield Index

# Calculate weekly returns for equity tickers
aapl_weekly <- weeklyReturn(AAPL, type = "arithmetic")
spy_weekly <- weeklyReturn(SPY, type = "arithmetic")

# Process the T-Bill (^IRX) data
# Extract the closing yield values matching our equity weekly date index
# Using Ad() gets the adjusted close, or Cl() for regular close
t_bill_weekly_yield <- Cl(IRX)[index(spy_weekly)]

# Forward-fill any missing data gap days (like market holidays)
t_bill_weekly_yield <- na.locf(t_bill_weekly_yield, na.rm = TRUE)

# Convert annualized yield percentage to weekly decimal: (Yield / 100) / 52
t_bill_weekly_return <- (t_bill_weekly_yield / 100) / 52

# Merge all series into one object and rename columns
merged_returns <- merge(aapl_weekly, spy_weekly, t_bill_weekly_return)
colnames(merged_returns) <- db_columns <- c(
  "AAPL_Return",
  "SPY_Return",
  "TBill_Weekly_Yield"
)

# Convert the xts object to a standard data.frame
final_df <- data.frame(Date = index(merged_returns), coredata(merged_returns))

# Remove rows containing NA values (e.g., first row due to return calculations)
final_df <- na.omit(final_df)

# Reset row names for clean indexing
rownames(final_df) <- NULL

# ------------------------------------------------------------------------------
# Exploratory Data Analysis (EDA)
# ------------------------------------------------------------------------------

g <- ggplot(final_df, aes(x = SPY_Return, y = AAPL_Return)) +
  geom_point(color = "blue", alpha = 0.5) +
  labs(
    title = "Scatter Plot of AAPL vs SPY Weekly Returns",
    x = "SPY Weekly Return",
    y = "AAPL Weekly Return"
  )

g

# ------------------------------------------------------------------------------
# Fit the CAPM model using simple linear regression
# ------------------------------------------------------------------------------

# Calculate excess returns
final_df <- final_df %>%
  mutate(
    AAPL_Excess_Return = AAPL_Return - TBill_Weekly_Yield,
    SPY_Excess_Return = SPY_Return - TBill_Weekly_Yield
  )

# Fit the linear regression model: AAPL excess return ~ SPY excess return
capm_model <- lm(AAPL_Excess_Return ~ SPY_Excess_Return, data = final_df)
g + geom_smooth(method = "lm", color = "red", se = FALSE)


# View the summary of the CAPM model
summary(capm_model)

# Estimates, standard errors, and t-values for the coefficients
summary(capm_model)$coefficients

# Confidence intervals for the coefficients
confint(capm_model)

# Confidence intervals at x = 0
predict(
  capm_model,
  newdata = data.frame(SPY_Excess_Return = 0),
  interval = "confidence"
)
g + geom_smooth(method = "lm", color = "red", se = TRUE)

# Prediction intervals at x = 0
predict(
  capm_model,
  newdata = data.frame(SPY_Excess_Return = 0),
  interval = "prediction"
)

# R-squared
summary(capm_model)$r.squared
