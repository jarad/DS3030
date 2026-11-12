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
| 2026-09-30 | Wed | Exam 1 review | Review class with no prepared content. |
| 2026-10-02 | Fri | Exam 1 | Exam 1 held on this date. |
| 2026-10-05 | Mon | 04-classification/50-lda.qmd | Covered every slide in `50-lda_slides.qmd`: Bayes' theorem and the Bayes classifier; LDA for $p=1$ and $p>1$; the logistic regression comparisons; student strata. The classifier-evaluation sections (confusion matrix, ROC curve, AUC) are not in the deck and were not covered; on 2026-10-06 they were moved, with the Credit card findings and Student strata sections, into `04-classification/55-classifier-evaluation.qmd`, so the student strata covered today now live in that file. Two gaps: the deck had no R code for fitting `MASS::lda()` and extracting its output (one slide each for $p=1$ and $p>1$ added afterward), and the balance-and-income example shows a higher `income` raising the probability of default at a fixed balance, which is explained by `income` standing in for student status (verified 2026-10-06). |
| 2026-10-07 | Wed | `04-classification/55-classifier-evaluation.qmd` | Covered every slide in `55-classifier-evaluation_slides.qmd` (confusion matrix, sensitivity and specificity, classification thresholds, ROC curve and AUC, student strata, multiple classes), though some slides were skipped on the fly as less important. Afterwards the deck was revised: the Area under the ROC curve slide moved to follow ROC curves, balance + income; the Credit card findings slide was removed; and the Multiple classes slides got a transition slide, with the first retitled Confusion matrix. |
| 2026-10-09 | Fri | `04-classification/60-qda-naive-bayes.qmd` | First 10 minutes reviewing LDA, classification, and evaluating classifiers. The remaining 40 minutes covered QDA, naive Bayes, and KNN classification. The Comparing methods section (fitted boundaries, boundary shapes, simulated scenarios, test performance) was not reached and was covered on Monday 2026-10-12. |
| 2026-10-12 | Mon | `04-classification/55-classifier-evaluation.qmd`, `04-classification/60-qda-naive-bayes.qmd`, `04-classification/70-generalized-linear-models.qmd` | First 20 minutes reviewing classifiers and classifier evaluation. Then the Comparing methods content from Friday's `60-qda-naive-bayes_slides.qmd`, and Poisson regression from `70-generalized-linear-models_slides.qmd`. The general GLM slides (three components, special cases, variance function, transforming the mean) were skipped. |
| 2026-10-14 | Wed | `05-resampling/10-cross-validation.qmd` | Covered every slide in `10-cross-validation_slides.qmd` except the Classification section (Credit card default data, Cross-validation error rate, Neighbor count), which moved to Friday 2026-10-16. |
| 2026-10-16 | Fri | Class cancelled | No class meeting. The planned lecture (the Classification slides held over from Wednesday, then `05-resampling/15-cv-in-practice.qmd` and its small-group activity `15-cv-in-practice_activity.R`) was not taught. The next class (Monday 2026-10-19) moves on to the next topic, so the cross-validation Classification section and Cross-Validation in Practice were not presented in class; both stay in the book. |
| 2026-10-19 | Mon | `06-regularization/10-subset-selection.qmd` | Covered most of the slides in `10-subset-selection_slides.qmd` (best subset selection, stepwise selection, choosing model size by the penalized criteria and the chosen-sizes comparison, interpreting the selected model); the within-fold cross-validation slides and the optimism slides (Training error optimism and Optimistic inference) were skipped. |
| 2026-10-21 | Wed | `06-regularization/20-ridge-regression.qmd` | Covered the ridge slides in `20-ridge-regression_slides.qmd`. Afterwards the deck was trimmed: Shrinkage, Standardization, Squared bias and variance, Favorable draw, the Ridge coefficients transition, Coefficient comparison and Interpretation were removed from it. |
| 2026-10-23 | Fri | `06-regularization/30-lasso.qmd` | Covered all of the slides in `30-lasso_slides.qmd` with time to spare. The text in several figures was too small to read on the slides (for example Selected sets), though the same figures read well in the notes; see the Notes for the next offering. |
| 2026-10-26 | Mon | `06-regularization/40-principal-components.qmd` | Covered all of the slides in `40-principal-components_slides.qmd`. |
| 2026-10-28 | Wed | `06-regularization/50-pcr-and-pls.qmd` | Covered the PCR and PLS slides in `50-pcr-and-pls_slides.qmd`. |
| 2026-10-30 | Fri | `06-regularization/60-high-dimensions.qmd` | Covered all of the slides in `60-high-dimensions_slides.qmd`. Grid lines on the plots were inconsistent: major and minor lines were not evenly spaced (on the channel sweep Test MSE plot the major lines fell at 1, 10, 20, 30, 40 and 49 and the minor lines at 5.5, 15, 25, 35 and 44.5, which made d = 46, used on the next slide, hard to find). See Notes for the next offering. |
| 2026-11-02 | Mon | `06-regularization/70-method-comparison.qmd` | Covered these slides in `70-method-comparison_slides.qmd`, in deck order: Data, Training homes, Candidate features, Six fits, Cross-validation curves, Test evaluation, Method ranking. Not on the list of slides covered: Today, Kept dummies, Kept features, and the Six methods compared section (Properties, Expected settings, Conclusion). |
| 2026-11-04 | Wed | Exam 2 review | Ad hoc review class with no specific slides. |
| 2026-11-06 | Fri | Exam 2 | Exam 2 held on this date. |
| 2026-11-09 | Mon | `08-trees/10-decision-trees.qmd` | Covered the slides in `10-decision-trees_slides.qmd` from Today through Fitted classification tree, in deck order: Data, Training specimens, Age and cement, Regions and predictions, Best split, Best split: cut points, Partition, Regression tree diagram, Recursive binary splitting (only the default stopping rules), Full tree (only for the number of leaves), Overfitting, Cost-complexity pruning, Cross-validation curve, Pruned tree regions, All explanatory variables, Training penguins, Fitted classification tree. Skipped within that stretch: Decrease in RSS, the Fitting a regression tree, Cross-validation and Pruned tree code slides, Penguin species, and the classification impurity slides (Most common class, Node impurity, Impurity of a split, Gini index and entropy, Fitting a classification tree). Not reached: Test confusion matrix, Pruning a classification tree, and the Strengths and weaknesses section (Interpretability, Nonlinearity and interactions, Step functions, Instability). |
| 2026-11-11 | Wed | `08-trees/20-bagging-and-random-forests.qmd` | Covered these slides in `20-bagging-and-random-forests_slides.qmd`, in deck order: Unstable trees, Averaging, Bootstrap samples, Appearances in a bootstrap sample, Bagged trees: test MSE, Out-of-bag prediction, Out-of-bag and test error, Correlated trees, Split restriction, Split restriction: correlation, Fitting a random forest, Forest size, Choosing m, Test error. Not on the list of slides covered: Today, Data, Concrete specimens, Bagged trees, Bagging from scratch, Out-of-bag prediction in R, Extrapolation, Interpretability and cost, Conclusion. There was insufficient time for the Variable importance section (One tree, Two measures, Two measures in R, Importance by variable, Interpretation), which was not taught; Friday's boosting lecture builds on it ("as for a forest"), see the Notes for the next offering. |

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
| 2026-11-13 | Fri | `08-trees/30-boosting.qmd` | Boosting regression trees (ISLR2 8.2.3) around `xgboost` on the same `modeldata::concrete` split as the two previous tree lectures (the earlier draws are repeated so their test MSEs are reproduced: least squares main effects 106.4, log(age) least squares 48.5, default tree 86.8, full tree 40.3, pruned tree 42.2). Notation: shrinkage $\nu$ (xgboost `learning_rate`, not ISLR2's $\lambda$), depth $\delta$ (`max_depth`), $B$ trees (`nrounds`). Earlier fits as predicted against observed test strength (mean 254.7, stump 183.6, default tree 86.8, random forest with OOB-chosen m = 5, 27.5; bagging 26.9); residuals against age after 0, 1, 10, 100 and 1,000 trees; algorithm in steps; visible from-scratch `rpart()` loop (1,000 trees of depth 4, nu = 0.1: training MSE 0.42, test 23.7); visible `xgb.train()` fit with xgboost's defaults (test 24.1) and the loop reproduction table (xgboost with `lambda = 0`, `base_score = 0` and exact splits matches the loop to rounding through tree 232, test 25.0). Tuning: test MSE against b for nu = 0.5, 0.1, 0.01 at depth 4 (minima 21.0 after 83 trees and 23.9 after 573; nu = 0.01 still falling at 23.7 after 5,000); for depths 1, 2, 4, 8 (ends 31.7, 28.1, 23.9, 28.2); overfitting on a linear axis (nu = 0.5 rises 8% from its minimum by 5,000 trees, nu = 0.1 rises 2%). 10-fold `xgb.cv()` chooses B = 1,194 (CV 20.0, test 24.1, best test 23.9 after 573; the CV estimate is within 1% of its minimum from 546 to 5,000; the 4.1 gap between CV and test is not fully explained, so expect the question). Variable importance defined from scratch (RSS decrease summed over the trees, `xgb.importance()` Gain; age and cement lead, 66%), since the Random Forests lecture's importance slides were not taught. Additive structure: stumps give parallel age curves (gap 16.6 MPa at every age), depth 4 a gap of 5.9 to 20.6. Bagging against boosting small trees (stumps 171.7 against 31.7; depth 4 59.9 against 24.3). Comparison table (boosting 24.1, 10% below bagging's 26.9, but differences of a few units are within noise; depths 1, 2 and 8 end above bagging) and limits. Classification boosting, AdaBoost, `gbm`, LightGBM, CatBoost and BART only in a Beyond this course callout |

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
- `04-classification/70-generalized-linear-models.qmd` was originally to be a
  notes-only chapter in Fall 2026; on 2026-10-08 it was scheduled for
  Mon 2026-10-12 (see the plan table above), so no decision is needed unless
  that changes.
- Boxplots to violin plots: `geom_boxplot()` still appears in
  `04-classification/60-qda-naive-bayes.qmd` and `05-resampling/20-bootstrap.qmd`
  (replace with `geom_violin(fill = "grey90", scale = "width", quantiles = c(0.25, 0.5, 0.75), quantile.linetype = "solid")`
  as in `05-resampling/10-cross-validation.qmd`, then
  re-render and refresh the figures in their slide decks). The course now
  prefers violin plots; `notes-author` and `slides-author` were updated
  2026-10-15 (noted 2026-10-15, to do next semester).
- Slide figure text size: figures reused from the notes show their text too
  small on the slides (noted 2026-10-23 after the lasso lecture, for example
  Selected sets). The cause is figure height in inches against the height at
  which the slide displays it: a tall figure shrinks its text to 8 to 10 pixels
  on a 720 pixel slide. The instructor will deal with a figure when it
  causes a problem in class, not in advance.
- Plot grid lines (noted 2026-10-30 after the high dimensions lecture): ggplot2's
  default breaks put major and minor grid lines at uneven distances, for example
  major lines at 1, 10, 20, 30, 40 and 49 and minor lines at 5.5, 15, 25, 35
  and 44.5 on the channel sweep plot. Readers expect round, evenly
  spaced major lines (additive on a regular axis; powers, 1-2-5 values or
  round percentages on a logarithmic one) and minor lines midway between
  them: 0, 10, ..., 50 with minor lines at 5, 15, ..., 45; the rule is in
  `.claude/skills/plot-conventions/SKILL.md`. The plots in Chapter 6 and likely earlier chapters set their breaks
  by default and need explicit `breaks` and `minor_breaks`.
- Callout headings: `04-classification/30-flexible-logistic-regression.qmd`
  has a callout headed `### Two questions, two verdicts`, which is not one of
  the three fixed callout headings in `CONVENTIONS.md`.
- Variable importance (noted 2026-11-11): the Variable importance section of `08-trees/20-bagging-and-random-forests_slides.qmd` (One tree, Two measures, Two measures in R, Importance by variable, Interpretation) was not reached in class. The boosting chapter and deck were reworked on 2026-11-12 so that they define importance themselves and no longer assume it. Decide whether the forest's importance stays in the Random Forests lecture, or is taught once, in whichever lecture has time.
