# Slide outline: Decision Trees

(drafted 2026-10-31)

Outline for `10-decision-trees_slides.qmd` (Mon 2026-11-09, the first lecture on tree-based methods; ISLR2 Section 8.1). **This file is the spec; the deck is built from it, and this file describes the deck as it stands.** Edit it freely and ask for the deck to be refreshed.

Drafted against `10-decision-trees.qmd`, the deck's `derived-from` comment records the chapter's commit (`80ba0d7`). The frozen output `_freeze/08-trees/10-decision-trees/execute-results/html.json` is current: its recorded `hash` (`477f25477b28f4e423a93869b7096764`) equals the md5 of the chapter file as it stands, which includes the "Slides for this lecture" link (`10-decision-trees_slides.html`) on the line after `# Decision Trees`.

**What the deck is.** 41 slides including the title: the agenda, five transitions, 33 content slides and the Conclusion. It reuses all 20 figures the chapter renders, both kable tables (`compare_table` and `impurity_table`), and seven code slides: the basic `rpart()` code of the chapter's visible chunks with their console output. The deck has no new content: every `show:` is a figure, table, equation, code chunk or console printout the chapter already has, or a list cut from the chapter's own sentences. The chapter has two running examples: `modeldata::concrete` for regression trees (700 training and 305 test specimens; the response is `compressive_strength` in MPa; the explanatory variables are seven ingredients in kg per cubic meter and `age` in days) and `modeldata::penguins` for classification trees (240 training and 102 test penguins; the response is `species`; four body measurements are the explanatory variables).

**Timing.** One 50-minute period is tight: the core slides come to about 45 minutes at the estimates below, and the optional slides add about 10 more. If time is short, drop in this order: (1) Step functions (say it while on Instability), (2) Interpretability, (3) Best split: cut points, (4) Regression tree diagram, (5) Pruned tree regions, (6) Impurity of a split, (7) Fitted classification tree, (8) Training penguins. The natural break if the chapter is taught over two days is after All explanatory variables (slide 19), where regression trees end.

**Code slides.** The seven code slides are entries 9 (`two-fit`), 12 (`full-fit`), 15 (`cp-table`), 17 (`pruned-fit`), 26 (`penguin-fit`), 28 (`penguin-test`) and 29 (`penguin-prune`). Each shows the chunk's source copied verbatim from the chapter (without the `#|` lines) in a ` ```r ` block, which is not executed, followed by the chunk's console output copied verbatim from the frozen markdown in a plain ` ``` ` block. Nothing is trimmed. Entry 9 is the one printout that does not fit at the code's usual size (22 lines of output below 3 lines of code); it is wrapped in the deck's `.code-small` class (`font-size: 0.42em`, about 16.8 px) so that code and output share one slide, and the other six code slides are at the deck's normal code size (22 px).

**Not in this deck.** The chapter's visible chunks `split`, `penguin-split` (the splits show as the 700, 305, 240 and 102 on the data slides), `all-fit` and `all-compare` (their test MSEs are in the All explanatory variables table, so they are not code slides); every collapsed `### Code` callout; the chapter's `### For example,` callout (the 28-day specimen); both `### Beyond this course` callouts; the data cleaning paragraph, the split search (`split-search`), the tree drawing code and the leaf-size paragraph that closes All explanatory variables (all in `say:` only or in the notes).

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
- **show:** none, a nested bulleted list in two columns
- **words:** Concrete strength (Data, Training specimens); Regression trees (Regions and predictions, Best split, Recursive binary splitting, Fitting and partition); Pruning (Overfitting, Cost-complexity pruning, Cross-validation and pruned tree, All explanatory variables); Classification trees (Penguin species, Most common class, Node impurity, Fitting and pruning); Strengths and weaknesses (Interpretability and nonlinearity, Step functions and instability)
- **say:** distilled from the chapter's six learning objectives; most models so far were linear in features built by hand, and a tree needs no features built by hand; the data cleaning, the split search, the tree-drawing code, the concavity argument and the Beyond this course callouts are in the notes and not in the agenda; the next lecture averages many trees: bagging and random forests
- **note:** relies on the chapter's `## Concrete strength`, `## Regression trees`, `## Pruning`, `## Classification trees` and `## Strengths and weaknesses` headings and the `###` children the deck spends slides on. Two columns because the 22 lines do not fit one column. The Conclusion is not an agenda item.

# Concrete strength

- **tag:** transition (0)
- **show:** none (transition slide, title only)
- **say:** most models so far were linear in features with curvature or interaction built in by hand; a tree splits the explanatory variables into rectangles and predicts a constant in each; regression trees for a numeric response, then classification trees for a class, and both pruned back
- **note:** relies on the chapter's opening paragraph under `# Decision Trees`.

## 1. Data

- **tag:** core (1.5)
- **show:** none, a words-only data slide (a short itemized list)
- **words:** "Question: how well do the ingredients of a concrete mix and its age predict how much load the concrete can bear?"; "Observation: a specimen, one cylinder of one mix, crushed at one age"; "Response variable: `compressive_strength`, in megapascals (MPa)"; "Explanatory variables: seven ingredients, in kg per cubic meter of mix, and `age`, in days"; then "Training sample: 700 specimens" and "Test specimens: 305"
- **reveal:** on arrival: the first four lines; click 1: the training sample and test specimens lines
- **say:** laboratory tests of concrete cylinders (Yeh 2006); exact duplicate rows (strength included) are removed with `distinct()` so no specimen is both a training and a test specimen, while replicates with a different strength stay; the training specimens are a random sample of 700
- **note:** the chapter's `**Question.**`, `**Data.**` and `### Training specimens` paragraphs compressed to a list; 700 and 305 are inline R in the chapter, quoted from the frozen markdown. The title is the chapter's `### Data`.

## 2. Training specimens

- **tag:** core (1.5)
- **show:** figure — `data-figure` (strength against age on a log scale and against cement), the figure alone
- **words:** none
- **say:** strength rises steeply with age over the first month, from a mean of 17.6 MPa at 3 days to 36.6 MPa at 28 days, then more slowly and noisily; 40% were tested at 28 days; strength rises with cement with a wide spread at every content; the relation with age is far from a straight line and a linear model would need a log of age; 68% of the test specimens have a mix some training specimen also has, so the test MSEs below are for mixes like those tested, often at a new age
- **note:** relies on the chapter's paragraphs after `data-figure` (values in `say:` only, quoted from the frozen markdown). The figure is 9 by 4 inches, shown at `height=520`.

# Regression trees

- **tag:** transition (0)
- **show:** none (transition slide, title only)
- **say:** a regression tree is a partition of the explanatory variables into regions with a constant prediction in each; this part defines the model, the best single split and the recursive search, and fits a tree
- **note:** relies on the chapter's `## Regression trees` section.

## 3. Age and cement

- **tag:** core (1)
- **show:** figure — `plane-figure` (training specimens by age and cement, colored by strength), the figure alone
- **words:** none
- **say:** the dark, weak specimens sit at the left, at young ages, and in the bottom band of low cement; the light, strong ones sit at the right and the top; a vertical line near 3 weeks and a horizontal line or two in cement would already separate much of the weak concrete from the strong
- **note:** the chapter's `### Age and cement` figure; the sentences are in `say:` only. The figure is 8 by 4.5 inches, shown at `height=570`.

## 4. Regions and predictions

- **tag:** core (2)
- **show:** equation — the chapter's $\widehat f(x)$ display, then the training RSS display, each with the chapter's symbol legend compressed to labels
- **words:** "$x$ — value of the $p$ explanatory variables $X = (X_1, \ldots, X_p)$"; "$R_\ell$ — $\ell$th region, a rectangle in the $p$ explanatory variables"; "$\widehat y_{R_\ell}$ — mean response of the training observations in $R_\ell$"; "$\mathrm{I}\left(x \in R_\ell\right)$ — 1 if $x$ falls in $R_\ell$, 0 otherwise"
- **reveal:** on arrival: the $\widehat f(x)$ display and its legend; click 1: the RSS display
- **say:** a tree turns those lines into a model; it predicts the mean training response of a region for every observation in it; the mean is the constant with the smallest RSS in a region (derivative $-2\sum(y_i - c)$ is zero at the mean); too many partitions to search, so a tree builds its regions one split at a time; a tree splits on the explanatory variables as recorded, so here each feature is an explanatory variable
- **note:** both displays copied from the chapter's `### Regions and predictions` with `\hat` written `\widehat`. The legend is the chapter's bullet list cut to labels.

## 5. Best split

- **tag:** core (2)
- **show:** equation — the chapter's $R_1(j, s)$ and $R_2(j, s)$ display, then the display of the RSS of the two regions
- **words:** "$R$ — region being split"; "$X_j$ — explanatory variable $j$"; "$s$ — cut point"; then "RSS of the two regions after the split, minimized over $(j, s)$"
- **reveal:** on arrival: the region display and legend; click 1: the RSS display and its label
- **say:** a split of a region $R$ on variable $j$ at cut point $s$ makes two regions (at the first split $R$ is every value of the explanatory variables); the best split is the pair $(j, s)$ that minimizes the RSS of the two regions after the split
- **note:** both displays copied from the chapter's `### Best split` with `\hat` written `\widehat`.

## 6. Decrease in RSS

- **tag:** core (2)
- **show:** equation — the chapter's RSS-decrease display
- **words:** "RSS before the split minus RSS after it"; "$n_1, n_2$ — training observations in the two regions"; "$\bar y_1, \bar y_2$ — their means"; "$\bar y$ — mean before the split"
- **say:** the derivation: in $R_1$, $\sum(y_i - \bar y)^2 = \sum(y_i - \bar y_1)^2 + n_1(\bar y_1 - \bar y)^2$ because the cross term is zero, likewise in $R_2$, with $\bar y_1 - \bar y = n_2(\bar y_1 - \bar y_2)/n_R$; the best split separates two means as far apart as possible, weighted toward regions of similar size; the RSS after the split changes only when $s$ crosses an observed value, so only the midpoints between consecutive distinct values need checking, at most $n_R - 1$ per variable
- **note:** the display is the chapter's, copied verbatim. **The slide title is not a chapter heading** (the display sits under `### Best split`). The derivation is in `say:` only, per the rule that derivations belong in the notes.

## 7. Best split: cut points

- **tag:** optional (1.5)
- **show:** figure — `curve-figure` (the share of RSS removed by every cut point on age and on cement, the best circled), the figure alone
- **words:** none
- **say:** the best split on age is at $s = 21$ days, removing 25.0% of the RSS; the best on cement is at 352.5 kg per cubic meter, removing 17.9%; age has only 13 cut points to check (14 ages); over all 8 explanatory variables the best first split is on age, with cement next at 17.9%
- **note:** the chapter's `curve-figure`, 9 by 4 inches, shown at `height=520`. **The title is the chapter's `### Best split` with a suffix** so that two slides do not share a title. The values are inline R, quoted from the frozen markdown, and are in `say:` only. Third in the drop order.

## 8. Recursive binary splitting

- **tag:** core (2)
- **show:** none, the chapter's three numbered steps and two definitions
- **words:** "Start with all the training observations in one region, the **root**"; "In each current region, find the best split $(j, s)$ of the training observations in that region alone, and split"; "Repeat in each new region until a stopping rule holds"; then "**Greedy**: each split is the best one at its own step" and "**Top-down**: from the root to the **leaves**"; then "Default stopping rules: fewer than 20 observations in a region, a leaf with fewer than 7, a split lowering the RSS by less than 1% of the root's"
- **reveal:** on arrival: the three steps; click 1: Greedy and Top-down; click 2: the default stopping rules
- **say:** greedy: chosen without looking ahead to the splits it makes possible later; top-down: it starts from the root and works down; the regions at the end are the leaves, or terminal nodes, and the splits are the internal nodes; the defaults (`minsplit`, `minbucket`, `cp = 0.01`) are chosen for speed; the Pruning section chooses the size from the data; the tree `rpart()` grows with them is the default tree
- **note:** the chapter's numbered list and the paragraph defining greedy and top-down, cut to lines; the three defaults are the chapter's inline R values (`rpart.control()` values 20, 7 and 1%, quoted from the frozen markdown).

## 9. Fitting a regression tree

- **tag:** core (2.5)
- **show:** code — the chapter's `two-fit` chunk (`rpart()` on age and cement) and its printed tree, copied verbatim
- **words:** none
- **say:** each line is a node: number, split, number of training specimens, RSS (`deviance`) and mean strength (`yval`); an asterisk marks a leaf; node 1, the root, holds all 700 specimens with mean 35.8 MPa; the first split sends the specimens younger than 21 days to node 2 and the rest to node 3, and node $m$ has children $2m$ and $2m + 1$; a prediction is the mean of the leaf reached; the tree has 9 leaves
- **note:** **the one slide whose printout does not fit at the code's normal size**: 3 lines of code and 22 lines of output, so the slide is wrapped in `.code-small` (`font-size: 0.42em`, 16.8 px; the output is 526 px wide). At 22 px the slide overflows by about 100 px. The title is the chapter's `### Fitting` made specific to regression trees, since the chapter has two sections with that heading.

## 10. Regression tree diagram

- **tag:** optional (1)
- **show:** figure — `two-tree-figure` (the printed tree drawn with `rpart.plot`), the figure alone
- **words:** none
- **say:** each box shows a node's mean strength and its share of the training specimens; a specimen goes left when the condition under the box holds
- **note:** the chapter's `two-tree-figure`, 9 by 4.5 inches, shown at `height=570`. **The title is not a chapter heading.** Fourth in the drop order.

## 11. Partition

- **tag:** core (2)
- **show:** tabset, the chapter's own tabs: "One split" (`level-1-figure`), "Two levels" (`level-2-figure`), "Three levels" (`level-3-figure`), "Four levels" (`level-4-figure`), "Fitted tree" (`level-fit-figure`)
- **words:** none
- **say:** the tabs draw the tree's regions over the training specimens one level of splits at a time; each rectangle is a leaf labeled with its mean strength; the fitted tree has 5 levels of splits; every boundary is vertical or horizontal and each later split divides only the region it is made in, so the young and the old specimens are split on cement at different cut points; the fitted function is a step function in two explanatory variables
- **note:** the chapter's `### Partition` tabs (the chapter's `####` tab names). The five figures are 8 by 4.5 inches with aligned panels in the chapter, shown with the deck's `.mid-tabs` class (`max-height: 520px`) because at `.tall-tabs` (560 px) the tab bar pushes the figure past the bottom of the slide.

# Pruning

- **tag:** transition (0)
- **show:** none (transition slide, title only)
- **say:** this part prunes the tree on age and cement only; with all 8 explanatory variables the full tree's test MSE is no worse than the pruned tree's, as slide 19 shows; the default stopping rules ended the tree at 9 leaves, and growing it without them gives the full tree $T_0$
- **note:** relies on the chapter's `## Pruning` section and its opening sentences under `### Overfitting`.

## 12. Full tree

- **tag:** core (1.5)
- **show:** code — the chapter's `full-fit` chunk (the full tree with `cp = 0`, `minsplit = 2`, `minbucket = 1`) and its output `leaves 564`
- **words:** none
- **say:** growing without the stopping rules, until no region can be split, gives the full tree $T_0$; it has 564 leaves for 700 training specimens
- **note:** the chunk and its output are copied verbatim (8 lines of code, 2 of output). **The title is not a chapter heading** (the chunk sits under `### Overfitting`); it uses the chapter's term "full tree".

## 13. Overfitting

- **tag:** core (2)
- **show:** figure — `size-figure` (training and test MSE of the subtrees by number of leaves, log scale), the figure alone
- **words:** none
- **say:** the training MSE falls with every added leaf, to 13.5 for the full tree, not zero because specimens with the same age and cement but different other ingredients share a leaf; the test MSE is smallest, 106.5, at 32 leaves and higher for larger trees, 136.4 for the full tree; the smallest leaves hold one or a few specimens whose means follow other ingredients and measurement error
- **note:** the chapter's `size-figure`, 8 by 4.2 inches, shown at `height=560`; the values are in `say:` only, quoted from the frozen markdown.

## 14. Cost-complexity pruning

- **tag:** core (2)
- **show:** equation — the chapter's $C_\alpha(T)$ display with its legend compressed to labels
- **words:** "$T$ — subtree of the full tree $T_0$, some internal nodes turned into leaves"; "$|T|$ — number of leaves of $T$; $R_\ell$ — its $\ell$th leaf"; "$\alpha$ — tuning parameter, the RSS a leaf must remove to be worth keeping"; then "$\alpha = 0$: the minimizer is $T_0$; larger $\alpha$, fewer leaves, down to the root alone" and "`rpart()`: `cp` is $\alpha$ divided by the RSS of the root"
- **reveal:** on arrival: the display and its legend; click 1: the last two lines
- **say:** stopping early is a poor remedy since a split that removes little RSS can lead to splits below it that remove much more; like $\lambda$ in ridge regression and the lasso, $\alpha$ trades fit against a penalty, here counting leaves as the subset selection criteria count features; the minimizing subtrees are nested and found by weakest link pruning in one pass over $T_0$, one subtree per row of the table on the next slide; the default `cp = 0.01` is the default tree's stopping rule
- **note:** the display is copied from the chapter with `\hat` written `\widehat`; the legend is cut to labels; the last two lines are the chapter's sentences "With $\alpha = 0$ the minimizer is $T_0$ ..." and "its complexity parameter `cp` is $\alpha$ divided by the root's RSS" shortened.

## 15. Cross-validation

- **tag:** core (2)
- **show:** code — the chapter's `cp-table` chunk (`full_fit$cptable`, the rows around the smallest `xerror`) and its printed rows
- **words:** none
- **say:** while fitting, `rpart()` runs 10-fold cross-validation over the sequence of subtrees and stores it in `cptable`; the columns: `CP` is the value of `cp` at which the subtree becomes the minimizer, `nsplit` its splits (one fewer than its leaves), `rel error` its training RSS over the root's, `xerror` its cross-validation sum of squared errors over the root's, `xstd` a standard error of `xerror`
- **note:** the chunk (4 lines) and its 6-line output are copied verbatim. The title is the chapter's `### Cross-validation`.

## 16. Cross-validation curve

- **tag:** core (1)
- **show:** figure — `cv-figure` (the cross-validation estimate against the number of leaves, the chosen size circled), the figure alone
- **words:** none
- **say:** the estimate is `xerror` times the root's RSS divided by $n$; it is smallest, 110.0, at 24 leaves and rises for larger trees as the test MSE did; in each fold the full tree is grown from the training folds and pruned at the same values of `cp`, so the estimate judges the whole procedure, not one tree
- **note:** the chapter's `cv-figure`, 8 by 4.2 inches, shown at `height=560`. **The title is the chapter's `### Cross-validation` with a suffix.**

## 17. Pruned tree

- **tag:** core (1.5)
- **show:** code — the chapter's `pruned-fit` chunk (`prune()` at the `cp` with the smallest `xerror`, and the full and pruned tree's test MSE) and its output
- **words:** none
- **say:** the full tree is pruned at the `cp` with the smallest `xerror` and both are evaluated once on the test specimens: 136.4 for the full tree and 111.6 for the pruned tree with 24 leaves; the default tree has 108.5 with 9 leaves and least squares on age and cement 172.7; the smallest test MSE of any subtree is 106.5, and pruning at the cross-validation choice removes 83% of the full tree's excess over it; here the default stopping rules happened to stop near the best size
- **note:** the chunk (7 lines of code) and its 2-line output are copied verbatim. The other numbers in `say:` are the chapter's inline R values, quoted from the frozen markdown. The title is the chapter's `### Pruned tree`.

## 18. Pruned tree regions

- **tag:** optional (1)
- **show:** figure — `pruned-figure` (the regions of the pruned tree), the figure alone
- **words:** none
- **say:** the pruned tree's first split is the default tree's, on age at 21 days; below it more steps in cement and age divide each side, and some regions are thin bands of cement that hold a few specimens; regions less than 25 kg per cubic meter tall are not labeled
- **note:** the chapter's `pruned-figure`, 8 by 4.5 inches, shown at `height=570`. **The title is not a chapter heading.** Fifth in the drop order.

## 19. All explanatory variables

- **tag:** core (2)
- **show:** table — the chapter's `compare_table` (leaves and test MSE of least squares and the default, full and pruned trees, on age and cement and on all 8 explanatory variables), copied from the frozen markdown
- **words:** none
- **say:** the same steps on all 8 explanatory variables; the pruned tree has 179 leaves and test MSE 42.2, a root mean squared error of 6.5 MPa against a standard deviation of 15.9 among the test strengths; least squares has 106.4; the default tree, stopped at 15 leaves, has 86.8 against 40.3 and 42.2 for the full and pruned trees grown past it, so the splits a stopping rule never reaches are where most of the gain is; pruning changes little: the estimate is within 5% of its smallest for 517 subtrees with 54 to 659 leaves, and the full tree's 40.3 is no worse than the pruned tree's; 619 of the full tree's 659 leaves hold one training specimen, and 68% of the test specimens have a mix some training specimen also has; pruning helped more on age and cement alone
- **note:** the table is copied verbatim from `result.markdown`, wrapped in the new `.auto-table` class (content-sized columns, no wrap in the first column). The chapter's two code chunks `all-fit` and `all-compare` are not code slides; the table carries their numbers (the pruned test MSE 42.2 and the least squares, log-age and default-tree MSEs 106.4, 48.5, 86.8). Relies on the chapter's paragraphs after the table (all in `say:`). Ends the regression-tree half of the deck.

# Classification trees

- **tag:** transition (0)
- **show:** none (transition slide, title only)
- **say:** a classification tree splits the explanatory variables into regions in the same way and predicts for a region its most common class among the training observations in it
- **note:** relies on the opening sentence of the chapter's `### Most common class`.

## 20. Penguin species

- **tag:** core (1)
- **show:** none, a words-only data slide (a short itemized list)
- **words:** "Question: which of three species is a penguin, given four measurements of its body?"; "Observation: a penguin"; "Response variable: `species`: Adelie, Chinstrap, Gentoo"; "Explanatory variables: bill length and bill depth (mm), flipper length (mm), body mass (g)"; then "Training sample: 240 penguins" and "Test penguins: 102"
- **reveal:** on arrival: the first four lines; click 1: the training sample and test penguins lines
- **say:** `modeldata::penguins` records 344 penguins from three islands of the Palmer Archipelago; 2 have none of the four measurements and are removed, leaving 342; sex is missing for 9 of those and is not used; island is not used because a split on a categorical variable is not covered in this lecture; the training penguins are a random sample of 240
- **note:** the chapter's `**Question.**` and `**Data.**` paragraphs under `### Penguin species`; the counts are inline R, quoted from the frozen markdown. The title is the chapter's `### Penguin species`.

## 21. Training penguins

- **tag:** optional (1)
- **show:** figure — `penguin-figure` (bill length against flipper length by species), the figure alone
- **words:** none
- **say:** 102 Adelie, 48 Chinstrap and 90 Gentoo; Gentoo penguins have the longest flippers, and among the shorter-flippered penguins Chinstrap penguins have longer bills than Adelie; one vertical and one horizontal line in the left part of the plot would separate the three species with a few penguins on the wrong side
- **note:** the chapter's `penguin-figure`, 7 by 4.5 inches, shown at `height=570`. **The title is not a chapter heading** (the figure sits under `### Penguin species`). Eighth in the drop order.

## 22. Most common class

- **tag:** core (1.5)
- **show:** equation — the chapter's $\widehat p_{\ell k}$ display with its legend compressed to labels
- **words:** "$K$ — number of classes, indexed $k = 1, \ldots, K$"; "$n_\ell$ — training observations in region $R_\ell$"; "$\widehat p_{\ell k}$ — proportion of them in class $k$"; then "Prediction for $R_\ell$: the class $k$ with the largest $\widehat p_{\ell k}$"
- **reveal:** on arrival: the display and its legend; click 1: the prediction line
- **say:** the proportions themselves estimate the probability of each class for an observation in $R_\ell$; here $K = 3$
- **note:** the display is copied from the chapter with `\hat` written `\widehat`; the last line is the chapter's sentence "The prediction for region $R_\ell$ is the class $k$ with the largest $\hat p_{\ell k}$" shortened.

## 23. Node impurity

- **tag:** core (2)
- **show:** equation — the chapter's display of $E_\ell$, $G_\ell$ and $D_\ell$, then the weighted impurity of a split
- **words:** "$E_\ell$ — classification error rate"; "$G_\ell$ — Gini index"; "$D_\ell$ — entropy, natural log, $0\log 0 = 0$"; then "Impurity of a split: $Q$ is any of the three, $Q_1$ and $Q_2$ its values in the two regions"
- **reveal:** on arrival: the three-measure display and its legend; click 1: the weighted-impurity display and its label
- **say:** a regression tree chooses the split with the smallest RSS; a classification tree chooses the split with the smallest impurity, a measure of how mixed the classes in a region are; all three are zero for a pure node and largest when the classes are equally common; the impurity of a split is the average of the two regions' impurities weighted by their numbers of observations
- **note:** both displays copied from the chapter with `\hat` written `\widehat`; the first display is set at 0.65em so that it fits on one line, as the chapter writes it.

## 24. Impurity of a split

- **tag:** optional (1.5)
- **show:** table — the chapter's `impurity_table` (class counts and the three impurities of the root, its two children and the weighted split), copied from the frozen markdown
- **words:** none
- **say:** the best Gini split of the training penguins is on `flipper_length_mm` at 206.5 mm; the right child is nearly pure Gentoo, and the left holds nearly all the Adelie and Chinstrap; the split removes 64% of the root's error rate, 53% of its Gini index and 54% of its entropy
- **note:** the table is copied verbatim from `result.markdown`; the values in `say:` are inline R in the chapter. **The title is not a chapter heading** (the table sits under `### Node impurity`). Sixth in the drop order.

## 25. Gini index and entropy

- **tag:** core (2)
- **show:** figure — `impurity-figure` (the share of the left child's impurity removed by every cut point on bill length, by each measure), the figure alone
- **words:** none
- **say:** all three are largest near the same cut point, which separates Adelie from Chinstrap; at every cut point up to 39.05 mm the error rate removes nothing, because both regions keep Adelie as their most common class, while the Gini index and the entropy still fall because one region becomes purer; the reason is concavity: they are strictly concave in the proportions, so by Jensen's inequality the weighted impurity after a split is smaller unless the two parts have the same proportions, while the error rate is linear wherever the most common class stays the same; a tree grown on the error rate can stop at such a split, so `rpart()` uses the Gini index by default (`parms = list(split = "information")` is the entropy), and the error rate is the usual measure for pruning
- **note:** the chapter's `impurity-figure`, 8 by 4.2 inches, shown at `height=560`; the concavity argument is in `say:` only.

## 26. Fitting a classification tree

- **tag:** core (2)
- **show:** code — the chapter's `penguin-fit` chunk (`rpart()` with `method = "class"` and `print(penguin_fit, digits = 4)`) and its printed tree
- **words:** none
- **say:** each line gives a node's number of training penguins, the number not in its most common class (`loss`), that class (`yval`), and the class proportions in the order Adelie, Chinstrap, Gentoo; the tree has 4 leaves and splits on `flipper_length_mm`, `bill_length_mm` and `bill_depth_mm`, not `body_mass_g`; its first split is the one in the impurity table
- **note:** the chunk (5 lines) and its 14-line output are copied verbatim; both fit at the normal code size (the output is 1,007 px wide). The title is the chapter's second `### Fitting`, made specific to classification trees.

## 27. Fitted classification tree

- **tag:** optional (1.5)
- **show:** tabset: "Diagram" (`penguin-tree-figure`) and "Regions" (`penguin-partition-figure`)
- **words:** none
- **say:** the diagram shows each node's most common class, its class proportions and its share of the training penguins; the regions are drawn over the data plot, each shaded by its predicted species, with the long-flipper region drawn as one rectangle because its split on bill depth is not on the plot
- **note:** the two chapter figures under `### Fitting`, 7 by 4 and 7 by 4.5 inches, as a tabset with `.mid-tabs`. **The tab names "Diagram" and "Regions" are not chapter headings.** Seventh in the drop order.

## 28. Test confusion matrix

- **tag:** core (1.5)
- **show:** code — the chapter's `penguin-test` chunk (`predict()`, the confusion matrix and the accuracy) and its console output (the matrix, then `[1] 0.9509804`)
- **words:** none
- **say:** the tree classifies 95.1% of the 102 test penguins correctly and misclassifies 5; always predicting the most common species would be right for 48.0%
- **note:** the chunk (5 lines) is copied verbatim; the output joins the two console printouts the chunk produces, in order, as R shows them. The title is the chapter's `### Test confusion matrix`.

## 29. Pruning a classification tree

- **tag:** core (1.5)
- **show:** code — the chapter's `penguin-prune` chunk (the full classification tree and its table from two rows above the smallest `xerror`) and its printed rows
- **words:** none
- **say:** a classification tree is pruned in the same way with the error rate in place of the RSS; `rel error` and `xerror` are numbers of misclassified training penguins divided by the root's, the 138 that are not Adelie; the smallest estimate, 10 misclassified penguins, is at 4 leaves (4, 6 and 12 leaves tie and the smallest tree is taken), the size of the default tree; the two trees differ in node 3: the default splits at `bill_depth_mm >= 17.05`, leaving a leaf of 7, and the chosen tree at `bill_depth_mm >= 17.65`, leaving a leaf of 5, which the default `minbucket = 7` forbids; the chosen tree classifies 96.1% of the test penguins correctly against 95.1%, 98 of 102 against 97
- **note:** the chunk (8 lines) and its 7-line output are copied verbatim; both fit at the normal code size. The title is the chapter's second `### Pruning`, made specific to classification trees.

# Strengths and weaknesses

- **tag:** transition (0)
- **show:** none (transition slide, title only)
- **say:** the strengths are interpretability, and nonlinearity and interactions without feature engineering; the weaknesses are step-function predictions and high variance
- **note:** relies on the chapter's `## Strengths and weaknesses` section. The chapter has no summary table of strengths and weaknesses, and the deck does not invent one.

## 30. Interpretability

- **tag:** optional (1)
- **show:** none, a short list of the chapter's own sizes
- **words:** "Default concrete tree on age and cement: 9 leaves"; "Default penguin tree: 4 leaves"; "Any number of classes, no change to the method"; then "Pruned tree on all 8 explanatory variables: 179 leaves"
- **reveal:** on arrival: the first three lines; click 1: the last line
- **say:** a small tree is a list of rules a reader can follow without software; a classification tree handles any number of classes with no change to the method; interpretability fades with size, and 179 leaves is more than anyone reads
- **note:** the chapter's `### Interpretability` paragraph cut to lines; 9, 4 and 179 are inline R, quoted from the frozen markdown. Second in the drop order.

## 31. Nonlinearity and interactions

- **tag:** core (1.5)
- **show:** none, a short list of the chapter's own numbers
- **words:** "Test MSE on all 8 explanatory variables: pruned tree 42.2, least squares 106.4"; "Least squares with $\log(\texttt{age})$ in place of age: 48.5"; then "Default tree on age and cement: younger than 21 days, cement split at 354.5; older, at 164.8, 257.7 and 352.5"
- **reveal:** on arrival: the first two lines; click 1: the last line
- **say:** a tree needs no features built for curvature or interaction; the log of age is a feature chosen after seeing the curve in the data plot, and the tree does better without being told about the curvature; a split on another variable below a split is an interaction: the step in strength that cement makes depends on age
- **note:** the chapter's `### Nonlinearity and interactions` paragraphs cut to lines; 42.2, 106.4, 48.5, 21, 354.5, 164.8, 257.7 and 352.5 are inline R, quoted from the frozen markdown. The first two lines repeat numbers in the All explanatory variables table.

## 32. Step functions

- **tag:** optional (2)
- **show:** tabset, the chapter's own tabs: "Tree and least squares" (`step-fits-figure`) and "Trees on halves" (`step-halves-figure`)
- **words:** none
- **say:** a halving splits the 700 training specimens at random into two halves of 350; the tabs plot predicted strength at 28 days against cement, over the 28-day specimens: the default tree and least squares fit to all 700, then the default trees fit to the 40 halves of 20 halvings; the tree's prediction is flat between cut points and jumps at each one, so two mixes on either side of a cut point differ however close they are, and two mixes far apart within a region get the same prediction; least squares draws a straight line; the trees on halves differ in where they put their steps and how high each step is
- **note:** the chapter's `### Step functions` tabs (the chapter's `####` names), 8 by 4.2 inches, with aligned panels, shown with `.mid-tabs`. First in the drop order.

## 33. Instability

- **tag:** core (2)
- **show:** tabset, the chapter's own tabs: "First half" (`half-1-figure`) and "Second half" (`half-2-figure`)
- **words:** none
- **say:** the regions of the two trees of one halving, each over its own half of the training specimens: the first halving, in the order drawn, whose two trees split first in different places; the first splits on `age< 42` with 10 leaves and the second on `age< 21` with 8; each later split is made inside a region the first creates, so the partitions differ throughout; over 200 halvings the two halves split first at the same place 50% of the time and `age< 21` is the first split of 74% of the 400 trees; predictions for a test specimen differ by 6.2 MPa on average, against 1.6 MPa for least squares on the same halves; a tree has high variance, since each split is chosen from the data and a different first or second split changes every split below it
- **note:** the chapter's `### Instability` tabs, two 8 by 4.5 inch figures, shown with `.mid-tabs`; the values are inline R, quoted from the frozen markdown, and are in `say:` only.

## 34. Conclusion

- **tag:** core (1)
- **show:** none, a flat list of six takeaways
- **words:** "A tree predicts a constant in each rectangle: the mean, or the most common class"; "Recursive binary splitting is greedy and top-down"; "Gini index or entropy, not the error rate, grows a classification tree"; "Cross-validated pruning sets the size of the tree"; "Small trees are readable and capture nonlinearity and interactions"; "Predictions are step functions with high variance"
- **say:** the chapter's Conclusion; the next lecture reduces that variance by averaging many trees: bagging fits a tree to each of many bootstrap samples, and random forests also restrict each split to a random subset of the explanatory variables
- **note:** distilled from the chapter's `## Conclusion` (one line per paragraph's main result); no example numbers. Relies on the Conclusion's sentences on the constant per region, "a greedy, top-down search", the strict concavity of the Gini index and entropy, cost-complexity pruning with `cp` chosen by 10-fold cross-validation, "Trees are easy to read when they are small, capture nonlinearity and interactions without feature engineering", and "Their predictions are step functions, and they have high variance".
