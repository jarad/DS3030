# Slide outline: Random Forests

(drafted 2026-10-31)

Outline for `20-bagging-and-random-forests_slides.qmd` (Wed 2026-11-11, the second lecture on tree-based methods; ISLR2 Sections 8.2.1 and 8.2.2). **This file is the spec; the deck is built from it, and this file describes the deck as it stands.** Edit it freely and ask for the deck to be refreshed.

Drafted against `20-bagging-and-random-forests.qmd`, the deck's `derived-from` comment records the chapter's commit (`5524cc4`). The frozen output `_freeze/08-trees/20-bagging-and-random-forests/execute-results/html.json` is current: its recorded `hash` (`a7306dc4c9db5c7473f1b6ad6ed83a2a`) equals the md5 of the chapter file as it stands, which includes the "Slides for this lecture" link (`20-bagging-and-random-forests_slides.html`) on the line after `# Random Forests`.

**What the deck is.** 35 slides including the title: the agenda, six transitions, 27 content slides (the last is the Conclusion). It reuses 10 of the 11 figures the chapter renders (the `halves-figure` and `average-figure` share one tabset; the `penguin-figure` is not used), two of its five kable tables (`correlation_table` and `concrete_table`; `settle_display`, `penguin_m_table` and `penguin_table` are left out) and five code slides: the basic `rpart()` and `randomForest()` code of the chapter's visible chunks with their console output. The deck has no new content: every `show:` is a figure, table, equation, code chunk or console printout the chapter already has, or a list cut from the chapter's own sentences. The deck uses the chapter's running example on the Decision Trees lecture's data and split: `modeldata::concrete` (700 training and 305 test specimens; the response is `compressive_strength` in MPa; the explanatory variables are seven ingredients in kg per cubic meter and `age` in days). The chapter's other example is left out (see "Not in this deck").

**Timing.** One 50-minute period: the 26 core slides (the agenda and 25 content slides) come to about 41 minutes at the estimates below, and the two optional slides add about 2.5 more, so the period is not full. If time is short, drop in this order: (1) One tree, (2) Appearances in a bootstrap sample (say the 243 of 700 left out, 34.7%, while on Bootstrap samples), (3) Split restriction: correlation (say the two correlation estimates, 0.09 and 0.04, on Split restriction), (4) Interpretability and cost (say it on the Conclusion). The natural break if the chapter is taught over two days is after Choosing $m$ (slide 18), where the concrete forest is complete.

**Code slides.** The five code slides are entries 7 (`bagging`), 10 (`oob-prediction`), 16 (`forest-fit`), 19 (`one-tree`, optional) and 21 (`importance`). Each shows the chunk's source copied verbatim from the chapter (without the `#|` lines) in a ` ```r ` block, which is not executed, followed by the chunk's console output copied verbatim from the frozen markdown in a plain ` ``` ` block (the two outputs of `forest-fit` are joined in order, as R shows them). Nothing is trimmed. All five are at the deck's normal code size (22 px); entry 16 is wrapped in a new `.code-wrap` class (`white-space: pre-wrap`) because the `Call:` line of a `randomForest()` printout is one long line (about 90 characters) that would run off the slide at that size; wrapping changes where the line breaks, not its text. The `.code-small` class is not needed.

**Not in this deck.** The chapter's `## Classification forests` section, with its `penguin-split`, `penguin-forest` and `penguin-test` chunks, the `penguin_m_table` and `penguin_table` tables and the `penguin-figure`, is left out because the instructor has no time for it; it stays in the chapter. Also left out: the visible chunks `split` (the splits show as the 700 and 305 on the Data slide) and `out-of-bag` (the counts of left-out specimens, in `say:` only); every collapsed `### Code` callout (including the `replay` chunk, the `settle_display` table and the `mtry` numbers); the `### Beyond this course` callout; the chapter has no `### For example,` callout. The bootstrap-sample probability's limit argument, the estimation of $\hat\rho$ and $\hat\sigma^2$ and the `nodesize` default are in `say:` only.

**Response variable and explanatory variables.** The response is `compressive_strength` (MPa); the explanatory variables are the 7 ingredients and `age`, $p = 8$. A tree and a forest split on the explanatory variables as recorded, so each feature is an explanatory variable.

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
- **words:** Data; Bagging (Unstable trees, Averaging, Bootstrap samples, Bagged trees); Out-of-bag error (Out-of-bag prediction, Out-of-bag and test error); Random forests (Definition, Correlated trees, Split restriction, Fitting a random forest, Forest size, Choosing $m$); Variable importance (Two measures, Interpretation); Comparison (Test error, Extrapolation, Interpretability and cost)
- **say:** distilled from the chapter's six learning objectives; the Decision Trees lecture ended with a weakness, that trees fit to different training samples differ, and this lecture averages many trees to reduce that variance; the one-tree split counts (optional), the left-out counts, the forest-size table, the Beyond this course callout and the hand-off to the next lecture are in the notes and not in the agenda
- **note:** relies on the chapter's `## Data`, `## Bagging`, `## Out-of-bag error`, `## Random forests`, `## Variable importance` and `## Comparison` headings and the `###` children the deck spends slides on. Three columns because the 23 lines do not fit one or two, split as Data, Bagging and Out-of-bag error (nine lines), then Random forests (seven), then Variable importance and Comparison (seven). The Conclusion is not an agenda item.

# Data

- **tag:** transition (0)
- **show:** none (transition slide, title only)
- **say:** the data and splits are those of the Decision Trees lecture, so its numbers can be compared with this lecture's; the question is whether an average of many trees predicts the strength of concrete better than one tree
- **note:** relies on the chapter's `**Question.**` paragraph under `## Data`.

## 1. Concrete specimens

- **tag:** core (1)
- **show:** none, a words-only data slide: two blocks of bullets with white space between them
- **words:** "Response: `compressive_strength`"; "Explanatory variables:" with the eight sub-bullets `cement`, `blast_furnace_slag`, `fly_ash`, `water`, `superplasticizer`, `coarse_aggregate`, `fine_aggregate`, `age`; then, after a gap, "Training specimens: 700" and "Test specimens: 305"
- **reveal:** none
- **say:** 7 ingredient amounts (kg per cubic meter) and the age (days), $p = 8$; exact duplicate rows removed; the training specimens are the first random draw after `set.seed(20261031)`, as in the Decision Trees lecture; a collapsed callout in the chapter recomputes that lecture's test results to confirm the split: 106.4 for least squares with main effects only, 48.5 with $\log(\texttt{age})$, 86.8 for the default tree, and 40.3 and 42.2 for the full and pruned trees
- **note:** the chapter's `### Concrete specimens` paragraph as a data layout: the response, the explanatory variables as a list, and the two sample sizes, in one font size (0.75em) with the second block set off by a 1em top margin; the word is "specimens" for these data (people, units and so on for other data). 700 and 305 are inline R in the chapter, quoted from the frozen markdown. The title is the chapter's `### Concrete specimens`; the chapter's `## Data` is the transition.

# Bagging

- **tag:** transition (0)
- **show:** none (transition slide, title only)
- **say:** bagging fits each tree to a bootstrap sample of the training data; this part shows why averaging trees helps, defines a bootstrap sample and the bagged prediction, and writes the algorithm out with `rpart()`
- **note:** relies on the chapter's opening paragraph and the `## Bagging` section.

## 2. Unstable trees

- **tag:** core (2)
- **show:** tabset, the chapter's own tabs: "Halves" (`halves-figure`) and "Their average" (`average-figure`)
- **words:** none
- **say:** the earlier lecture split the 700 training specimens at random into two halves of 350 (a halving) and fit the default tree on age and cement to each; the first tab plots the predicted strength at 28 days against cement of the trees from the first 20 halvings, over the 28-day specimens, and the second adds their average; the 40 trees put their steps in different places and at a given cement content their predictions span up to 29.9 MPa; over all 200 halvings the most common first split, `age < 21`, is the first split of 74% of the 400 trees; the average of the 40 curves is smoother than any one of them: it still steps, but in many small steps
- **note:** the chapter's `### Unstable trees` tabs (the chapter's `####` names), two 8 by 4.2 inch figures with aligned panels, shown with `.mid-tabs` (`max-height: 520px`); the values are inline R, quoted from the frozen markdown, and are in `say:` only.

## 3. Averaging

- **tag:** core (3)
- **show:** equation — the chapter's variance-of-an-average derivation, as one two-line `aligned` display
- **words:** "$B$ — number of predictions averaged, $b = 1, \ldots, B$"; "$\sigma^2$ — variance of one prediction at $x$"; "$\rho$ — correlation between two of them"
- **reveal:** none: the whole display, then the legend
- **say:** at 300 kg of cement and 28 days the 40 trees predict between 32.7 and 42.5 MPa, standard deviation 2.6, average 37.6; let $B$ predictions at the same $x$ each have variance $\sigma^2$ and correlation $\rho$ between any two ($\sigma^2$ is the variance of one prediction in this lecture, not the error variance of a regression model); with independent predictions, $\rho = 0$, the variance falls like $1/B$; with correlated ones it falls toward $\rho\sigma^2$, the term that does not depend on $B$
- **note:** the chapter's two-line `aligned` display, copied whole so that the legend does not interrupt it (the second line ends with a period, the chapter's comma); `\hat` written `\widehat`; display at 0.75em, legend at 0.7em.

## 4. Bootstrap samples

- **tag:** core (2)
- **show:** equation — the chapter's display of the probability an observation is left out
- **words:** "Bootstrap sample" with the three sub-bullets "$n$ training observations", "$n$ draws" and "with replacement"; then "Probability that a given observation is missed by all $n$ draws" with the display under it
- **reveal:** on arrival: the definition and its sub-bullets; click 1: the probability bullet and its display
- **say:** there is one training sample, not $B$; bagging, short for bootstrap aggregation, makes $B$ training samples from it by resampling, as in the optional Bootstrap lecture, which was not taught this semester; an observation is missed by one draw with probability $1 - 1/n$, and by all $n$ draws with probability $(1 - 1/n)^n$, whose limit is the case $x = -1$ of $(1 + x/n)^n \to e^x$; for $n = 700$ it is 0.368; a bootstrap sample holds about 63% of the training observations, some more than once
- **note:** the display is copied from the chapter, without its comma, as the continuation of the probability bullet; both lists are at 0.8em, so bullets at the same level share a font size; 0.368 is inline R, quoted from the frozen markdown; the chapter's "where $n$ is the number of training observations" is in the first sub-bullet.

## 5. Appearances in a bootstrap sample

- **tag:** core (1)
- **show:** figure — `boot-figure` (how many of the 700 training specimens appear 0, 1, 2, ... times in one bootstrap sample), the figure alone
- **words:** none
- **say:** this bootstrap sample leaves out 243 of the 700 training specimens, 34.7%
- **note:** the chapter's `boot-figure`, 7 by 3.8 inches, shown at `height=540`. **The title is not a chapter heading** (the figure sits under `### Bootstrap samples`). Second in the drop order.

## 6. Bagged trees

- **tag:** core (1.5)
- **show:** equation — the chapter's $\widehat f_{\text{bag}}(x)$ display with its legend compressed to labels
- **words:** "$\widehat f^{*b}(x)$ — prediction at $x$ of the tree fit to bootstrap sample $b$"; "$\widehat f_{\text{bag}}(x)$ — bagged prediction"; then "Trees grown full, not pruned"
- **reveal:** on arrival: the display and its legend; click 1: the last line
- **say:** bagging fits a tree to bootstrap sample $b$, for $b = 1, \ldots, B$, and predicts with their average; the star marks a quantity computed from a bootstrap sample; each tree has low bias and high variance, and the average removes much of the variance
- **note:** the display is copied from the chapter with `\hat` written `\widehat`; the last line is the chapter's sentence "The trees are grown full and not pruned" shortened; the legend and the last line are both at 0.7em.

## 7. Bagging from scratch

- **tag:** core (2.5)
- **show:** code — the chapter's `bagging` chunk ($B = 300$ full trees with `rpart()`, each fit to a bootstrap sample, and the test MSE of their average) and its output `test_mse 26.76253`
- **words:** none
- **say:** the chunk writes the bagging algorithm out with `rpart()`: 300 full trees on all 8 explanatory variables, each fit to its own bootstrap sample; `xval = 0` skips the cross-validation `rpart()` would otherwise run in each fit and nothing is pruned; `tree_pred` holds one column of test predictions per tree and the bagged prediction averages each row; the test MSE of the average is 26.8
- **note:** the chunk (9 lines) and its 2-line output are copied verbatim, at the normal code size. **The title is not a chapter heading** (the chunk sits under `### Bagged trees`); it takes the chunk's own comment, "Bagging from scratch".

## 8. Bagged trees: test MSE

- **tag:** core (2)
- **show:** figure — `bag-figure` (test MSE of the average of the first $k$ trees against $k$, with the full tree's test MSE dashed), the figure alone
- **words:** none
- **say:** a single tree fit to a bootstrap sample has test MSE between 47.7 and 102.2, every one above the full tree's 40.3, and each sees only about 63% of the distinct specimens; averaging brings the test MSE to 26.8 with 300 trees and from $k = 15$ on it stays within 5% of that value; what remains of the variance is the $\rho\sigma^2$ term, which more trees do not reduce; after $k = 15$ the curve stays between 26.3 and 27.9, so adding trees does not overfit
- **note:** the chapter's `bag-figure`, 8 by 4.2 inches, shown at `height=560`. **The title is the chapter's `### Bagged trees` with a suffix** so that two slides do not share a title. The values are inline R, quoted from the frozen markdown.

# Out-of-bag error

- **tag:** transition (0)
- **show:** none (transition slide, title only)
- **say:** the observations a bootstrap sample leaves out give each training observation a prediction from trees that never saw it; this part defines the out-of-bag prediction and compares the out-of-bag error with the test error
- **note:** relies on the chapter's conclusion sentence on out-of-bag error and the `## Out-of-bag error` section.

## 9. Out-of-bag prediction

- **tag:** core (2)
- **show:** equation — the chapter's $\text{MSE}_{\text{OOB}}$ display, then $\widehat f_{\text{OOB}}(x_i)$, with the legend
- **words:** "$\mathcal{O}_i$ — bootstrap samples that leave out observation $i$; $\left|\mathcal{O}_i\right|$ — their number"; "$\widehat f_{\text{OOB}}(x_i)$ — OOB prediction of observation $i$"
- **reveal:** on arrival: the $\text{MSE}_{\text{OOB}}$ display; click 1: the $\widehat f_{\text{OOB}}(x_i)$ display and its legend
- **say:** each bootstrap sample of the loop leaves some training specimens out (the first five leave out between 243 and 274 of the 700, and the tree fit to each never saw them); the out-of-bag (OOB) prediction of a training specimen averages the predictions of only the trees whose bootstrap samples left it out; every training observation is predicted by trees that did not use it, as a held-out fold is in cross-validation, but the OOB error comes from the bagged fit itself, with no refitting
- **note:** the chapter's one display with two parts, split at its `\qquad` so the definition of $\widehat f_{\text{OOB}}$ can be revealed after the MSE; `\hat` written `\widehat`; the displays are at 0.75em. The chunk `out-of-bag` (left-out counts) is not a slide.

## 10. Out-of-bag prediction in R

- **tag:** core (1.5)
- **show:** code — the chapter's `oob-prediction` chunk (each tree's predictions for the training specimens, the OOB prediction and the OOB MSE) and its output `oob_mse 27.03195`
- **words:** none
- **say:** computed from the 300 trees of the loop: `train_pred` holds each tree's predictions for the training specimens and each specimen's OOB prediction averages the trees that left it out; the OOB MSE is 27.0
- **note:** the chunk (5 lines) and its 2-line output are copied verbatim, at the normal code size. **The title is the chapter's `### Out-of-bag prediction` with a suffix.**

## 11. Out-of-bag and test error

- **tag:** core (2)
- **show:** figure — `oob-figure` (OOB MSE and test MSE of the first $k$ trees against $k$), the figure alone
- **words:** none
- **say:** a training specimen is out of bag for between 30% and 45% of the 300 trees, on average 36.9%, and every specimen has at least one out-of-bag tree among the first $k$ from $k = 15$ on; with 300 trees the OOB MSE is 27.0 and the test MSE 26.8; the OOB MSE is above the test MSE at every $k$ from 15 to 300, by up to 6.9, most for few trees; the OOB error here measures predictions for mixes like those tested: 74% of the training specimens share their mix with another training specimen and 68% of the test specimens have a mix that some training specimen also has
- **note:** the chapter's `oob-figure`, 8 by 4.2 inches, shown at `height=560`; the values are inline R, quoted from the frozen markdown, and are in `say:` only. The title is the chapter's `### Out-of-bag and test error`.

# Random forests

- **tag:** transition (0)
- **show:** none (transition slide, title only)
- **say:** bagged trees tend to make the same strong splits, so they are correlated and the $\rho\sigma^2$ term remains; a random forest lets each split choose among only $m$ randomly chosen explanatory variables, which decorrelates the trees at some cost in the accuracy of each; this part defines a random forest, shows the correlation, defines the restriction, fits a forest and chooses the number of trees and $m$
- **note:** relies on the chapter's `## Random forests` section and its Conclusion paragraph.

## 12. Definition

- **tag:** core (1)
- **show:** none, a list of three ingredients and a closing line
- **words:** "**Bootstrap samples**: each tree is fit to its own bootstrap sample of the training data"; "**Averaging**: the forest predicts with the average of its trees' predictions"; "**Random variable inclusion**: at each split, the tree chooses among only a random subset of the explanatory variables"; then "Bagged trees have the first two; the third is the change a random forest makes"
- **reveal:** on arrival: the three ingredients; click 1: the closing line
- **say:** a random forest combines three ingredients: bootstrap samples, averaging (or a majority vote for a class), and random variable inclusion; bagged trees have the first two and the third is the one change a random forest makes to them
- **note:** the chapter's `### Definition` (the three bullets and the sentence after them); the symbols $m$ and $p$ are defined on the Split restriction slide, not here. Both lists at 0.85em.

## 13. Correlated trees

- **tag:** core (1.5)
- **show:** figure — `root-figure` (the share of the 500 trees whose first split uses each variable, in bagging and in the random forest), the figure alone
- **words:** none
- **say:** two forests of 500 trees fit to all the training specimens with `randomForest()`: bagging, which may split on any of the 8 explanatory variables, and the random forest described next; in bagging 96% of the trees split first on age, in the random forest 28% do; bagged trees are fit to overlapping samples of the same training data and nearly all begin with the same split
- **note:** the chapter's `root-figure`, 8 by 3.8 inches, shown at `height=540`; the values are inline R, quoted from the frozen markdown. The title is the chapter's `### Correlated trees`.

## 14. Split restriction

- **tag:** core (1.5)
- **show:** none, the chapter's definition and symbol list
- **words:** "At each split, a tree may use only $m$ of the $p$ explanatory variables, chosen at random anew for that split" with the sub-bullets "$p$ — number of explanatory variables" and "$m \le p$ — number tried at each split"; then "$m = p$ is bagging"; then "Default `randomForest()`: $m = \lfloor p/3 \rfloor$ for a numeric response"
- **reveal:** on arrival: the definition and its two sub-bullets; click 1: $m = p$ is bagging; click 2: the default
- **say:** the random subset of explanatory variables is the third ingredient of a random forest; a strong variable such as age is not available at many splits, including the first split of many trees, so the trees differ more, at the cost of some accuracy in each; for the 8 concrete explanatory variables the default is $m = 2$; by its default `nodesize` `randomForest()` does not split a node with 5 or fewer observations, so its regression trees are nearly, not exactly, full
- **note:** all bullets at 0.8em, the symbol list nested under the definition; the chapter's bulleted $p$ and $m$ list and the sentences "$m = p$ is bagging" and "`randomForest()` uses $m = \lfloor p/3 \rfloor$ by default for a numeric response", shortened (its class default is not used); the 2 and the 5 are inline R, quoted from the frozen markdown. The title is the chapter's `### Split restriction`.

## 15. Split restriction: correlation

- **tag:** optional (1.5)
- **show:** table — the chapter's `correlation_table` ($m$, $\widehat\sigma^2$, $\widehat\rho$ and $\widehat\rho\widehat\sigma^2$ for bagging and the random forest), copied from the frozen markdown, with two lines under it
- **words:** "$\widehat\sigma^2$ and $\widehat\rho\widehat\sigma^2$: averages over the 305 test specimens of values at one $x$"; then "Restriction: lower $\widehat\rho$, higher $\widehat\sigma^2$"
- **reveal:** on arrival: the table and the first line; click 1: the second line
- **say:** estimated for trees fit to 350 specimens (a half) across 100 random halvings of the training specimens: a forest of 100 trees fit to the first half of each, with $m = p$ and the default $m$; at each test specimen the variance of one tree's prediction splits into the variance across halvings of a forest's expected prediction (shared by all its trees) and the variance among the trees of one forest; these are values at one $x$, the explanatory variables of one test specimen, and the table averages them over the 305 test specimens: $\widehat\sigma^2$ is the average of the sum of the two parts, $\widehat\rho\widehat\sigma^2$ the average of the first part and $\widehat\rho$ their ratio; $\widehat\rho$ is 0.09 with $m = p$ and 0.04 with $m = 2$; for these data the restriction lowers the correlation between trees and raises the variance of one tree, from 62 to 105: it randomizes each tree's splits, so the trees differ more, and each tree is a more variable predictor; the part no number of trees removes, $\widehat\rho\widehat\sigma^2$, is 5.8 for bagging and 4.4 for the forest; these are variances across halvings of the 700 training specimens, which overlap, not across independent training samples, and they say nothing about bias; the restriction also changes each tree: a single tree of the forests of 500 trees has mean test MSE 68.2 with $m = p$ and 111.9 with $m = 2$
- **note:** the table is copied verbatim from `result.markdown` with `\hat` in its headers written `\widehat`, wrapped in `.auto-table`; the two lines are the chapter's sentences "averaged over the test specimens" and "the restriction lowers the correlation between trees and raises the variance of one tree", cut to labels, at 0.7em; the values in `say:` are inline R in the chapter. **The title is the chapter's `### Split restriction` with a suffix.** Third in the drop order.

## 16. Fitting a random forest

- **tag:** core (2)
- **show:** code — the chapter's `forest-fit` chunk (`randomForest()` with the default $m$ and number of trees, its printout and its test MSE) and its two console outputs, joined
- **words:** none
- **say:** the printout gives the number of trees, the $m$ used ("variables tried at each split"), the OOB MSE ("mean of squared residuals"), 32.2, and "% Var explained", one minus the OOB MSE divided by the variance (divisor $n$) of the training responses; the test MSE is 34.2
- **note:** the chunk (5 lines) and its printout and 2-line test MSE are copied verbatim; the slide is wrapped in the new `.code-wrap` class because the `Call:` line is about 90 characters. The title is the chapter's `### Fitting` (under `## Random forests`) made specific, since the bare word names no model on a slide.

## 17. Forest size

- **tag:** core (1.5)
- **show:** figure — `ntree-figure` (OOB MSE and test MSE against the number of trees, for bagging and the random forest, two panels), the figure alone
- **words:** none
- **say:** `randomForest()` computes the OOB MSE after $k$ trees from the specimens with at least one out-of-bag tree among them, so its curves start at one tree; the chapter's table (not on a slide) gives the number of trees from which each curve stays within 5% and 2% of its value with 500 trees, and the slowest to settle within 5% is the random forest's OOB curve, at 111 trees, so 500 trees are enough; with 500 trees bagging has OOB MSE 27.6 and test MSE 27.1 and the forest with $m = 2$ has 32.2 and 34.2; the OOB MSE is above the test MSE from 2 trees on for bagging and below it from 95 trees on for the forest; here the default $m$ predicts worse than bagging: the restriction lowered the variance averaging cannot remove, from 5.8 to 4.4, yet the test MSE rose from 27.1 to 34.2, so the increase is bias, since with $m = 2$ a tree often cannot split on the variables that matter most
- **note:** the chapter's `ntree-figure`, 8 by 4.2 inches, shown at `height=560`; the values are inline R, quoted from the frozen markdown. The title is the chapter's `### Forest size`. The `settle_display` table is not on a slide.

## 18. Choosing $m$

- **tag:** core (1.5)
- **show:** figure — `mtry-figure` (OOB and test MSE of a forest of 500 trees for each $m$ from 1 to 8, the smallest OOB MSE circled), the figure alone
- **words:** none
- **say:** the OOB MSE chooses $m$ without the test data; it is smallest at $m = 5$, 26.6, and that forest's test MSE is 26.7; with $m = 1$ each split is on one variable chosen at random and both errors are highest, 56.2 and 58.7; every $m$ from 3 to 8 has an OOB MSE within 5% of the smallest, so the choice among them matters little
- **note:** the chapter's `mtry-figure`, 8 by 4 inches, shown at `height=560`; the values are inline R, quoted from the frozen markdown. The title is the chapter's `### Choosing $m$` (the heading carries inline math).

# Variable importance

- **tag:** transition (0)
- **show:** none (transition slide, title only)
- **say:** a forest of hundreds of trees has no single diagram to read, so it is summarized by two importance measures instead
- **note:** relies on the last sentences of the chapter's `### One tree`.

## 19. One tree

- **tag:** optional (1)
- **show:** code — the chapter's `one-tree` chunk (the default tree on all 8 explanatory variables and a count of its splits on each) and its table of counts
- **words:** none
- **say:** a single tree shows which explanatory variables it uses; the default tree of the Decision Trees lecture on all 8 has splits on age (5), blast_furnace_slag (2), cement (4) and water (3), and never splits on fly_ash, superplasticizer, coarse_aggregate or fine_aggregate
- **note:** the chunk (5 lines) and its table output are copied verbatim, at the normal code size. The title is the chapter's `### One tree`. First in the drop order.

## 20. Two measures

- **tag:** core (1.5)
- **show:** none, the chapter's two definitions
- **words:** "**Decrease in RSS** (`IncNodePurity`)" with "total decrease from the splits on the variable in a tree, averaged over the trees"; "**Permutation importance** (`%IncMSE`)" with "increase in a tree's OOB MSE when the variable is shuffled among its OOB observations, averaged over the trees"
- **say:** both measures are computed by `randomForest()` with `importance = TRUE`; shuffling breaks the variable's relation to the response, and the tree is not refit; with `scale = FALSE` the increase is in the units of the MSE, by default `importance()` divides it by its standard error
- **note:** the chapter's two bullets of `### Two measures` cut to a bold name, the name `randomForest()` prints and a nested line each (the names for a class are not used). The title is the chapter's `### Two measures`.

## 21. Two measures in R

- **tag:** core (1.5)
- **show:** code — the chapter's `importance` chunk (`importance(rf_fit, scale = FALSE)`) and its 8-row printout
- **words:** none
- **say:** both importance measures of the forest on the Fitting slide, the permutation increase in MPa squared; the eight rows are the explanatory variables
- **note:** the chunk (2 lines) and its 9-line output are copied verbatim, at the normal code size. **The title is the chapter's `### Two measures` with a suffix.**

## 22. Importance by variable

- **tag:** core (1.5)
- **show:** figure — `importance-figure` (dot charts of the permutation increase in OOB MSE and the decrease in RSS for each variable, in the permutation order), the figure alone
- **words:** none
- **say:** by permutation importance the order is age, cement, water, superplasticizer, fine_aggregate, blast_furnace_slag, coarse_aggregate, fly_ash, and by the decrease in RSS age, cement, water, superplasticizer, fine_aggregate, coarse_aggregate, blast_furnace_slag, fly_ash, both with age first; every variable has a positive decrease in RSS, so every one is split on somewhere, including those the single tree never used: with $m = 2$ a variable is among those tried at a split with probability $m/p = 0.25$, so the strongest are often unavailable
- **note:** the chapter's `importance-figure`, 9 by 3.8 inches, shown at `height=500` (width-limited at 1185 px); the orders are inline R, quoted from the frozen markdown. **The title is not a chapter heading** (the figure sits under `### Two measures`).

## 23. Interpretation

- **tag:** core (1)
- **show:** none, a three-line list
- **words:** "Importance ranks the variables"; "No direction"; "No effect size"
- **say:** a large importance for water says that predictions get worse without it, not whether concrete gets stronger or weaker as water increases, with the others fixed, or by how much; the two measures order the variables differently here, because they measure different things: the fit to the training data within each tree and the loss of out-of-bag accuracy when the variable is shuffled
- **note:** the chapter's sentence "Importance ranks the variables; it gives no direction and no effect size" cut into three lines. The title is the chapter's `### Interpretation`.

# Comparison

- **tag:** transition (0)
- **show:** none (transition slide, title only)
- **say:** this part compares bagging and random forests with a single tree and with least squares on test error, behavior outside the range of the training data, and interpretability and cost
- **note:** relies on the chapter's `## Comparison` section.

## 24. Test error

- **tag:** core (2)
- **show:** table — the chapter's `concrete_table` (nine methods' test MSE), copied from the frozen markdown, with one line under it: "Least squares: no interactions or polynomial terms" (0.7em)
- **words:** none
- **say:** both least squares fits have main effects only: each explanatory variable enters linearly, with no interactions or polynomial terms, and the second replaces age by $\log(\texttt{age})$; least squares with quadratic terms or interactions is not in the table; every average of trees beats every single tree and least squares with main effects: the best average has test MSE 26.7 against 40.3 for the best single tree and 48.5 for least squares with main effects and $\log(\texttt{age})$, a feature built for the curvature in age; the two bagging fits, 26.8 and 27.1, differ in their bootstrap samples and in node size (full trees against `randomForest()`'s `nodesize = 5`); the first and second 150 trees of the loop alone give 26.7 and 27.1, a spread at least as large
- **note:** the table is copied verbatim from `result.markdown`, wrapped in `.auto-table` and in a 0.85em div so that its ten rows fit the slide. The title is the chapter's `### Test error`.

## 25. Extrapolation

- **tag:** core (2)
- **show:** figure — `extrapolation-figure` (predicted strength at 28 days against cement from 100 to 800 kg per cubic meter for the OOB-chosen forest and for least squares with $\log(\texttt{age})$), the figure alone
- **words:** none
- **say:** the other 6 ingredients are at their training medians and the dashed line is the largest cement content among the training specimens; the forest predicts 55.3 MPa at the largest training cement, 540, and 55.3 MPa at 800, while least squares continues its line; each tree predicts a constant beyond the largest value of an explanatory variable in its training sample, so a forest's average does too; no data check either fit past 540
- **note:** the chapter's `extrapolation-figure`, 8 by 4.2 inches, shown at `height=560`; the values are inline R, quoted from the frozen markdown. The title is the chapter's `### Extrapolation`.

## 26. Interpretability and cost

- **tag:** core (1)
- **show:** none, a three-line list cut from the chapter's paragraph
- **words:** "Gives up the single tree's interpretability: importance rankings only"; "Hundreds of trees to store and evaluate"; "Predictions still made of steps"
- **say:** a forest gives up the single tree's interpretability, leaving only importance rankings; it fits hundreds of trees instead of one, each of which must be stored and evaluated to predict; its predictions are still made of steps
- **note:** the chapter's three sentences of `### Interpretability and cost`, shortened. The chapter's `### Beyond this course` callout that follows is not used. Fourth in the drop order.

## 27. Conclusion

- **tag:** core (1)
- **show:** none, a flat list of six takeaways
- **words:** "Averaging removes variance, but not $\rho\sigma^2$"; "Bagging averages full trees; more trees do not overfit"; "Out-of-bag error estimates test error"; "A random forest decorrelates trees; choose $m$ by out-of-bag error"; "Importance ranks variables, with no direction or effect size"; "Forests lose interpretability and cannot extrapolate"
- **say:** the chapter's Conclusion; the next lecture, on Friday, covers boosting, which also combines many trees but builds them one after another, each fit to the residuals of the trees before it, instead of in parallel on bootstrap samples
- **note:** distilled from the chapter's `## Conclusion` (one line per main result); no example numbers. Relies on the Conclusion's sentences on the variance $\rho\sigma^2 + (1 - \rho)\sigma^2/B$ with the second term removed by averaging, "Adding trees does not overfit", the out-of-bag error estimating the test error "from the fit itself", a random forest that "decorrelates the trees" with $m$ "chosen by the out-of-bag error", importance that "ranks the variables but gives no direction or effect size", and "Forests usually predict better than one tree, at the cost of interpretability, and like a tree they cannot extrapolate".
