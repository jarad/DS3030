# DS 3030 - Lecture Log

A record of what was actually covered in class, by date. This is the
authoritative record of *when* material was taught — filenames only encode
the *order* material is covered within a chapter (see `CLAUDE.md`), not the
calendar date, because this book is reused across semesters and the calendar
shifts every year.

Update this whenever a file is presented in class, including when a chapter
takes more or fewer days than planned.

## Fall 2026

| Date | Day | File(s) covered | Notes |
| ---- | --- | ---------------- | ----- |
| 2026-09-09 | Wed | regression/03-10-slr.qmd | All content except the CAPM example |
| 2026-09-11 | Fri | regression/03-15-capm.qmd | CAPM example (originally the last section of 03-10-slr.qmd, later split into its own chapter); class activity finding a stock/index with higher R-squared and more extreme beta than AAPL |
| 2026-09-14 | Mon | regression/03-20-mlr.qmd | All content except F-tests |
| 2026-09-16 | Wed | regression/03-20-mlr.qmd, regression/03-30-feature-engineering.qmd | First ~10 min on agentic AI course setup; then F-tests (03-20-mlr.qmd, held over from Monday), then Polynomials and Interactions (03-30-feature-engineering.qmd) |
| 2026-09-18 | Fri | regression/03-40-flexibility.qmd | Step functions and K-nearest neighbors. Potential problems (non-linearity, correlated errors, non-constant variance, outliers, leverage, collinearity) only briefly covered, ~5 minutes, due to time spent on step-function coefficient interpretation — students could state the mechanics but struggled to interpret the fitted $\beta_j$, which traced back to not understanding how the indicator functions work, specifically that the bin $X < c_1$ has no indicator/coefficient of its own. Prompted adding a worked coefficient-interpretation example to 03-40-flexibility.qmd. |
|      | Mon |                   |       |

<!--
Add one row per class meeting. "File(s) covered" can list more than one path
if a single day spans multiple files, or repeat a path across rows if one
file took more than one day. Use the path relative to the repo root, e.g.
`regression/03-10-slr.qmd`.
-->
