# Slide outline: Support Vector Classifier

(drafted 2026-11-14)

Outline for `20-support-vector-classifier_slides.qmd` (Wed 2026-11-18, the second of three lectures on support vector machines; ISLR2 Section 9.2). **This file is the spec; the deck is built from it, and this file describes the deck as it stands.** Edit it freely and ask for the deck to be refreshed.

Drafted against `20-support-vector-classifier.qmd`, the deck's `derived-from` comment records the chapter's commit (`0282ec7`). The frozen output `_freeze/09-svm/20-support-vector-classifier/execute-results/html.json` is current: its recorded `hash` (`06bb98266cce449427558843ae030a9f`) equals the md5 of the chapter file as it stands, which already carries the "Slides for this lecture" link (`20-support-vector-classifier_slides.html`) on the line after `# Support Vector Classifier`.

**What the deck is.** 36 slides including the title: the agenda, eight transitions, 26 content slides (the last is the Conclusion). The chapter's `## Cat sex`, `## Soft margin`, `## Fitting`, `## Budget`, `## Support vectors`, `## Cross-validation`, `## Test error` and `## Comparison` are the eight parts (each a transition slide). It reuses 12 of the 15 figures the chapter renders (see "Not in this deck"), the two displayed kable tables (`budget_table`, on Cost and budget; `comparison_table`, the chapter's single comparison table, on the optional Results under Comparison), and four code slides: the visible chunks `svc-fit`, `svc-estimates`, `cv-fit` and `comparison-fits`, each with its console output. The deck has no new content: every `show:` is a figure, table, equation, code chunk or console printout the chapter already has, or a list cut from the chapter's own sentences. The chapter has one running example, `MASS::cats` (144 adult domestic cats; the class is `Sex`, `F` or `M`; the explanatory variables are heart weight `Hwt` in g and body weight `Bwt` in kg, $p = 2$), split at random into 96 training cats and 48 test cats.

**Timing.** One full 50-minute period on Wed 2026-11-18; the instructor may spend its first minutes finishing maximal margin material from Monday. **The core slides come to 42.5 minutes** at the estimates below (0.5 + 0.5 + 2 + 1.5 + 4 + 2 + 2.5 + 2 + 2 + 2.5 + 4 + 2 + 3.5 + 1 + 2 + 3 + 2.5 + 1.5 + 2 + 1.5 = 42.5, in the order of the lecture: the agenda, entries 1 to 6, 8, 9, 11 to 16, 19 to 22, 26). The eight transitions are counted as zero minutes, so the core leaves no slack in 50 minutes: if time is short even without the optional slides, **the first slide to drop is Standardization: fits (entry 9, 2 minutes)**, which takes the core to 40.5. **The optional slides add 12.5 minutes** (7 for the four earlier optional slides + 5.5 for the Comparison part: 1.5 + 2.5 + 1.5 + 0 for Measures, Results, Classifiers and the transition; 55.0 for the whole deck). **Drop order, the first to drop first:**

1. Measures (entry 24, 1.5): nothing core, and no other slide of Comparison depends on it; the notes of Results say what log loss is ("If the Measures slide is dropped, say: ..."), and the notes of Measures carry the chapter's two evaluations, the shared folds, the constant-probability values, why the support vector classifier has no log loss, and, marked "not assessed", the `svm(probability = TRUE)` sentence.
2. Results (entry 25, 2.5), together with Classifiers (entry 23, 1.5) and the Comparison transition (0), dropped as a group (4.0): the table needs the classifier list, so the group stays or goes together, and no core slide needs a substitute, since nothing core refers to the Comparison part (the Conclusion's notes carry the chapter's closing sentence about it conditionally, "If the Comparison slides were taught, add: ...").
3. Support vector count (entry 18, 1.5): the count against `cost` figure only illustrates what Bias and variance already says; its numbers are in the notes of Bias and variance.
4. Refits (entry 17, 1.5): its first claim is already on Definition ("depends only on them"); the six-decimal refit and the contrast with the maximal margin classifier are in the notes of Definition.
5. Penalty form (entry 7, 2): the statement is said from the notes of Fitting (`svm()` minimizes one half of the squared norm of $w$ plus `cost` times the slack, `cost` is the price of one unit of slack, a large `cost` is a small budget), and Cost and budget states the relation between `cost` and $C$.
6. Estimates (entry 10, 2): nothing later needs the printed estimates; the Slack estimates slide carries a legend for $\widehat f$ and $\widehat M$, and its notes say what to say if Estimates is dropped.

When a slide is dropped, its substitute sentences are in the speaker notes of the slide named, each written "If the X slide is dropped, say: ...": Penalty form (Fitting), Estimates (Slack estimates), Refits (Definition), Support vector count (Bias and variance), Standardization: fits (Standardization). The agenda slide's notes list the agenda lines to skip: Measures under Comparison; Results and Classifiers under Comparison, with the item Comparison itself, when that group is dropped; Support vector count and Refits under Support vectors, Penalty form and Estimates under Fitting; Standardization: fits has no agenda line. Results has one ("If the Measures slide is dropped, say: ...", for the definition of log loss, which is the one dependence inside Comparison); no core slide depends on any of the Comparison slides, so they have no other such sentence.

The chapter's Slack estimates tabs are `Fit` and `Slack`; the `Fit` tab is the same figure as `support-figure` (Support vectors) and as the standardized tab of Standardization: fits, so the deck keeps only the `Slack` tab (entry 11, core), with no separate slide for the `Fit` tab. To make the `Slack` figure optional, drop entry 11 and move its formula to the notes of Slack variables. **The deck is built so that the core stands without any optional slide:** nothing on a core slide refers to an optional slide, and each `say:` sentence that depends on one is conditional ("If the X slide is dropped, say: ...").

**Code slides.** Entries 6 (`svc-fit`), 10 (`svc-estimates`), 19 (`cv-fit`) and 23 (`comparison-fits`, optional). Each shows the chunk's source copied verbatim from the chapter (without the `#|` lines) in a ` ```r ` block, which is not executed, followed by the chunk's console output copied verbatim from the frozen markdown (with its trailing spaces and the blank first line of the `svm()` printout) in a plain ` ``` ` block; `cv-fit` has two outputs (`head(cv_fit$performances, 3)` and `cv_fit$best.parameters`), shown as two blocks. Nothing is trimmed, including the comments. The code uses `cost_grid` and `svc_w()`, which the chapter defines in collapsed Code callouts; as in the chapter, they are not on the slide. `svc-fit` (4 lines of source, 13 of output) ends at 558 px of 720; the tallest, `comparison-fits` (9 lines of source, with its comments and blank line, as in the chapter, and 4 of output, under a four-line list of the classifiers), ends at 682 px, and has one output, shown in one plain block. Entry 22 shows the chapter's `test-confusion` console printout alone (the chunk is `table(...)`, not a model fit, so its code is not shown).

**Not in this deck.** Every collapsed `### Code` callout (plot code, `fit-helpers`, `scale-plot`, `svc-checks`, `slack-plot`, `budget-plot`, `support-check`, `count-plot`, `cv-plot`, `test-plot`, `comparison-code`, which also builds the one comparison table; the chunk `comparison-results` only displays it); the chapter's `### Beyond this course` callout is not on any slide; its one sentence (`svm(probability = TRUE)`) is in the notes of Measures, marked "not assessed", at the instructor's request; the visible chunks `cats`, `split` (the 47 and 97, and 31 and 65, counts are quoted on Cat sex), `support-vectors` (the count by kind, 3, 33 and 22, is in the notes of Definition) and `test-predict` (the first test cats' predictions); the `### Error rate` display, the 10-fold cross-validation formula, which is in the notes of Error rate (the resampling lectures defined it); the `### Sign rule` subsection (the rule is in the notes of Test error; it is the previous lecture's); the sensitivity and specificity (notes of Confusion matrix); the figures `budget-data-figure`, `cv-data-figure` (both repeat `cat-figure`) and `fit-figure` (the same figure as `support-figure`, see above).

**Display punctuation.** Every display keeps the chapter's trailing comma or period; `\hat` is written `\widehat` throughout, including in the table's header (the `Cost and budget` table is the frozen pipe table with `\hat` replaced by `\widehat` in its two header cells), and in the Measures display (`\widehat p_i`). The comparison table is the frozen pipe table verbatim, the `&mdash;` cells of the support vector classifier's row kept.

**Response variable and explanatory variables.** The class is `Sex`; the explanatory variables are `Hwt` (heart weight, $x_1$, horizontal axis of the figures) and `Bwt` (body weight, $x_2$, vertical axis), $p = 2$, and each feature is an explanatory variable. The data slide follows the instructor's layout: the class and the explanatory variables with a sub-bullet each, vertical white space, then the training and test counts, with the data's unit word, cats.

**Figure legibility.** Effective tick size is 8.8/72 times the display height in px over the figure height in inches (14 px or more is the target). The PNGs are 1075 by 864 px at 192 dpi (5.6 by 4.5 in) for the `coord_fixed` equal-SD figures, which, with heart weight horizontal and body weight vertical, are 5.8 standard deviations wide by 4.4 tall, so the plot fills the figure, and 1344 by 768 px (7 by 4 in) for `slack-figure`, `count-figure` and `cv-figure`. Display heights were measured in the rendered deck (layout px at 16:9, before reveal's scaling). Every reused figure is at 14.1 px or more. The grid lines of the figures are even. The Comparison part reuses no figure (tables and code only), so adds no row.

| Figure | Height (in) | Display height (px) | Tick (px) |
|:--|--:|--:|--:|
| `cat-figure`, `support-figure`, `test-figure` (`height=560`) | 4.5 | 560 | 15.2 |
| `scale-raw-figure`, `scale-std-figure`, `budget-1-figure` to `budget-4-figure` (tabs, `.mid-tabs`) | 4.5 | 520 | 14.1 |
| `slack-figure` (`height=480`, equation in a right column) | 4.0 | 480 | 14.7 |
| `count-figure`, `cv-figure` (`height=480`) | 4.0 | 480 | 14.7 |

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
- **words:** Cat sex; Soft margin (Overlapping classes, Optimization problem, Slack variables); Fitting (Penalty form, Standardization, Estimates, Slack estimates); Budget (Bias and variance, Cost and budget); Support vectors (Definition, Refits, Support vector count); Cross-validation (Error rate, Curve); Test error (Confusion matrix); Comparison (Classifiers, Measures, Results)
- **say:** distilled from the chapter's six learning objectives (why the maximal margin classifier fails for overlapping classes, the optimization problem with slack variables and a budget; the three slack cases, the support vectors and why the fit depends only on them; the budget as the tuning parameter, bias against variance, $C = 0$; the penalty form, `cost` and the budget, standardization; `tune()` and the test error rate and confusion matrix; the comparison of its error rates with those of logistic regression, LDA, QDA and a random forest, and why it has no log loss); the chapter's introduction (the second of three lectures on support vector machines; ISLR2 Section 9.2); the timing and the drop order of this outline are in the notes, and so is the list of agenda lines to skip when an optional slide is dropped (Measures, Results and Classifiers with the Comparison item, Support vector count, Refits, Penalty form, Estimates)
- **note:** the list names every part and every `###` the deck spends slides on, including the optional ones (they are in the deck, as in the previous deck's agenda); the figure slides without a chapter heading (Cat sex: plot, Standardization: fits) are not listed. The `### Sign rule` and the formula of `### Error rate` (under Cross-validation) have no slide. Three columns, 10, 10 and 6 lines, aligned at the top (column 1: Cat sex, Soft margin, Fitting; column 2: Budget, Support vectors, Cross-validation; column 3: Test error, Comparison); the lowest line ends at 567 px of 720, measured in the rendered deck.

# Cat sex

- **tag:** transition (0)
- **show:** none (transition slide, title only)
- **say:** the chapter's Question: can a cat's heart weight and body weight tell its sex, and if the two sexes overlap, which straight line should do the telling?
- **note:** relies on the chapter's `**Question.**` paragraph under `## Cat sex`.

## 1. Cat sex

- **tag:** core (0.5)
- **show:** none, a words-only data slide: two blocks of bullets with white space between them
- **words:** "Class: `Sex` (`M`: $y = 1$, `F`: $y = -1$)" and "Explanatory variables ($p = 2$):" with the sub-bullets "`Hwt`: heart weight (g)" and "`Bwt`: body weight (kg)"; then, after a gap, "Training cats: 96 (31 `F`, 65 `M`)" and "Test cats: 48"
- **say:** `MASS::cats` records the sex, heart weight in grams and body weight in kilograms of 144 adult domestic cats used in experiments with the heart drug digitalis (published by R. A. Fisher in 1947); the observations are cats, each sex is a class and the two explanatory variables are the features, heart weight $x_1$ on the horizontal axis of the figures and body weight $x_2$ on the vertical axis; as in the previous lecture the class is coded $y_i = 1$ for `M` and $y_i = -1$ for `F`; the cats are split at random, two thirds for training, 96 training cats and 48 test cats, and the test cats are used only at the end of the lecture; the training cats hold 31 females and 65 males; in the code `train` is the 96 training cats and `test` the 48 test cats
- **note:** the chapter's `**Data.**` paragraph and its `cats` and `split` chunk outputs as a data layout, at 0.7em, the second block set off by a 1em top margin. The coding of the class is on the first line because $y_i$ is used from the Optimization problem slide on. 96, 48, 31 and 65 are inline R or console output, quoted from the frozen markdown (the 144 is in the notes). The title is the chapter's `## Cat sex`, the same as its transition.

## 2. Cat sex: plot

- **tag:** core (2)
- **show:** figure — `cat-figure` (the training cats by `Hwt` (horizontal) and `Bwt` (vertical), color and shape by sex, axes drawn so that one standard deviation of each measurement has the same length), the figure alone
- **words:** none
- **say:** the males are heavier on average, 2.90 kg against 2.38 kg, with heavier hearts, 11.3 g against 9.2 g, and heart weight rises with body weight in both sexes; every female weighs at most 3.0 kg, while males run from 2.0 kg up, so the heavier cats are all male and the 71 cats between 2.0 and 3.0 kg are a mixture of the two sexes, with no line between them; the axes are drawn so that one standard deviation of each measurement, 2.59 g and 0.50 kg, has the same length, which the Standardization slide explains
- **note:** the chapter's `cat-figure`, 5.6 by 4.5 inches, at `height=560`; the values are inline R, quoted from the frozen markdown. **The title is not a chapter heading** (the figure sits under `## Cat sex`); it follows the "plot" suffix of the instructor's earlier decks.

# Soft margin

- **tag:** transition (0)
- **show:** none (transition slide, title only)
- **say:** this part says why the maximal margin classifier fails for the cats, writes the optimization problem of the support vector classifier, and says what each observation's slack means
- **note:** no chapter sentence; it names the three subsections.

## 3. Overlapping classes

- **tag:** core (1.5)
- **show:** equation — the chapter's maximal margin constraint, $y_i\left(\beta_0 + \beta^\top x_i\right) \ge M$
- **words:** "Not separable: in 3 places a female and a male cat share both measurements"; "Maximal margin constraints cannot all hold with $M > 0$:" with the display under it
- **reveal:** the first bullet on arrival; click 1: the second bullet and the display
- **say:** the maximal margin classifier of the previous lecture exists only when a hyperplane separates the classes, and when it exists one observation near the boundary can move it far; the training cats are not separable: in 3 places a female and a male cat share both measurements, and no hyperplane can put one point on both of its sides; the constraints of the maximal margin problem cannot all hold with $M > 0$
- **note:** the chapter's `### Overlapping classes`; the 3 is inline R (`n_tied`), quoted from the frozen markdown. The display is the inline constraint of the chapter's paragraph set as a display, at 0.8em; the bullets at 0.7em.

## 4. Optimization problem

- **tag:** core (4)
- **show:** equation — the chapter's maximize display (with $M$, $\sum_j\beta_j^2 = 1$, the slack constraint and $\epsilon_i \ge 0$, $\sum_i\epsilon_i \le C$), whole, then the symbol list
- **words:** "Support vector classifier, constraints for all $i = 1, \ldots, n$:" above the display; then "$\epsilon_i$ — slack variable: violation of the margin, in units of $M$"; "$C \ge 0$ — budget: bounds the total slack"; "$\sum_j \beta_j^2 = 1$: $f(x_i) = \beta_0 + \beta^\top x_i$ is the signed distance to the hyperplane"; "$y_i f(x_i) \ge M(1 - \epsilon_i)$: distance on own side at least $M(1 - \epsilon_i)$; $\epsilon_i = 0$ is the maximal margin constraint"
- **reveal:** the lead line and the display on arrival, then one bullet per click (4 clicks, `.incremental`)
- **say:** the support vector classifier, also called the soft margin classifier, allows each observation to violate the margin by an amount it pays for out of a fixed budget; $\epsilon_i$ is the slack variable of observation $i$, the amount by which it may violate the margin in units of $M$, and it is not the error term of regression; $C \ge 0$ is the budget, a tuning parameter that bounds the total slack; the squared betas summing to 1 makes $f(x_i)$ the signed distance, so $y_i f(x_i)$ is that distance, positive on observation $i$'s own side and negative on the other; the second constraint asks observation $i$ to be at distance at least $M(1 - \epsilon_i)$ on its own side, with $\epsilon_i = 0$ the maximal margin constraint and a positive $\epsilon_i$ relaxing it; the budget stops the slack from growing without limit, since without it every $\epsilon_i$ could be made large and $M$ as large as desired
- **note:** the chapter's `### Optimization problem`, display verbatim and whole before the symbol list; the chapter's "where the constraints hold for all $i$" is the lead line; the chapter's three "pieces" bullets are the last two bullets, the first of them carrying the definition of $f(x_i)$ (the third, the budget's purpose, is in the notes). Everything at 0.7em, so the slide ends at 668 px of 720.

## 5. Slack variables

- **tag:** core (2)
- **show:** the chapter's list of the three slack cases, then the consequence for the number of misclassified observations
- **words:** the lead line "With $f(x_i) = \beta_0 + \beta^\top x_i$:"; then "$\epsilon_i = 0$: $y_i f(x_i) \ge M$, on the correct side and on or outside the margin"; "$0 < \epsilon_i \le 1$: $0 \le y_i f(x_i) < M$, inside the margin on the correct side (on the hyperplane when $\epsilon_i = 1$)"; "$\epsilon_i > 1$: $y_i f(x_i) < 0$, on the wrong side of the hyperplane, misclassified"; "At most $C$ training observations are misclassified"
- **reveal:** the lead line on arrival, then one bullet per click (4 clicks, `.incremental`)
- **say:** at the solution each $\epsilon_i$ is no larger than its constraint needs, since a smaller $\epsilon_i$ leaves more of the budget for the others, so $\epsilon_i$ says where observation $i$ lies; every misclassified training observation uses more than 1 of the budget, so at most $C$ training observations are misclassified; the cats' slacks are estimated on the Slack estimates slide, once the classifier is fit
- **note:** the chapter's `### Slack variables`, a list already terse, copied near-verbatim; the lead line restates $f(x_i)$ from the previous slide.

# Fitting

- **tag:** transition (0)
- **show:** none (transition slide, title only)
- **say:** this part fits the support vector classifier to the training cats with `e1071::svm()`, says what `cost` is and why the features are standardized, and reads the fit's estimates and slacks
- **note:** no chapter sentence; it names the subsections.

## 6. Fitting

- **tag:** core (2.5)
- **show:** code — chunk `svc-fit` (`svm(Sex ~ Hwt + Bwt, ..., kernel = "linear", cost = 1, tolerance = 1e-8)` and `svc_fit`) and its console printout
- **words:** none
- **say:** the support vector classifier of the training cats is fit by `svm()` with `kernel = "linear"`; `cost = 1` is a starting value, chosen by cross-validation later; `svm()` standardizes the features by default, for the reason on the Standardization slide; `tolerance` tightens the solver's stopping rule so the estimates are accurate to more digits than are printed; the printout gives the settings and the number of support vectors, 58, defined below; **if the Penalty form slide is dropped, say here** (the notes read "If the Penalty form slide is dropped, say: ...") that `svm()` replaces the budget with a price on slack, minimizing one half of the squared norm of $w$ plus `cost` times the sum of the slacks, where `cost` is the price of one unit of slack, and that a large `cost` makes slack expensive, which is a small budget, while a small `cost` makes slack cheap, which is a large budget, and that the Cost and budget slide gives the exact relation (a larger `cost` gives a budget no larger and a margin no wider)
- **note:** the chapter's `svc-fit` chunk (4 lines of source), verbatim, and its printout verbatim (13 lines with the blank first line; 58 support vectors); ends at 558 px of 720.

## 7. Penalty form

- **tag:** optional (2), the fifth to drop
- **show:** equation — the chapter's second (penalty) display, whole, then a short list
- **words:** "`e1071::svm()` solves" above the display; then "$w_0 = \beta_0/M$, $w = \beta/M$, so $\|w\| = 1/M$", "$\epsilon_i$ — slack variable of observation $i$, as before", "`cost` $> 0$ — price of one unit of slack", "Large `cost`: slack is expensive, a small budget", "Small `cost`: slack is cheap, a large budget"
- **reveal:** the lead line and the display on arrival; click 1: the five bullets
- **say:** software solves the problem in a rescaled form, as for the maximal margin classifier: dividing the second constraint by $M$ and writing $w_0 = \beta_0/M$ and $w = \beta/M$, so that $\|w\| = 1/M$, it becomes $y_i(w_0 + w^\top x_i) \ge 1 - \epsilon_i$ with the same slack, and the budget problem is to minimize one half of the squared norm of $w$ subject to these constraints and the sum of the slacks being at most $C$; `e1071::svm()` replaces the budget with a price on slack, the display, where `cost` is the price of one unit of slack (the `libsvm` documentation writes the slack as $\xi_i$, the same quantity as $\epsilon_i$); `cost` is not the budget and works in the opposite direction (a large `cost` is a small budget, a small `cost` a large one); the Cost and budget slide gives the exact relation, a budget no larger and a margin no wider for a larger `cost`
- **note:** the chapter's `### Penalty form`; the display is the chapter's second one (the penalty problem), verbatim; the rescaled budget problem, the chapter's first display, is only in the notes. The display is the widest of the deck (0.8em, its right end at 1200 px of 1280) and the slide ends at 442 px.

## 8. Standardization

- **tag:** core (2)
- **show:** equation — the chapter's standardization display, whole before its symbol list, under two statement bullets
- **words:** "Margin: a distance, adding the features' squared differences in their own units"; "Penalty: depends on the units too, so the same `cost` is a different budget"; "Standardize each feature, as `svm()` does by default (`scale = TRUE`):" with the display under it; then "$\bar x_j$ — mean of feature $j$ among the training observations", "$s_j$ — its standard deviation", "$\tilde x_{ij}$ — observation $i$'s value of feature $j$, in standard deviations from that mean"
- **reveal:** the two statements on arrival; click 1: the third bullet and the display; click 2: the three-symbol list
- **say:** the margin is a Euclidean distance, which adds the squared differences of the features in their own units; with heart weight in grams and body weight in kilograms, a difference of 1 g counts as much as 1 kg, although 1 g is 0.39 standard deviations of heart weight and 1 kg is 1.99 of body weight; the penalty depends on the units too: recording feature $j$ in units $a$ times smaller multiplies its values by $a$, so the same hyperplane needs $w_j/a$ in place of $w_j$ and its part of the squared norm of $w$ changes from $w_j^2$ to $w_j^2/a^2$, so the trade between the squared norm and the slack changes with the units and the same `cost` is a different budget (the derivation stays in the notes); standardizing removes the units; a change of units leaves $\tilde x_{ij}$ unchanged, so the fit no longer depends on the units; `svm()` standardizes with the training observations' means and standard deviations, stores them in the fit's `x.scale` and applies the same ones in `predict()`; the previous lecture set `scale = FALSE` because both beetle measurements were in micrometers, where a distance in micrometers means something; **if the Standardization: fits slide is dropped, say** that the same `cost` = 1 gives a different hyperplane unscaled than standardized (per standard deviation the unit normal vectors, heart weight part first, are $(0.16, 0.99)$ and $(-0.15, 0.99)$, a turn of 17.8 degrees, with training error rates 24.0% and 22.9%)
- **note:** the chapter's `### Standardization` as a statement (the two units points as one short bullet each, no derivation on the slide); the display is verbatim with the trailing comma. The slide ends at 572 px of 720.

## 9. Standardization: fits

- **tag:** core (2)
- **show:** tabset — `scale-raw-figure` (Unscaled) and `scale-std-figure` (Standardized), the fits with `cost = 1`, `.mid-tabs`
- **words:** none
- **say:** the tabs show two fits with `cost = 1`: unscaled, with the measurements as recorded (`scale = FALSE`), and standardized (the fit above), each with its hyperplane (solid), its margins (dashed) and its support vectors (circled); the axes are drawn so that one standard deviation of each measurement has the same length; per standard deviation of each measurement the unit normal vector of the unscaled fit is $(0.16, 0.99)$ and that of the standardized fit $(-0.15, 0.99)$, both mostly body weight, differing in the sign of the heart weight part, a turn of 17.8 degrees; their training error rates are 24.0% and 22.9%, and the budgets they use, the sum of the estimated slacks, are 56.15 and 54.55; the standardized fit's margins lie 0.64 standard deviations from its hyperplane; the unscaled fit's margins lie 0.97 standard deviations from its hyperplane in the picture, but the margin `svm()` maximizes for it, 0.49, is a distance in kilograms and grams together
- **note:** the chapter's `### Standardization` tabs, 5.6 by 4.5 inches at `.mid-tabs` (520 px); the title is not a chapter heading (the chapter's `### Standardization` is the previous slide's), with the usual colon suffix. It is the first picture of the fitted hyperplane and shows that the same `cost` gives two fits. **It is the first core slide to drop if time is short**: nothing later depends on it (the Standardization notes carry its numbers), and dropping it takes the core to 40.5 minutes.

## 10. Estimates

- **tag:** optional (2), the sixth to drop
- **show:** code — chunk `svc-estimates` and its console printout
- **words:** none
- **say:** `svc_w()` is a helper the chapter defines in a collapsed Code callout: it reads $w_0$ and $w$ from the fit's `coefs`, `SV` and `rho` and fixes the sign so that $M$ is on the positive side; undoing the rescaling gives the estimates on the standardized scale, $\widehat\beta_0 = \widehat w_0/\|\widehat w\|$, $\widehat\beta = \widehat w/\|\widehat w\|$ and $\widehat M = 1/\|\widehat w\|$, with $\widehat w$ and $\widehat w_0$ read from the fit's `coefs`, `SV` and `rho` as in the previous lecture (here `SV` holds the support vectors' standardized features); `svm()`'s decision values are positive for the class of its first training observation, here `M`, the class coded $y = 1$; the fitted value $\widehat f(x)$ is the signed distance from $x$ to the hyperplane in the standardized features, in standard deviations; $\widehat\beta_0 = 0.55$ is $\widehat f$ for a cat of average heart and body weight, 0.55 standard deviations from the hyperplane on the `M` side; $\widehat\beta_1 = -0.15$: one standard deviation more heart weight (2.59 g) moves a cat 0.15 standard deviations toward `F`; $\widehat\beta_2 = 0.99$: one standard deviation more body weight (0.50 kg) moves it 0.99 toward `M`; body weight carries most of the classification, and among cats of the same body weight a heavier heart points slightly toward female; the margin is $\widehat M = 0.64$ standard deviations
- **note:** the chapter's `### Estimates`; the chunk is 8 lines of source and 2 of output, verbatim. The estimates equation is in the notes only (it is the previous lecture's). $\beta_0$ is interpreted first, as the chapter does.

## 11. Slack estimates

- **tag:** core (2.5)
- **show:** figure and equation — `slack-figure` (each training cat's slack against its distance on its own side in margins, three kinds shaded) with the chapter's slack display in a right column
- **words:** the display $\widehat\epsilon_i = \max\left(0,\ 1 - y_i\widehat f(x_i)/\widehat M\right)$ with the legend "$\widehat f(x)$ — fitted value" and "$\widehat M$ — margin" under it, in the right column
- **say:** each $\widehat\epsilon_i$ is the smallest slack its constraint allows, where $y_i\widehat f(x_i)/\widehat M$ is observation $i$'s distance from the hyperplane on its own side, in margins; the figure plots each training cat's slack against that distance, with the three kinds of observation shaded, where $\widehat f$ is the fitted value, the signed distance from $x$ to the hyperplane, and $\widehat M$ the margin, as in the previous lecture (on the standardized scale $\widehat M = 0.64$ standard deviations); **if the Estimates slide is dropped, say** (the notes read "If the Estimates slide is dropped, say: ...") that the unit-norm estimates are read from the `svm()` fit as in the previous lecture, $\widehat\beta = \widehat w/\|\widehat w\|$ and $\widehat M = 1/\|\widehat w\|$, and the margin is 0.64 standard deviations; of the 96 training cats, 41 are on or outside the margin (3 exactly on it) with $\widehat\epsilon_i = 0$, 33 are inside the margin on the correct side and 22 are on the wrong side, so the training error rate is 22.9%; the slacks lie on the line $\widehat\epsilon_i = 1 - y_i\widehat f(x_i)/\widehat M$ to the left of 1 and at 0 to its right, and add to 54.55, the budget this fit uses; the cats in the shaded wrong-side band, with a negative distance, are both males and females; on the Support vectors figure they are the lighter males, below the solid line, and the heavier females, above it
- **note:** the chapter's `### Slack estimates`, `slack-figure` only (the `Fit` tab is not repeated, see the Timing paragraph). The display sits in a right column (0.55em, 28% of the width) because the figure and the display together are too tall for the slide in one column (743 px at 0.8em), and the figure must stay at least 480 px for its ticks. The slide ends at 619 px.

# Budget

- **tag:** transition (0)
- **show:** none (transition slide, title only)
- **say:** this part fits the support vector classifier at four values of `cost`, reads the budget as the tuning parameter that trades bias against variance, and relates `cost` to the budget
- **note:** no chapter sentence; it names the subsections.

## 12. Budget

- **tag:** core (4)
- **show:** tabset — `budget-1-figure` to `budget-4-figure` (`cost` = 0.01, 0.1, 1, 10), `.mid-tabs`
- **words:** none (the tab titles are the values of `cost`)
- **say:** the tabs show support vector classifiers fit with four values of `cost`, from small to large, each with its hyperplane, margins and support vectors circled (the chapter's first tab, the training cats alone, is not repeated); with `cost` = 0.01 slack is so cheap that the margin is 17.7 standard deviations, the hyperplane and the margin on the `F` side lie off the plot below, and only the margin on the `M` side (dashed) is in view; every training cat is classified `M`, the more common sex, so every female is on the wrong side, and the 62 support vectors are the 31 females and the 31 males below the dashed line; as `cost` grows the margin narrows and the hyperplane turns to separate light from heavy cats, but it changes little from `cost` = 1 to 10
- **note:** the chapter's `## Budget` tabs; 5.6 by 4.5 inches at 520 px. Values are inline R, quoted from the frozen markdown. The tab titles are the chapter's.

## 13. Bias and variance

- **tag:** core (2)
- **show:** the chapter's list of readings of the budget
- **words:** "$C = 0$: the maximal margin classifier, which exists only for separable classes"; "Small $C$: narrow margin, few support vectors, low bias, high variance"; "Large $C$: wide margin, many support vectors, low variance, more bias"
- **reveal:** one bullet per click (3 clicks, `.incremental`)
- **say:** the budget $C$ is the classifier's tuning parameter; $C = 0$ allows no slack, so the problem is the maximal margin problem and the classifier exists only for separable classes; a small $C$ allows little slack, the margin is narrow, few observations are on or inside it and the hyperplane is set by those few, following the training observations near the boundary closely, low bias and high variance; a large $C$ allows much slack, the margin is wide, many observations are inside it and the hyperplane is set by all of them, each with a small part, so it moves little when one observation changes, low variance and more bias; read against the tabs, a small `cost` is a large budget, so the `cost` = 0.01 tab is the wide margin and the `cost` = 10 tab the narrow one; **if the Support vector count slide is dropped, say here** (the notes read "If the Support vector count slide is dropped, say: ...") that the number of support vectors falls from 62 at `cost` = 0.01 to 56 at `cost` = 100 as the margin narrows from 17.7 to 0.57 standard deviations
- **note:** the chapter's `### Bias and variance`, the three bullets shortened to fragments. The notes' sentence "read against the tabs" only joins two chapter sentences (a small `cost` is a large budget, and as `cost` grows the margin narrows); it adds no content.

## 14. Cost and budget

- **tag:** core (3.5)
- **show:** table — `budget_table` (the four fits: `cost`, $\sum_i\widehat\epsilon_i$, $\widehat M$, support vectors, inside the margin, wrong side, training error rate), copied as the frozen pipe table with `\hat` replaced by `\widehat`
- **words:** "Larger `cost`: budget $C$ no larger, margin $\widehat M$ no wider"; "`cost` $\ne C$: the $C$ a `cost` gives depends on the data"; "`cost` $\to \infty$ on separable data: the maximal margin classifier"
- **reveal:** the three bullets on arrival; click 1: the table
- **say:** the statement is that `svm()`'s penalty form solves the budget problem for a budget set by `cost`, and the budget is a weakly monotone function of `cost`, a larger `cost` corresponding to a budget no larger, constant on a plateau (the cats have one, from `cost` = 5.62 on); the proof is in the chapter and in the notes (the chapter's two displays, in words): any point within the budget $C = \sum_i\widehat\epsilon_i$ has penalty objective at least that of the solution, so none has a smaller $\|w\|$ and $\widehat w$ solves the budget problem; for the solutions at `cost` $= a$ and `cost` $= b > a$, each is at least as good as the other at its own `cost`, $N + aS \le N' + aS'$ and $N' + bS' \le N + bS$ with $N = \frac12\|\widehat w\|^2$ and $S = \sum_i\widehat\epsilon_i$, adding gives $(b - a)(S' - S) \le 0$ so $S' \le S$, and the first inequality gives $N \le N'$, a margin no wider; `cost` and $C$ are not equal and the $C$ that a `cost` gives depends on the data; as `cost` grows without bound on separable data the budget falls to 0 and the fit becomes the maximal margin classifier, which is why the previous lecture used a very large `cost`; the table is for the four fits in the tabs, the budget used and the margin fall as `cost` grows, and the budget stays above the number of misclassified training cats, as it must
- **note:** the chapter's `### Cost and budget`; the table is the `budget-table-show` output of the frozen markdown, columns right-aligned, in `.auto-table` as the previous deck's Refits table. The proof (the chapter's two displays) is **not on the slide**, only in the notes (objective 4 is "explain"). The table is the chapter's, whose header cells carry `\hat`, set as `\widehat`. The `{.fragment}` wraps the `.auto-table` div.

# Support vectors

- **tag:** transition (0)
- **show:** none (transition slide, title only)
- **say:** this part defines the support vectors of the support vector classifier and says what the fitted hyperplane depends on
- **note:** no chapter sentence; it names the subsections.

## 15. Support vectors

- **tag:** core (1)
- **show:** figure — `support-figure` (the fit with `cost` = 1, support vectors circled), the figure alone
- **words:** none
- **say:** the figure is the fit with `cost` = 1 again (the `cost` = 1 tab of Budget), with its support vectors circled
- **note:** the chapter's `support-figure` under `## Support vectors`, 5.6 by 4.5 inches at `height=560`; the same figure as the chapter's `fit-figure` (Slack estimates, `Fit` tab).

## 16. Definition

- **tag:** core (2)
- **show:** the chapter's definition, as short bullets
- **words:** "Support vectors: $y_i\widehat f(x_i) \le \widehat M$, on the margin, inside it, or on the wrong side of the hyperplane"; "Wider than the previous lecture's: the observations on the margin only, the case with no slack"; "Circled cats: 58 of the 96"; "The fitted hyperplane depends only on them"
- **reveal:** one bullet per click (4 clicks, `.incremental`)
- **say:** the support vectors of the support vector classifier are the training observations on the margin, inside it or on the wrong side of the hyperplane, those with $y_i\widehat f(x_i) \le \widehat M$, wider than the previous lecture's definition, the observations on the margin only, which is the case with no slack; they are the circled cats, 58 of the 96, the 3 on the margin with $\widehat\epsilon_i = 0$ and all 55 with $\widehat\epsilon_i > 0$ (by kind: 3 on or outside the margin, 33 inside it, 22 on the wrong side); the fitted hyperplane depends on the training data only through the support vectors, since an observation outside the margin has $\widehat\epsilon_i = 0$ and its constraint holds with room to spare, so deleting it or moving it anywhere outside the margin leaves the fit unchanged; **if the Refits slide is dropped, say here** (the notes read "If the Refits slide is dropped, say: ...") that refitting to the 58 support vectors alone, with the training cats' means and standard deviations, gives the same estimates to six decimal places, and that the difference from the maximal margin classifier is how many support vectors there are: there a handful on the margin set the hyperplane, here every observation inside the margin or on the wrong side does, and a wider margin holds more
- **note:** the chapter's `### Definition`; 58, 96, 3 and 55 are inline R, quoted from the frozen markdown, the by-kind counts from the `support-vectors` chunk's printout (not shown). The inequality is inline, not a display.

## 17. Refits

- **tag:** optional (1.5), the fourth to drop
- **show:** the chapter's two claims, as short bullets
- **words:** "Delete an observation outside the margin, or move it anywhere outside: the fit is unchanged"; "Refit to the 58 support vectors alone: the same estimates, to six decimal places"; "Maximal margin: a handful of support vectors; here, every observation inside the margin or on the wrong side"
- **reveal:** one bullet per click (3 clicks, `.incremental`)
- **say:** the chapter's `### Refits` paragraph: an observation outside the margin has $\widehat\epsilon_i = 0$ and its constraint holds with room to spare; suppose deleting it allowed a better solution; moving a short way from the current solution toward that better one keeps the deleted observation's constraint satisfied (it held strictly), keeps every other constraint satisfied (each defines a convex set containing both ends) and lowers the objective (which is convex), so that point would beat the current solution of the full problem, which is impossible; so deleting an observation outside the margin, or moving it anywhere outside the margin, leaves the fit unchanged; refitting to the 58 support vectors alone gives the same estimates to six decimal places; the difference from the maximal margin classifier is how many support vectors there are
- **note:** the chapter's `### Refits`; the convexity argument is in the notes only. The six-decimal refit is checked in the chapter's collapsed `support-check` code (no table, unlike the previous lecture's Refits).

## 18. Support vector count

- **tag:** optional (1.5), the third to drop
- **show:** figure — `count-figure` (support vectors, those inside the margin and those on the wrong side against `cost`, log scale), the figure alone
- **words:** none
- **say:** the figure counts the support vectors, and the two kinds with positive slack, for fits over a grid of `cost` values; the number of support vectors falls from 62 at `cost` = 0.01 to 56 at `cost` = 100 as the margin narrows from 17.7 to 0.57 standard deviations; because the sexes overlap so much, more than half of the training cats are support vectors at every `cost`, including the 21 or more misclassified training cats of every fit on the grid; from `cost` = 5.62 on the fit no longer changes, its budget used, 54.41, is the smallest total slack that any hyperplane leaves these training cats, so a larger `cost` cannot reduce it; the three counts are flat from `cost` = 5.62 on, 56 support vectors, 32 inside the margin and 21 on the wrong side
- **note:** the chapter's `### Support vector count`; 7 by 4 inches at `height=480`. Values are inline R, quoted from the frozen markdown.

# Cross-validation

- **tag:** transition (0)
- **show:** none (transition slide, title only)
- **say:** the budget, and so `cost`, is chosen by cross-validation, as in the resampling lectures, from the training cats alone; the test cats stay aside
- **note:** the chapter's sentence under `## Cross-validation` ("Cross-validation chooses `cost` from them alone; the test cats stay aside").

## 19. Error rate

- **tag:** core (3)
- **show:** code — chunk `cv-fit` (`tune(svm, Sex ~ Hwt + Bwt, ..., ranges = list(cost = cost_grid))`, then `head(cv_fit$performances, 3)` and `cv_fit$best.parameters`) and its two console outputs
- **words:** none
- **say:** with the training cats split at random into $k = 10$ folds, the estimate for a given `cost` is the average of the fold error rates, each the error rate on fold $\ell$ of the classifier fit with that `cost` to the training cats outside it (the chapter's CV display); `e1071::tune()` averages the fold error rates with equal weights, so with folds of different sizes it differs slightly from the size-weighted average of the resampling lectures; each fit inside `tune()` standardizes with its own training folds' means and standard deviations, so the standardization is part of the fit being cross-validated; `tune()` takes the fitting function, the model, any further arguments and a list of values of the tuning parameter (here `cost_grid`, the chapter's grid `10^seq(-2, 2, by = 0.25)`, 4 values per factor of 10 from 0.01 to 100, defined in a collapsed Code callout); its folds are random, which the chapter's seed makes reproducible; the fits inside it keep `svm()`'s default `tolerance`, since with the tighter one the solver stops at its iteration limit on some folds; `performances` has one row per `cost`, `error` the 10-fold estimate (the misclassification rate by default) and `dispersion` the standard deviation of the 10 fold error rates; `best.parameters` is the `cost` with the smallest `error` and `best.model` is the classifier refit with it to all the training cats
- **note:** the chapter's `### Error rate`, chunk `cv-fit` (4 lines of source) verbatim, with both console outputs verbatim in two plain blocks. The slide ends at 425 px. **The chapter's display of $\text{CV}_{(10)}(\texttt{cost})$ is not on a slide** (not in the core list, and the resampling lectures defined it); it is in the notes. `cost_grid` is defined in a collapsed Code callout and is not shown, as in the chapter; the notes say what it is. The slide carries the equal-weight remark, the tolerance remark and two outputs in its notes, hence 3 minutes.

## 20. Curve

- **tag:** core (2.5)
- **show:** figure — `cv-figure` (the 10-fold estimate of the error rate against `cost`, log scale, the chosen `cost` circled, the all-`M` error rate dotted), the figure alone
- **words:** none
- **say:** for small `cost` the estimate is close to the error rate of classifying every training cat `M` (dotted), because the margin is so wide that the classifier fit to each set of training folds puts nearly every cat on the `M` side; the estimate is not monotone in `cost` (it rises to 34.6% at `cost` = 0.18) and is smallest, 24.0%, at `cost` = 1.78 (circled), after which it is nearly flat; a linear boundary in two features has only three estimates, so even the narrowest margin on this grid varies little from one set of training folds to another and the curve does not rise again at large `cost`; the fold error rates at the chosen `cost` have standard deviation 16.0%, so differences of a few percentage points along the curve are within the noise of the estimate
- **note:** the chapter's `### Curve`; 7 by 4 inches at `height=480`. Values are inline R, quoted from the frozen markdown.

# Test error

- **tag:** transition (0)
- **show:** none (transition slide, title only)
- **say:** this part evaluates the chosen classifier on the test cats, which played no part in fitting or in choosing `cost`
- **note:** the chapter's sentence in the Confusion matrix paragraph that the test cats played no part in fitting or in choosing `cost`.

## 21. Test error

- **tag:** core (1.5)
- **show:** figure — `test-figure` (the 48 test cats with the chosen classifier's hyperplane and margins, crosses on the misclassified), the figure alone
- **words:** none
- **say:** the figure shows the 48 test cats and the support vector classifier chosen by cross-validation, refit to all the training cats, with its hyperplane and margins; crosses mark the test cats it misclassifies; a new observation $x^*$ is classified by the sign of $\widehat f(x^*)$, as for the maximal margin classifier, to `M` if it is positive and to `F` if it is negative, and `predict()` standardizes $x^*$ with the training cats' means and standard deviations first
- **note:** the chapter's `## Test error` figure and its `### Sign rule` paragraph in the notes only (the rule is the previous lecture's); 5.6 by 4.5 inches at `height=560`. The title repeats the transition's, as the other opening slides do.

## 22. Confusion matrix

- **tag:** core (2)
- **show:** console printout — chunk `test-confusion` (truth in the rows, predictions in the columns), then the two numbers of the chapter's paragraph
- **words:** "Positive class: `M`" (under the printout, on arrival); "Test error rate: $(FP + FN)/n = (5 + 4)/48 = 0.188$"; "Classifying every test cat `M`: 33.3%"
- **reveal:** the printout on arrival; click 1: the two bullets
- **say:** with `M`, the class coded $y = 1$, as the positive class, the confusion matrix of the test cats is the printout; the test error rate is $(FP + FN)/n = (5 + 4)/48 = 0.188$, against 33.3% for classifying every test cat `M`; the sensitivity, the proportion of male cats classified male, is 87.5%, and the specificity, the proportion of female cats classified female, is 68.8%; the training error rate of the same fit is 21.9% and its cross-validation estimate 24.0%; the test cats played no part in fitting or in choosing `cost`, so the test error rate is the honest estimate, if a noisy one from 48 cats; the misclassified test cats lie where the training cats of the two sexes overlapped, the lighter males and the heavier females
- **note:** the chapter's `### Confusion matrix`; the printout is verbatim from the frozen markdown, the numbers are inline R. The chunk's code (`table(...)`) is not shown (not a model fit).

# Comparison

- **tag:** transition (0), optional with Classifiers and Results (dropped as a group)
- **show:** none (transition slide, title only)
- **say:** the comparison classifiers come from the earlier lectures: this part compares the support vector classifier with logistic regression, LDA, QDA and a random forest, by error rate and by log loss
- **note:** the chapter's sentence opening `### Classifiers` ("The comparison classifiers come from the earlier lectures").

## 23. Classifiers

- **tag:** optional (1.5), dropped with Results (entry 25) and the Comparison transition
- **show:** code — chunk `comparison-fits` (the fits of main-effects logistic regression, LDA, QDA and the random forest, and `head(predict(lda_fit, test)$posterior, 3)`) and its console printout, under a short list of the compared classifiers
- **words:** "Support vector classifier (chosen `cost`)"; "Logistic regression: main effects; with interaction; with squares and interaction"; "LDA, QDA"; "Random forest" (0.7em, above the code)
- **say:** each comparison classifier is fit to the same 96 training cats and the same two explanatory variables, `Hwt` and `Bwt`, gives a probability that a cat is `M` and classifies it `M` when that probability exceeds $1/2$; the classifiers are logistic regression with main effects only, with the interaction of `Hwt` and `Bwt`, and with both squares as well as the interaction, linear discriminant analysis (LDA) and quadratic discriminant analysis (QDA), and a random forest with `randomForest()`'s default settings; the support vector classifier is the one chosen by cross-validation in this lecture, with `cost` = 1.78; the code is the chapter's calls for main-effects logistic regression, LDA, QDA and the random forest, the other two logistic regressions being fit in the chapter's collapsed Code callout, and the output is the probabilities of `F` and `M` that LDA gives the first three test cats
- **note:** the chapter's `### Classifiers`; the list is the chapter's own bulleted list compressed to fragments, with the support vector classifier added from the paragraph under it (the chosen `cost`, its value is in the notes). The chunk's source is verbatim (9 lines including two comments and a blank line, over the "about eight lines" of the guidance, as in the chapter) and its printout verbatim (4 lines, no trailing spaces) in a plain block. The slide ends at 682 px.

## 24. Measures

- **tag:** optional (1.5), the first to drop
- **show:** equation — the chapter's log loss display, under one short line for the error rate
- **words:** "Error rate: proportion misclassified" (0.7em, above the display); the display $\text{log loss} = -\frac{1}{n}\sum_{i=1}^n \log \widehat p_i,$ (0.8em); then the legend "$\widehat p_i$ — probability given cat $i$'s observed sex" and "$n$ — number of cats" (0.7em)
- **reveal:** none, the slide is static
- **say:** the chapter's `### Measures` paragraphs: each classifier is evaluated twice; 10-fold cross-validation estimates its performance from the training cats alone, with the same ten folds for every classifier, and the support vector classifier is refit in each fold at the `cost` chosen earlier by a different set of folds, so its cross-validation estimates are slightly favorable to it, while the other classifiers have no tuning parameter chosen here; the test cats are the other evaluation, each classifier fit to all the training cats and evaluated on the 48 test cats; two measures are computed in each, the error rate (the proportion of cats misclassified) and the log loss (the display, where $n$ is the number of cats and $\widehat p_i$ the probability the classifier gives cat $i$'s observed sex, a smaller log loss being better); the error rate counts a cat as right or wrong by which side of $1/2$ its probability falls on, while the log loss also rewards a confident correct probability and punishes a confident wrong one; giving every cat the proportion of males among the training cats (in cross-validation, among the cats outside its fold), so using no explanatory variable, has a log loss of 0.633 in cross-validation and 0.637 on the test cats; the support vector classifier has no log loss because it gives no probability: its fitted value $\widehat f(x)$ is a signed distance from the hyperplane, which says which side a cat is on and how far from the boundary, not how likely `M` is, and any increasing function of $\widehat f(x)$ could be declared a probability, but the classifier does not say which; the other five classifiers estimate a probability, so they have a log loss, and the support vector classifier is compared with them by error rate only; marked "not assessed": `svm()` with `probability = TRUE` fits a logistic regression to the fitted values by an internal cross-validation, a second model added to the classifier
- **note:** the chapter's `### Measures`; the display is the chapter's, verbatim with `\hat` set as `\widehat` and its trailing comma, at 0.8em; the legend is the chapter's "where" clause compressed to two short lines (the "smaller is better" clause is in the notes). The error-rate line is the chapter's one-sentence definition compressed. The constant-probability values (0.633 and 0.637, in the chapter's order, cross-validation then test) are the chapter's inline R, quoted from the frozen markdown. The `### Beyond this course` sentence is in the notes at the instructor's request, marked "not assessed", and never on the slide. The slide ends at 401 px of 720. Dropped first: the notes of Results say what log loss is.

## 25. Results

- **tag:** optional (2.5), dropped with Classifiers (entry 23) and the Comparison transition
- **show:** table — `comparison_table` (chunk `comparison-results` in the frozen markdown: CV error rate (%), CV log loss, Test error rate (%), Test log loss for the six classifiers with a probability and the support vector classifier, all cross-validation columns first, then all test columns, error rate before log loss), the frozen pipe table verbatim in `.auto-table`, at 0.85em, alone
- **words:** none
- **say:** the chapter's three `### Results` paragraphs: the cross-validation error rates run from 22.9% to 27.1% and the cross-validation log losses of the classifiers with a probability from 0.509 to 0.567, the quadratic logistic regression, QDA and the random forest having the three largest (0.543 to 0.567); the test error rates run from 14.6% to 20.8%, and one cat is 2.1% of the 48 test cats; the support vector classifier misclassifies 9 test cats, 1 more than each logistic regression and LDA, 2 more than QDA and 1 fewer than the random forest; the same three classifiers have the three smallest test log losses (0.377 to 0.406); the cross-validation and the test estimates do not rank the classifiers the same way: QDA has the largest cross-validation error rate, 27.1%, and the smallest test error rate, 14.6%, and the quadratic logistic regression, QDA and the random forest go from the largest log losses in cross-validation to the smallest on the test cats; none of the interaction, quadratic, QDA or random forest classifiers has both a smaller cross-validation error rate and a smaller test error rate than logistic regression with main effects only; with two explanatory variables and a sex difference that is mostly a difference in body weight, a straight boundary does about as well as anything here; **if the Measures slide is dropped, say** (the notes read "If the Measures slide is dropped, say: ...") that log loss is minus the mean log of the probability a classifier gives each cat's observed sex, smaller is better, and that the support vector classifier gives no probability, so it has no log loss
- **note:** the chapter's `### Results`; the table is copied from the frozen markdown (`comparison-results` output), not retyped, and every value in the notes is the chapter's inline R, quoted from the frozen markdown. Not a figure, no bullets: the table alone, five columns, the `&mdash;` cells of the support vector classifier's row kept. It is in a 0.85em div wrapping `.auto-table` so that it fits: measured in the rendered deck, the table is 1081 px wide (from 100 to 1180 px of 1280) and the slide ends at 454 px of 720.

## 26. Conclusion

- **tag:** core (1.5)
- **show:** a flat list of six takeaways, in the order of the lecture, no nesting, no example numbers
- **words:** "Overlapping classes need slack, bounded by a budget $C$"; "At most $C$ training observations are misclassified"; "The fit depends only on the support vectors"; "Small budget: low bias, high variance; large budget: the reverse"; "Larger `cost`: budget no larger, margin no wider; features standardized"; "`cost` by cross-validation; judged by the test error rate"
- **say:** the chapter's `## Conclusion`: when the classes overlap no hyperplane separates them and the maximal margin classifier does not exist; the support vector classifier gives each observation a slack variable $\epsilon_i \ge 0$, requires $y_i(\beta_0 + \beta^\top x_i) \ge M(1 - \epsilon_i)$ and maximizes $M$ subject to the budget $\sum_i\epsilon_i \le C$; the three slack cases, so at most $C$ training observations are misclassified; the support vectors are the observations on or inside the margin or on the wrong side, and the hyperplane depends only on them; $C = 0$ gives the maximal margin classifier, a small $C$ a narrow margin with few support vectors (low bias, high variance) and a large $C$ a wide margin with many (low variance, more bias); `svm()` solves the penalty form, so a larger `cost` gives a budget no larger and a margin no wider, and `cost` and $C$ move in opposite directions; it standardizes the features by default so the fit is independent of their units; `tune()` chooses `cost` by 10-fold cross-validation and the chosen classifier is judged by its test error rate and confusion matrix; **if the Comparison slides were taught, add** (the notes read "If the Comparison slides were taught, add that ...") that the support vector classifier is compared with other classifiers by error rate, in cross-validation and on test cats, and that, unlike logistic regression, LDA, QDA and a random forest, it gives a class and no probability, so it has no log loss; the next lecture covers support vector machines, which replace the flat boundary with a curved one by means of kernels, tune `cost` together with a kernel's own parameter, extend to more than two classes, and compare the support vector classifier's loss with that of logistic regression
- **note:** the six items are the chapter's `## Conclusion` paragraphs compressed in its order: the problem and the budget, the slack cases, the support vectors, the budget as the tuning parameter, the penalty form and standardization, `tune()` and the test error. They do not repeat the agenda item for item and restate no example numbers; the next lecture is in the notes only. The chapter's new Conclusion sentence (compared with other classifiers by error rate, and no probability so no log loss) is not a seventh item: it is in the notes only, as a conditional sentence for when the optional Comparison slides were taught, so the core does not refer to an optional slide.
