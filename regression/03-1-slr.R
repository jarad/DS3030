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
d <- data.frame(Date = index(merged_returns), coredata(merged_returns)) |>
  na.omit() |>
  remove_rownames() |>
  mutate(
    AAPL_Excess_Return = AAPL_Return - TBill_Weekly_Yield,
    SPY_Excess_Return = SPY_Return - TBill_Weekly_Yield
  )

# ------------------------------------------------------------------------------
# Exploratory Data Analysis (EDA)
# ------------------------------------------------------------------------------

g <- ggplot(d, aes(x = SPY_Excess_Return, y = AAPL_Excess_Return)) +
  geom_point(alpha = 0.5) +
  labs(
    title = "Scatter Plot of AAPL vs SPY Weekly Returns",
    x = "SPY Weekly Excess Return",
    y = "AAPL Weekly ExcessReturn"
  )

g

# Hexbin plot
g <- ggplot(d, aes(x = SPY_Excess_Return, y = AAPL_Excess_Return)) +
  geom_hex(bins = 30) +
  labs(
    title = "Hexbin Plot of AAPL vs SPY Weekly Returns",
    x = "SPY Weekly Excess Return",
    y = "AAPL Weekly ExcessReturn"
  ) +
  scale_fill_gradient(low = "lightblue", high = "darkblue")

g
g + geom_smooth(method = "lm")

# ------------------------------------------------------------------------------
# Fit the CAPM model using simple linear regression
# ------------------------------------------------------------------------------

# Fit the linear regression model: AAPL excess return ~ SPY excess return
capm_model <- lm(AAPL_Excess_Return ~ SPY_Excess_Return, data = d)


# View the summary of the CAPM model
summary(capm_model)

coef(capm_model)
confint(capm_model)
summary(capm_model)$r.squared
