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
| 2026-11-09 | Mon | `08-trees/10-decision-trees.qmd` | Covered the slides in `10-decision-trees_slides.qmd` from Today through Fitted classification tree, in deck order: Data, Training specimens, Age and cement, Regions and predictions, Best split, Best split: cut points, Partition, Regression tree diagram, Recursive binary splitting (only the default stopping rules), Full tree (only for the number of leaves), Overfitting, Cost-complexity pruning, Cross-validation curve, Pruned tree regions, All explanatory variables, Training penguins, Fitted classification tree. Skipped within that stretch: Decrease in RSS, the Fitting a regression tree, Cross-validation and Pruned tree code slides, Penguin species, and the classification impurity slides (Most common class, Node impurity, Impurity of a split, Gini index and entropy, Fitting a classification tree). Not reached: Test confusion matrix, Pruning a classification tree, and the Strengths and weaknesses section (Interpretability, Nonlinearity and interactions, Step functions, Instability). |

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
| 2026-11-02 | Mon | `06-regularization/70-method-comparison.qmd` | Comparison day on `modeldata::ames` (log sale price; the five homes over 4,000 sq ft removed; main effects only, no interactions): least squares, forward stepwise selection, ridge, lasso, PCR and PLS on one training sample of n = 200 homes with about 120 candidate features (rare levels merged into the reference, redundant columns dropped), each tuned by 10-fold cross-validation with standardization, the forward path and the PCR/PLS directions recomputed in each fold, then one test-MSE table; a study over 200 repeated training samples drawn from the remaining test homes (share of samples each method wins, change from least squares, features kept by forward selection and the lasso), moved here from the PCR/PLS lecture; a comparison table of the six methods and the setting each is expected to suit. Penalized logistic/Poisson regression, elastic net, group lasso and interactions are only in a Beyond this course callout. Also a buffer if an earlier lecture runs over |
| 2026-11-04 | Wed | **Exam 2 review** | |
| 2026-11-06 | Fri | **Exam 2** | |
| 2026-11-11 | Wed | `08-trees/20-bagging-and-random-forests.qmd` | Bagging and random forests (ISLR2 8.2.1-8.2.2) on the same `modeldata::concrete` and `modeldata::penguins` splits as the decision trees lecture (its random draws are repeated so the penguin split matches; its test results are reproduced: least squares 106.4, log(age) least squares 48.5, default tree 86.8, full tree 40.3, pruned tree 42.2; penguin trees 95.1% and 96.1%). Instability of trees on random halvings (default age-and-cement trees, age < 21 the first split of 74% of 400 trees) and their average; variance of an average $\rho\sigma^2 + (1 - \rho)\sigma^2/B$ (derived); bootstrap samples and $(1 - 1/n)^n \approx 1/e$; bagging from scratch with `rpart()` (300 full trees, test MSE 26.8 against 40.3 for one full tree); out-of-bag error (OOB MSE 27.0 against test MSE 26.8); random forests: first split on age in 96% of bagged trees and 28% of forest trees, estimated tree correlation about 0.09 (bagging) and 0.04 (m = 2) across 100 halvings, single-tree test MSE 68.2 (m = 8) against 111.9 (m = 2), visible `randomForest()` fit (default m = 2, OOB 32.2, test 34.2, worse than bagging here, a bias effect), OOB and test error against the number of trees (settling table) and against m (OOB chooses m = 5, test 26.7); visible hand-computed OOB prediction; variable importance (which variables one tree uses; permutation and decrease in RSS; age, cement, water lead); classification forest on penguins (OOB error 3.3%, test accuracy 99.0%, 101 of 102, against 97 and 98 for the trees); comparison table; extrapolation (forest flat beyond the largest training cement). The deck leaves out the Classification forests section, which stays in the chapter. Extremely randomized trees, conditional and quantile forests, proximity and `ranger` only in a Beyond this course callout |
| 2026-11-13 | Fri | `08-trees/30-boosting.qmd` | Boosting regression trees (ISLR2 8.2.3) on the same `modeldata::concrete` split as the two previous tree lectures (Monday's draws are repeated so its test MSEs are reproduced: least squares 106.4, log(age) least squares 48.5, default tree 86.8, full tree 40.3, pruned tree 42.2). Notation: shrinkage $\nu$ (not ISLR2's $\lambda$), depth $\delta$ (`maxdepth`, not ISLR2's number of splits $d$), $B$ trees. Earlier fits as predicted against observed test strength (mean 254.7, stump 183.6, default tree 86.8, random forest with OOB-chosen m = 5, 27.5; bagging 26.9, refit, within 0.8 of Wednesday's). Residuals against age after 0, 1, 10, 100 and 1,000 trees (zero start: mean fit 23.3 after 10 trees against mean strength 35.8); algorithm in steps; visible from-scratch `rpart()` loop (1,000 trees of depth 4, nu = 0.1: training MSE 1.2, test 20.9). Tuning: test MSE against b for nu = 0.5, 0.1, 0.01 at depth 4 (minima 20.2 after 179 trees and 20.6 after 1,504; nu = 0.01 still falling at 22.2 after 5,000); for depths 1, 2, 4, 8 at nu = 0.1 (stumps still falling, 32.3 after 5,000 trees; minima 23.6, 20.6, 22.2 for depths 2, 4, 8); overfitting on a linear axis (nu = 0.5 rises 12% from its minimum by 5,000 trees, nu = 0.1 rises 5%; training MSE 0.41). 10-fold CV from scratch chooses B = 1,207 (CV 20.8, test 20.8; best test 20.6). Variable importance (decrease in RSS of the residuals, summed over trees; age and cement lead, as for the forest and the pruned tree). Additive structure: raw strength against age for the low and high cement thirds, then stumps give parallel age curves at 200 and 400 kg cement (gap 18.6 MPa at every age), depth 4 a gap of 7.3 to 20.7. Bagging against boosting small trees (stumps 171.7 against 32.3; depth 4 59.9 against 21.6). Comparison table (boosting 20.8, 23% below bagging's 26.9; only B chosen by CV, depth 4 mildly optimistic, depths 2, 4, 8 all below bagging) and limits. Classification boosting, AdaBoost, `gbm`/`xgboost` and BART only in a Beyond this course callout |

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
