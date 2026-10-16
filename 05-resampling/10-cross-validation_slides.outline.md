# Slide outline: Cross-Validation

Outline for `10-cross-validation_slides.qmd` (Wed 2026-10-14, one 50-minute
period, MWF 1:10-2:00). **This file is the spec; the deck is built from it, and
this file describes the deck as it stands.** Edit it freely: reorder, cut,
reword, change `tag:`, add notes. When it says what you want, ask for the deck
to be refreshed and `slides-author` will implement exactly these slides.

Drafted 2026-10-13 against `10-cross-validation.qmd` at `38bb479`
(`38bb4793e61eee541265cd5fccb0076b0b7278b3`), which is what the deck's
`derived-from` comment records. The deck was built from that draft and then
revised by the instructor on 2026-10-14; this file was brought in line with the
revised deck the same day. The frozen output
`_freeze/05-resampling/10-cross-validation/execute-results/html.json` is
current: its recorded `hash` (`4a36ecfbf83de097162b850a0a32c49d`) equals the md5
of the chapter file as it stands (the chapter's only uncommitted change is the
link line below). The chapter now has its "Slides for this lecture" link on the
line after `# Cross-Validation`.

The chapter's `##` sections are Test error estimation, Validation set approach,
Leave-one-out cross-validation, k-fold cross-validation, Classification,
Data-dependent steps and Conclusion. It is the densest chapter of the course so
far: 22 figures, one table, one three-step derivation, one variance formula and
a simulation study, all on one running example (`ISLR2::Auto`, then
`ISLR2::Default`), and it prints no console output at all. **The deck spends
slides on a subset of it.** The core line is: why training error cannot choose a
model's flexibility (polynomial fits of `mpg` on `horsepower`, the training MSE);
the validation set approach and its two weaknesses (the estimate varies from
split to split, and it overestimates because the fit uses only part of the
data); leave-one-out cross-validation (the held-out car, the estimate, the degree
it selects); $k$-fold cross-validation (the folds, the estimate, its stability
across random partitions, the fold-count trade-off in bias, variance and
computation, and the usual choice $k = 5$ or $10$); and cross-validation for a
classifier (the error rate, and the number of neighbors $K$ for KNN on
`ISLR2::Default`). The deck does **not** cover the least squares shortcut and the
leverage $h_i$, the loops that fit on all but one fold, or the data-dependent
steps (feature screening, standardization, tuning); those are in the notes only,
and their slides are parked under "Not in this deck" below. Mapped onto the
chapter's six learning objectives:

1. training error cannot choose flexibility; the two validation set weaknesses:
   slides 2, 5, 6;
2. LOOCV and $k$-fold estimates for test MSE and test error rate: slides 9, 13,
   20 (the loop that fits on all but one fold is notes only; its code slide is
   parked);
3. the least squares shortcut and the role of the leverage: notes only, no slide;
4. compare the three methods by bias, variance and computation; justify
   $k = 5$ or $10$: slides 6, 14, 15, 16, 17;
5. use cross-validation to choose a degree or $K$: slides 10, 21;
6. data-dependent steps repeated inside every fold: notes only, no slide.

Optional: the Conclusion slide (22). If time is still short, drop in this order:
Cross-validation error rate (20; say the formula over slide 21's figure),
Computation and bias (16; its two lines go into slide 17's `say:`), Partition
variability (14). Cut from the deck entirely and parked below: the chapter's
opening Held-out data prose, the horsepower scatterplot slide, the whole
least squares shortcut block (shortcut, derivation, leverage and held-out
error), the loop-versus-shortcut table, the k-fold and LOOCV loop code, the
Data-dependent steps section (transition, noise feature screening, within-fold
screening, standardization and tuning), the log-loss display, the extreme 2-fold
estimates, why screening inside each fold lands slightly above 50%, and every
`### Beyond this course` pointer. Four transition slides (3, 7, 11, 18), no live
widget, no code slide and no console slide: the chapter prints no console
output.

Nothing here is new content. Every `show:` points at something that already
exists in `10-cross-validation.qmd`, so the deck distills the notes and never
invents. If a slide needs something the chapter doesn't have, flag it with
`needs:` and it goes back through `notes-author` and `proof-reader` first. No
slide in this outline needs one; one slide lays out the chapter's own sentences
or numbers in a form the chapter does not have (16's list of two bullets); it is
marked with a `note:`.

**Response variable and explanatory variables.** The deck says what they are
every time a new dataset appears, in the speaker notes of the slide whose figure
shows the data. For `ISLR2::Auto` (slide 1, Polynomial fits) the response
variable is `mpg` and the one explanatory variable is `horsepower`; the
degree-$d$ polynomial then has $d$ features, the powers of horsepower (the one
label that says so is on the slide). For `ISLR2::Default` (slide 19) the response
variable is `default` and the explanatory variables are `balance` and `income`.
The simulated screening data (parked) have the class as the response variable
and 5,000 noise columns as explanatory variables; the 20 that screening keeps
are the features of the KNN classifier. The deck uses "explanatory variables"
for raw columns and "features" only for the columns that enter the model, per
`CONVENTIONS.md`.

**Symbols,** per `CONVENTIONS.md` and the chapter: lowercase $k$ is the number
of folds (and $\text{CV}_{(k)}$), indexed by $\ell$; uppercase $K$ is the number
of neighbors in KNN only (slides 19 to 21); $d$ is the polynomial degree;
$\tau^2$ and $\rho$ are the variance and pairwise correlation of the fold MSEs on
slide 17; $m$ is the training set size on slide 6 (speaker notes only); $n$ is
the number of observations; $\mathcal{V}$ and $\mathcal{F}_\ell$ are the
validation set and fold $\ell$. The leverage $h_i$ appears only in the parked
slides. Slide 13 says $k$ and $K$ are unrelated (a label on the slide, and aloud).
Every equation is copied from the chapter's source with `\widehat` for `\hat`.

## How to read an entry

```
## N. Slide title                       <- reuse the chapter's own heading when there is one
tag: core | optional                    <- optional = first to drop if time is short
show: <type> — <asset>                  <- what is on the slide (types below)
words: "a short label, 0-1 lines"       <- the only prose on the slide; omitted on figure and tabset slides
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
beside a figure. `words:` is the only prose on a slide and never uses a
middle-dot separator: several short claims are an itemized list (one idea per
bullet) or a table. **A figure or tabset slide carries the figure alone, full
width, and no `words:` line; the facts that were bullet lines go to the start of
`say:`.** The exceptions are slides where the list is itself the content (the
algorithm's steps, a symbol legend).

Slides never draw from a `### For example,` or `### Beyond this course`
callout.

Equations use the bracket convention (`E[\cdot]` and `Var[\cdot]` always square,
other nested groupings cycling `()`, `[]`, `{}`) and `\widehat` for `\hat`.

**Timing:** 23 slides (0 to 22): 4 transitions (no time), 18 `core` content
slides (slide 0 and 17 more) and 1 `optional`. At the estimates below the 18 core
slides come to about 34 minutes, which leaves about 16 minutes of a 50-minute
period for questions and for the Conclusion. The estimates, in minutes: 0 (1),
1 (2.5), 2 (1.5), 4 (2.5), 5 (3), 6 (2), 8 (2), 9 (1.5), 10 (1.5), 12 (1), 13
(2), 14 (2), 15 (2), 16 (1.5), 17 (2.5), 19 (1.5), 20 (1.5), 21 (2.5). The
slowest are Split variability (5), Polynomial fits and Validation set algorithm (1, 4), the Fold
count simulation (15 and 17 together) and Neighbor count (21). The optional
Conclusion adds about 1 minute. If the lecture is running behind at the start of
Classification (slide 18), the last section needs about 5.5 minutes (slides 19 to
21); the drop order above frees about 5 minutes across the lecture (slides 20,
16, 14).

---

## 0. Today
tag: core
show: none, a nested bulleted list
words: agenda as a nested outline: Training error; Estimating test error, with Validation set approach, Leave-one-out cross-validation (LOOCV) and k-fold cross-validation nested beneath it; Classification
say: distilled from the chapter's learning objectives and the slides the lecture spends time on: training error cannot choose a flexibility setting; the validation set approach, leave-one-out and k-fold cross-validation estimate test error; the same idea chooses the number of neighbors for a classifier; the least squares shortcut, the choice of the number of folds and the data-dependent steps are in the notes and not in the agenda; one running thread, how flexible a model should be, first for the polynomial degree d on the cars, then for the number of neighbors K on the credit card customers; the timing note in the speaker notes: the Conclusion is optional, and if time is short drop in this order Cross-validation error rate (say the formula over the Neighbor count figure), Computation and bias (its two lines go into Variance), Partition variability
note: the notes chapter's learning objectives are the source; the chapter has no "Today" section. The DS3030 title slide carries the chapter title. The nested items are the three methods, each with its own transition slide (3, 7, 11); Training error and Estimating test error have no transition slide of their own, and Classification has one (18). Only what the deck spends slides on is listed.

## 1. Polynomial fits
tag: core
show: tabset — the chapter's three-tab fits with its own tab names, full width: "Degree 1" (auto-degree1-figure), "+ Degree 2" (auto-degree2-figure), "+ Degree 10" (auto-degree10-figure)
words: none
say: data: ISLR2::Auto, 392 cars; the response variable is mpg, miles per gallon; the explanatory variable is horsepower; fuel efficiency falls as horsepower rises, steeply at first and then more slowly; the question for the lecture is how to choose among polynomial models of different degree without a separate test set; the model (not on the slide) is mpg_i = beta_0 + beta_1 horsepower_i + ... + beta_d horsepower_i^d + epsilon_i with epsilon_i independent N(0, sigma^2); the tabs add least squares fits of degree 1, 2 and 10 to the scatterplot; the straight line misses the curvature, underpredicting at both ends and overpredicting in the middle; the quadratic follows the curve; the degree-10 polynomial follows it too, with extra wiggles at both ends of the range of horsepower, where cars are few; the degree d is the flexibility setting to be chosen, kept as d throughout (K is the number of neighbors later); the features here are the powers of horsepower, so row i of the model matrix is (1, horsepower_i, ..., horsepower_i^d); `poly(horsepower, d)` fits the same model with an orthogonal basis
note: the tabset is the chapter's own "Degree 1 / + Degree 2 / + Degree 10" tabset, with no fragments; the two symbol labels (d is the degree, the features are its powers of horsepower) are speaker notes only. **The model formula and the Auto variable names are speaker notes only**: the deck no longer has the Horsepower and fuel efficiency slide (parked), so the dataset facts (the 392 is inline R in the chapter, "`r nrow(Auto)` cars") moved here. The title is new (the paragraph has no heading). The chapter's `$\beta_{d+1} = 0$` nesting argument for training MSE is in slide 2's `say:`.

## 2. Training MSE
tag: core
show: figure — train-mse-figure (training MSE against the degree d from 1 to 10), full width
words: none
say: the training MSE is the average squared error on the same 392 cars the model was fit to; it cannot rise as d increases, since the degree-d model is the degree-(d+1) model with the last coefficient set to zero, so least squares over the larger model can only match or lower the residual sum of squares; training error rewards flexibility whether or not the flexibility captures anything that will appear in new data; the regression lecture defined the test MSE on observations not used to fit; a large separate test set would make choosing d easy, fit each degree to the training data and keep the smallest test MSE, but a separate test set is rarely available, collecting one costs as much as the training data and setting part of the data aside leaves less to fit with; resampling methods estimate test error from the training data alone, by fitting to part of the data and measuring error on the part left out; this lecture develops three in increasing order of reuse: the validation set approach, leave-one-out cross-validation and k-fold cross-validation
note: the figure is the chapter's `train-mse-figure`; the three numbers are inline R in the chapter, quoted from the frozen markdown. The chapter's "Held-out data" subsection (its argument for resampling) is words only, so it is not a slide; its content is in this slide's `say:` (parked below). The two bullet lines (the three training MSEs and "Training error cannot choose d") are speaker notes only.

## 3. Validation set approach
tag: core
show: none (transition slide, title only)
words: none
say: the first of the three methods

---

# Validation set approach

## 4. Validation set algorithm
tag: core
show: figure and equation — validation-split-figure (the 392 cars split at random into a training half, blue circles, and a validation half, orange triangles; left, 48% width) with the algorithm's three steps beside it (right, 52% width), then the `\text{MSE}_{\mathcal{V}}` display below the steps: `\text{MSE}_{\mathcal{V}} = \frac{1}{n_{\mathcal{V}}}\sum_{i \in \mathcal{V}}\left[y_i - \widehat f(x_i)\right]^2`
words: an itemized list of three steps beside the figure: "Split the n observations at random into a training set and a validation set", "Fit the model to the training set", "Predict the validation set and average the squared errors"; after the equation, an itemized list of two labels: "V — validation set, n_V observations", "f̂ — fit to the training set only"
reveal: on arrival: the figure and the three steps; click 1: the MSE equation; click 2: the two labels
say: the figure shows the cars split at random into two halves of 196, a training set (blue circles) and a validation set (orange triangles); both halves cover the range of horsepower and either shows the same curved decline as the full data; every validation observation is new to f̂, so MSE_V estimates the test MSE; it is also used to choose among degrees, so the validation set is not untouched test data (training data fit the model, validation data estimate test error and choose among models, and test data are never used for either); MSE_V is computed for each degree d to compare them; K is not involved, the degree d is the only setting
note: the chapter opens the section with the split figure and then states the algorithm under "### Algorithm"; the slide, titled Validation set algorithm, merges them (figure beside the steps, equation on a click) to save a slide, and the chapter's `validation-mse` code is not shown. The 196 is inline R in the chapter ("`r nrow(Auto) / 2`"). The steps are the slide's content, so they stay as a list beside the figure.

## 5. Split variability
tag: core
show: tabset — three tabs with the chapter's own names, the tabset alone and full width: "One split" (one-split-figure), "100 splits" (all-splits-figure), "Chosen degree" (val-choice-figure)
say: the facts the tabs show: the quadratic's validation MSE ranges from 14.50 to 24.71 across splits; the best degree is 2 through 10; degree 7 wins 36 of 100 splits; the first tab is the validation MSE of the one split against the degree; the second adds the curves of all 100 random splits, grey, with the first in black; the third counts the degree with the smallest validation MSE in each split; every curve drops sharply from degree 1 to degree 2, so every split agrees that a quadratic beats a line; beyond that the splits disagree: the quadratic's validation MSE ranges from 14.50 to 24.71 across splits, while within a split the estimates for degrees 2 through 10 span a median of 1.87; 2 of the 100 curves leave the top of the plot at high degree, where a polynomial fit to half the cars extrapolates badly to a validation car outside their range of horsepower; the most common choice, degree 7, wins only 36 of 100 splits; this is the first weakness: the estimate, and the model it selects, depend on which observations land in which half
note: the chapter's own three-tab set, with the tab names as the chapter writes them (the second is "`r n_splits` splits", rendered "100 splits"); the numbers are inline R in the chapter, quoted from the frozen markdown. The slide's two-line list was removed; its facts are the first lines of `say:`. The lecture's first main visual (3 minutes).

## 6. Effect of training set size
tag: core
show: figure — learning-curve-figure (median validation MSE against the training set size m, for degree 2 and degree 7, a vertical line at half of the cars), the figure alone
say: degree 7: median validation MSE 24.07 at m = 60 and 19.39 at m = 196; the validation set approach overestimates the test error of the fit to all 392 cars; the second weakness is that each model is fit to only part of the data; to see what that costs, the cars were split at random into a training set of m cars and a validation set of the other n − m, for m from 60 to 360, 400 times at each m; because the validation cars are new to each fit, the typical validation MSE at a given m estimates the test MSE of a model fit to m cars; test MSE generally falls as the training set grows and falls more steeply for the more flexible model; the quadratic goes from 20.05 to 19.23 over the same range; the median is plotted because the mean is dominated by a few catastrophic extrapolations (the mean at m = 60 for degree 7 is 5,778); the model that will be used is fit to all 392 cars, so an estimate from fits to half of them estimates the error of a worse model; the validation set approach tends to overestimate the test error of the final fit, more so for flexible models and small n
note: retitled from "Smaller training sets" to "Effect of training set size". The numbers are inline R in the chapter, quoted from the frozen markdown. The 360 and 400 are inline R (`max(train_sizes)`, `n_learning_reps`) in the chapter's text paragraph. The slide's two-line list was removed; its facts are the first lines of `say:`.

## 7. Leave-one-out cross-validation
tag: core
show: none (transition slide, title only)
words: none
say: the validation set approach leaves out half the data; leave-one-out cross-validation leaves out one observation at a time

---

# Leave-one-out cross-validation

## 8. Held-out car
tag: core
show: tabset — two tabs with the chapter's own names, the tabset alone and full width: "Degree 2" (held-out-d2-figure), "Degree 10" (held-out-d10-figure)
say: the facts the tabs show: the black triangle is the car with the most horsepower, 230; the dashed curve is the fit to all 392 cars; the solid curve is the fit to the other 391; the held-out car is a Pontiac Grand Prix with 230 horsepower, the car with the largest horsepower; for the quadratic the two fits nearly coincide, and the held-out car is predicted about as well without it as with it; for degree 10 the fit to all cars bends to pass near the held-out car, and without it the curve swings far below; the squared error of the held-out prediction measures how well the model predicts a car it has not seen, which the residual from the fit to all cars does not
note: the chapter's own two-tab set, with its tab names; the opening paragraph's inline R (the car's name, 230, 392 and 391) is quoted from the frozen markdown at build time. The title is new (the figure opens the section with no subsection heading). The slide's three-line list was removed; its facts are the first lines of `say:`.

## 9. LOOCV estimate
tag: core
show: equation — `\text{CV}_{(n)} = \frac{1}{n}\sum_{i=1}^n\left[y_i - \widehat f^{(-i)}(x_i)\right]^2`
words: after the equation, an itemized list of two labels: "f̂^(−i) — fit to the n − 1 observations other than observation i", "f̂^(−i)(x_i) — its prediction for the held-out observation"; then "n fits per model"
reveal: on arrival: the equation; click 1: the two labels; click 2: "n fits per model"
say: leave-one-out cross-validation (LOOCV) repeats the held-out car for every observation; each fit uses n − 1 observations, nearly all of the data, and there is no random split: every observation is held out exactly once; written as a loop, LOOCV costs n fits per model, 392 for the cars
note: the display is the chapter's, with `\widehat` for `\hat`; the labels are its two bullets, shortened. The 392 in `say:` is inline R in the chapter (the `loocv-table` column header "Loop (392 fits)"). The LOOCV loop code is parked (see below).

## 10. Degree selection
tag: core
show: figure — loocv-curve-figure (the training MSE and the LOOCV estimate against the degree d), the figure alone
say: the facts the figure shows: LOOCV is 24.23 at d = 1, 19.25 at d = 2, with its minimum 18.83 at d = 7; the training MSE keeps falling while LOOCV at d = 10 is 19.49; the LOOCV estimate drops from 24.23 at degree 1 to 19.25 at degree 2 and then barely moves; its minimum, 18.83, is at degree 7, only 0.42 below the quadratic; unlike the training MSE it does not keep falling: at degree 10 it is 19.49, above its minimum, while the training MSE is at its lowest; the curve is nearly flat from degree 2 on, so LOOCV does not clearly separate degrees 2 through 10; objective 5 (use cross-validation to choose a flexibility setting) first appears here
note: the figure is the chapter's `loocv-curve-figure`; the numbers are inline R in the chapter, quoted from the frozen markdown. The slide's two-line list was removed; its facts are the first lines of `say:`.

## 11. k-fold cross-validation
tag: core
show: none (transition slide, title only)
words: none
say: leave-one-out is the extreme of one observation per fold; k-fold cross-validation uses k folds in between

---

# k-fold cross-validation

## 12. Folds
tag: core
show: figure — auto-folds-figure (ten panels, each marking one group of cars as black triangles and the rest as grey circles), the figure alone
say: the facts the figure shows: 10 folds of 39 or 40 cars; the black triangles are the held-out fold in each panel; the 392 cars are split at random into 10 groups of about equal size; every car appears as a triangle in exactly one panel, and each group is scattered across the whole range of horsepower; k is the number of folds; here k = 10
note: the figure is the chapter's `auto-folds-figure`; the sizes 39 and 40 are inline R in the chapter. The title is new (the figure opens the section with no subsection heading). The slide's two-line list was removed; its facts are the first lines of `say:`.

## 13. k-fold estimate
tag: core
show: equation — `\text{MSE}_\ell = \frac{1}{n_\ell}\sum_{i \in \mathcal{F}_\ell}\left[y_i - \widehat f^{(-\ell)}(x_i)\right]^2, \qquad \text{CV}_{(k)} = \sum_{\ell=1}^k \frac{n_\ell}{n}\,\text{MSE}_\ell`
words: after the equation, an itemized list of three labels: "k — number of folds (unrelated to K, the number of neighbors)", "F_ℓ — set of observations in fold ℓ, n_ℓ of them", "f̂^(−ℓ) — fit to the observations outside fold ℓ"; then "LOOCV is the special case k = n"
reveal: on arrival: the equation; click 1: the three labels; click 2: "LOOCV is the special case k = n"
say: k-fold cross-validation divides the observations at random into k folds of about equal size; for each fold ℓ it fits the model to the other k − 1 folds and computes the MSE on fold ℓ; CV_(k) is the average of the fold MSEs weighted by fold size, which is the plain average when every fold has n/k observations; every observation is held out exactly once and used for fitting k − 1 times; the symbol k, lowercase as in the name, is unrelated to K, the number of neighbors in KNN (and of classes in the generative classifier lectures), which returns in Classification (slide 18)
note: the display is the chapter's, verbatim; the labels are its bullets, cut. The chapter's "weighted by fold size" bullet is in `say:` only. The k-fold loop code slide is parked (see below).

## 14. Partition variability
tag: core
show: tabset — three tabs with the chapter's own names, the tabset alone and full width: "Validation set" (resample-val-figure), "5-fold" (resample-5fold-figure), "10-fold" (resample-10fold-figure)
say: the facts the tabs show: the standard deviation of the degree-2 estimate across partitions is 1.70 for the validation set, 0.136 for 5-fold and 0.093 for 10-fold; the tabs repeat the validation set curves of 100 random splits and add 100 random partitions into 5 folds and into 10 folds, each over the LOOCV curve (black, dashed); the band of curves narrows from tab to tab; the 5-fold and 10-fold curves hug the LOOCV curve, while the validation set curves scatter widely on both sides of it: every observation is held out once and the held-out errors are averaged over all n of them, so the estimate depends far less on which observations share a fold; the degree with the smallest estimate is still not fixed: across partitions 10-fold cross-validation chooses degree 2, 6 and 7, because the curves are nearly flat from degree 2 on
note: the chapter's own three-tab set; the numbers are inline R in the chapter, quoted from the frozen markdown. The tab names are the chapter's headings ("Validation set", "5-fold", "10-fold"). Third and last in the drop order if time is short. **Deck and outline disagree:** the deck's speaker notes call this "the fourth slide to drop"; the drop order (also in the deck's Today notes) has three items, so it is the third.

## 15. Fold count
tag: core
show: figure — k-simulation-figure (cross-validation estimates of test MSE for 2-fold, 5-fold, 10-fold and LOOCV, over 2,000 samples of 50 cars, quadratic fit; diamond = mean, dashed = mean test MSE), the figure alone
say: the facts the figure shows: 2,000 samples of 50 cars, quadratic fit; the mean test MSE of the fits is 20.38; the mean estimates are 23.08 (2-fold), 20.86 (5-fold), 20.55 (10-fold) and 20.37 (LOOCV); to see how k affects bias and variance, the 392 cars were treated as a population: each of 2,000 times a sample of 50 cars was drawn without replacement and a quadratic fit to it; the actual test MSE of that fit is its average squared error on the 342 cars not drawn; the figure compares the cross-validation estimates from the same 50 cars, with k equal to 2, 5, 10 and 50 (LOOCV), against it; 2-fold cross-validation, fitting to 25 cars, overestimates by 2.70, with a simulation standard error of 0.52; by k = 5 the overestimate is small, 0.49, with a simulation standard error of 0.14; the standard deviations of the estimates are 23.06, 5.35, 5.15 and 5.01, so 10-fold and LOOCV vary about equally; the 2-fold standard deviation is dominated by 3 of the 2,000 samples whose estimates exceed five times the mean test MSE (the largest is 984.29), where a quadratic fit to 25 cars extrapolates badly to a held-out car; without them it is 7.61; the figure's vertical axis is clipped, so those estimates are not shown; if time is short, say the bias and variance numbers over the figure
note: the figure is the chapter's `k-simulation-figure`; the numbers are inline R in the chapter, quoted from the frozen markdown. This is the empirical anchor for slides 16 and 17; the 50 is `n_sample` (not the `n` of the Auto data). Not in the drop order. The slide's three-line list was removed; its facts are the first lines of `say:`. **Deck and outline disagree:** the deck's speaker notes still end "say the bias and variance numbers over the figure and skip the list", but the list no longer exists on the slide; the outline drops "and skip the list".

## 16. Computation and bias
tag: core
show: none, an itemized list
words: three items, one per click: "Computation: k fits per model, LOOCV n fits"; "Bias: each fit uses n(k − 1)/k observations" with a nested list "196 cars at k = 2, about 314 at k = 5, about 353 at k = 10, 391 at LOOCV"; "Smaller k: more upward bias; LOOCV nearly unbiased"
reveal: on arrival: the computation line; click 1: the bias line and its nested list (four lines, one per fold count); click 2: the "Smaller k" line
say: for least squares the shortcut makes LOOCV cost one fit; for most other methods it is n fits, and k = 5 or 10 is a large saving; by the learning curve on Effect of training set size (slide 6), a model fit to fewer observations has larger test error, so CV_(k) overestimates the test error of the model fit to all n, by more as k shrinks; the 20.37 average of LOOCV against the 20.38 mean test MSE on Fold count (slide 15) is the nearly unbiased case; second in the drop order (its lines go into Variance)
note: the chapter's **Computation** and **Bias** bullets, cut to a clause each; the nested numbers are inline R in the chapter ("about `r round(n_auto * 4 / 5)`" and so on), quoted from the frozen markdown. The slide is words only (a list), a re-layout of two bullets, not a table or figure the chapter has. The shortcut is mentioned in `say:` only; the shortcut slides are parked. Second to drop if time is short (the lines go into slide 17's `say:`).

## 17. Variance
tag: core
show: equation — `Var\left[\frac{1}{k}\sum_{\ell=1}^k\text{MSE}_\ell\right] = \frac{1}{k^2}\sum_{\ell=1}^k\sum_{\ell'=1}^k Cov\left[\text{MSE}_\ell, \text{MSE}_{\ell'}\right] = \tau^2\left(\rho + \frac{1-\rho}{k}\right)`
words: after the equation, an itemized list of two labels: "τ² — variance of each fold MSE", "ρ — correlation of each pair of fold MSEs"; then "Averaging more folds shrinks (1 − ρ)/k but not ρτ²"; then "Usual choice: k = 5 or 10"
reveal: on arrival: the equation; click 1: the two labels; click 2: "Averaging more folds shrinks (1 − ρ)/k but not ρτ²"; click 3: "Usual choice: k = 5 or 10"
say: CV_(k) is an average of k fold MSEs; if each has variance τ² and each pair has correlation ρ, the variance is τ²(ρ + (1 − ρ)/k); in LOOCV any two fits share n − 2 of their n − 1 observations, so their held-out errors are strongly correlated and averaging n of them reduces the variance less than the number n suggests; with larger k each fold MSE is also computed from fewer observations, raising τ²; which effect dominates depends on the method and the data; the simulation's standard deviations combine two sources, which 50 cars were drawn and the random partition; the partition alone is the cleaner comparison: for all 392 cars held fixed, 0.136 for 5-fold, 0.093 for 10-fold and none for LOOCV; for a quadratic fit to 50 cars, 5-fold and 10-fold cross-validation had small bias and variance close to LOOCV's, and for a method without the least squares shortcut they need 5 or 10 fits rather than n: that combination is why k = 5 or 10 is the usual choice
note: the display is the chapter's, verbatim (it keeps the chapter's `Var` and `Cov` roman spelling and the square brackets, as the bracket convention asks); τ² is the chapter's per-fold variance, per `CONVENTIONS.md` and the chapter. The final line is the chapter's sentence "That combination is why k = 5 or 10 is the usual choice", cut to the choice itself; the 0.136 and 0.093 are inline R in the chapter. Objective 4's "justify" is this slide with slides 15 and 16.

## 18. Classification
tag: core
show: none (transition slide, title only)
words: none
say: so far the loss was squared error; for a classifier the loss is misclassification, and the flexibility setting is the number of neighbors K

---

# Classification

## 19. Credit card default data
tag: core
show: figure — default-figure (income against credit card balance for the training half, colored and shaped by default status), the figure alone
say: ISLR2::Default, the training half of 5,000 customers, 176 of whom defaulted (3.52%); the response variable is default; the explanatory variables are balance and income; the QDA and naive Bayes lecture classified credit card customers as defaulters or not from balance and income, fitting every classifier to a random half of the 10,000 customers and evaluating it on the other half; its KNN classifier used K = 71 neighbors, the smallest odd integer above the square root of n for the training half, a rule of thumb; the figure plots the same training half, recreated with the same seed; defaulters sit at high balances at every income, mixed among non-defaulters with similar balances; the classifier standardizes balance and income inside each fit, so the features KNN sees are the standardized values
note: the figure is the chapter's `default-figure`; the 5,000, 176, 3.52% and the 71 are inline R in the chapter, quoted from the frozen markdown. The chapter calls the two columns "features" at `knn-cv-function`; the deck says "explanatory variables" for the raw columns, per `CONVENTIONS.md` (a possible wording fix in the notes, flagged in the report). The data are the QDA lecture's training half, recreated with its seed, so they are not new. The slide's four-line list was removed; its facts are the first lines of `say:`.

## 20. Cross-validation error rate
tag: core
show: equation — `\text{Err}_\ell = \frac{1}{n_\ell}\sum_{i \in \mathcal{F}_\ell}\mathrm{I}\left(y_i \ne \widehat y_i^{(-\ell)}\right), \qquad \text{CV}_{(k)} = \sum_{\ell=1}^k\frac{n_\ell}{n}\,\text{Err}_\ell`
words: after the equation, an itemized list of two labels: "ŷ_i^(−ℓ) — class predicted by the classifier fit outside fold ℓ", "Err_ℓ — test error rate on fold ℓ"
reveal: on arrival: the equation; click 1: the two labels
say: first in the drop order (say the formula over the Neighbor count figure); cross-validation for a classifier replaces the squared error with a classification loss; the misclassification indicator gives the error rate; any loss can take the place of the indicator; for KNN the classifier fit to the training folds includes the standardization of the features: their means and standard deviations are computed from the training folds, as they were from the training half in the QDA lecture
note: the display is the chapter's, verbatim, with `\widehat` for `\hat`. First to drop if time is short (speak the formula over slide 21's figure). The chapter's log-loss display is parked.

## 21. Neighbor count
tag: core
show: figure — knn-cv-figure (training, 10-fold CV and test-half error rates against the flexibility 1/K on a log scale, for odd K from 1 to 201; vertical lines at K = 11 and the rule K = 71), the figure alone
say: the facts the figure shows: the 10-fold CV error rate is 4.72% at K = 1, with its minimum 2.82% at K = 11, and 3.52% at K = 201; the rule of thumb K = 71 gives 3.24%; on the test half, 2.74% at K = 11 and the smallest, 2.60%, at K = 9; the training half was divided into 10 folds, and the 10-fold cross-validation error rate computed for every odd K from 1 to 201; the training error rate falls to 0.00% at K = 1, where every training customer is its own nearest neighbor; the cross-validation error rate is U-shaped instead; at K = 201 KNN classifies every customer as a non-defaulter and its error rate equals the proportion of defaulters; the test half, which the cross-validation never touched, gives the same shape; its curve lies below the cross-validation curve at every value of K, in part because defaulters are rarer in the test half, 3.14% against 3.52%; objective 5 closes here: cross-validation chooses K as it chose the polynomial degree d
note: the figure is the chapter's `knn-cv-figure`; the numbers are inline R in the chapter, quoted from the frozen markdown. The deck says "K" for the neighbors and "k" for the folds, per `CONVENTIONS.md`. The slide's three-line list was removed; its facts are the first lines of `say:`.

## 22. Conclusion
tag: optional
show: none, a nested bulleted list that mirrors slide 0 item for item, with a takeaway phrase under each item
words: Training error, with "Always falls with flexibility, so it cannot choose a model"; Estimating test error, with Validation set approach ("Varies by split and overestimates the test error"), Leave-one-out cross-validation (LOOCV) ("Nearly unbiased, but needs n fits") and k-fold cross-validation ("Far less variable than one split; k = 5 or 10 is the usual choice") nested beneath it; Classification, with "Cross-validation chooses the number of neighbors K"
say: optional; the lecture may end on Neighbor count with the next lecture's preview said aloud: Friday 2026-10-16, cross-validation in practice: choosing among models on real data and the issues that choosing raises
note: the structure and order are slide 0's; each takeaway is a short phrase drawn from the chapter's `## Conclusion` paragraphs, with no restated example numbers (the deck's takeaways name no number except the usual choice k = 5 or 10, which is the chapter's own rule). The "Estimating test error" item has no takeaway of its own; its three methods carry them.

---

# Not in this deck

Cut from the lecture's core line, with their assets and original content, so
they can come back. The slides the instructor removed on 2026-10-14 are given as
the outline entries they were (slide numbers there were the old ones; links to
other slides use titles).

## Parked slides (removed 2026-10-14)

### Horsepower and fuel efficiency (was slide 1, core)
show: figure — auto-data-figure (mpg against horsepower for the cars, with the `ISLR2::Auto` title); then a short itemized list
words: an itemized list of three lines beside or below the figure: "`ISLR2::Auto`: 392 cars", "Response variable: `mpg`, miles per gallon", "Explanatory variable: `horsepower`"
say: how flexible should a regression of fuel efficiency on horsepower be; fuel efficiency falls as horsepower rises, steeply at first and then more slowly; the next lecture-long question is how to choose among polynomial models of different degree without a separate test set; the 392 is inline R in the chapter ("`r nrow(Auto)` cars")
note: the chapter's first subsection opens with a Question and a Data paragraph (words only) and the figure. Its facts (the response `mpg`, the explanatory variable `horsepower`, 392 cars) now live in Polynomial fits' `say:`; the figure auto-data-figure is no longer on any slide. Coming back means a figure-only slide before Polynomial fits, with the three lines in `say:`.

### Least squares shortcut (was slide 11, core)
show: equation — `\mathbf{H} = \mathbf{X}\left(\mathbf{X}^\top\mathbf{X}\right)^{-1}\mathbf{X}^\top, \qquad \widehat y_i = \sum_{j=1}^n h_{ij}\,y_j, \qquad h_i = h_{ii} = x_i\left(\mathbf{X}^\top\mathbf{X}\right)^{-1}x_i^\top`, then `z_j = y_j \text{ for } j \ne i, \quad z_i = x_i\widehat\beta^{(-i)}`, then `\sum_{j=1}^n\left(z_j - x_j\beta\right)^2 = \sum_{j \ne i}\left(y_j - x_j\beta\right)^2 + \left(x_i\widehat\beta^{(-i)} - x_i\beta\right)^2`, then `\widehat\beta^{(-i)} = \left(\mathbf{X}^\top\mathbf{X}\right)^{-1}\mathbf{X}^\top z`
words: after the first display, an itemized list of two labels: "H — hat matrix", "h_i — leverage, 0 ≤ h_i ≤ 1"; before the second display, "Step 1: a full-data fit that reproduces β̂^(−i)"; after the last display, "β̂^(−i) is the least squares estimate for response z"
reveal: on arrival: the hat matrix display; click 1: the two labels; click 2: "Step 1" line and the z display; click 3: the sum-of-squares display; click 4: the closing display and its line
say: for a model fit by least squares the n fits are unnecessary; write the least squares fit to all n observations as ŷ = Hy, with h_i the diagonal entry, the leverage of observation i, as in the flexibility lecture; assume X without row i still has full column rank so β̂^(−i) is unique; define a response vector z equal to y except entry i, replaced by the held-out prediction; the first sum on the right of the identity is minimized at β = β̂^(−i), by definition, and the second term is zero there, its smallest possible value, so β̂^(−i) minimizes the left side: it is the least squares estimate for response z with all n rows; Step 2 and Step 3 are on the next slide
note: derivation Step 1 of 3, verbatim from the chapter's source (with `\widehat` for `\hat`), split off from Steps 2 and 3 so neither slide stacks more than four displays. The chapter states Step 1 in prose with one display and the closing display inline; the slide wrote the closing display on its own line.

### Shortcut derivation (was slide 12, core)
show: equation — Step 2, `\widehat f^{(-i)}(x_i) = \sum_{j=1}^n h_{ij}\,z_j = \sum_{j=1}^n h_{ij}\,y_j - h_i\,y_i + h_i\,\widehat f^{(-i)}(x_i) = \widehat y_i - h_i\,y_i + h_i\,\widehat f^{(-i)}(x_i)`; then Step 3, `\left(1 - h_i\right)\widehat f^{(-i)}(x_i) = \widehat y_i - h_i y_i` and `y_i - \widehat f^{(-i)}(x_i) = \frac{y_i - \widehat y_i}{1 - h_i}`
words: before the first display, "Step 2: apply the hat matrix"; before the second, "Step 3: solve"
reveal: on arrival: the Step 2 line and display; click 1: the Step 3 line and its two displays
say: multiplying by x_i, x_i β̂^(−i) is entry i of Hz, and z differs from y only in entry i; collecting the f̂^(−i)(x_i) terms gives (1 − h_i) f̂^(−i)(x_i) = ŷ_i − h_i y_i; the full-rank assumption makes h_i < 1, so dividing by 1 − h_i gives the held-out error as the ordinary residual divided by 1 − h_i; this is the lecture's derivation (objective 3); squaring and averaging over i is the next slide
note: derivation Steps 2 and 3 of 3, from the chapter's three displays. `\hat f^{(-i)}` becomes `\widehat f^{(-i)}`. It was the slowest slide of the lecture (3 minutes).

### Leverage and held-out error (was slide 13, core)
show: equation — `\text{CV}_{(n)} = \frac{1}{n}\sum_{i=1}^n\left(\frac{y_i - \widehat y_i}{1 - h_i}\right)^2`, then a two-item nested list of the chapter's two numerical comparisons
words: after the equation, "Held-out error: the residual inflated by 1/(1 − h_i)"; then an itemized list: "Degree 2: h_i = 0.0936, residual 1.228, held-out error 1.35", "Degree 10: h_i = 0.9018, residual 1.168, held-out error 11.90 = 1.168/(1 − 0.9018)"
reveal: on arrival: the equation; click 1: the inflation line; click 2: the two-line list
say: squaring and averaging over i gives the shortcut; the held-out error is the ordinary residual inflated by 1/(1 − h_i); with h_i = 0 for every i this would be the training MSE; the inflation is small for a typical observation and large for a high-leverage one, whose fitted value the full-data fit pulls toward its own response; the held-out car has leverage 0.0936 under the quadratic and 0.9018 under degree 10, where the fit bends to pass near it, so its held-out error is 11.90 against a residual of only 1.168; the formula needs one fit, its residuals and `hatvalues()`; it holds for any model fit by least squares on fixed features (polynomials, interactions, step functions with fixed cut points) and does not hold for logistic regression or KNN, where LOOCV takes n fits; the loop and the shortcut agree to the digits shown for every degree, 3,920 least squares fits against 10 (the table is parked)
note: the formula is the chapter's final display; the labels and the two-line list are the chapter's paragraph on the held-out car, cut to numbers. The chapter has no table of these numbers, so the two lines were the chapter's prose numbers (inline R) laid out as a list, a re-layout and not a chapter table. The chapter's loop-versus-shortcut table `loocv-table-display` is parked (below).

### k-fold loop (was slide 18, optional)
show: code — the chapter's `kfold-function` chunk verbatim as a plain code block (the function `kfold_mse` and the line `kfold_10 <- map_dbl(degrees, kfold_mse, fold = fold_auto)`), then one line of words below it
words: "10-fold estimate: 24.29 at d = 1, 19.28 at d = 2, smallest 19.19 at d = 7"
say: optional; the loop fits the model on the rows outside fold ℓ and stores the squared errors on the rows in fold ℓ; `fold` is a vector giving each observation's fold; with k = n this is the leave-one-out loop (the LOOCV loop chunk is parked); the objective's "implement each as a loop that fits on all but one fold and predicts the held-out fold" is this slide; with the folds of the figure the 10-fold estimate is 24.29 at degree 1, 19.28 at degree 2 and smallest, 19.19, at degree 7
note: no fragments (code slide). `fit_degree()` and `degrees` are defined in earlier chunks (`fit-degree`, `auto-curves`) and are not shown; the printed numbers are inline R in the chapter. Optional because the equation on k-fold estimate and the figure on Folds already state the algorithm. Without it, no slide carries the objective's loop; the loop is in the notes only.

### Data-dependent steps (was slide 27, transition, core)
show: none (transition slide, title only)
words: none
say: the chapter's last section; its data are simulated, because with no information in the explanatory variables the true test error rate of any classifier is known, so a cross-validation estimate can be checked against it

### Noise feature screening (was slide 28, core)
show: figure — noise-figure (the two of 5,000 noise columns most correlated with the class, colored and shaped by class)
words: an itemized list of four lines: "Simulated: n = 50, two classes of 25", "5,000 explanatory variables unrelated to the class", "Screening: keep the 20 most correlated with the class", "True test error rate: 50%"
say: each simulated data set has n = 50 observations in two classes of 25 and 5,000 explanatory variables, all independent standard normal draws unrelated to the class, so the true test error rate of any classifier is 50%; a common first step with so many columns is screening: keep the 20 most correlated with the response, then fit a classifier (KNN with K = 5) to those, which are the features of the classifier; the figure plots the two with the largest absolute correlation with the class; the classes look partly separated, but among 5,000 columns unrelated to the class some are correlated with it in a sample of 50 by chance, and screening finds exactly those
note: the figure is the chapter's `noise-figure`; the numbers are inline R in the chapter. The chapter writes "5,000 features" for the simulated columns; the deck would write "explanatory variables" per `CONVENTIONS.md`, and say the 20 kept enter the model as features (a wording difference to flag). The figure is no longer on any slide.

### Within-fold screening (was slide 29, core)
show: figure — screen-figure (histograms of the 10-fold cross-validation error rate over 200 simulated data sets, for "Screen once, then cross-validate" and "Screen inside each fold", dashed line at the true error rate 50%)
words: an itemized list of three lines: "Screen once, then cross-validate: 5.1%", "Screen inside each fold: 51.8%", "True test error rate: 50%"
say: across 200 simulated data sets, screening once and then cross-validating gives an average estimated error rate of 5.1%, against a true error rate of 50%; screening inside each fold gives 51.8%; the first approach selected the features using the responses of the very observations it later held out, so those observations were not new to the classifier; screening is part of the fit; so is every other step that uses the data to build a classifier or a regression; a cross-validation estimate is honest only if all of those steps are repeated, inside every fold, using only the training folds; the second estimate sits slightly above 50% (the reason, fixed class counts with folds that ignore the class, is in the chapter and parked)
note: the figure is the chapter's `screen-figure`; the numbers are inline R in the chapter. The chapter's `screen-cv` code (the `inside` argument) was not shown. The figure is no longer on any slide.

### Standardization and tuning (was slide 30, core)
show: none, a two-item list with a nested list
words: "Standardization: training-fold means and standard deviations only"; "Tuning: choosing K is itself data-dependent" with nested items "Smallest of 101 CV error rates: 2.82%" and "Test half, not used in choosing: 2.74% at K = 11"
say: the same rule covers every data-dependent step; knn_classify() computes the feature means and standard deviations from the training folds and applies them to the held-out fold; standardizing the whole data set first lets the held-out observations influence the scale, the same kind of leak as screening; choosing K by cross-validation is itself a data-dependent step: the smallest of 101 cross-validation error rates, 2.82%, is the minimum of noisy estimates, so over repeated data sets it tends to fall below the test error rate of the classifier it chooses; an honest estimate of the error of "choose K by 10-fold cross-validation, then fit" needs data not used in the choosing, here the test half, where K = 11 has error rate 2.74%; on this one split that is below the cross-validation minimum, the opposite of the tendency, because the test curve lies below the cross-validation curve
note: the slide was the chapter's two bullets cut to a clause and a number each; a re-layout of its sentences, not a figure or table the chapter has. The 101, 2.82% and 2.74% are inline R in the chapter. The standardization point still appears in Cross-validation error rate's `say:` and Credit card default data's `say:`.

## Other parked content

- **Held-out data** (the chapter's `### Held-out data`, three paragraphs, words
  only): the argument for resampling methods (a separate test set is rarely
  available; resampling estimates test error from the training data alone; three
  methods in increasing order of reuse). In Training MSE's `say:`; it would come
  back as a words-only slide between Training MSE and the Validation set approach
  transition, with the three method names as a list.
- **Random split as its own slide:** the figure is on Validation set algorithm, beside the steps.
- **LOOCV loop code** (`loocv-loop` chunk): `loocv_mse()` with its `for (i in
  seq_len(nrow(data)))` loop. Would come back as an optional code slide after
  LOOCV estimate, ahead of the parked k-fold loop.
- **Loop versus shortcut table** (`loocv-table-display`, the chapter's one kable):
  columns Degree $d$, Loop (392 fits), Shortcut (1 fit) for degrees 1 to 10, the
  two columns equal to the digits shown (largest difference $3.0 \times
  10^{-12}$), and the counts 3,920 fits against 10 (in the parked Leverage and
  held-out error slide's `say:`). Would come back as an optional table slide after
  that slide, copied verbatim from the frozen markdown.
- **Log loss** (the display replacing the indicator by $-\{y_i\log\widehat p +
  (1-y_i)\log[1-\widehat p]\}$, and the remark that a KNN vote share of 0 or 1
  makes it infinite): in the chapter text for Cross-validation error rate, not in
  the deck.
- **KNN code** (`knn-cv-function`, `knn-cv`): `knn_classify()` with the training-fold
  standardization and `knn_cv_error()`. Not shown; the standardization point is
  in Cross-validation error rate's `say:` and the parked Standardization and
  tuning slide.
- **Screening code** (`screen-cv`): `screen_cv_error()`, with `inside = FALSE` or
  `TRUE`. Not shown; the contrast is in the parked Within-fold screening slide.
- **Why screening inside each fold sits slightly above 50%:** 51.8% for random
  folds, 50.1% for stratified folds and 49.9% for independent class labels, each
  with a standard error of at most 0.33 percentage points; the explanation (a
  held-out fold with more of one class leaves the training folds with fewer of it)
  is in the chapter, text only, mentioned in the parked Within-fold screening
  slide's `say:`.
- **The extreme 2-fold estimates:** 3 of the 2,000 samples exceed five times the
  mean test MSE, the largest 984.29, and the 7.61 without them; in Fold count's
  `say:` only.
- **Beyond this course (never used):** the one-standard-error rule, repeated and
  stratified $k$-fold cross-validation, and nested cross-validation (the callout
  at the end of the Data-dependent steps section).

---

# Reference: assets used by this deck

- **Figures (PNG in `_freeze/05-resampling/10-cross-validation/figure-html/`, each
  with a `-1.png` suffix):** auto-degree1-figure, auto-degree2-figure,
  auto-degree10-figure (the three tabs of slide 1), train-mse-figure (2),
  validation-split-figure (4), one-split-figure, all-splits-figure,
  val-choice-figure (the three tabs of slide 5), learning-curve-figure (6),
  held-out-d2-figure, held-out-d10-figure (the two tabs of slide 8),
  loocv-curve-figure (10), auto-folds-figure (12), resample-val-figure,
  resample-5fold-figure, resample-10fold-figure (the three tabs of slide 14),
  k-simulation-figure (15), default-figure (19), knn-cv-figure (21). That is 19
  of the 22 chunk figures in the freeze directory. **Not on any slide:**
  auto-data-figure (the parked Horsepower and fuel efficiency), noise-figure
  (parked Noise feature screening) and screen-figure (parked Within-fold
  screening).
- **Tables (kable, copied from the frozen markdown):** none used. The chapter's
  one kable, `loocv-table-display`, is parked.
- **Console output (frozen markdown):** none; the chapter prints no console
  output. The deck has no code slide either (the k-fold loop code slide is parked).
- **Equations on slides:** the validation set MSE (4); $\text{CV}_{(n)}$ (9);
  $\text{MSE}_\ell$ and $\text{CV}_{(k)}$ (13); the variance of the average of $k$
  fold MSEs (17); the error rate
  $\text{Err}_\ell$ and $\text{CV}_{(k)}$ for a classifier (20). **Only in
  speaker notes, as plain text:** the polynomial regression model (1). **Parked:**
  the hat matrix and leverage, the $z$ vector, the Step 1 sum-of-squares identity
  and the closing $\widehat\beta^{(-i)}$ display; the Step 2 chain, the Step 3
  $(1 - h_i)\widehat f^{(-i)}$ line and the held-out error display; the shortcut
  $\text{CV}_{(n)}$. Every equation that mentions `\hat` is written with `\widehat`
  in the deck.
- **Numbers quoted from inline R in the frozen markdown (never retyped or
  recomputed). On slides:** training MSE 23.94, 18.98, 18.01 (2); 196, 314, 353,
  391 (16). **In speaker notes only:** 392 cars and the car with 230 horsepower
  (1, 8); 391 (8); 196 cars in each half (4); 14.50 to 24.71, median span 1.87, 2
  of 100 curves off the plot, degree 7 wins 36 of 100 (5); 24.07, 19.39, 20.05,
  19.23, 5,778, the 360 and 400 (6); the 392 fits (9); LOOCV 24.23, 19.25, 18.83
  at degree 7, 0.42, 19.49 (10); fold sizes 39 and 40 (12); partition SDs 1.70,
  0.136, 0.093 and degrees 2, 6, 7 (14); simulation 20.38, 23.08, 20.86, 20.55,
  20.37, 2.70 (0.52), 0.49 (0.14), 23.06, 5.35, 5.15, 5.01, 3 samples, 984.29,
  7.61, 342 (15, 16, 17); 5,000 customers, 176, 3.52%, 71 (19); 4.72%, 2.82% at
  K = 11, 3.52% at K = 201, 3.24%, 2.74%, 2.60% at K = 9, 3.14%, 0.00% (21).
  **Parked:** leverage 0.0936 and 0.9018, residuals 1.228 and 1.168, held-out
  errors 1.35 and 11.90, 3,920 fits against 10; 10-fold 24.29, 19.28, 19.19 at
  degree 7; 50 observations, 5,000 columns, 25 per class, 20 kept; 5.1%, 51.8%,
  50.1%, 49.9%, 50%, 0.33; 101, 2.82%, 2.74%.
- **Chunk names to confirm at build time:** the freeze directory's `figure-html/`
  holds the 22 PNGs (each with a `-1.png` suffix), 19 of them used; the notes' tab
  names are "Degree 1 / + Degree 2 / + Degree 10" (slide 1), "One split / 100 splits
  / Chosen degree" (slide 5), "Degree 2 / Degree 10" (slide 8) and "Validation set
  / 5-fold / 10-fold" (slide 14); `result.markdown` has the `loocv-table-display`
  table block (parked) and no `cell-output-stdout` or `cell-output-stderr` blocks.

Not available to slides: anything inside a `### For example,` or
`### Beyond this course` callout (here, the one-standard-error rule, repeated and
stratified $k$-fold, and nested cross-validation callout at the end of the
Data-dependent steps section; the chapter has no `### For example,` callout).
