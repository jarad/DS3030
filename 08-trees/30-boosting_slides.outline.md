# Slide outline: Boosting

(drafted 2026-11-01)

Outline for `30-boosting_slides.qmd` (Fri 2026-11-13, the third lecture on tree-based methods; ISLR2 Section 8.2.3). **This file is the spec; the deck is built from it, and this file describes the deck as it stands.** Edit it freely and ask for the deck to be refreshed.

Drafted against `30-boosting.qmd`, which is not committed yet: the deck's `derived-from` comment reads `uncommitted`, and the publish routine replaces it with the chapter's commit hash once the chapter is committed. The frozen output `_freeze/08-trees/30-boosting/execute-results/html.json` is current: its recorded `hash` (`0ae9e079cf1693983253017c9065d7bb`) equals the md5 of the chapter file as it stands, which includes the "Slides for this lecture" link (`30-boosting_slides.html`) on the line after `# Boosting`.

**What the deck is.** 33 slides including the title: the agenda, seven transitions, 24 content slides (the last is the Conclusion). It reuses all 18 figures the chapter renders (the four `earlier-fits` figures share one tabset, the five `residual-*` figures another and the `stumps-figure` and `depth-4-figure` a third; the `cement-age-figure` is the chapter's new figure), the one kable table that is displayed (`comparison_table`), and four code slides: the basic `rpart()` boosting loop and prediction of the chapter's visible chunks with their console output, the data split, and the importance shares. The deck has no new content: every `show:` is a figure, table, equation, code chunk or console printout the chapter already has, or a list cut from the chapter's own sentences. The chapter has one running example, `modeldata::concrete` on the Decision Trees lecture's data and split (700 training and 305 test specimens; the response is `compressive_strength` in MPa; the explanatory variables are seven ingredients in kg per cubic meter and `age` in days), and the chapter fits a numeric response only.

**Timing.** One 50-minute period: the 22 core content slides and the agenda come to about 41 minutes at the estimates below, and the two optional slides add about 2.5 more, so the period has room to spare. If time is short, drop in this order: (1) Training and test specimens (the split; the 700 and 305 are on the previous slide), (2) RSS decrease in R, (3) Limits (say it on the Conclusion), (4) Cement and age (say the question while on Stumps), (5) Forest and tree importance (say it on Importance by variable). The natural break if the chapter is taught over two days is after Chosen model (entry 12), where the boosted model has been fit, tuned and chosen.

**Code slides.** The four code slides are entries 2 (`split`, optional), 6 (`boosting`), 7 (`boosting-predict`) and 14 (`importance`, optional). Each shows the chunk's source copied verbatim from the chapter (without the `#|` lines) in a ` ```r ` block, which is not executed, followed, where the chunk prints something, by the chunk's console output copied verbatim from the frozen markdown in a plain ` ``` ` block (the `split` and `boosting` chunks print nothing, so they show code only). Nothing is trimmed, including the `set.seed(20261031)` comment of `split`. All four are at the deck's normal code size (22 px); the `.code-small` and `.code-wrap` classes are not needed (the longest, `boosting`, is 17 lines with comments and ends at 576 px of 720).

**Not in this deck.** Every collapsed `### Code` callout (including the `earlier` replay of the Decision Trees lecture's random draws, the `boost()` function and every figure's plot code); the chapter's `### Beyond this course` callout, which is not used; the chapter has no `### For example,` callout. The numbers of the chapter's `Cross-validation estimate`, `Chosen model` and `Limits` prose are in `say:` only.

**Response variable and explanatory variables.** The response is `compressive_strength` (MPa); the explanatory variables are the 7 ingredients and `age`, $p = 8$. A tree splits on the explanatory variables as recorded, so each feature is an explanatory variable.

**Figure legibility.** Effective tick size is 8.8/72 times the display height in px over the figure height in inches (14 px or more is the target); every reused figure is at 14.1 px or more.

| Figure | Height (in) | Display height (px) | Tick (px) |
|:--|--:|--:|--:|
| `mean-figure`, `stump-figure`, `default-figure`, `forest-figure` (tabs, `.mid-tabs`) | 4.5 | 520 | 14.1 |
| `residual-*-figure` (tabs, `.mid-tabs`) | 4.2 | 520 | 15.1 |
| `stumps-figure`, `depth-4-figure` (tabs, `.mid-tabs`) | 4.2 | 520 | 15.1 |
| `shrinkage-figure`, `depth-figure`, `overfitting-figure`, `cv-figure`, `cement-age-figure` | 4.2 | 560 | 16.3 |
| `bias-variance-figure` | 4.2 | 540 | 15.7 |
| `importance-figure` | 3.8 | 500 | 16.1 |

## How to read an entry

Entries are numbered by content slide; the title and the transitions are not numbered, and the agenda is entry 0, so the deck's footer numbers (which count every slide) run higher than the entry numbers.

- **tag:** core | optional | transition, with the timing in minutes
- **show:** the type (equation, figure, table, tabset, code, none) and the asset
- **words:** the only prose on the slide; omitted on figure and tabset slides
- **reveal:** what appears on each click
- **say:** speaker notes, never on the slide
- **note:** build and provenance details, including the chapter sentences or values the slide relies on

---

## 0. Today

- **tag:** core (0.5)
- **show:** none, a nested bulleted list in three columns
- **words:** Data (Earlier fits); Algorithm (Residuals, Steps, Fitting); Tuning parameters (Shrinkage, Tree depth, Overfitting); Choosing $B$ (Cross-validation estimate, Chosen model); Variable importance (RSS decrease, Forest and tree importance); Additive structure (Cement and age, Stumps, Depth and interactions); Comparison (Bias and variance, Test error, Limits)
- **say:** distilled from the chapter's five learning objectives; the Bagging and Random Forests lecture averaged many large trees, each grown independently, and boosting also combines many trees but grows small ones, one after another; the split chunk, the code that computes the importance shares, the Beyond this course callout and the hand-off to the next lecture (support vector machines, ISLR2 Chapter 9) are in the notes and not in the agenda
- **note:** relies on the chapter's `## Data`, `## Algorithm`, `## Tuning parameters`, `## Choosing $B$`, `## Variable importance`, `## Additive structure` and `## Comparison` headings and the `###` children the deck spends slides on. The Conclusion is not an agenda item. The agenda's lowest line ends at 551 px of 720.

# Data

- **tag:** transition (0)
- **show:** none (transition slide, title only)
- **say:** the chapter's Question: with the concrete data of the two previous lectures, can a sum of small trees grown one after another predict compressive strength better than one tree or an average of many?
- **note:** relies on the chapter's `**Question.**` paragraph under `## Data`.

## 1. Concrete specimens

- **tag:** core (1)
- **show:** none, a words-only data slide (three itemized lines)
- **words:** "Response: `compressive_strength`"; "Explanatory variables: seven ingredients and `age`"; "700 training specimens, 305 test specimens"
- **say:** the data and split are those of the Decision Trees lecture, so the test MSEs of the three lectures can be compared; `modeldata::concrete` records the compressive strength (MPa) of concrete cylinders, with seven ingredient amounts (kg per cubic meter of mix) and the age (days) as explanatory variables, $p = 8$; a specimen is one cylinder of one mix, crushed at one age; rows that repeat an earlier row exactly are removed: the 25 exact duplicates removed leave 1,005 specimens
- **note:** the chapter's `### Concrete specimens` paragraph compressed to three lines; 700, 305, 25 and 1,005 are inline R, quoted from the frozen markdown. The title is the chapter's `### Concrete specimens`.

## 2. Training and test specimens

- **tag:** optional (1)
- **show:** code — the chapter's `split` chunk (the seed, `distinct(modeldata::concrete)`, the 700 training specimens and the test specimens); the chunk prints nothing
- **words:** none
- **say:** the seed is the Decision Trees lecture's, so the training specimens are the same specimens; a collapsed callout in the chapter repeats the random draws that lecture made before its pruned tree, because `rpart()` draws its cross-validation folds at random, then sets this lecture's seed, and reproduces that lecture's test MSEs on all 8 explanatory variables: 106.4 for least squares, 48.5 with $\log(\texttt{age})$ in place of age, 86.8 for the default tree, and 40.3 and 42.2 for the full and pruned trees
- **note:** the chunk (10 lines with comments and blanks) is copied verbatim, including the `set.seed(20261031)` comment, at the normal code size. **The title is not a chapter heading** (the chunk sits under `### Concrete specimens`). First in the drop order.

## 3. Earlier fits

- **tag:** core (3)
- **show:** tabset, the chapter's own tabs: "Mean" (`mean-figure`), "Stump" (`stump-figure`), "Default tree" (`default-figure`) and "Random forest" (`forest-figure`)
- **words:** none
- **say:** the tabs plot the predicted against the observed strength of the 305 test specimens for four fits on all 8 explanatory variables: the mean training strength, a stump (a tree with a single split, so of depth 1), the default tree, and a random forest with $m$ chosen by its out-of-bag error; a point on the dashed line is predicted exactly; the mean predicts one value, the stump 2, the default tree 15, one per leaf; within a leaf the test strengths have pooled standard deviation 9.1 MPa against 15.9 MPa overall; the test MSEs are 254.7, 183.6, 86.8 and 27.5, the forest with $m = 5$ (bagging has 26.9); the forests are refit here, so their test MSEs differ from those of the previous lecture by up to 0.8; a small tree is a poor fit, bagging and random forests get past this by averaging large trees, and boosting instead keeps the trees small and adds them up one at a time, each fit to the part of the strength the trees before it have not yet explained
- **note:** the chapter's `### Earlier fits` tabs (the chapter's `####` names), four 5.5 by 4.5 inch figures with aligned panels, shown with `.mid-tabs` (`max-height: 520px`); the values are inline R, quoted from the frozen markdown, and are in `say:` only. Effective tick text is 14.1 px, the smallest in the deck. The title is the chapter's `### Earlier fits`.

# Algorithm

- **tag:** transition (0)
- **show:** none (transition slide, title only)
- **say:** boosting starts from the prediction 0 for every specimen, so its first residuals are the strengths themselves; it fits a small tree to the residuals, adds a shrunken copy of the tree's predictions to the fit, and recomputes the residuals; this part shows the residuals as trees are added, writes the algorithm out, and fits it with `rpart()`
- **note:** relies on the opening paragraph of the chapter's `### Residuals`.

## 4. Residuals

- **tag:** core (3)
- **show:** tabset, the chapter's own tabs: "No trees" (`residual-0-figure`), "1 tree" (`residual-1-figure`), "10 trees" (`residual-10-figure`), "100 trees" (`residual-100-figure`) and "1,000 trees" (`residual-1000-figure`)
- **words:** none
- **say:** the tabs plot the residuals of the training specimens against age: at the start, the strengths, then after 1, 10, 100 and 1,000 trees of depth 4 (each leaf reached through at most 4 splits), each tree's predictions multiplied by the shrinkage $\nu = 0.1$ before they are added; after one tree no residual moves by more than 6.6 MPa and the training MSE falls from 1,549.0 to 1,268.9, by 18%; a tree's predictions for its training data average to the mean of the residuals it is fit to, so after $b$ trees the mean fitted value is $1 - (1 - \nu)^b$ times the mean strength, and after 10 trees that factor is $1 - 0.9^{10} = 0.651$, a mean fitted value of 23.3 MPa against a mean training strength of 35.8; by 100 trees the rise with age is gone (correlation with $\log(\texttt{age})$ from 0.57 to 0.03) and after 1,000 trees the training MSE is 1.2
- **note:** the chapter's `### Residuals` tabs, five 8 by 4.2 inch figures with aligned panels, shown with `.mid-tabs`; the values are inline R, quoted from the frozen markdown. The title is the chapter's `### Residuals`.

## 5. Steps

- **tag:** core (2.5)
- **show:** equation — the chapter's numbered steps of boosting, with the prediction $\widehat f_B(x)$, and a symbol legend
- **words:** the three steps ("Set $\widehat f_0(x) = 0$ and $r_i = y_i$ for $i = 1, \ldots, n$"; "For $b = 1, \ldots, B$" with sub-steps a to c; "Predict with the boosted model"); then "$B$ — number of trees, indexed $b$"; "$\widehat f^b(x)$ — prediction at $x$ of the $b$th tree"; "$\nu$, $0 < \nu \le 1$ — shrinkage (learning rate)"; "$\delta$ — depth of each tree; $\delta = 1$ is a stump"; "$r_i$ — current residual of observation $i$"
- **reveal:** on arrival: the three steps; click 1: the legend
- **say:** the tree at step $b$ depends on the trees before it through the residuals, so the trees are grown in sequence; $B$ is the number of trees, indexed $b$, as in the Bagging and Random Forests lecture; the superscript of the $b$th tree names the tree and has no star, because the tree is not fit to a bootstrap sample; $r_i$ is not the lasso residual vector $r$; the shrinkage is what the textbook writes $\lambda$, which here is the ridge and lasso tuning parameter; the depth is the largest number of splits on a path from the root to a leaf; the textbook limits the number of splits, $d$, which here is the number of features of the subset selection lectures, and `rpart()` limits depth with `maxdepth`; a tree of depth $\delta$ has at most $2^\delta$ leaves; $\delta$ is unrelated to the discriminant functions $\delta_k(x)$ and the interaction estimates $\delta_j$, which carry a subscript
- **note:** the chapter's list, with step 1's "for every $x$" and "for every training observation", step 2a's "to the training data, with the residuals ... as the response" and the display of step 3 (written inline, because with the display the slide ended at 787 px; the chapter displays it) shortened; `\hat` written `\widehat`; list at 0.7em, legend at 0.6em; the slide ends at 660 px of 720 after the click. The legend is the chapter's bullet list cut to labels. The title is the chapter's `### Steps`.

## 6. Boosting from scratch

- **tag:** core (2.5)
- **show:** code — the chapter's `boosting` chunk ($B = 1{,}000$ trees of depth 4 with shrinkage 0.1 fit to the residuals with `rpart()`); the chunk prints nothing
- **words:** none
- **say:** the chunk writes the algorithm out with `rpart()`, the fit of the Residuals tabs on all 8 explanatory variables; `cp = 0` lets the depth limit the tree, but `rpart()`'s defaults still apply (`minsplit = 20`, `minbucket = 7`), so $\delta$ is an upper bound on the depth; `xval = 0` skips the cross-validation and `maxcompete = 0` and `maxsurrogate = 0` skip the competing and surrogate splits, which speeds up the loop without changing any tree; the leaves of the first tree hold 11 to 161 training specimens
- **note:** the chunk (17 lines with comments and blanks, a 5-line loop) is copied verbatim, at the normal code size. **The title is not a chapter heading** (the chunk sits under `### Fitting`); it takes the chunk's own comment, "Boosting from scratch", as the Bagging and Random Forests deck's "Bagging from scratch" does. The chunk has no output.

## 7. Boosted prediction

- **tag:** core (1.5)
- **show:** code — the chapter's `boosting-predict` chunk (each tree's predictions for the test specimens, the boosted prediction, and the training and test MSE) and its output `train_mse 1.247399`, `test_mse 20.894387`
- **words:** none
- **say:** the boosted prediction sums the trees' predictions and multiplies by $\nu$; with $B = 1{,}000$ trees the training MSE is 1.2 and the test MSE 20.9, against 86.8 for the default tree and 27.5 for the random forest
- **note:** the chunk (5 lines) and its 2-line output are copied verbatim, at the normal code size. **The title is not a chapter heading** (the chunk sits under `### Fitting`).

# Tuning parameters

- **tag:** transition (0)
- **show:** none (transition slide, title only)
- **say:** boosting has three tuning parameters, the number of trees $B$, the shrinkage $\nu$ and the depth $\delta$; this part shows how the test MSE changes with each
- **note:** relies on the learning objective on the three tuning parameters and the `## Tuning parameters` section.

## 8. Shrinkage

- **tag:** core (2.5)
- **show:** figure — `shrinkage-figure` (test MSE of the boosted model after $b$ trees against $b$ for $\nu = 0.5, 0.1, 0.01$ at depth 4, the random forest's test MSE dashed, the smallest of each curve circled), the figure alone
- **words:** none
- **say:** the smaller the shrinkage, the more trees the model needs: with $\nu = 0.5$ the test MSE is smallest, 20.2, after 179 trees; with $\nu = 0.1$ it is smallest, 20.6, after 1,504; with $\nu = 0.01$ it is 22.2 after 5,000 trees and still falling; the shrinkage controls how fast the model learns, each tree correcting only a fraction $\nu$ of what it estimates; after 100 trees the mean prediction for the test specimens is 21.7 MPa with $\nu = 0.01$ and 34.1 with $\nu = 0.1$, against a mean test strength of 34.1; as a large $\lambda$ does in ridge regression and the lasso, a small $\nu$ holds the fit near its starting point, here 0; part of the slow start with $\nu = 0.01$ is the start at 0: after 100 trees the mean fitted value of the training specimens is $1 - 0.99^{100} = 0.634$ times the mean training strength, 22.7 MPa; the `gbm` package starts instead from the mean of the response
- **note:** the chapter's `shrinkage-figure`, 8 by 4.2 inches, shown at `height=560`; the values are inline R, quoted from the frozen markdown. The title is the chapter's `### Shrinkage`.

## 9. Tree depth

- **tag:** core (2)
- **show:** figure — `depth-figure` (test MSE against the number of trees for depths 1, 2, 4 and 8 at $\nu = 0.1$), the figure alone
- **words:** none
- **say:** deeper trees learn faster: the test MSE is smallest after 305 trees of depth 8 (22.2), 1,504 of depth 4 (20.6) and 4,129 of depth 2 (23.6); the stumps' curve is still falling at 5,000 trees, where it is 32.3, but slowly, the last 1,000 trees lowering it by 0.6; depth 4 does best, and depth 8 reaches its smallest value early and then rises; the Additive structure part shows what the depth changes in the fitted model
- **note:** the chapter's `depth-figure`, 8 by 4.2 inches, shown at `height=560`; the values are inline R, quoted from the frozen markdown. The title is the chapter's `### Tree depth`.

## 10. Overfitting

- **tag:** core (2)
- **show:** figure — `overfitting-figure` (test MSE against the number of trees for $\nu = 0.5$ and $0.1$ at depth 4, on a linear axis), the figure alone
- **words:** none
- **say:** both curves reach a smallest value and then rise: with $\nu = 0.5$ the test MSE rises 12% from its smallest value, after 179 trees, to 5,000 trees, and with $\nu = 0.1$ 5%, after 1,504; the training MSE with $\nu = 0.5$ falls to 0.41 by 5,000 trees while its test MSE is 22.6, the late trees fitting what is left of the training residuals, which does not carry over to the test specimens; bagging's test error levels off instead, between 26.5 and 27.8 from 50 to its 500 trees; boosting overfits when $B$ is too large, and a smaller $\nu$ makes the rise slower
- **note:** the chapter's `overfitting-figure`, 8 by 4.2 inches, shown at `height=560`; the values are inline R, quoted from the frozen markdown. The title is the chapter's `### Overfitting`.

# Choosing $B$

- **tag:** transition (0)
- **show:** none (transition slide, title only)
- **say:** $B$ is chosen without the test data by 10-fold cross-validation; this part defines the cross-validation estimate and shows the model it chooses
- **note:** relies on the opening sentence of the chapter's `### Cross-validation estimate`.

## 11. Cross-validation estimate

- **tag:** core (2)
- **show:** equation — the chapter's $\text{CV}_{(10)}(B)$ display, with the legend
- **words:** "$\mathcal{F}_\ell$ — training observations in fold $\ell$"; "$\widehat f_B^{(-\ell)}$ — boosted model of $B$ trees fit to the observations outside fold $\ell$"
- **reveal:** on arrival: the display; click 1: the legend
- **say:** split the training observations at random into 10 folds; for each fold $\ell$, run boosting on the other nine folds and record the error on fold $\ell$ after every number of trees; one run of $B_{\max}$ trees per fold gives the estimate for every $B \le B_{\max}$, because the model of $B$ trees is the first $B$ trees of the longer run; here $B_{\max} = 5{,}000$, with $\nu = 0.1$ and $\delta = 4$
- **note:** the display is copied from the chapter with `\hat` written `\widehat`, at 0.75em; the legend is the chapter's two bullets cut to labels. The title is the chapter's `### Cross-validation estimate`.

## 12. Chosen model

- **tag:** core (2)
- **show:** figure — `cv-figure` (the cross-validation estimate and the test MSE against the number of trees, the chosen $B$ circled), the figure alone
- **words:** none
- **say:** the cross-validation estimate is smallest, 20.8, at $B = 1{,}207$; the model of the first 1,207 trees fit to all the training specimens has test MSE 20.8, and the smallest test MSE over every number of trees, which cross-validation cannot know, is 20.6 after 1,504 trees; the estimate equals the test MSE to one decimal; both measure predictions for mixes like those tested: 73% of the training specimens share their mix with a training specimen in another fold, and 68% of the test specimens have a mix that some training specimen also has
- **note:** the chapter's `cv-figure`, 8 by 4.2 inches, shown at `height=560`; the values are inline R, quoted from the frozen markdown. The title is the chapter's `### Chosen model`.

# Variable importance

- **tag:** transition (0)
- **show:** none (transition slide, title only)
- **say:** the importance of an explanatory variable in a boosted model is read from the trees' splits, as for a forest
- **note:** relies on the chapter's `## Variable importance` section.

## 13. RSS decrease

- **tag:** core (1.5)
- **show:** equation — the chapter's inline expression for a split's decrease in RSS, set as a display
- **words:** "A split's decrease in RSS"; then "Importance of a variable: its decreases in RSS, summed over the $B$ trees"
- **reveal:** on arrival: the display and its label; click 1: the definition of importance
- **say:** a split's decrease in RSS is the display, as in the Decision Trees lecture, where $n_1$, $n_2$ and the two means are the sizes and means of the two regions of the split; in boosting the RSS is that of the residuals the tree is fit to; the importance of an explanatory variable is the decrease in RSS from all its splits, summed over the $B$ trees; a random forest's `IncNodePurity` averages the same decrease over its trees; with `maxsurrogate = 0`, the `variable.importance` of an `rpart()` fit is this sum for one tree
- **note:** the display is the chapter's inline `$n_1n_2\left(\bar y_1 - \bar y_2\right)^2/\left(n_1 + n_2\right)$`, copied verbatim as a display (it has no `\hat`); the chapter does not define its symbols (it points to the Decision Trees lecture), so the slide does not either. The title is the chapter's `### RSS decrease`.

## 14. RSS decrease in R

- **tag:** optional (1.5)
- **show:** code — the chapter's `importance` chunk (the decrease in RSS of each variable's splits summed over the trees, as a share of the total) and its 4-line printout
- **words:** none
- **say:** for the 1,000 trees of the loop of the Fitting subsection, as shares of the total; the figure on the next slide uses the chosen model of 1,207 trees instead
- **note:** the chunk (5 lines) and its output are copied verbatim, at the normal code size; the output's lines keep their trailing spaces. **The title is the chapter's `### RSS decrease` with a suffix.** Second in the drop order.

## 15. Importance by variable

- **tag:** core (1.5)
- **show:** figure — `importance-figure` (dot charts of the shares of the total decrease in RSS for the boosted model of the chosen 1,207 trees, the random forest with $m = 5$ and the pruned tree, the variables in the order of the boosting shares), the figure alone
- **words:** none
- **say:** the shares are those of the chosen boosted model of 1,207 trees, of the random forest with $m = 5$, and of the pruned tree of the Decision Trees lecture
- **note:** the chapter's `importance-figure`, 9 by 3.8 inches, shown at `height=500` (width-limited at 1185 px). The `40%` of one panel and the `0%` of the next sit close together on the axis (see the report). **The title is not a chapter heading** (the figure sits under `### RSS decrease`).

## 16. Forest and tree importance

- **tag:** core (1)
- **show:** none, a three-line list
- **words:** "Importance ranks the variables"; "No direction"; "No effect size"
- **say:** boosting ranks the variables age, cement, superplasticizer, water, blast_furnace_slag, fine_aggregate, coarse_aggregate and fly_ash; the random forest ranks them age, cement, water, superplasticizer, blast_furnace_slag, fine_aggregate, coarse_aggregate and fly_ash; the pruned tree ranks them cement, age, water, blast_furnace_slag, superplasticizer, fine_aggregate, coarse_aggregate and fly_ash; all three put age and cement in the first two places, with 65% of the boosted model's decrease in RSS, 63% of the forest's and 71% of the tree's; below them the orders differ; as for a forest, importance ranks the variables and gives no direction or effect size
- **note:** the chapter's sentence "importance ranks the variables and gives no direction or effect size" cut into three lines, as the Bagging and Random Forests deck's Interpretation slide does; the ranks and shares are inline R, quoted from the frozen markdown. The title is the chapter's `### Forest and tree importance`. Fifth in the drop order.

# Additive structure

- **tag:** transition (0)
- **show:** none (transition slide, title only)
- **say:** the chapter's question: does the effect of cement on strength depend on age? This part asks it of the raw data, and then of boosted models of stumps and of trees of depth 4
- **note:** relies on the chapter's one-line question under `### Cement and age`.

## 17. Cement and age

- **tag:** core (1.5)
- **show:** figure — `cement-age-figure` (strength of the training specimens in the lowest and the highest third of cement content against age, with the mean strength of each third at every age with at least 5 specimens in both thirds), the figure alone
- **words:** none
- **say:** the high-cement third is stronger at every such age, by 8.5 MPa at 90 days and by about 22 MPa at 7 and 28 days; the two thirds also differ in other ingredients, chiefly fly ash and blast furnace slag, of which the high-cement third has less, so this raw comparison does not isolate cement; a model can
- **note:** the chapter's new `cement-age-figure`, 8 by 4.2 inches, shown at `height=560`; the values are inline R, quoted from the frozen markdown. The title is the chapter's `### Cement and age`. Fourth in the drop order.

## 18. Stumps

- **tag:** core (1.5)
- **show:** equation — the chapter's display of a boosted model of stumps as a sum of functions $a_j(x)$, with a label
- **words:** "$a_j(x)$ — sum of the shrunken stumps that split on $X_j$, a function of $x$ only through $X_j$"; then "Additive model: the change in the prediction when $X_j$ changes does not depend on the other variables"
- **reveal:** on arrival: the display and the label of $a_j(x)$; click 1: the additive-model line
- **say:** the figure on the previous slide asks whether the gap in strength between high- and low-cement mixes changes with age, and a boosted model of stumps cannot let it change; a stump depends on one explanatory variable, and collecting the stumps that split on each variable, a boosted model of stumps is a sum of functions that each depend on one variable; this is an additive model; the function is written $a_j(x)$, not $g_j(x_j)$, because $g_j$ is the PLS simple regression estimate and the naive Bayes log density ratio, and a single subscript on $x$ means an observation
- **note:** the display is copied from the chapter with `\hat` written `\widehat`, at 0.75em; the label is the chapter's "where $a_j(x)$ is the sum of the shrunken stumps that split on $X_j$, which depends on $x$ only through the value of $X_j$" shortened; the last line is the chapter's definition of an **additive model**. The title is the chapter's `### Stumps`.

## 19. Depth and interactions

- **tag:** core (1)
- **show:** none, a two-line list
- **words:** "Each leaf is reached through at most $\delta$ splits"; "Interactions among at most $\delta$ variables"
- **say:** a tree of depth $\delta$ can split on more than $\delta$ explanatory variables in all: the 1,207 trees of depth 4 of the chosen model split on 1 to 8, with median 4; but each leaf is reached through at most $\delta$ splits, so the tree's prediction is a sum, over its leaves, of a constant times an indicator that involves at most $\delta$ variables; a boosted model of such trees is a sum of such terms, so it can represent interactions among at most $\delta$ variables
- **note:** the chapter's sentences "each leaf is reached through at most $\delta$ splits" and "it can represent interactions among at most $\delta$ variables", cut to two lines; the 1 to 8 and the median 4 are inline R, quoted from the frozen markdown. **The title is not a chapter heading** (the paragraph sits under `### Stumps`); it names the learning objective the lines state.

## 20. Stumps and trees of depth 4

- **tag:** core (2)
- **show:** tabset, the chapter's own tabs: "Depth 1" (`stumps-figure`) and "Depth 4" (`depth-4-figure`)
- **words:** none
- **say:** the tabs plot the predicted strength against age for mixes with 200 and 400 kg of cement per cubic meter, the other six ingredients at their training medians, for the boosted model of 5,000 stumps with $\nu = 0.1$ and for the chosen model of 1,207 trees of depth 4; for the stumps the two curves are parallel, the extra cement adding 18.6 MPa at every age; for the trees of depth 4 the gap runs from 7.3 to 20.7 MPa depending on age, an interaction, as the raw thirds suggested; whether the interactions matter is a question for the test error: the stumps' test MSE after 5,000 trees, 32.3 and still falling slowly, is above the smallest test MSE of every depth that allows interactions, 23.6 for depth 2, 20.6 for depth 4 and 22.2 for depth 8
- **note:** the chapter's `### Stumps` tabs (the chapter's `####` names), two 8 by 4.2 inch figures with aligned panels, shown with `.mid-tabs`; the values are inline R, quoted from the frozen markdown. **The title is not a chapter heading** (it names the two tabs).

# Comparison

- **tag:** transition (0)
- **show:** none (transition slide, title only)
- **say:** this part compares boosting with bagging and random forests, and with every other fit of the three tree lectures, on test error, and lists its limits
- **note:** relies on the chapter's `## Comparison` section.

## 21. Bias and variance

- **tag:** core (2)
- **show:** figure — `bias-variance-figure` (test MSE against the number of trees for bagging and boosting with the same small trees, stumps and trees of depth 4, in two panels), the figure alone
- **words:** none
- **say:** one stump fit to all the training specimens has test MSE 183.6 and one tree of depth 4 91.9; averaging 1,000 of them over bootstrap samples brings these to 171.7 and 59.9, and boosting the same kinds of trees brings them to 32.3 and 21.6 with 5,000 trees; a small tree's error is mostly bias: it cannot follow the curve in age, or the effect of the other ingredients, with a few leaves; averaging removes variance but leaves the bias of the trees it averages, so bagging needs large trees; boosting removes bias, since each tree is fit to what the trees before it got wrong
- **note:** the chapter's `bias-variance-figure`, 9 by 4.2 inches, shown at `height=540` (1158 px wide); the values are inline R, quoted from the frozen markdown. The title is the chapter's `### Bias and variance`.

## 22. Test error

- **tag:** core (2)
- **show:** table — the chapter's `comparison_table` (test MSE of eight fits, with how each was tuned), copied from the frozen markdown
- **words:** none
- **say:** the table collects the test MSE of every fit to all 8 explanatory variables in the three tree lectures, with how each was tuned; boosting has the smallest test MSE, 20.8, 23% below the best of the other fits, 26.9; only $B$ was chosen by cross-validation, and $\nu = 0.1$ and $\delta = 4$ were fixed in advance, but $\delta = 4$ is also the depth with the smallest test MSE in the Tree depth section, so 20.8 is mildly optimistic; even taking the best $B$ for each depth, chosen on the test specimens and so flattering to boosting, depths 2, 4 and 8 reach 23.6, 20.6 and 22.2, all below bagging's 26.9, which used no tuning; least squares with $\log(\texttt{age})$, which needed a feature built after seeing the curve in age, has 48.5, and the tree ensembles find the curve and the interactions without it
- **note:** the table is copied verbatim from `result.markdown` and wrapped in `.auto-table`, which sets the column widths from the content. The chapter's `tbl-colwidths: [38, 47, 15]` appears in the frozen markdown only as an attribute on the `.cell` div around the table, not in the pipe table, whose separator line is the table's only width information, so the class sets the widths here. The table ends at 574 px. The title is the chapter's `### Test error`.

## 23. Limits

- **tag:** core (1)
- **show:** none, a five-line list cut from the chapter's paragraph
- **words:** "Three tuning parameters: $B$, $\nu$, $\delta$"; "$B$ must be chosen: too many trees overfit"; "Trees grown in sequence, not in parallel"; "No single tree to read: importance rankings only"; "Predictions made of steps, constant beyond the largest training value"
- **say:** boosting has three tuning parameters, against a random forest's $m$ and number of trees, and its $B$ must be chosen, since too many trees overfit, while a forest only needs enough trees; its trees are grown in sequence, each needing the residuals of the one before, so they cannot be grown at the same time as a forest's can, and the cross-validation refit 5,000 trees in each of 10 folds; with many trees it fits the training data nearly exactly: the training MSE fell to 0.41 with $\nu = 0.5$ while that fit's test MSE never fell below 20.2; like a forest it has no single tree to read, its predictions are made of steps, and it predicts a constant beyond the largest value of an explanatory variable in the training data, since every tree does
- **note:** the chapter's `### Limits` paragraph cut to five lines. The chapter's `### Beyond this course` callout that follows is not used. Third in the drop order.

## 24. Conclusion

- **tag:** core (1)
- **show:** none, a flat list of six takeaways
- **words:** "Boosting adds small trees, each fit to the residuals of the trees before it"; "A smaller $\nu$ needs more trees"; "Depth $\delta$ allows interactions among at most $\delta$ variables"; "Too many trees overfit: choose $B$ by cross-validation"; "Boosting reduces bias; bagging reduces variance"; "Importance ranks variables, with no direction or effect size"
- **say:** the chapter's Conclusion: boosting builds a model from small trees added one after another, starting from the fit 0; each tree is fit to what the trees before it got wrong, so the trees depend on one another and are grown in sequence; a smaller $\nu$ needs more trees and makes the test error less sensitive to their number; each leaf of a tree of depth $\delta$ is reached through at most $\delta$ splits, so the model can represent interactions among at most $\delta$ variables, and stumps give an additive model; $B$ is chosen by cross-validation since, unlike bagging, boosting overfits when $B$ is too large, and one run of boosting gives the estimate for every $B$ up to its length; bagging and random forests average large trees, each with low bias and high variance, which reduces variance, while boosting adds small trees, each with high bias, which reduces bias; importance ranks the variables without a direction or an effect size, as for a forest; the next lecture begins support vector machines (ISLR2 Chapter 9), which classify by finding a boundary that separates the classes in the space of the features, with as wide a margin as possible
- **note:** distilled from the chapter's `## Conclusion` (one line per main result); no example numbers. The chapter's sentence "stumps give an additive model" is in `say:` only, so that the third line fits on one line.
