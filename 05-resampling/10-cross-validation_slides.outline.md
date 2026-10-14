# Slide outline: Cross-Validation

Outline for `10-cross-validation_slides.qmd` (Wed 2026-10-14, one 50-minute
period, MWF 1:10-2:00). **This file is the spec; the deck is built from it.**
Edit it freely: reorder, cut, reword, change `tag:`, add notes. When it says
what you want, ask for the deck to be built and `slides-author` will implement
exactly these slides. The deck does not exist yet.

Drafted 2026-10-13 against `10-cross-validation.qmd` at `38bb479`
(`38bb4793e61eee541265cd5fccb0076b0b7278b3`), which is what the deck's
`derived-from` comment should record. The frozen output
`_freeze/05-resampling/10-cross-validation/execute-results/html.json` is
current: its recorded `hash` (`37eaf23fcb3a0327cd2288ed59bad488`) equals the
md5 of the chapter file as it stands, and the file has no uncommitted changes.
The chapter does **not** have a "Slides for this lecture" link yet;
`slides-author` inserts it on the line after `# Cross-Validation` the first time
the deck is built, and the chapter is then re-rendered.

The chapter's `##` sections are Test error estimation, Validation set approach,
Leave-one-out cross-validation, k-fold cross-validation, Classification,
Data-dependent steps and Conclusion. It is the densest chapter of the course so
far: 22 figures, one table, one three-step derivation, one variance formula and
a simulation study, all on one running example (`ISLR2::Auto`, then
`ISLR2::Default`), and it prints no console output at all. The core line is: why
training error cannot choose a model's flexibility (polynomial fits of
`mpg` on `horsepower`, the training MSE); the validation set approach and its
two weaknesses (the estimate varies from split to split, and it overestimates
because the fit uses only part of the data); leave-one-out cross-validation (the
held-out car, the estimate, the least squares shortcut with the leverage $h_i$,
the degree it selects); $k$-fold cross-validation (the folds, the estimate, its
stability across random partitions, the fold-count trade-off in bias, variance
and computation, and the usual choice $k = 5$ or $10$); cross-validation for a
classifier (the error rate, and the number of neighbors $K$ for KNN on
`ISLR2::Default`); and the data-dependent steps that must be repeated inside
every fold (feature screening, standardization, tuning). Mapped onto the
chapter's six learning objectives:

1. training error cannot choose flexibility; the two validation set weaknesses:
   slides 3, 6, 7;
2. LOOCV and $k$-fold estimates for test MSE and test error rate, and the loop
   that fits on all but one fold: slides 10, 17, 18 (optional), 25;
3. the least squares shortcut and the role of the leverage: slides 11, 12, 13;
4. compare the three methods by bias, variance and computation; justify
   $k = 5$ or $10$: slides 7, 19, 20, 21, 22;
5. use cross-validation to choose a degree or $K$: slides 14, 26;
6. data-dependent steps repeated inside every fold: slides 28, 29, 30.

Cut to optional, in the order they would go: the $k$-fold loop code (18) and the
Conclusion slide (31). If time is still short, drop in this order: Standardization
and tuning (30), Cross-validation error rate (25; say the formula over slide
26's figure), Computation and bias (21; its two lines go into slide 22's
`say:`), Partition variability (19). Cut from the deck entirely and parked below:
the chapter's opening Held-out data prose, the loop-versus-shortcut table, the
LOOCV loop code, the log-loss display, the extreme 2-fold estimates, why screening
inside each fold lands slightly above 50%, and every `### Beyond this course`
pointer. Five transition slides (4, 8, 15, 23, 27), no live widget and no console
slide: the chapter prints no console output. One code slide (18, optional).

Nothing here is new content. Every `show:` points at something that already
exists in `10-cross-validation.qmd`, so the deck distills the notes and never
invents. If a slide needs something the chapter doesn't have, flag it with
`needs:` and it goes back through `notes-author` and `proof-reader` first. No
slide in this outline needs one, but three slides lay out the chapter's own
sentences or numbers in a form the chapter does not have (13's two-line
comparison, 21's list, 30's list); each is marked with a `note:`.

**Response variable and explanatory variables.** The deck says what they are
every time a new dataset appears. For `ISLR2::Auto` (slide 1) the response
variable is `mpg` and the one explanatory variable is `horsepower`; the
degree-$d$ polynomial then has $d$ features, the powers of horsepower. For
`ISLR2::Default` (slide 24) the response variable is `default` and the
explanatory variables are `balance` and `income`. For the simulated screening
data (slide 28) the response variable is the class and the explanatory variables
are the 5,000 noise columns; the 20 that screening keeps are the features of the
KNN classifier. The deck uses "explanatory variables" for raw columns and
"features" only for the columns that enter the model, per `CONVENTIONS.md`.

**Symbols,** per `CONVENTIONS.md` and the chapter: lowercase $k$ is the number
of folds (and $\text{CV}_{(k)}$), indexed by $\ell$; uppercase $K$ is the number
of neighbors in KNN only (slides 24 to 30); $d$ is the polynomial degree; $h_i$
is the leverage; $\tau^2$ and $\rho$ are the variance and pairwise correlation of
the fold MSEs on slide 22; $m$ is the training set size on slide 7; $n$ is the
number of observations; $\mathcal{V}$ and $\mathcal{F}_\ell$ are the validation
set and fold $\ell$. Slide 17 says aloud that $k$ and $K$ are unrelated. Every
equation is copied from the chapter's source with `\widehat` for `\hat`.

## How to read an entry

```
## N. Slide title                       <- reuse the chapter's own heading when there is one
tag: core | optional                    <- optional = first to drop if time is short
show: <type> — <asset>                  <- what is on the slide (types below)
words: "a short label, 0-1 lines"       <- the only prose on the slide
reveal: <what appears on each click>    <- optional; omit when everything shows at once
say: what you plan to say aloud         <- speaker notes, never on the slide
note: build and provenance details      <- not on the slide, not spoken
needs: ...                              <- only if something is missing from the chapter
```

`reveal:` lists the clicks in order, as "on arrival: ...; click 1: ...; click 2: ...".
Each click is one `{.fragment}` block in the deck. Use it on slides that stack
several equations or lines, so the content appears as it is discussed. Figures,
tabsets and code slides carry no fragments.

`show:` types: `equation` (copied from the chapter's source; `\widehat` for
`\hat` in slides), `figure` (the named chunk's PNG from `_freeze/`), `table`
(the named kable chunk, copied from the frozen markdown), `tabset` (several
figures on ONE slide as a `.panel-tabset`, one tab per figure; the tab labels
are the chapter's own tab names), `code` (a chunk's source, shown as a plain
code block), `console` (a chunk's printed R output, verbatim), `link` (a pointer
back to the notes page, for anything that cannot be a static image), `none` (a
words-only slide). A slide may combine two `show:` items, for example an equation
under a figure. `words:` is the only prose on a slide and never uses a
middle-dot separator: several short claims are an itemized list (one idea per
bullet) or a table.

Slides never draw from a `### For example,` or `### Beyond this course`
callout.

Equations use the bracket convention (`E[\cdot]` and `Var[\cdot]` always square,
other nested groupings cycling `()`, `[]`, `{}`) and `\widehat` for `\hat`.

**Timing:** 32 slides (0 to 31): 5 transitions (no time), 25 `core` content
slides (slide 0 and 24 more) and 2 `optional`. At the estimates below the 25
core slides come to about 47 minutes, which fits 50 only because the quick ones
take about a minute; there is no slack for questions. The estimates, in minutes:
0 (1), 1 (1.5), 2 (2), 3 (1.5), 5 (2.5), 6 (3), 7 (2), 9 (2), 10 (1.5), 11 (2),
12 (3), 13 (2), 14 (1.5), 16 (1), 17 (2), 19 (2), 20 (2), 21 (1.5), 22 (2.5),
24 (1.5), 25 (1.5), 26 (2.5), 28 (1.5), 29 (2.5), 30 (1.5). The slowest are the
two derivation slides (11, 12), Split variability (6), the Fold count simulation
(20 and 22 together) and Neighbor count (26). The two optional slides add about 2
minutes if there is room. If the lecture is running behind at the start of
Classification (slide 23), the last three sections need about 13 minutes
(slides 24 to 30); the drop order above frees about 7 of them, so decide there
whether Data-dependent steps (28 to 30) is given its full time or spoken over
the two figures only.

---

## 0. Today
tag: core
show: none, a bulleted list
words: agenda as eight noun phrases, one per line: Training error and test error; Validation set approach; Leave-one-out cross-validation; Least squares shortcut; k-fold cross-validation; Fold count; Choosing a flexibility setting; Data-dependent steps
say: distilled from the chapter's six learning objectives, each compressed to a noun phrase (training error versus test error, with the validation set weaknesses; leave-one-out and k-fold estimates; the shortcut and the leverage; the bias, variance and computation comparison; choosing a degree or K; the steps repeated inside every fold); the DS3030 title slide carries the chapter title; one running thread, how flexible a model should be, first for the polynomial degree d on the cars, then for the number of neighbors K on the credit card customers; the timing note is in the speaker notes: optional slides in the order they would go (k-fold loop, Conclusion), then the drop order (Standardization and tuning, Cross-validation error rate, Computation and bias, Partition variability)
note: the notes chapter's learning objectives are the source; the chapter has no "Today" section.

## 1. Horsepower and fuel efficiency
tag: core
show: figure — auto-data-figure (mpg against horsepower for the cars, with the `ISLR2::Auto` title); then a short itemized list
words: an itemized list of three lines beside or below the figure: "`ISLR2::Auto`: 392 cars", "Response variable: `mpg`, miles per gallon", "Explanatory variable: `horsepower`"
say: how flexible should a regression of fuel efficiency on horsepower be; fuel efficiency falls as horsepower rises, steeply at first and then more slowly; the next lecture-long question is how to choose among polynomial models of different degree without a separate test set; the 392 is inline R in the chapter ("`r nrow(Auto)` cars"), quoted from the frozen markdown at build time
note: the chapter's first subsection opens with a Question and a Data paragraph (words only) and the figure; the slide is the data paragraph's two variable names plus the figure. The data-first order the notes follow is kept: the data come before the polynomial model on slide 2.

## 2. Polynomial fits
tag: core
show: equation and tabset — the polynomial regression display, `\texttt{mpg}_i = \beta_0 + \beta_1\,\texttt{horsepower}_i + \beta_2\,\texttt{horsepower}_i^2 + \cdots + \beta_d\,\texttt{horsepower}_i^d + \epsilon_i, \qquad \epsilon_i \stackrel{ind}{\sim} N\left(0, \sigma^2\right)`, above the chapter's three-tab fits with its own tab names: "Degree 1" (auto-degree1-figure), "+ Degree 2" (auto-degree2-figure), "+ Degree 10" (auto-degree10-figure)
words: after the equation, an itemized list of two labels: "d — degree, the flexibility setting to be chosen", "Features: the d powers of horsepower"
say: the tabs add least squares fits of degree 1, 2 and 10 to the scatterplot; the straight line misses the curvature, underpredicting at both ends and overpredicting in the middle; the quadratic follows the curve; the degree-10 polynomial follows it too, with extra wiggles at both ends of the range of horsepower, where cars are few; the degree d is the flexibility setting to be chosen, and the chapter keeps it as d throughout (K is the number of neighbors later); the features here are the powers of horsepower, so row i of the model matrix is (1, horsepower_i, ..., horsepower_i^d); `poly(horsepower, d)` fits the same model with an orthogonal basis
note: the tabset is the chapter's own "Degree 1 / + Degree 2 / + Degree 10" tabset, with no fragments; the equation is the chapter's "Model" display verbatim and the two labels are cut from its symbol bullets. The title is new (the paragraph has no heading). The slide is the one place the chapter's `$\beta_{d+1} = 0$` nesting argument for training MSE is not used; it is parked (slide 3's `say:`).

## 3. Training MSE
tag: core
show: figure — train-mse-figure (training MSE against the degree d from 1 to 10)
words: an itemized list of two lines: "Training MSE: 23.94 at d = 1, 18.98 at d = 2, 18.01 at d = 10", "Training error cannot choose d"
say: the training MSE is the average squared error on the same 392 cars the model was fit to; it cannot rise as d increases, since the degree-d model is the degree-(d+1) model with the last coefficient set to zero, so least squares over the larger model can only match or lower the residual sum of squares; training error rewards flexibility whether or not the flexibility captures anything that will appear in new data; the regression lecture defined the test MSE on observations not used to fit; a large separate test set would make choosing d easy, fit each degree to the training data and keep the smallest test MSE, but a separate test set is rarely available, collecting one costs as much as the training data and setting part of the data aside leaves less to fit with; resampling methods estimate test error from the training data alone, by fitting to part of the data and measuring error on the part left out; this lecture develops three in increasing order of reuse: the validation set approach, leave-one-out cross-validation and k-fold cross-validation
note: the figure is the chapter's `train-mse-figure`; the three numbers are inline R in the chapter, quoted from the frozen markdown. The chapter's "Held-out data" subsection (its argument for resampling) is words only, so it is not a slide; its content is in this slide's `say:` (parked below).

## 4. Validation set approach
tag: core
show: none (transition slide, title only)
words: none
say: the first of the three methods

---

# Validation set approach

## 5. Algorithm
tag: core
show: figure and equation — validation-split-figure (the 392 cars split at random into a training half, blue circles, and a validation half, orange triangles) with the algorithm's three steps beside it, then the `\text{MSE}_{\mathcal{V}}` display below: `\text{MSE}_{\mathcal{V}} = \frac{1}{n_{\mathcal{V}}}\sum_{i \in \mathcal{V}}\left[y_i - \widehat f(x_i)\right]^2`
words: an itemized list of three steps beside the figure: "Split the n observations at random into a training set and a validation set", "Fit the model to the training set", "Predict the validation set and average the squared errors"; after the equation, an itemized list of two labels: "V — validation set, n_V observations", "f̂ — fit to the training set only"
reveal: on arrival: the figure and the three steps; click 1: the MSE equation; click 2: the two labels
say: the figure shows the cars split at random into two halves of 196, a training set (blue circles) and a validation set (orange triangles); both halves cover the range of horsepower and either shows the same curved decline as the full data; every validation observation is new to f̂, so MSE_V is a test MSE in the sense of the regression lecture; MSE_V is computed for each degree d to compare them; K is not involved, the degree d is the only setting
note: the chapter opens the section with the split figure and then states the algorithm under "### Algorithm"; the slide merges them (figure beside the steps, equation on a click) to save a slide, and the chapter's `validation-mse` code is not shown. The 196 is inline R in the chapter ("`r nrow(Auto) / 2`").

## 6. Split variability
tag: core
show: tabset — three tabs with the chapter's own names: "One split" (one-split-figure), "100 splits" (all-splits-figure), "Chosen degree" (val-choice-figure), then a two-line list below it
words: an itemized list of two lines below the tabset: "Quadratic: validation MSE from 14.50 to 24.71 across splits", "Best degree is 2 through 10; degree 7 wins 36 of 100 splits"
say: the first tab is the validation MSE of the one split against the degree; the second adds the curves of all 100 random splits, grey, with the first in black; the third counts the degree with the smallest validation MSE in each split; every curve drops sharply from degree 1 to degree 2, so every split agrees that a quadratic beats a line; beyond that the splits disagree: the quadratic's validation MSE ranges from 14.50 to 24.71 across splits, while within a split the estimates for degrees 2 through 10 span a median of 1.87; 2 of the 100 curves leave the top of the plot at high degree, where a polynomial fit to half the cars extrapolates badly to a validation car outside their range of horsepower; the most common choice, degree 7, wins only 36 of 100 splits; this is the first weakness: the estimate and the model it selects depend on which observations land in which half
note: the chapter's own three-tab set, with the tab names as the chapter writes them (the second is "`r n_splits` splits", rendered "100 splits"); the numbers are inline R in the chapter, quoted from the frozen markdown. The lecture's first main visual (3 minutes).

## 7. Smaller training sets
tag: core
show: figure — learning-curve-figure (median validation MSE against the training set size m, for degree 2 and degree 7, a vertical line at half of the cars)
words: an itemized list of two lines: "Degree 7: median validation MSE 24.07 at m = 60, 19.39 at m = 196", "Validation set approach overestimates the test error of the fit to all 392 cars"
say: the second weakness is that each model is fit to only part of the data; to see what that costs, the cars were split at random into a training set of m cars and a validation set of the other n − m, for m from 60 to 360, 400 times at each m; because the validation cars are new to each fit, the typical validation MSE at a given m estimates the test MSE of a model fit to m cars; test MSE generally falls as the training set grows and falls more steeply for the more flexible model; the quadratic goes from 20.05 to 19.23 over the same range; the median is plotted because the mean is dominated by a few catastrophic extrapolations (the mean at m = 60 for degree 7 is 5,778); the model that will be used is fit to all 392 cars, so an estimate from fits to half of them estimates the error of a worse model; the validation set approach tends to overestimate the test error of the final fit, more so for flexible models and small n
note: the numbers are inline R in the chapter, quoted from the frozen markdown. The 360 and 400 are inline R (`max(train_sizes)`, `n_learning_reps`) in the chapter's text paragraph.

## 8. Leave-one-out cross-validation
tag: core
show: none (transition slide, title only)
words: none
say: the validation set approach leaves out half the data; leave-one-out cross-validation leaves out one observation at a time

---

# Leave-one-out cross-validation

## 9. Held-out car
tag: core
show: tabset — two tabs with the chapter's own names: "Degree 2" (held-out-d2-figure), "Degree 10" (held-out-d10-figure), and a three-line list beside or below it
words: an itemized list of three lines: "Black triangle: the car with the most horsepower, 230", "Dashed: fit to all 392 cars", "Solid: fit to the other 391"
say: the held-out car is a Pontiac Grand Prix with 230 horsepower, the car with the largest horsepower; for the quadratic the two fits nearly coincide, and the held-out car is predicted about as well without it as with it; for degree 10 the fit to all cars bends to pass near the held-out car, and without it the curve swings far below; the squared error of the held-out prediction measures how well the model predicts a car it has not seen, which the residual from the fit to all cars does not
note: the chapter's own two-tab set, with its tab names; the opening paragraph's inline R (the car's name, 230, 392 and 391) is quoted from the frozen markdown at build time. The title is new (the figure opens the section with no subsection heading).

## 10. LOOCV estimate
tag: core
show: equation — `\text{CV}_{(n)} = \frac{1}{n}\sum_{i=1}^n\left[y_i - \widehat f^{(-i)}(x_i)\right]^2`
words: after the equation, an itemized list of two labels: "f̂^(−i) — fit to the n − 1 observations other than observation i", "f̂^(−i)(x_i) — its prediction for the held-out observation"; then "n fits per model"
reveal: on arrival: the equation; click 1: the two labels; click 2: "n fits per model"
say: leave-one-out cross-validation (LOOCV) repeats the held-out car for every observation; each fit uses n − 1 observations, nearly all of the data, and there is no random split: every observation is held out exactly once; written as a loop, LOOCV costs n fits per model, 392 for the cars (the loop is parked, since the k-fold loop on slide 18 covers it with k = n)
note: the display is the chapter's, with `\widehat` for `\hat`; the labels are its two bullets, shortened. The 392 in `say:` is inline R in the chapter (the `loocv-table` column header "Loop (392 fits)").

## 11. Least squares shortcut
tag: core
show: equation — `\mathbf{H} = \mathbf{X}\left(\mathbf{X}^\top\mathbf{X}\right)^{-1}\mathbf{X}^\top, \qquad \widehat y_i = \sum_{j=1}^n h_{ij}\,y_j, \qquad h_i = h_{ii} = x_i\left(\mathbf{X}^\top\mathbf{X}\right)^{-1}x_i^\top`, then `z_j = y_j \text{ for } j \ne i, \quad z_i = x_i\widehat\beta^{(-i)}`, then `\sum_{j=1}^n\left(z_j - x_j\beta\right)^2 = \sum_{j \ne i}\left(y_j - x_j\beta\right)^2 + \left(x_i\widehat\beta^{(-i)} - x_i\beta\right)^2`, then `\widehat\beta^{(-i)} = \left(\mathbf{X}^\top\mathbf{X}\right)^{-1}\mathbf{X}^\top z`
words: after the first display, an itemized list of two labels: "H — hat matrix", "h_i — leverage, 0 ≤ h_i ≤ 1"; before the second display, "Step 1: a full-data fit that reproduces β̂^(−i)"; after the last display, "β̂^(−i) is the least squares estimate for response z"
reveal: on arrival: the hat matrix display; click 1: the two labels; click 2: "Step 1" line and the z display; click 3: the sum-of-squares display; click 4: the closing display and its line
say: for a model fit by least squares the n fits are unnecessary; write the least squares fit to all n observations as ŷ = Hy, with h_i the diagonal entry, the leverage of observation i, as in the flexibility lecture; assume X without row i still has full column rank so β̂^(−i) is unique; define a response vector z equal to y except entry i, replaced by the held-out prediction; the first sum on the right of the identity is minimized at β = β̂^(−i), by definition, and the second term is zero there, its smallest possible value, so β̂^(−i) minimizes the left side: it is the least squares estimate for response z with all n rows; Step 2 and Step 3 are on the next slide
note: derivation Step 1 of 3, verbatim from the chapter's source (with `\widehat` for `\hat`), split off from Steps 2 and 3 so neither slide stacks more than four displays. The chapter states Step 1 in prose with one display and the closing display inline; the slide writes the closing display on its own line. The chapter's `$\mathbf{X}$ without row $i$ still has full column rank` assumption is in `say:` only. One of the two slowest slides (2 minutes).

## 12. Shortcut derivation
tag: core
show: equation — Step 2, `\widehat f^{(-i)}(x_i) = \sum_{j=1}^n h_{ij}\,z_j = \sum_{j=1}^n h_{ij}\,y_j - h_i\,y_i + h_i\,\widehat f^{(-i)}(x_i) = \widehat y_i - h_i\,y_i + h_i\,\widehat f^{(-i)}(x_i)`; then Step 3, `\left(1 - h_i\right)\widehat f^{(-i)}(x_i) = \widehat y_i - h_i y_i` and `y_i - \widehat f^{(-i)}(x_i) = \frac{y_i - \widehat y_i}{1 - h_i}`
words: before the first display, "Step 2: apply the hat matrix"; before the second, "Step 3: solve"
reveal: on arrival: the Step 2 line and display; click 1: the Step 3 line and its two displays
say: multiplying by x_i, x_i β̂^(−i) is entry i of Hz, and z differs from y only in entry i; collecting the f̂^(−i)(x_i) terms gives (1 − h_i) f̂^(−i)(x_i) = ŷ_i − h_i y_i; the full-rank assumption makes h_i < 1, so dividing by 1 − h_i gives the held-out error as the ordinary residual divided by 1 − h_i; this is the lecture's derivation (objective 3); squaring and averaging over i is the next slide
note: derivation Steps 2 and 3 of 3, from the chapter's three displays. `\hat f^{(-i)}` becomes `\widehat f^{(-i)}`. The slowest slide of the lecture (3 minutes).

## 13. Leverage and held-out error
tag: core
show: equation — `\text{CV}_{(n)} = \frac{1}{n}\sum_{i=1}^n\left(\frac{y_i - \widehat y_i}{1 - h_i}\right)^2`, then a two-item nested list of the chapter's two numerical comparisons
words: after the equation, "Held-out error: the residual inflated by 1/(1 − h_i)"; then an itemized list: "Degree 2: h_i = 0.0936, residual 1.228, held-out error 1.35", "Degree 10: h_i = 0.9018, residual 1.168, held-out error 11.90 = 1.168/(1 − 0.9018)"
reveal: on arrival: the equation; click 1: the inflation line; click 2: the two-line list
say: squaring and averaging over i gives the shortcut; the held-out error is the ordinary residual inflated by 1/(1 − h_i); with h_i = 0 for every i this would be the training MSE; the inflation is small for a typical observation and large for a high-leverage one, whose fitted value the full-data fit pulls toward its own response; the held-out car has leverage 0.0936 under the quadratic and 0.9018 under degree 10, where the fit bends to pass near it, so its held-out error is 11.90 against a residual of only 1.168; the formula needs one fit, its residuals and `hatvalues()`; it holds for any model fit by least squares on fixed features (polynomials, interactions, step functions with fixed cut points) and does not hold for logistic regression or KNN, where LOOCV takes n fits; the loop and the shortcut agree to the digits shown for every degree, 3,920 least squares fits against 10 (the table is parked)
note: the formula is the chapter's final display; the labels and the two-line list are the chapter's paragraph on the held-out car, cut to numbers. The chapter has no table of these numbers, so the two lines are the chapter's prose numbers (inline R) laid out as a list; flag them as a re-layout, not a chapter table. The chapter's loop-versus-shortcut table `loocv-table-display` is parked (see below).

## 14. Degree selection
tag: core
show: figure — loocv-curve-figure (the training MSE and the LOOCV estimate against the degree d)
words: an itemized list of two lines: "LOOCV: 24.23 at d = 1, 19.25 at d = 2, minimum 18.83 at d = 7", "Training MSE keeps falling; LOOCV at d = 10 is 19.49"
say: the LOOCV estimate drops from 24.23 at degree 1 to 19.25 at degree 2 and then barely moves; its minimum, 18.83, is at degree 7, only 0.42 below the quadratic; unlike the training MSE it does not keep falling: at degree 10 it is 19.49, above its minimum, while the training MSE is at its lowest; the curve is nearly flat from degree 2 on, so LOOCV does not clearly separate degrees 2 through 10; objective 5 (use cross-validation to choose a flexibility setting) first appears here
note: the figure is the chapter's `loocv-curve-figure`; the numbers are inline R in the chapter, quoted from the frozen markdown.

## 15. k-fold cross-validation
tag: core
show: none (transition slide, title only)
words: none
say: leave-one-out is the extreme of one observation per fold; k-fold cross-validation uses k folds in between

---

# k-fold cross-validation

## 16. Folds
tag: core
show: figure — auto-folds-figure (ten panels, each marking one group of cars as black triangles and the rest as grey circles)
words: an itemized list of two lines: "10 folds of 39 or 40 cars", "Black triangles: the held-out fold in each panel"
say: the 392 cars are split at random into 10 groups of about equal size; every car appears as a triangle in exactly one panel, and each group is scattered across the whole range of horsepower; k is the number of folds; here k = 10
note: the figure is the chapter's `auto-folds-figure`; the sizes 39 and 40 are inline R in the chapter. The title is new (the figure opens the section with no subsection heading).

## 17. k-fold estimate
tag: core
show: equation — `\text{MSE}_\ell = \frac{1}{n_\ell}\sum_{i \in \mathcal{F}_\ell}\left[y_i - \widehat f^{(-\ell)}(x_i)\right]^2, \qquad \text{CV}_{(k)} = \sum_{\ell=1}^k \frac{n_\ell}{n}\,\text{MSE}_\ell`
words: after the equation, an itemized list of three labels: "k — number of folds, unrelated to K, the number of neighbors", "F_ℓ — set of observations in fold ℓ, n_ℓ of them", "f̂^(−ℓ) — fit to the observations outside fold ℓ"; then "LOOCV is the special case k = n"
reveal: on arrival: the equation; click 1: the three labels; click 2: "LOOCV is the special case k = n"
say: k-fold cross-validation divides the observations at random into k folds of about equal size; for each fold ℓ it fits the model to the other k − 1 folds and computes the MSE on fold ℓ; CV_(k) is the average of the fold MSEs weighted by fold size, which is the plain average when every fold has n/k observations; every observation is held out exactly once and used for fitting k − 1 times; the symbol k, lowercase as in the name, is unrelated to K, the number of neighbors in KNN (and of classes in the generative classifier lectures), which returns on slide 26
note: the display is the chapter's, verbatim; the labels are its bullets, cut. The chapter's "weighted by fold size" bullet is in `say:` only.

## 18. k-fold loop
tag: optional
show: code — the chapter's `kfold-function` chunk verbatim as a plain code block (the function `kfold_mse` and the line `kfold_10 <- map_dbl(degrees, kfold_mse, fold = fold_auto)`), then one line of words below it
words: "10-fold estimate: 24.29 at d = 1, 19.28 at d = 2, smallest 19.19 at d = 7"
say: optional; the loop fits the model on the rows outside fold ℓ and stores the squared errors on the rows in fold ℓ; `fold` is a vector giving each observation's fold; with k = n this is the leave-one-out loop (the LOOCV loop chunk is parked); the objective's "implement each as a loop that fits on all but one fold and predicts the held-out fold" is this slide; with the folds of the figure the 10-fold estimate is 24.29 at degree 1, 19.28 at degree 2 and smallest, 19.19, at degree 7
note: no fragments (code slide). `fit_degree()` and `degrees` are defined in earlier chunks (`fit-degree`, `auto-curves`) and are not shown; the printed numbers are inline R in the chapter. Optional because the equation on slide 17 and the figure on slide 16 already state the algorithm.

## 19. Partition variability
tag: core
show: tabset — three tabs with the chapter's own names: "Validation set" (resample-val-figure), "5-fold" (resample-5fold-figure), "10-fold" (resample-10fold-figure), then one line of words below
words: "SD of the degree-2 estimate: 1.70 (validation set), 0.136 (5-fold), 0.093 (10-fold)"
say: the tabs repeat the validation set curves of 100 random splits and add 100 random partitions into 5 folds and into 10 folds, each over the LOOCV curve (black, dashed); the band of curves narrows from tab to tab; at degree 2 the standard deviation of the estimate across random partitions is 1.70 for the validation set, 0.136 for 5-fold and 0.093 for 10-fold cross-validation; the 5-fold and 10-fold curves hug the LOOCV curve, while the validation set curves scatter widely on both sides of it: every observation is held out once and the held-out errors are averaged over all n of them, so the estimate depends far less on which observations share a fold; the degree with the smallest estimate is still not fixed: across partitions 10-fold cross-validation chooses degree 2, 6 and 7, because the curves are nearly flat from degree 2 on
note: the chapter's own three-tab set; the numbers are inline R in the chapter, quoted from the frozen markdown. The tab names are the chapter's headings ("Validation set", "5-fold", "10-fold"). Fourth to drop if time is short.

## 20. Fold count
tag: core
show: figure — k-simulation-figure (cross-validation estimates of test MSE for 2-fold, 5-fold, 10-fold and LOOCV, over 2,000 samples of 50 cars, quadratic fit; diamond = mean, dashed = mean test MSE)
words: an itemized list of three lines: "2,000 samples of 50 cars; quadratic fit", "Mean test MSE of the fits: 20.38", "Mean estimate: 23.08 (2-fold), 20.86 (5-fold), 20.55 (10-fold), 20.37 (LOOCV)"
say: to see how k affects bias and variance, the 392 cars were treated as a population: each of 2,000 times a sample of 50 cars was drawn without replacement and a quadratic fit to it; the actual test MSE of that fit is its average squared error on the 342 cars not drawn; the figure compares the cross-validation estimates from the same 50 cars, with k equal to 2, 5, 10 and 50 (LOOCV), against it; 2-fold cross-validation, fitting to 25 cars, overestimates by 2.70, with a simulation standard error of 0.52; by k = 5 the overestimate is small, 0.49, with a simulation standard error of 0.14; the standard deviations of the estimates are 23.06, 5.35, 5.15 and 5.01, so 10-fold and LOOCV vary about equally; the 2-fold standard deviation is dominated by 3 of the 2,000 samples whose estimates exceed five times the mean test MSE (the largest is 984.29), where a quadratic fit to 25 cars extrapolates badly to a held-out car; without them it is 7.61; the figure's vertical axis is clipped, so those estimates are not shown
note: the figure is the chapter's `k-simulation-figure`; the numbers are inline R in the chapter, quoted from the frozen markdown. This is the empirical anchor for slides 21 and 22; the 50 is `n_sample` (not the `n` of the Auto data). Not in the drop order; if time is short, say the bias and variance numbers over the figure and skip the list.

## 21. Computation and bias
tag: core
show: none, an itemized list
words: three items, one per click: "Computation: k fits per model, LOOCV n fits"; "Bias: each fit uses n(k − 1)/k observations" with a nested list "196 cars at k = 2, about 314 at k = 5, about 353 at k = 10, 391 at LOOCV"; "Smaller k: more upward bias; LOOCV nearly unbiased"
reveal: on arrival: the computation line; click 1: the bias line and its nested list; click 2: the "Smaller k" line
say: for least squares the shortcut makes LOOCV cost one fit; for most other methods it is n fits, and k = 5 or 10 is a large saving; by the learning curve of slide 7, a model fit to fewer observations has larger test error, so CV_(k) overestimates the test error of the model fit to all n, by more as k shrinks; the 20.37 average of LOOCV against 20.38 mean test MSE on slide 20 is the nearly unbiased case
note: the chapter's **Computation** and **Bias** bullets, cut to a clause each; the nested numbers are inline R in the chapter ("about `r round(n_auto * 4 / 5)`" and so on), quoted from the frozen markdown. The slide is words only (a list), a re-layout of two bullets, not a table or figure the chapter has. Third to drop if time is short (the lines go into slide 22's `say:`).

## 22. Variance
tag: core
show: equation — `Var\left[\frac{1}{k}\sum_{\ell=1}^k\text{MSE}_\ell\right] = \frac{1}{k^2}\sum_{\ell=1}^k\sum_{\ell'=1}^k Cov\left[\text{MSE}_\ell, \text{MSE}_{\ell'}\right] = \tau^2\left(\rho + \frac{1-\rho}{k}\right)`
words: after the equation, an itemized list of two labels: "τ² — variance of each fold MSE", "ρ — correlation of each pair of fold MSEs"; then "Averaging more folds shrinks (1 − ρ)/k but not ρτ²"; then "Usual choice: k = 5 or 10"
reveal: on arrival: the equation; click 1: the two labels; click 2: "Averaging more folds shrinks (1 − ρ)/k but not ρτ²"; click 3: "Usual choice: k = 5 or 10"
say: CV_(k) is an average of k fold MSEs; if each has variance τ² and each pair has correlation ρ, the variance is τ²(ρ + (1 − ρ)/k); in LOOCV any two fits share n − 2 of their n − 1 observations, so their held-out errors are strongly correlated and averaging n of them reduces the variance less than the number n suggests; with larger k each fold MSE is also computed from fewer observations, raising τ²; which effect dominates depends on the method and the data; the simulation's standard deviations combine two sources, which 50 cars were drawn and the random partition; the partition alone is the cleaner comparison: for all 392 cars held fixed, 0.136 for 5-fold, 0.093 for 10-fold and none for LOOCV; for a quadratic fit to 50 cars 5-fold and 10-fold cross-validation had small bias and variance close to LOOCV's, and for a method without the least squares shortcut they need 5 or 10 fits rather than n: that combination is why k = 5 or 10 is the usual choice
note: the display is the chapter's, verbatim (it keeps the chapter's `Var` and `Cov` roman spelling and the square brackets, as the bracket convention asks); τ² is the chapter's per-fold variance, per `CONVENTIONS.md` and the chapter. The final line is the chapter's sentence "That combination is why k = 5 or 10 is the usual choice", cut to the choice itself; the 0.136 and 0.093 are inline R in the chapter. Objective 4's "justify" is this slide with slides 20 and 21.

## 23. Classification
tag: core
show: none (transition slide, title only)
words: none
say: so far the loss was squared error; for a classifier the loss is misclassification, and the flexibility setting is the number of neighbors K

---

# Classification

## 24. Credit card default data
tag: core
show: figure — default-figure (income against credit card balance for the training half, colored and shaped by default status)
words: an itemized list of four lines: "`ISLR2::Default`: training half, 5,000 customers", "176 defaulted (3.52%)", "Response variable: `default`", "Explanatory variables: `balance` and `income`"
say: the QDA and naive Bayes lecture classified credit card customers as defaulters or not from balance and income, fitting every classifier to a random half of the 10,000 customers and evaluating it on the other half; its KNN classifier used K = 71 neighbors, the smallest odd integer above the square root of n for the training half, a rule of thumb; the figure plots the same training half, recreated with the same seed; defaulters sit at high balances at every income, mixed among non-defaulters with similar balances; the classifier standardizes balance and income inside each fit (the chapter's `features` are these two columns), so the features KNN sees are the standardized values
note: the figure is the chapter's `default-figure`; the 5,000, 176, 3.52% and the 71 are inline R in the chapter, quoted from the frozen markdown. The chapter calls the two columns "features" at `knn-cv-function`; the deck says "explanatory variables" for the raw columns, per `CONVENTIONS.md` (a possible wording fix in the notes, flagged in the report). The data are the QDA lecture's training half, recreated with its seed, so they are not new.

## 25. Cross-validation error rate
tag: core
show: equation — `\text{Err}_\ell = \frac{1}{n_\ell}\sum_{i \in \mathcal{F}_\ell}\mathrm{I}\left(y_i \ne \widehat y_i^{(-\ell)}\right), \qquad \text{CV}_{(k)} = \sum_{\ell=1}^k\frac{n_\ell}{n}\,\text{Err}_\ell`
words: after the equation, an itemized list of two labels: "ŷ_i^(−ℓ) — class predicted by the classifier fit outside fold ℓ", "Err_ℓ — test error rate on fold ℓ"
reveal: on arrival: the equation; click 1: the two labels
say: cross-validation for a classifier replaces the squared error with a classification loss; the misclassification indicator gives the error rate; any loss can take the place of the indicator (log loss is parked); for KNN the classifier fit to the training folds includes the standardization of the features: their means and standard deviations are computed from the training folds, as they were from the training half in the QDA lecture
note: the display is the chapter's, verbatim, with `\widehat` for `\hat`. Second to drop if time is short (speak the formula over slide 26's figure). The chapter's log-loss display is parked.

## 26. Neighbor count
tag: core
show: figure — knn-cv-figure (training, 10-fold CV and test-half error rates against the flexibility 1/K on a log scale, for odd K from 1 to 201; vertical lines at K = 11 and the rule K = 71)
words: an itemized list of three lines: "10-fold CV: 4.72% at K = 1, minimum 2.82% at K = 11, 3.52% at K = 201", "Rule of thumb K = 71: 3.24%", "Test half: 2.74% at K = 11, smallest 2.60% at K = 9"
say: the training half was divided into 10 folds, and the 10-fold cross-validation error rate computed for every odd K from 1 to 201; the training error rate falls to 0.00% at K = 1, where every training customer is its own nearest neighbor; the cross-validation error rate is U-shaped instead; at K = 201 KNN classifies every customer as a non-defaulter and its error rate equals the proportion of defaulters; the test half, which the cross-validation never touched, gives the same shape; the test curve lies below the cross-validation curve at every value of K, in part because defaulters are rarer in the test half, 3.14% against 3.52%; objective 5 closes here: cross-validation chooses K as it chose the polynomial degree d
note: the figure is the chapter's `knn-cv-figure`; the numbers are inline R in the chapter, quoted from the frozen markdown. The training error rate (0.00% at K = 1) is in `say:` only. The deck says "K" for the neighbors and "k" for the folds, per `CONVENTIONS.md`.

## 27. Data-dependent steps
tag: core
show: none (transition slide, title only)
words: none
say: the chapter's last section; its data are simulated, because with no information in the explanatory variables the true test error rate of any classifier is known, so a cross-validation estimate can be checked against it

---

# Data-dependent steps

## 28. Noise feature screening
tag: core
show: figure — noise-figure (the two of 5,000 noise columns most correlated with the class, colored and shaped by class)
words: an itemized list of four lines: "Simulated: n = 50, two classes of 25", "5,000 explanatory variables unrelated to the class", "Screening: keep the 20 most correlated with the class", "True test error rate: 50%"
say: each simulated data set has n = 50 observations in two classes of 25 and 5,000 explanatory variables, all independent standard normal draws unrelated to the class, so the true test error rate of any classifier is 50%; a common first step with so many columns is screening: keep the 20 most correlated with the response, then fit a classifier (KNN with K = 5) to those, which are the features of the classifier; the figure plots the two with the largest absolute correlation with the class; the classes look partly separated, but among 5,000 columns unrelated to the class some are correlated with it in a sample of 50 by chance, and screening finds exactly those
note: the figure is the chapter's `noise-figure`; the numbers are inline R in the chapter, quoted from the frozen markdown. The chapter writes "5,000 features" for the simulated columns; the deck writes "explanatory variables" per `CONVENTIONS.md`, and says the 20 kept enter the model as features (flagged in the report as a wording difference).

## 29. Within-fold screening
tag: core
show: figure — screen-figure (histograms of the 10-fold cross-validation error rate over 200 simulated data sets, for "Screen once, then cross-validate" and "Screen inside each fold", dashed line at the true error rate 50%)
words: an itemized list of three lines: "Screen once, then cross-validate: 5.1%", "Screen inside each fold: 51.8%", "True test error rate: 50%"
say: across 200 simulated data sets, screening once and then cross-validating gives an average estimated error rate of 5.1%, against a true error rate of 50%; screening inside each fold gives 51.8%; the first approach selected the features using the responses of the very observations it later held out, so those observations were not new to the classifier; screening is part of the fit; so is every other step that uses the data to build a classifier or a regression; a cross-validation estimate is honest only if all of those steps are repeated, inside every fold, using only the training folds; the second estimate sits slightly above 50% (the reason, fixed class counts with folds that ignore the class, is in the chapter and parked)
note: the figure is the chapter's `screen-figure`; the numbers are inline R in the chapter, quoted from the frozen markdown. The chapter's `screen-cv` code (the `inside` argument) is not shown (parked).

## 30. Standardization and tuning
tag: core
show: none, a two-item list with a nested list
words: "Standardization: training-fold means and standard deviations only"; "Tuning: choosing K is itself data-dependent" with nested items "Smallest of 101 CV error rates: 2.82%" and "Test half, not used in choosing: 2.74% at K = 11"
say: the same rule covers every data-dependent step; knn_classify() computes the feature means and standard deviations from the training folds and applies them to the held-out fold; standardizing the whole data set first lets the held-out observations influence the scale, the same kind of leak as screening; choosing K by cross-validation is itself a data-dependent step: the smallest of 101 cross-validation error rates, 2.82%, is the minimum of noisy estimates, so over repeated data sets it tends to fall below the test error rate of the classifier it chooses; an honest estimate of the error of "choose K by 10-fold cross-validation, then fit" needs data not used in the choosing, here the test half, where K = 11 has error rate 2.74%; on this one split that is below the cross-validation minimum, the opposite of the tendency, because the test curve lies below the cross-validation curve
note: the slide is the chapter's two bullets cut to a clause and a number each; a re-layout of its sentences, not a figure or table the chapter has. The 101, 2.82% and 2.74% are inline R in the chapter, quoted from the frozen markdown. First to drop after the optional slides.

## 31. Conclusion
tag: optional
show: none, a bulleted list
words: the concept names from the chapter's `## Conclusion`, no recap sentences, one per line: Training error; Resampling methods; Validation set approach; Leave-one-out cross-validation; Least squares shortcut and leverage; k-fold cross-validation; Fold count; Cross-validation error rate; Data-dependent steps
say: optional; the lecture may end on slide 30 with the next lecture's preview said aloud: Friday 2026-10-16, the bootstrap, which turns from estimating test error to estimating the variability of an estimate by resampling the observations with replacement to approximate a statistic's sampling distribution
note: the chapter's `## Conclusion` has no bare concept list, so the names above are the nouns its paragraphs use, as the earlier decks do; no restated numbers on this slide.

---

# Not in this deck

Cut from the lecture's core line, with their assets, so they can come back.

- **Held-out data** (the chapter's `### Held-out data`, three paragraphs, words
  only): the argument for resampling methods (a separate test set is rarely
  available; resampling estimates test error from the training data alone; three
  methods in increasing order of reuse). In slide 3's `say:`; it would come back
  as a words-only slide between Training MSE and the Validation set approach
  transition, with the three method names as a list.
- **Random split as its own slide:** the figure is on slide 5, beside the algorithm.
- **LOOCV loop code** (`loocv-loop` chunk): `loocv_mse()` with its `for (i in
  seq_len(nrow(data)))` loop. Would come back as an optional code slide after
  slide 10; slide 18's k-fold loop covers the same idea with k = n.
- **Loop versus shortcut table** (`loocv-table-display`, the chapter's one kable):
  columns Degree $d$, Loop (392 fits), Shortcut (1 fit) for degrees 1 to 10, the
  two columns equal to the digits shown (largest difference $3.0 \times
  10^{-12}$), and the counts 3,920 fits against 10 (in slide 13's `say:`). Would
  come back as an optional table slide after slide 13, copied verbatim from the
  frozen markdown.
- **Log loss** (the display replacing the indicator by $-\{y_i\log\widehat p +
  (1-y_i)\log[1-\widehat p]\}$, and the remark that a KNN vote share of 0 or 1
  makes it infinite): in slide 25's chapter text, not in the deck.
- **KNN code** (`knn-cv-function`, `knn-cv`): `knn_classify()` with the training-fold
  standardization and `knn_cv_error()`. Not shown; the standardization point is
  on slide 30.
- **Screening code** (`screen-cv`): `screen_cv_error()`, with `inside = FALSE` or
  `TRUE`. Not shown; the contrast is on slide 29.
- **Why screening inside each fold sits slightly above 50%:** 51.8% for random
  folds, 50.1% for stratified folds and 49.9% for independent class labels, each
  with a standard error of at most 0.33 percentage points; the explanation (a
  held-out fold with more of one class leaves the training folds with fewer of it)
  is in the chapter, text only, mentioned in slide 29's `say:`.
- **The extreme 2-fold estimates:** 3 of the 2,000 samples exceed five times the
  mean test MSE, the largest 984.29, and the 7.61 without them; in slide 20's
  `say:` only.
- **Beyond this course (never used):** the one-standard-error rule, repeated and
  stratified $k$-fold cross-validation, and nested cross-validation (the callout
  at the end of the Data-dependent steps section).

---

# Reference: assets used by this deck

- **Figures (PNG in `_freeze/05-resampling/10-cross-validation/figure-html/`, each
  with a `-1.png` suffix):** auto-data-figure (1), auto-degree1-figure,
  auto-degree2-figure, auto-degree10-figure (the three tabs of slide 2),
  train-mse-figure (3), validation-split-figure (5), one-split-figure,
  all-splits-figure, val-choice-figure (the three tabs of slide 6),
  learning-curve-figure (7), held-out-d2-figure, held-out-d10-figure (the two tabs
  of slide 9), loocv-curve-figure (14), auto-folds-figure (16),
  resample-val-figure, resample-5fold-figure, resample-10fold-figure (the three
  tabs of slide 19), k-simulation-figure (20), default-figure (24),
  knn-cv-figure (26), noise-figure (28), screen-figure (29). All 22 of the chunk
  figures in the freeze directory are used; none is parked.
- **Tables (kable, copied from the frozen markdown):** none used. The chapter's
  one kable, `loocv-table-display`, is parked.
- **Console output (frozen markdown):** none; the chapter prints no console
  output. Slide 18 shows a chunk's source as a plain code block, nothing printed.
- **Equations:** the polynomial regression display (2); the validation set MSE
  (5); $\text{CV}_{(n)}$ (10); the hat matrix and leverage, the $z$ vector, the
  Step 1 sum-of-squares identity and the closing $\widehat\beta^{(-i)}$ display (11);
  the Step 2 chain, the Step 3 $(1 - h_i)\widehat f^{(-i)}$ line and the held-out
  error display (12); the shortcut $\text{CV}_{(n)}$ (13); $\text{MSE}_\ell$ and
  $\text{CV}_{(k)}$ (17); the variance of the average of $k$ fold MSEs (22); the
  error rate $\text{Err}_\ell$ and $\text{CV}_{(k)}$ for a classifier (25). Every
  equation that mentions `\hat` is written with `\widehat` in the deck.
- **Numbers quoted from inline R in the frozen markdown (never retyped or
  recomputed):** 392 cars (1, 5, 9, 10); training MSE 23.94, 18.98, 18.01 (3); 196
  cars in each half (5); 14.50 to 24.71, median span 1.87, 2 of 100 curves off the
  plot, degree 7 wins 36 of 100 (6); 24.07, 19.39, 20.05, 19.23, 5,778 (7); the
  car and 230 horsepower, 391 (9); leverage 0.0936 and 0.9018, residuals 1.228 and
  1.168, held-out errors 1.35 and 11.90 (13); 3,920 fits against 10 (13, speaker
  notes); LOOCV 24.23, 19.25, 18.83 at degree 7, 0.42, 19.49 (14); fold sizes 39
  and 40 (16); 10-fold 24.29, 19.28, 19.19 at degree 7 (18); partition SDs 1.70,
  0.136, 0.093 and degrees 2, 6, 7 (19); simulation 20.38, 23.08, 20.86, 20.55,
  20.37, 2.70 (0.52), 0.49 (0.14), 23.06, 5.35, 5.15, 5.01, 3 samples, 984.29, 7.61
  (20, 22); 196, 314, 353, 391 (21); 5,000 customers, 176, 3.52%, 71 (24); 4.72%,
  2.82% at K = 11, 3.52% at K = 201, 3.24%, 2.74%, 2.60% at K = 9, 3.14% (26);
  50 observations, 5,000 columns, 25 per class, 20 kept; 5.1%, 51.8%,
  50.1%, 49.9%, 50%, 0.33 (29); 101, 2.82%, 2.74% (30).
- **Chunk names to confirm at build time:** the freeze directory's `figure-html/`
  holds the 22 PNGs listed above (each with a `-1.png` suffix); the notes' tab
  names are "Degree 1 / + Degree 2 / + Degree 10" (slide 2), "One split / 100 splits
  / Chosen degree" (slide 6), "Degree 2 / Degree 10" (slide 9) and "Validation set
  / 5-fold / 10-fold" (slide 19); `result.markdown` has the `loocv-table-display`
  table block (parked) and no `cell-output-stdout` or `cell-output-stderr` blocks.
  The chunk `kfold-function` (slide 18's code) is in the chapter source.

Not available to slides: anything inside a `### For example,` or
`### Beyond this course` callout (here, the one-standard-error rule, repeated and
stratified $k$-fold, and nested cross-validation callout at the end of the
Data-dependent steps section; the chapter has no `### For example,` callout).
