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
| 2026-09-09 | Wed | 03-regression/10-slr.qmd | All content except the CAPM example |
| 2026-09-11 | Fri | 03-regression/15-capm.qmd | CAPM example (originally the last section of 10-slr.qmd, later split into its own chapter); class activity finding a stock/index with higher R-squared and more extreme beta than AAPL |
| 2026-09-14 | Mon | 03-regression/20-mlr.qmd | All content except F-tests |
| 2026-09-16 | Wed | 03-regression/20-mlr.qmd, 03-regression/30-feature-engineering.qmd | First ~10 min on agentic AI course setup; then F-tests (20-mlr.qmd, held over from Monday), then Polynomials and Interactions (30-feature-engineering.qmd) |
| 2026-09-18 | Fri | 03-regression/40-flexibility.qmd | Step functions and K-nearest neighbors. Potential problems (non-linearity, correlated errors, non-constant variance, outliers, leverage, collinearity) only briefly covered, ~5 minutes, due to time spent on step-function coefficient interpretation — students could state the mechanics but struggled to interpret the fitted $\beta_j$, which traced back to not understanding how the indicator functions work, specifically that the bin $X < c_1$ has no indicator/coefficient of its own. Prompted adding a worked coefficient-interpretation example to 40-flexibility.qmd. |
| 2026-09-21 | Mon | 04-classification/10-logistic-regression.qmd | All content up through Coefficient inference (9.2.5); Prediction (9.2.6) held over to Wednesday. Paced deliberately slower than SLR/MLR, as planned. |
| 2026-09-23 | Wed | 04-classification/10-logistic-regression.qmd, 04-classification/20-multiple-logistic-regression.qmd | Finished Prediction (9.2.6, held over from Monday), then covered all of Multiple Logistic Regression — ahead of the planned pace, which had budgeted the whole day for the multiple logistic regression chapter alone. |
| 2026-09-25 | Fri | 04-classification/30-flexible-logistic-regression.qmd | All content except the Store-specific price effects worked example, held over to the next class. |
| 2026-09-28 | Mon | 04-classification/40-problems-in-logistic-regression.qmd | All content except Separation diagnosis and response, which was skipped for time; Muscular dystrophy carrier screening was covered quickly. The Store-specific price effects worked example held over from 09-25 (`04-classification/30-flexible-logistic-regression.qmd`) was not covered and will not be taught this semester. |
| 2026-10-05 | Mon | 04-classification/50-lda.qmd | Covered every slide in `50-lda_slides.qmd`: Bayes' theorem and the Bayes classifier; LDA for $p=1$ and $p>1$; the logistic regression comparisons; student strata. The classifier-evaluation sections (confusion matrix, ROC curve, AUC) are not in the deck and were not covered; on 2026-10-06 they were moved, with the Credit card findings and Student strata sections, into `04-classification/55-classifier-evaluation.qmd`, so the student strata covered today now live in that file. Two gaps: the deck had no R code for fitting `MASS::lda()` and extracting its output (one slide each for $p=1$ and $p>1$ added afterward), and the balance-and-income example shows a higher `income` raising the probability of default at a fixed balance, which is explained by `income` standing in for student status (verified 2026-10-06). |

<!--
Add one row per class meeting. "File(s) covered" can list more than one path
if a single day spans multiple files, or repeat a path across rows if one
file took more than one day. Use the path relative to the repo root, e.g.
`03-regression/10-slr.qmd`.
-->

## Planned (Fall 2026)

A day-by-day plan for the near term, filled in ahead of time so pacing can be
sanity-checked before each class — this is a plan, not a record, and it will
be wrong in places. When a planned day actually happens, move it into the
Fall 2026 log table above with what was actually covered (which may differ
from what's planned here), and revise the remaining planned rows if the pace
shifted.

| Date | Day | Planned topic | Notes |
| ---- | --- | -------------- | ----- |
| 2026-09-30 | Wed | **Exam 1 review** | Consider a Simpson's Paradox example here, connecting back to the `student`/`balance` sign-reversal example in `04-classification/20-multiple-logistic-regression.qmd` |
| 2026-10-02 | Fri | **Exam 1** | |
| 2026-10-07 | Wed | `04-classification/55-classifier-evaluation.qmd` | Confusion matrix, sensitivity and specificity, classification thresholds, ROC curve and AUC, credit card findings, student strata (shown 10-05 from the LDA deck; full treatment here) |
| 2026-10-09 | Fri | `04-classification/60-qda-naive-bayes.qmd` | QDA (bias-variance tradeoff vs. LDA); naive Bayes (conditional independence); KNN classification; comparison of classification methods (ISLR2 4.5) on a held-out test set |
| 2026-11-04 | Wed | **Exam 2 review** | |
| 2026-11-06 | Fri | **Exam 2** | |

Multinomial logistic regression is deliberately deferred until after Exam 1
and is not yet scheduled above.

<!--
When a planned day happens, move its row up into the Fall 2026 log table with
the file(s) actually covered and what really happened, then delete it from
this table. Add new planned rows here as the semester's pacing becomes clear
further out; there's no need to plan the whole remaining semester at once.
-->

## Notes for the next offering

Revisions to make before this material is taught again. These are edits to
chapters that are already published to students, so they wait until after
the semester in which they were noted.

- The classification index: the original classification chapter
  (`02-learning/30-classification.qmd`) and the logistic regression chapters
  write $C$ (and $c$) for the number of classes and the class index, while
  `04-classification/50-lda.qmd` onward writes $K$ and $k$. Consider changing
  the earlier chapters to $K$ and $k$ so the notation is the same across the
  unit (noted 2026-10-04; confirm which index the instructor meant before
  editing).
- Bracket nesting: four displays in `03-regression/10-slr.qmd`,
  `03-regression/20-mlr.qmd` and the logistic chapters write
  `\exp\left(...\right)` with parentheses inside, which the settled rule in
  `CONVENTIONS.md` (outer bracket of a function argument is square when
  parentheses are nested inside) would change to `\exp\left[...\right]`.
  The log posterior odds `\log\left[\frac{p}{1 - p}\right]` were converted
  2026-10-06, as was `\log\left[f_{2j}(x_j)/f_{1j}(x_j)\right]` in
  `60-qda-naive-bayes.qmd`. Still to convert:
  `\log\left(1 + e^{\beta_1(x_i - 5.5)}\right)` in
  `40-problems-in-logistic-regression.qmd`, and
  `\log\left(L(\hat\beta_r)/L(\hat\beta_f)\right)` in
  `20-multiple-logistic-regression.qmd`.
- `04-classification/70-generalized-linear-models.qmd` was not taught in
  Fall 2026; it was left in the book as a notes-only chapter for interested
  students. Decide whether to schedule it next time.
- Callout headings: `04-classification/30-flexible-logistic-regression.qmd`
  has a callout headed `### Two questions, two verdicts`, which is not one of
  the three fixed callout headings in `CONVENTIONS.md`.
