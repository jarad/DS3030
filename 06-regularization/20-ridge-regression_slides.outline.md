# Slide outline: Ridge Regression

(drafted 2026-10-17, revised 2026-10-17 after the chapter was revised and re-rendered)

Outline for `20-ridge-regression_slides.qmd` (Wed 2026-10-21, one 50-minute
period, MWF 1:10-2:00; ISLR2 6.2.1, the second lecture of Chapter 6). **This file
is the spec; the deck is built from it, and this file describes the deck as it
stands.** Edit it freely: reorder, cut, reword, change `tag:`, add notes. When it
says what you want, ask for the deck to be refreshed and `slides-author` will
implement exactly these slides.

Drafted 2026-10-17 against `20-ridge-regression.qmd`, which is **not yet
committed**, so the deck's `derived-from` comment records `uncommitted` in place
of a hash; replace it with the chapter's short hash (`git log -1 --format=%h --
06-regularization/20-ridge-regression.qmd`) once the chapter is committed. The
frozen output `_freeze/06-regularization/20-ridge-regression/execute-results/html.json`
is current: its recorded `hash` (it changes with every re-render) equals the md5
of the chapter file as it stands, which includes the "Slides for this lecture"
link on the line after `# Ridge Regression` (inserted when this outline was
drafted, followed by a re-render of the chapter).

**Where this deck sits in the period.** The whole 50-minute period is this deck.
It is sized for that: 26 slides including the title, four transitions and the
closing slide, of which 19 core slides (the agenda, 17 content slides and the
closing slide) come to about 38 minutes at the estimates below, and 2 optional
slides come to about 3.5 more, leaving the rest of the period as a buffer for
questions and for the tabs the instructor wants to dwell on.

The chapter's `##` sections are Delivery times, Ridge regression, Bias-variance
tradeoff, Tuning parameter selection, Ridge coefficients and Conclusion. It is
about 1,100 lines, most of it collapsed code, with 13 figures, 1 kable table and
no console output (no chunk prints text; the chapter's inline R carries the
numbers), on one running example (`modeldata::deliveries`, 10,012 delivery orders
from one restaurant, of which 100 are the training orders). **The deck spends
slides on a subset of it.** The core line is: the data, the features and the
least squares fit whose test MSE is more than twice its training MSE (Delivery
times); the item counts that show some features rest on one or two orders, the
penalized criterion with the unpenalized intercept, the closed form with its two
limits, the figure showing that the penalty needs standardized features and the
coefficient path (Ridge regression); the spread of ridge predictions over
repeated training samples, the squared bias, variance and MSE of those
predictions and the same curves for $n = 100$ and $n = 300$ (Bias-variance
tradeoff); the cross-validation curve for $\lambda$, the test evaluation table
and the repeated-sample result that shows the test gain is a favorable draw
(Tuning parameter selection); and the figure comparing ridge with least squares
coefficients and how to read them (Ridge coefficients). The deck does **not**
cover the derivation of the mean and variance of the ridge estimate (only its
result is an optional slide), the orthogonal-case aside, the check that
`glmnet()`'s $\lambda$ matches this chapter's (only the conversion is an
optional slide), the day-coefficient discussion beyond one line, the two
`### Beyond this course` callouts and the closing hand-off to the lasso; those
are parked under "Not in this deck" below. Mapped onto the chapter's six
learning objectives:

1. the ridge criterion, the role of $\lambda$, the unpenalized intercept and the
   limits $\lambda \to 0$ and $\lambda \to \infty$: slides 7 and 8;
2. the closed form of the estimate, and its mean and variance showing that it
   trades bias for variance: slide 8 (the closed form and its limits), slide 10
   (optional: the mean and the variance; the derivation is parked);
3. why the features must be standardized, although least squares needs no
   standardization, and why the standardization is repeated inside every
   cross-validation fold: slide 11 (the figure; the fold rule is in its `say:`);
4. how the squared bias, the variance and the test MSE of the predictions, over
   repeated training samples, change with $\lambda$, and why shrinkage helps more
   when the training sample is small: slides 14, 15, 16;
5. choosing $\lambda$ by cross-validation, refitting to all the training data,
   evaluating once on the test data and comparing with least squares, and that
   the test gain is a favorable draw: slides 18, 19, 20;
6. interpreting ridge coefficients as shrunken but not zero, and why the
   standard errors and $p$-values of `lm()` do not apply: slides 22, 23.

Optional: glmnet scaling (slide 9) and Shrinkage (10); the extra tabs of Data (2)
and Prediction spread (14) are the next to go. Item counts (6) is core but third
in the drop order. If time is short, drop in this order: Shrinkage (10; say that
the ridge estimate is biased toward zero and has smaller variance than least
squares over Closed form), glmnet scaling (9; say that `glmnet()`'s `lambda`
differs from this chapter's by a factor $n/s_y$), Item counts (6; say the single
order that determines `item_20` over Penalized criterion), then the extra tabs of
Data (leave it on Distance, hour, items) and of Prediction spread (show the first
and last tabs). Four transition slides (5, 13, 17, 21), no live widget, no code
slide and no console slide.

**The favorable draw.** The chapter says plainly that ridge regression's 7.5% lower
test MSE (slide 19) is the gain on this one training sample and that "this
training sample is a favorable draw": over 500 samples of 100 orders the whole
procedure (cross-validation, then a refit) beats least squares in 72% of them (and loses in 28%), by
3.7% on average, and over samples of 300 orders it wins in 44% (loses in 56%) and
loses 0.2% on average. The deck keeps the 7.5% out of every slide's words (it is the table's
last column and the first line of slide 19's `say:`) and puts the repeated-sample
numbers on their own slide (20, Favorable draw) straight after the table, so the
test gain is never shown without its qualification.

Nothing here is new content. Every `show:` points at something that already
exists in `20-ridge-regression.qmd`, so the deck distills the notes and never
invents. If a slide needs something the chapter doesn't have, flag it with
`needs:` and it goes back through `notes-author` and `proof-reader` first. No
slide in this outline needs one. Five slides lay out the chapter's own words in a
form the chapter does not have (1's list, 3's list, 20's two lines, 23's list and
24's takeaways); each is marked with a `note:`. The chapter shows its Data
subsection (the question, the data and the tabs) as one block; slide 1 lays out
its prose and slide 2 shows its tabs.

**Response variable and explanatory variables.** For `modeldata::deliveries`
(slide 1, a words-only slide that precedes the data figures) the response
variable is `time_to_delivery`, in minutes; the explanatory variables are `hour`
(a decimal hour on a 24-hour clock), `day`, `distance` (miles) and the 27 item
counts `item_01`, ..., `item_27`. The $p = 35$ **features** (slide 3) are `hour`,
`distance`, the 27 item counts and 6 day dummies, with Monday the reference
level. The deck uses "explanatory variables" for the raw columns and "features"
for the columns that enter the model, per `CONVENTIONS.md`.

**Symbols,** per `CONVENTIONS.md` and the chapter: $n = 100$ the number of
training orders and $p = 35$ the number of features; $\tilde x_{ij}$ the
standardized features and $\tilde{\mathbf{X}}$ their matrix; $\lambda$ the tuning
parameter; $\widehat\beta^R_\lambda$ the ridge estimate;
$\widehat f^{(m)}_\lambda(x_i)$ the prediction of evaluation order $i$ from
sample $m$ and $f^*(x_i)$ the least squares fit to the evaluation orders. The
equations are copied from the chapter's source with `\widehat` for `\hat`; where
the chapter writes `\hat\beta^R_\lambda` the slide writes `\widehat\beta^R_\lambda`.

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
agenda, a symbol legend, a words-only data slide).

Slides never draw from a `### For example,` or `### Beyond this course`
callout.

Equations use the bracket convention (`E[\cdot]` and `Var[\cdot]` always square,
other nested groupings cycling `()`, `[]`, `{}`) and `\widehat` for `\hat`.

**Timing:** 26 slides including the title slide (slides 0 to 24 plus the title
slide): 4 transitions (no time), 19 `core` slides (the agenda, 17 content slides
and the closing slide) and 2 `optional`. The estimates, in minutes: 0 (0.5),
1 (1.5), 2 (2), 3 (1), 4 (2), 6 (1), 7 (2.5), 8 (2), 11 (2.5), 12 (2.5), 14 (3),
15 (3), 16 (3), 18 (2.5), 19 (2), 20 (2), 22 (2), 23 (2.5), 24 (0.5), about 38
minutes of core slides; the optional slides add 9 (1) and 10 (2.5), about 3.5
minutes, so the whole deck is about 41.5 minutes with about 8.5 minutes of
buffer in the period. The slowest are the three slides that make the
bias-variance argument: Prediction spread (14, three tabs), Squared bias and
variance (15, the definitions and the decomposition) and Training sample size
(16, two tabs). If the lecture is running behind, the drop order above frees
about 6 minutes.

---

## 0. Today
tag: core
show: none, a nested bulleted list
words: agenda as a nested outline: Delivery times, with Data, Features and Least squares nested beneath it; Ridge regression, with Item counts, Penalized criterion, Closed form, Standardization and Coefficient path nested beneath it; Bias-variance tradeoff, with Prediction spread, Squared bias and variance and Training sample size nested beneath it; Tuning parameter selection, with Cross-validation, Test evaluation and Favorable draw nested beneath it; Ridge coefficients, with Coefficient comparison and Interpretation nested beneath it
say: distilled from the chapter's six learning objectives and the slides this deck spends time on: the ridge criterion, the tuning parameter and the unpenalized intercept; the closed form of the estimate; standardization of the features, repeated inside every cross-validation fold; the squared bias, variance and test MSE of ridge predictions over repeated training samples, and why shrinkage helps more when the training sample is small; choosing lambda by cross-validation on the training data and evaluating once on the test data; interpreting shrunken coefficients; the derivation of the mean and variance of the ridge estimate (optional slide), the glmnet conversion of lambda (optional slide), the orthogonal-case aside, the glmnet check of the conversion, the day-coefficient discussion, the Beyond this course callouts and the chapter's hand-off to the lasso are in the notes and not in the agenda; one running example, the delivery times of orders from one restaurant, and the question is how long a new order will take when only 100 orders have been recorded; Delivery times covers the data, the features and the least squares fit, with no transition slide of its own; the other four parts each have one; the timing note in the speaker notes: if time is short drop in this order Shrinkage, glmnet scaling, Item counts, the extra tabs of Data and of Prediction spread
note: the notes chapter's learning objectives are the source; the chapter has no "Today" section. The DS3030 title slide carries the chapter title. Delivery times (the data, the features and the least squares fit) is one top-level item; it has no transition slide. Ridge regression, Bias-variance tradeoff, Tuning parameter selection and Ridge coefficients each have one (5, 13, 17, 21). The optional slides (glmnet scaling, Shrinkage) are not listed. Only what the deck spends slides on is listed. Layout: the list is set in two columns (Delivery times and Ridge regression on the left, the other three parts on the right), since 20 lines do not fit one column at the deck's font size. Prediction spread, Item counts, Coefficient comparison and Interpretation are slide titles that are not chapter headings (see their `note:`).

## 1. Delivery times
tag: core
show: none, a words-only data slide (a short itemized list)
words: "Question: how long will a food delivery order take?"; "Response variable: `time_to_delivery`, in minutes"; "Explanatory variables: `hour`, `day`, `distance`, `item_01`, ..., `item_27`"; then "Training orders: 100, a small random sample"; "Test orders: 9,912, every other order"
reveal: on arrival: the question, the response variable and the explanatory variables; click 1: the training orders and test orders lines
say: the question is how long a delivery will take, from the time the order is placed until it arrives; the data are modeldata::deliveries, 10,012 orders from one restaurant; the response is time_to_delivery in minutes; the explanatory variables are the hour the order was placed (a decimal hour on a 24-hour clock), the day of the week, the delivery distance in miles, and 27 columns item_01, item_02, ... that count how many of each menu item the order contains; the test orders are split off first, before any plotting or fitting; the training data are a small random sample of orders; every other order is test data; the training sample size was chosen to be small relative to the 36 coefficients of the model, so that they are poorly determined; the bias-variance section also shows what happens with 300 training orders; the next lecture, on the lasso, uses the same split and the same folds
note: the chapter's `**Question.**` and `**Data.**` paragraphs under `### Data`, laid out as a list (a re-layout, not new content). The 10,012, 27, 100, 9,912 and 36 are inline R in the chapter, quoted from the frozen markdown; the 10,012 and 36 are in `say:` only. Words-only, so the response variable and the explanatory variables may be listed on the slide; the data figures that follow carry no list. The title is the chapter's `## Delivery times`, since the slide is the question and the data before any figure.

## 2. Data
tag: core
show: tabset — the chapter's two-tab data figures with its own tab names, full width: "Distance, hour, items" (numeric-figure), "Day" (day-figure)
words: none
say: the tabs plot the delivery time of the 100 training orders against distance, hour and the total number of items in the order, and against the day; delivery time rises with distance and with the hour of the order: steeply from 11:00 to about 13:30 and more slowly after, so a straight line in hour is only an approximation; it rises less clearly with the number of items; the median delivery time is shortest on Monday and Tuesday (20.2 and 20.7 minutes), between 25.0 and 25.3 minutes on Wednesday, Thursday and Sunday, and longest on Friday and Saturday (28.7 and 31.4), but only 4 of the training orders were placed on a Monday and 6 on a Tuesday; the item counts are nearly uncorrelated with each other: over the 351 pairs of items, the median absolute correlation in the training orders is 0.07, and 97% of the pairs are below 0.2 in absolute value; if time is short, leave the tabset on Distance, hour, items
note: the chapter's own two-tab set (`#### Distance, hour, items`, `#### Day`) under `### Data`. The 20.2, 20.7, 25.0, 25.3, 28.7, 31.4, 4, 6, 351, 0.07 and 97% are inline R in the chapter, quoted from the frozen markdown, and are in `say:` only. The day figure shows individual points with a median bar, not a boxplot; nothing to flag. Third in the drop order of tabs (leave it on the first tab).

## 3. Features
tag: core
show: none, a words-only slide (a short itemized list)
words: "Features, $p = 35$: `hour`, `distance`, 27 item counts, 6 day dummies"; then "Reference level: Monday"
reveal: on arrival: the features line; click 1: the reference level line
say: hour, distance and the 27 item counts enter as features as recorded; day enters as 6 dummy variables with Monday as the reference level, so the model has p = 35 features; the model is y_i = beta_0 + sum_j beta_j x_ij + epsilon_i with epsilon_i independent N(0, sigma^2), where y_i is the delivery time of training order i = 1, ..., n with n = 100 and x_ij is the value of feature j for order i
note: the chapter's `### Features` sentence, laid out as two lines (a re-layout, not new content). The chapter's model equation and its symbol bullets are in `say:` and parked below (ridge needs only $p$ and $n$ on the slides). The 35, 27 and 6 are inline R in the chapter, quoted from the frozen markdown.

## 4. Least squares
tag: core
show: figure — ls-figure (delivery time against the least squares prediction for the 100 training orders and the 9,912 test orders, with the line delivery time = prediction), the figure alone
words: none
say: the figure plots the delivery time against the least squares prediction, for the 100 training orders the model was fit to and for the test orders; the line is delivery time equals prediction; the training orders sit closer to the line than the test orders; the training MSE is 10.13 and the test MSE 22.02, 2.17 times as large; the Subset Selection lecture showed that, for a correct linear model, the training RSS underestimates the error on new responses at the same feature values by 2(p + 1) sigma^2 on average; with E[RSS] = sigma^2 (n - p - 1), the fact behind the unbiased estimate sigma-hat^2 = RSS/(n - p - 1), the expected error on those new responses is sigma^2 (n + p + 1), a ratio of (n + p + 1)/(n - p - 1) = 2.12 here, close to the observed ratio, although the test orders have new feature values as well as new responses; with p + 1 = 36 coefficients estimated from 100 orders, the average variance of the fitted values, sigma^2 (p + 1)/n, is 36% of the error variance
note: the chapter's `ls-figure` under `### Least squares`, alone. The 10.13, 22.02, 2.17, 2.12 and 36% are inline R in the chapter, quoted from the frozen markdown, and are in `say:` only. This is the small-sample problem the deck opens with: least squares on 35 features from 100 orders fits the training orders much better than new ones.

---

# Ridge regression

## 5. Ridge regression
tag: core
show: none (transition slide, title only)
words: none
say: ridge regression keeps every feature but pulls the coefficients toward zero

## 6. Item counts
tag: core
show: figure — item-count-figure (the number of training orders containing each menu item), the figure alone
words: none
say: the figure counts how many of the 100 training orders contain each menu item; each item appears in between 1 and 20 of the training orders, a median of 11; item_20 appears in only one order, so its least squares coefficient is set almost entirely by how far that order's delivery time is from the prediction of the other features, its error epsilon_i included; ridge regression keeps every feature but pulls the coefficients toward zero
note: the chapter's `item-count-figure`, the data that opens `## Ridge regression`, alone. **The slide title is not a chapter heading** (the chapter has no heading for this figure); "Item counts" names what it plots. The 1, 20, 11 and `item_20` are inline R in the chapter, quoted from the frozen markdown, and are in `say:` only. The figure is tall (6 by 5.5 inches), so it is set at height 540. Core but third in the drop order (say the single order that determines `item_20` over Penalized criterion).

## 7. Penalized criterion
tag: core
show: equation — the chapter's criterion display, with a four-label symbol legend
words: after the display, an itemized list of four labels: "$\tilde x_{ij} = \left(x_{ij} - \bar x_j\right)/s_j$ — feature $j$ of order $i$, standardized", "$\lambda \ge 0$ — tuning parameter", "$\lambda\sum_{j=1}^p\beta_j^2$ — shrinkage penalty", "$\beta_0$ — intercept, not penalized"
reveal: on arrival: the display; click 1: the four labels
say: ridge regression estimates the coefficients by minimizing the display; the mean x-bar_j is the mean of feature j over the n training orders and s_j its standard deviation, computed with divisor n; the intercept beta_0 and the coefficients beta_1, ..., beta_p of the standardized features are on the standardized scale: each beta_j is the change in mean delivery time per standard deviation of its feature, and equals s_j times the coefficient of feature j on the original scale of the model; they keep this meaning through the Shrinkage slide; the RSS rewards coefficients that fit the training orders; the penalty charges lambda per unit of squared coefficient, so a coefficient grows only as far as the drop in RSS pays for it; the intercept is not penalized: it is the mean delivery time when every standardized feature is at its mean of zero, and penalizing it would pull every prediction toward zero minutes, an arbitrary point; without a penalty on beta_0, adding a constant to every y_i adds the same constant to the intercept and changes no slope
note: the display is the chapter's `### Penalized criterion` display, verbatim without its trailing comma; the four labels are the chapter's `where` bullets and its sentence "The intercept is not penalized", cut. The display is set at 0.75em and the legend at 0.6em, as on the subset selection deck's criteria slides.

## 8. Closed form
tag: core
show: equation — the chapter's two right-hand sides, one display, with a two-label legend and the two limits
words: the display $\widehat\beta_0 = \bar y, \qquad \widehat\beta^R_\lambda = \left(\tilde{\mathbf{X}}^\top\tilde{\mathbf{X}} + \lambda\mathbf{I}_p\right)^{-1}\tilde{\mathbf{X}}^\top\left(y - \bar y\mathbf{1}\right)$; then an itemized list of two labels: "$\tilde{\mathbf{X}}$ — standardized features, without a column of ones", "$\mathbf{I}_p$ — $p \times p$ identity matrix"; then two limits: "$\lambda = 0$: least squares", "$\lambda \to \infty$: $\widehat\beta^R_\lambda \to 0$, the null model"
reveal: on arrival: the display; click 1: the two labels; click 2: the two limits
say: setting the derivatives of the criterion to zero gives beta-hat_0 = y-bar and the ridge estimate; each column of X-tilde sums to zero, so the derivative with respect to beta_0 does not involve the slopes, and the criterion is a convex quadratic, so this is its minimum; for lambda greater than 0 the matrix X-tilde^T X-tilde + lambda I_p is invertible even when X-tilde^T X-tilde is not, so the ridge estimate is unique even when p is at least n; at lambda = 0 the ridge estimate is the least squares estimate on the standardized features, which gives the same predictions as least squares on the features as recorded; as lambda goes to infinity every slope goes to zero and every prediction is y-bar, the null model; here beta-hat_0 = y-bar is the standardized-scale intercept and the ridge estimate is the estimate of the standardized-scale coefficients; a coefficient on the original scale is the ridge estimate divided by s_j, and the original-scale intercept is y-bar minus the sum over j of x-bar_j times the ridge estimate_j over s_j; the chapter's ridge_fit() computes the closed form and returns the coefficients on the original scale
note: the display joins the right-hand sides of the chapter's two derivative displays of `### Closed form` (the arrows and derivative expressions are cut; the derivation is parked); the labels are the chapter's symbol definitions, cut, and the two limits are its two bullets, cut. The display is set at 0.75em, the legend at 0.6em and the limits at 0.8em. The `ridge_fit()` code is not shown.

## 9. glmnet scaling
tag: optional
show: equation — the chapter's `glmnet()` criterion and the conversion of $\lambda$, with a two-label legend
words: the display $\frac{1}{2n}RSS + \frac{\lambda_{\text{glmnet}}}{2}\sum_{j=1}^p\beta_j^2$, then the display $\lambda = \frac{n\,\lambda_{\text{glmnet}}}{s_y}$, then an itemized list of two labels: "$\lambda_{\text{glmnet}}$ — the value `glmnet()` calls `lambda`", "$s_y$ — standard deviation of $y$, divisor $n$"
reveal: on arrival: the criterion; click 1: the conversion; click 2: the two labels
say: glmnet::glmnet() with alpha = 0 fits ridge regression, but its documented criterion is the first display; multiplying that criterion by 2n gives RSS + n lambda_glmnet times the sum of squared coefficients; two more steps happen inside glmnet() for a numeric response: it divides y by its standard deviation s_y, fits, and multiplies the coefficients by s_y afterward (fitting y/s_y with penalty n lambda_glmnet gives the same criterion divided by s_y^2, so this step alone would give lambda = n lambda_glmnet), and it also divides the supplied lambda_glmnet by s_y before fitting y/s_y (for the lasso's absolute-value penalty this division exactly undoes the effect of dividing y by s_y; glmnet() applies it to the squared penalty too, where it does not); the net effect, checked numerically in the notes, is that lambda_glmnet corresponds to the lambda of this chapter's criterion by the second display; glmnet() standardizes the features itself, with divisor n, and reports coefficients on the original scale; from here on lambda is this chapter's, converted where glmnet() is used; optional: second in the drop order (say that glmnet's lambda differs from this chapter's by a factor n over s_y)
note: the two displays are the chapter's `### glmnet scaling` displays, verbatim; the two labels are the chapter's `where` clause, cut. The numerical check (`glmnet-check`, with its difference of the order of $10^{-13}$) is not shown and is parked. Both displays are set at 0.75em and the legend at 0.6em.

## 10. Shrinkage
tag: optional
show: equation — the chapter's display of the mean and variance of the ridge estimate, with a one-label legend
words: the display $E\left[\widehat\beta^R_\lambda\right] = \mathbf{W}_\lambda\tilde{\mathbf{X}}^\top\tilde{\mathbf{X}}\beta = \beta - \lambda\mathbf{W}_\lambda\beta, \qquad Var\left[\widehat\beta^R_\lambda\right] = \sigma^2\mathbf{W}_\lambda\tilde{\mathbf{X}}^\top\tilde{\mathbf{X}}\mathbf{W}_\lambda$, then "$\mathbf{W}_\lambda = \left(\tilde{\mathbf{X}}^\top\tilde{\mathbf{X}} + \lambda\mathbf{I}_p\right)^{-1}$"
reveal: on arrival: the display; click 1: the label
say: treat the features as fixed and suppose the linear model is correct, so the expected centered response is X-tilde beta and its variance is sigma^2 I_n; the bias, minus lambda W_lambda beta, is zero at lambda = 0 and grows with lambda; the variance is smaller than the least squares variance sigma^2 A^{-1}, where A = X-tilde^T X-tilde is assumed invertible; take any p-vector a and write v = W_lambda a, so that a = (A + lambda I_p) v; the linear combination a^T beta-hat^R has variance sigma^2 v^T A v, and the least squares a^T beta-hat has variance sigma^2 a^T A^{-1} a = sigma^2 (v^T A v + 2 lambda v^T v + lambda^2 v^T A^{-1} v); the last two terms are nonnegative for lambda at least 0: v^T v is a sum of squares, and with u = A^{-1} v, v^T A^{-1} v = u^T X-tilde^T X-tilde u is the sum of squares of X-tilde u; so every linear combination of the coefficients, every prediction included, has variance no larger under ridge regression than under least squares, and strictly smaller when lambda is above 0 and a is not zero; the derivation and the aside for uncorrelated features (the shrinkage factor n/(n + lambda), which approaches 1 as n grows, so ridge regression departs most from least squares when the training sample is small) are in the notes; optional: first in the drop order (say that the ridge estimate is biased toward zero and has smaller variance than least squares over Closed form)
note: the display is the chapter's `### Shrinkage` display, verbatim without its trailing period; the label is the chapter's definition of $\mathbf{W}_\lambda$. The $v = \mathbf{W}_\lambda a$ argument (the $v^\top v$ and $v^\top\mathbf{A}^{-1}v$ terms) is in `say:` and the orthogonal-case display is in `say:` by reference only; both are parked. The objective's wording is "derive its mean and variance to show that it trades bias for variance"; the derivation is parked and this slide shows its result. The display is set at 0.7em and the label at 0.6em.

## 11. Standardization
tag: core
show: figure — scale-figure (the distance coefficient against $\lambda$ for ridge with distance in miles, with distance in feet, and with standardized features, with the least squares coefficient as a grey line), the figure alone
words: none
say: least squares is scale equivariant: recording distance in feet instead of miles divides its coefficient by 5,280 and leaves every prediction unchanged; the figure fits ridge regression to the training orders with centered but unstandardized features, once with distance in miles and once in feet, and with standardized features; the grey line is the least squares coefficient; all three agree with least squares as lambda goes to 0; as lambda grows the coefficient in miles shrinks, to 0.30 minutes per mile at lambda = 1,000; the coefficient in feet is never shrunk: it rises to 3.18, above its least squares value of 2.79, as distance takes over part of the effect of the features that are shrunk; with standardized features the fit is the same in either unit (the two distance coefficients at lambda = 50 agree to within the tolerance of all.equal()); the ridge penalty is not scale equivariant: in feet, the same effect needs a coefficient 5,280 times smaller, whose square the penalty barely charges; without standardization the amount of shrinkage a feature receives depends on its units; the means and standard deviations are computed from the data the model is fit to, so standardization is a data-dependent step: as in the Cross-Validation lecture, it is repeated inside every fold from the training folds only; glmnet() standardizes whatever data it is given, so cv.glmnet() does this automatically
note: the chapter's `scale-figure` under `### Standardization`, alone. The 5,280, 0.30, 3.18, 2.79, 1,000 and 50 are inline R in the chapter, quoted from the frozen markdown, and are in `say:` only. The fold rule (the objective's "standardization is repeated inside every cross-validation fold") is in `say:` and in the closing slide.

## 12. Coefficient path
tag: core
show: figure — path-figure (each standardized coefficient against $\lambda$, grouped as distance, hour, the 6 day dummies and the 27 items), the figure alone
words: none
say: the figure plots each standardized coefficient of the ridge fit to the 100 training orders against lambda, from 0.01 to 1,000; at the left the coefficients are those of least squares; the largest are hour (4.5), daySat (3.2) and distance (2.8) minutes per standard deviation, and 31 of the 35 are within a minute of zero; as lambda grows the coefficients move toward zero smoothly, and none reaches it: at lambda = 1,000 the hour coefficient is still 0.43; the length of the vector of standardized coefficients falls at every step of the grid, from 6.89 to 0.66, but a single coefficient need not: 20 of the 35 move away from zero somewhere along the path, and 8 change sign, among them 3 of the 6 day dummies; the dummy variables of one categorical explanatory variable are correlated, since an order placed on one day was placed on no other, and the penalty shrinks them together
note: the chapter's `path-figure` under `### Coefficient path`, alone. The 0.01, 1,000, 4.5, 3.2, 2.8, 31, 35, 0.43, 6.89, 0.66, 20, 8 and 3 are inline R in the chapter, quoted from the frozen markdown, and are in `say:` only.

---

# Bias-variance tradeoff

## 13. Bias-variance tradeoff
tag: core
show: none (transition slide, title only)
words: none
say: what shrinkage does to predictions, over repeated training samples; the test orders were divided into a pool and 4,000 evaluation orders; samples of 100 orders were drawn repeatedly from the pool, ridge regression was fit to each, and each fit predicted the evaluation orders; this demonstration chooses nothing: the delivery model is chosen and fit from the training orders alone

## 14. Prediction spread
tag: core
show: tabset — the chapter's three-tab spread figures with its own tab names, full width: "$\lambda = 0$" (spread-ls-figure), "$\lambda = 15.8$" (spread-mid-figure), "$\lambda = 1{,}000$" (spread-large-figure)
words: none
say: each violin shows one evaluation order's predictions over the 500 samples of 100 pool orders, and the cross marks its fitted value from least squares fit to the evaluation orders themselves; with lambda = 0, least squares, each order's predictions are centered near its cross but spread over several minutes; at lambda = 15.8 they spread less and are pulled slightly toward the mean; at lambda = 1,000 they spread least, but they are pulled toward the mean delivery time, above the cross for the quick orders and below it for the slow ones; if time is short, show the first and last tabs
note: the chapter's own three-tab set (`#### $\lambda = 0$`, `#### $\lambda = 15.8$`, `#### $\lambda = 1{,}000$`) under `## Bias-variance tradeoff`, which the chapter shows before its `### Squared bias and variance` subsection. **The slide title is not a chapter heading** (the section itself is slide 13's transition); "Prediction spread" names what the violins show. The three figures are violin plots with quartile lines and the median; no boxplot to flag. The 500, 100, 15.8 and 1,000 are inline R in the chapter, quoted from the frozen markdown, and are in `say:` only. No fragments. If time is short, show the first and last tabs.

## 15. Squared bias and variance
tag: core
show: equation — the chapter's three displays (the average prediction and the variance; the squared bias and the MSE; the decomposition), with a three-line symbol legend
words: the display $\bar f_\lambda(x_i) = \frac{1}{M}\sum_{m=1}^M\widehat f^{(m)}_\lambda(x_i), \qquad \text{Variance}(\lambda) = \frac{1}{|\mathcal{E}|}\sum_{i \in \mathcal{E}}\frac{1}{M}\sum_{m=1}^M\left[\widehat f^{(m)}_\lambda(x_i) - \bar f_\lambda(x_i)\right]^2$; then the display $\text{Bias}^2(\lambda) = \frac{1}{|\mathcal{E}|}\sum_{i \in \mathcal{E}}\left[\bar f_\lambda(x_i) - f^*(x_i)\right]^2, \qquad \text{MSE}(\lambda) = \frac{1}{|\mathcal{E}|}\sum_{i \in \mathcal{E}}\frac{1}{M}\sum_{m=1}^M\left[y_i - \widehat f^{(m)}_\lambda(x_i)\right]^2$; then the display $\text{MSE}(\lambda) = \text{MSE}^* + \text{Bias}^2(\lambda) + \text{Variance}(\lambda)$; then an itemized list of three labels: "$\widehat f^{(m)}_\lambda(x_i)$ — ridge prediction of order $i$ from sample $m$", "$\mathcal{E}$ — evaluation orders; $f^*(x_i)$ — least squares fit to them", "$\text{MSE}^*$ — does not depend on $\lambda$"
reveal: on arrival: the average prediction and variance display; click 1: the squared bias and MSE display; click 2: the decomposition; click 3: the three labels
say: index the evaluation orders by i in E (4,000 of them) and the samples by m = 1, ..., M, where M = 500 is the number of repeated training samples, each of n of the 5,912 pool orders; the bar-f_lambda(x_i) is the average prediction of order i; the f*(x_i) is the fitted value of order i from least squares fit to the evaluation orders, the closest a linear function of these features comes to their delivery times; it explains R^2 = 71% of their variability, and it is itself estimated, from 4,000 orders, so even least squares has a small squared bias; Variance measures how much a prediction depends on which orders were sampled, and Bias^2 how far the average prediction is from f*; both are estimates from M samples; the bias is measured against the best linear function of these features, not against the true mean delivery time, so error from a nonlinear effect of hour, for example, is in neither term; expanding the square in MSE around the average prediction, the cross term sums to zero over m; expanding again around f*, the cross term is zero because least squares residuals are orthogonal to every linear function of the features; so MSE = MSE* + Bias^2 + Variance, where MSE* = 13.71 does not depend on lambda; in the simulation the two sides differ by at most 1.2 x 10^-13, rounding error; if time is short, say the decomposition and skip the definitions
note: the three displays are the chapter's `### Squared bias and variance` displays, verbatim with `\widehat` for `\hat` and without trailing commas or the period; the three labels are the chapter's `where` bullets, cut (the first and third bullets' definitions of $M$, $y_i$ and $\bar f_\lambda$ are in `say:`). The expansion of the square and its orthogonality argument are in `say:` by reference only and parked. The 4,000, 500, 5,912, 71%, 13.71 and the $10^{-13}$ are inline R in the chapter, quoted from the frozen markdown, and are in `say:` only. The two definition displays are set at 0.55em, the decomposition at 0.75em and the legend at 0.5em so all four reveals fit one slide (checked in a 1280 by 720 render with every fragment visible).

## 16. Training sample size
tag: core
show: tabset — the chapter's two-tab figures with its own tab names, full width: "$n = 100$" (bv-100-figure), "$n = 300$" (bv-300-figure)
words: none
say: the tabs plot the test MSE minus MSE*, the squared bias and the variance against lambda for samples of 100 orders and of 300 orders; the dotted line marks the smallest test MSE; with n = 100, least squares has squared bias 0.30 and variance 8.57; as lambda grows the variance falls and the squared bias rises, slowly at first, so the test MSE falls to its minimum at lambda = 15.8: 21.24 against 22.58 for least squares, 5.9% lower; beyond the minimum the squared bias dominates and the test MSE climbs toward that of the null model; with n = 300 the variance of least squares is only 1.94, so there is little for shrinkage to remove before the squared bias from shrinking the large coefficients of hour, distance and the days outweighs it: the smallest test MSE, at lambda = 1.0, is less than 0.1% below that of least squares; how much shrinkage helps depends on the data and on the sample size, so lambda has to be chosen from the training data
note: the chapter's own two-tab set (`#### $n = 100$`, `#### $n = 300$`) under `### Training sample size`; no fragments. The 100, 300, 0.30, 8.57, 15.8, 21.24, 22.58, 5.9%, 1.94, 1.0 and 0.1% are inline R in the chapter, quoted from the frozen markdown, and are in `say:` only (the slide carries no label). The 5.9% is the gain of the best fixed $\lambda$, not of cross-validation (slide 20's `say:` distinguishes them).

---

# Tuning parameter selection

## 17. Tuning parameter selection
tag: core
show: none (transition slide, title only)
words: none
say: lambda is chosen like any tuning parameter: by k-fold cross-validation on the training data, then a refit to all the training data and one evaluation on the test data

## 18. Cross-validation
tag: core
show: figure — cv-figure (the 10-fold cross-validation estimate of the test MSE against $\lambda$, with grey bars of plus and minus one standard error, a dashed line for least squares and a dotted line at the smallest estimate), the figure alone
words: none
say: cv.glmnet() computes the 10-fold cross-validation estimate CV_(10)(lambda) for every lambda on a grid, with the folds drawn with the split; for each fold glmnet() standardizes and fits from the other 9 folds and predicts the held-out fold; the held-out folds are validation sets; the figure plots the estimate against lambda, with the estimate for least squares on the same folds as a dashed line; the grey bars are plus and minus one standard error over the folds; the estimate falls from 29.23 for least squares to its smallest value, 24.57, at lambda = 28.2 (lambda_glmnet = 2.071), and rises again beyond it, above the least squares estimate from lambda = 112 on; the estimated reduction, 15.9%, is small relative to its uncertainty: plus or minus one standard error is 19.62 to 29.52 at the minimum and 23.51 to 34.95 for least squares, intervals that overlap almost entirely; the curve is flat near its minimum: from lambda = 18 to 35 the estimate is within 1% of its smallest value; in 2 of the 10 folds some item appears in none of the training folds, and glmnet() gives it coefficient zero; the repeated samples of the previous section put the smallest average test MSE at lambda = 15.8; cross-validation sees only the 100 training orders and chooses a larger value; optional footnote of the chapter: the lambda axis is this chapter's lambda only approximately, because cv.glmnet() converts with the n and s_y of all 100 training orders but each fold is fit to 90 orders with their own s_y, so the lambda a fold applies is 0.87 to 0.95 times the plotted value; applying this chapter's lambda exactly in every fold gives a smallest estimate of 24.49 at lambda = 25.1; no conclusion changes
note: the chapter's `cv-figure` under `### Cross-validation`, alone. The 10, 29.23, 24.57, 28.2, 2.071, 112, 15.9%, 19.62, 29.52, 23.51, 34.95, 0.87, 0.95, 24.49, 25.1, 18, 35, 2 and 15.8 are inline R in the chapter, quoted from the frozen markdown, and are in `say:` only. The one-standard-error rule is in the chapter's `### Beyond this course` callout and is not used. The `cv.glmnet()` call is not shown.

## 19. Test evaluation
tag: core
show: table — test-table-display (kable: least squares and ridge, with the $\lambda$ used, the training MSE, the 10-fold CV estimate and the test MSE; copied from the frozen markdown), the table alone
words: none
say: cv.glmnet() also fits the whole path to all 100 training orders, so predicting with s = "lambda.min" uses the model refit to all the training data; the chosen model is evaluated once on test data, the 9,912 test orders, with least squares for comparison; the pool and evaluation orders of the bias-variance section were drawn from these test orders, but that demonstration chose nothing; ridge regression's test MSE is 20.38, against 22.02 for least squares, 7.5% lower; the paired difference in squared error over the test orders has mean 1.64 and standard error 0.18, so the improvement is not an accident of which orders are test orders; that standard error treats the two fitted models as fixed: it reflects only which orders are test orders, not which training orders were drawn; both cross-validation estimates are above the test MSE: each fit in cross-validation uses 90 orders, and with so few orders per feature the error falls quickly as orders are added; an estimate from 100 orders is also noisy; the reduction cross-validation estimated, 15.9%, is 2.1 times the 7.5% reduction on the test orders; the 7.5% is the gain on this one training sample; the next slide shows that this sample is a favorable draw, so do not quote the 7.5% as the gain to expect
note: the table is the chapter's `test-table-display` (the kable in `test-table`), copied verbatim from the frozen markdown, header `$\lambda$` kept; no caption on the chapter's table, none added. The 9,912, 20.38, 22.02, 7.5%, 1.64, 0.18, 90, 15.9% and 2.1 are inline R in the chapter, quoted from the frozen markdown, and are in `say:` only; the table's values are the chunk's own output. **Not overstated:** no slide's words state the 7.5%; the table shows the two test MSEs and slide 20 carries the qualification.

## 20. Favorable draw
tag: core
show: none, a short itemized list of two lines
words: two lines: "$n = 100$: ridge has the lower MSE in 72% of the samples and a higher one in 28%; its average MSE is 3.7% below least squares"; "$n = 300$: ridge has the lower MSE in 44% of the samples and a higher one in 56%; its average MSE is 0.2% above least squares"
say: this training sample is a favorable draw; over the 500 samples of 100 pool orders, the same procedure, lambda by 10-fold cross-validation and then a refit, has a lower MSE at the evaluation orders than least squares in 72% of the samples and a higher one in 28%; its average MSE is 3.7% below that of least squares, and the 7.5% gain on the test orders is 2.0 times as large; the median gain over the samples is 2.9%, 90% of the gains lie between -9.9% and 15.4%, and 25.6% of the samples gain at least as much as this one, which puts it at about the 74th percentile; the average gain is less than the 5.9% of the best fixed lambda, because cross-validation chooses lambda from noisy estimates; with samples of 300 orders, ridge regression has the lower MSE in only 44% of the samples and a higher one in 56%, and its average MSE is 0.2% above that of least squares; on these data, shrinkage helps modestly with 100 training orders and not at all with 300
note: **not a figure or table the chapter has**: the two lines are the chapter's own sentences of the paragraph beginning "This training sample is a favorable draw" under `### Test evaluation`, laid out as a list and cut (a re-layout, not new content). The title is the chapter's own phrase, since that subsection's heading is `### Test evaluation` (slide 19's). The 72%, 28%, 3.7%, 44%, 56% and 0.2% are inline R in the chapter, quoted from the frozen markdown, and are on the slide; the 500, 100, 300, 2.0, 2.9%, -9.9%, 15.4%, 25.6%, 74th and 5.9% are in `say:` only (the median gain, the 90% range and the percentile stay out of the slide, which stays two lines). This slide is what keeps the 7.5% of slide 19 from being read as the expected gain.

---

# Ridge coefficients

## 21. Ridge coefficients
tag: core
show: none (transition slide, title only)
words: none
say: the ridge coefficients of the delivery model, from the training orders and the lambda chosen by cross-validation, against those of least squares

## 22. Coefficient comparison
tag: core
show: figure — coef-compare-figure (the ridge and least squares coefficients of every feature, on the original scale), the figure alone
words: none
say: the figure compares the ridge coefficients, on the original scale, with the least squares coefficients, both fit to the 100 training orders; the next slide reads them in order
note: the chapter's `coef-compare-figure` under `## Ridge coefficients`, alone. **The slide title is not a chapter heading** (the chapter's heading is the section's `## Ridge coefficients`, slide 21's); "Coefficient comparison" names the figure. The figure is the tall one of the chapter (7.5 by 7.5 inches), set at height 540; no bullet lines under it.

## 23. Interpretation
tag: core
show: none, a short itemized list
words: five lines: "Intercept, original scale: $\widehat\beta_0 = -4.8$ minutes, for a Monday order at hour 0, distance 0, no items"; "Hour: 1.46 minutes per hour (least squares: 1.87)"; "Distance: 2.19 minutes per mile (least squares: 2.79)"; "Day: difference from an otherwise identical Monday order"; "Items: minutes per additional unit of the item"; then two lines: "No coefficient is zero: all 35 features are kept"; "`lm()` standard errors and $p$-values do not apply"
reveal: on arrival: the five coefficient lines; click 1: the two closing lines
say: read in order; intercept: on the original scale, beta-hat_0 = -4.8 minutes is the predicted time of a Monday order placed at hour 0, at distance 0, with no items, far outside the data; the standardized-scale intercept is y-bar = 26.7 minutes, the prediction at the feature means; it sets the level: a Monday order with no items at the training orders' mean hour, 16.2, and mean distance, 3.05 miles, has predicted time 25.6 minutes; hour and distance: each hour later in the day adds 1.46 minutes (least squares: 1.87), and each mile adds 2.19 minutes (least squares: 2.79), holding the other features fixed; day: each day coefficient is the predicted difference from an otherwise identical order on Monday, the reference; ridge regression lowers all 6 of them, by 2.4 to 3.7 minutes, which mostly moves Monday rather than the other days relative to each other: Saturday minus Tuesday is 7.5 minutes under least squares and 6.5 under ridge; lowering all the day coefficients by the same amount, and raising the intercept by it, changes only the predictions of Monday orders, so it shortens the coefficient vector at the cost of fitting just 4 training orders less well; Wed, Thu and Sun, slower than Monday under least squares, are faster under ridge regression, the sign changes of the coefficient path; comparisons with Monday are poorly determined by either method; items: each additional unit of an item changes the predicted time by its coefficient; the items that slow deliveries most are item_12, item_01 and item_03, at 2.23, 1.50 and 1.37 minutes per item; the item coefficient that changes most is that of item_20, in 1 training order: -4.62 minutes per item under least squares and -1.38 under ridge regression; the coefficients are shrunken as a whole: the vector of standardized coefficients has length 4.86, against 6.90 for least squares; none is zero; ridge regression keeps all 35 features; because the shrinkage makes every coefficient a biased estimate, the standard errors, t-statistics and p-values that lm() reports, which assume unbiased least squares estimates, do not apply, and glmnet() reports none
note: the chapter's bulleted list that follows `coef-compare-figure` (Intercept, Hour and distance, Day, Items), cut to labels with the chapter's numbers for the intercept, hour and distance, plus the two closing sentences of the section ("None is zero" and the `lm()` statement), laid out as a list (a re-layout, not new content). The intercept is read first, per `CONVENTIONS.md`. The -4.8, 1.46, 1.87, 2.19, 2.79 and 35 are inline R in the chapter, quoted from the frozen markdown, and are on the slide; the 26.7, 16.2, 3.05, 25.6, 2.4, 3.7, 7.5, 6.5, 4, 2.23, 1.50, 1.37, 1, -4.62, -1.38, 4.86 and 6.90 are in `say:` only. The intercept's slide label names its scale (the chapter writes "On the original scale" in the same place); the item_20 sentence and the length of the coefficient vector are the chapter's, which now places them in the Items bullet and after the list. The Reference level `### Beyond this course` bullet (the ridge fit depends on which day is the reference) is not used; the discussion of the day coefficients is in `say:` only.

## 24. Conclusion
tag: core
show: none, a flat bulleted list of six takeaways
words: six lines, in the order of the lecture: "Ridge penalizes the squared coefficients, not the intercept"; "Standardize the features, inside every fold"; "Ridge trades bias for variance; no coefficient reaches zero"; "The gain over least squares is largest for small training samples"; "Choose $\lambda$ by cross-validation, evaluate once on test data"; "Ridge can lose to least squares on a particular training sample"
say: ridge regression can lose to least squares on a particular training sample even where it wins on average; the next lecture, the lasso, replaces the squared penalty with lambda times the sum of the absolute values of the coefficients, which sets some coefficients exactly to zero, and compares the two on the same training and test orders; standard errors and p-values from lm() do not apply to ridge coefficients
note: the six takeaways are drawn from the chapter's `## Conclusion` paragraphs (the criterion and the unpenalized intercept; standardization repeated inside every fold; the bias-variance trade and "no coefficient reaches zero"; "the gain over least squares is largest when least squares has large variance, with few training observations per feature, and can vanish when it does not"; choosing $\lambda$ by cross-validation then one evaluation on test data; ridge "can lose to least squares on a particular training sample even where it wins on average"). A flat list with no nesting, no example numbers and no concept-name list; it does not mirror slide 0. The closed form, the `glmnet()` scale conversion and the `lm()` standard-errors statement are in the Conclusion but are not takeaways here (the last is in slide 23's closing line). Default font, one column, one line per item.

---

# Not in this deck

Cut from the lecture's core line, with their assets and original content, so
they can come back.

## Parked content

- **Model equation** (the chapter's `### Features` display
  $y_i = \beta_0 + \sum_{j=1}^p \beta_j x_{ij} + \epsilon_i$ with
  $\epsilon_i \stackrel{ind}{\sim} N\left(0, \sigma^2\right)$ and its four symbol
  bullets): it would come back as an optional equation slide after Features. Its
  content is in slide 3's `say:`.
- **Item correlations** (the chapter's closing sentence under `### Data`: the
  median absolute correlation 0.07 over the 351 pairs of items): in slide 2's
  `say:`.
- **Derivation of the closed form** (the chapter's two derivative displays under
  `### Closed form`, with $Q\left(\beta_0, \beta\right)$): the `derive` objective's
  content; only the result is on slide 8.
- **glmnet check** (the chunk `glmnet-check` and the sentence quoting the largest
  difference between the 36 coefficients): not shown; only the conversion is the
  optional slide 9.
- **Derivation of the mean and variance of the ridge estimate** (the argument
  under `### Shrinkage` with $v = \mathbf{W}_\lambda a$, $v^\top v$ and
  $v^\top\mathbf{A}^{-1}v$):
  only the result is on the optional slide 10; the argument is in its `say:`.
- **Orthogonal case** (the chapter's last paragraph under `### Shrinkage`:
  $\widehat\beta^R_{\lambda j} = \frac{n}{n + \lambda}\widehat\beta_j$, its mean
  squared error display and the $\lambda = p\sigma^2/\sum_j\beta_j^2$ that
  minimizes the sum): it would come back as an optional equation slide after
  Shrinkage (10); its conclusion (ridge departs most from least squares when the
  training sample is small) is in slide 10's `say:`.
- **Expansion of the squared error** (the cross-term argument under
  `### Squared bias and variance`): its result is the decomposition on slide 15;
  the argument is in slide 15's `say:`.
- **Day-coefficient discussion** (the chapter's `**Day.**` bullet beyond one
  line: ridge lowers all six day coefficients, mostly moving Monday, three change
  sign): in slide 23's `say:` only.
- **Chapter code callouts** (`### Code`) and the visible code chunks (`features`,
  `ridge-fit`, `glmnet-check`, `cv-ridge`, `test-evaluation`): not shown; the deck
  never shows a chunk's source.
- **`### Beyond this course` (never used):** the one-standard-error rule
  (`lambda.1se`, the callout under `### Cross-validation`), and the Bayesian
  interpretation, effective degrees of freedom and reference-level bullets (the
  callout at the end of `## Ridge coefficients`).

---

# Reference: assets used by this deck

- **Figures (PNG in `_freeze/06-regularization/20-ridge-regression/figure-html/`,
  each with a `-1.png` suffix):** numeric-figure, day-figure (the two tabs of
  slide 2), ls-figure (4), item-count-figure (6), scale-figure (11), path-figure
  (12), spread-ls-figure, spread-mid-figure, spread-large-figure (the three tabs
  of slide 14), bv-100-figure, bv-300-figure (the two tabs of slide 16),
  cv-figure (18), coef-compare-figure (22). That is all 13 of the 13 chunk
  figures in the freeze directory.
- **Tables (kable, copied from the frozen markdown):** `test-table-display` (slide
  19, the `test-table` kable). It is the chapter's only table.
- **Console output (frozen markdown):** none; the chapter prints no console
  output, and the deck has no code slide.
- **Equations on slides:** the ridge criterion (7); the intercept and the ridge
  estimate, the two right-hand sides of the derivative displays (8); the
  `glmnet()` criterion and the conversion $\lambda = n\lambda_{\text{glmnet}}/s_y$
  (9); the mean and variance of the ridge estimate (10); the average prediction,
  the variance, the squared bias, the MSE and its decomposition (15). **Parked:**
  the model display, the two derivative displays and $Q$, the positive
  semidefinite argument, the orthogonal-case displays and the expansion of the
  squared error. Every equation that mentions `\hat` is written with `\widehat`
  in the deck.
- **Numbers quoted from inline R in the frozen markdown (never retyped or
  recomputed). On slides:** 100 and 9,912 (1); $p = 35$, 27 and 6 (3); 72%, 3.7%,
  44% and 0.2% (20); $-4.8$, 1.46, 1.87, 2.19, 2.79 and 35 (23). The deck's
  `derived-from` comment records `uncommitted`. **In speaker notes only:**
  10,012, 4, 6, 351, 0.07, 97% (1, 2); 10.13, 22.02, 2.17, 2.12, 36% (4); 1, 20, 11
  (6); 5,280, 0.30, 3.18, 2.79, 50 (11); 0.01, 1,000, 4.5, 3.2, 2.8, 31, 0.43,
  6.89, 0.66, 20, 8, 3 (12); 500, 15.8 (14); 4,000, 5,912, 71%, 13.71 (15); 0.30,
  8.57, 21.24, 22.58, 5.9%, 1.94, 1.0 (16); 29.23, 24.57, 28.2, 2.071, 112, 18, 35,
  2 (18); 20.38, 7.5%, 1.64, 0.18, 90, 15.9%, 2.1 (19); 2.0, 2.9%, -9.9%, 15.4%, 25.6%, 74th (20); 26.7, $-4.62$, $-1.38$, 4.86,
  6.90 (23); 16.2, 3.05, 25.6, 2.4, 3.7, 7.5, 6.5, 4, 2.23, 1.50, 1.37 (23).
- **Chunk names to confirm at build time:** the freeze directory's `figure-html/`
  holds the 13 PNGs (each with a `-1.png` suffix), all 13 used; the notes' tab names
  are "Distance, hour, items / Day" (slide 2), "$\lambda = 0$ / $\lambda = 15.8$ /
  $\lambda = 1{,}000$" (14) and "$n = 100$ / $n = 300$" (16); `result.markdown` has one
  table block and no `cell-output-stdout` or `cell-output-stderr` blocks.

Not available to slides: anything inside a `### For example,` or
`### Beyond this course` callout (here, the one-standard-error rule callout under
Cross-validation and the Bayesian interpretation, effective degrees of freedom and
reference-level callout at the end of Ridge coefficients; the chapter has no
`### For example,` callout).
