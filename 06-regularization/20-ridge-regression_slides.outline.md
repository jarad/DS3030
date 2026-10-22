# Slide outline: Ridge Regression

(drafted 2026-10-17, revised 2026-10-22 after the deck was taught and trimmed, and the chapter was revised and re-rendered)

Outline for `20-ridge-regression_slides.qmd` (Wed 2026-10-21, one 50-minute
period, MWF 1:10-2:00; ISLR2 6.2.1, the second lecture of Chapter 6). **This file
is the spec; the deck is built from it, and this file describes the deck as it
stands.** Edit it freely: reorder, cut, reword, change `tag:`, add notes. When it
says what you want, ask for the deck to be refreshed and `slides-author` will
implement exactly these slides.

The deck's `derived-from` comment records `2cc8a47`, the chapter commit it was
derived from; the chapter has since been revised and re-rendered (uncommitted
when this outline was revised, so the comment is refreshed after the commit).
The frozen output `_freeze/06-regularization/20-ridge-regression/execute-results/html.json`
is current: its recorded `hash` equals the md5 of the chapter file as it stands,
which includes the "Slides for this lecture" link on the line after
`# Ridge Regression`.

**Revision 2026-10-22.** After teaching the deck, the instructor trimmed it from
26 slides to 19 and aligned it with the revised chapter. Removed from the deck
(their content is parked under "Removed from the deck" below, so any can come
back): Shrinkage (the optional mean-and-variance slide), Standardization, Squared
bias and variance, Favorable draw, the Ridge coefficients transition,
Coefficient comparison and Interpretation. The Ridge coefficients part, with only
a transition and two slides, is gone entirely. Bias-variance tradeoff keeps its
transition and two content slides (Prediction spread, Training sample size), so
it stays a part of its own. Wording follows the chapter: `Coefficient path`
became `Estimate path`; "estimate", not "coefficient", for fitted values; the
repeated-samples vocabulary is "test orders at which every prediction is made"
(4,000, $\mathcal{T}$) and "remaining test orders" from which the repeated
training samples are drawn (5,912), never "evaluation orders" or "pool"; the
chapter's cross-validation figure no longer has standard-error bars (it draws the
curve, a dashed "Least squares, $\lambda = 0$" line and a labeled point at the
chosen $\lambda$).

**Where this deck sits in the period.** The whole 50-minute period is this deck.
It is sized for that: 19 slides including the title, three transitions and the
closing slide, of which 14 core slides (the agenda, 12 content slides and the
closing slide) come to about 37 minutes at the estimates below, and 1 optional
slide comes to about 1 more, so core plus optional come to about 38 minutes,
leaving the rest of the period as a buffer for questions and for the tabs the
instructor wants to dwell on.

The chapter's `##` sections are Delivery times, Ridge regression, Bias-variance
tradeoff, Tuning parameter selection, Ridge estimates and Conclusion. It is
about 1,600 lines, most of it collapsed code, with 13 figures, 1 kable table and
no console output (no chunk prints text; the chapter's inline R carries the
numbers), on one running example (`modeldata::deliveries`, 10,012 delivery orders
from one restaurant, of which 100 are the training orders). **The deck spends
slides on a subset of it.** The core line is: the data, the features and the
least squares fit whose test MSE is more than twice its training MSE (Delivery
times); the item counts that show some features rest on one or two orders, the
penalized criterion with the unpenalized intercept, the closed form with its two
limits and the estimate path (Ridge regression); the spread of ridge predictions
over repeated training samples and the squared bias, variance and their sum for
$n = 100$ and $n = 300$ (Bias-variance tradeoff); and the cross-validation curve
for $\lambda$ and the test evaluation table (Tuning parameter selection). The deck
does **not** cover the derivation of the mean and variance of the ridge estimate,
its result, the figure on why the features must be standardized, the definitions
of the squared bias and variance, the comparison of ridge with least squares
estimates and the closing hand-off to the lasso; those are parked under "Removed
from the deck" and "Not in this deck" below. Mapped onto the chapter's six
learning objectives:

1. the ridge criterion, the role of $\lambda$, the unpenalized intercept and the
   limits $\lambda \to 0$ and $\lambda \to \infty$: slides 7 and 8;
2. the closed form of the estimate: slide 8; the mean and variance of the ridge
   estimator (to show that it trades bias for variance) are not in the deck: removed slide Shrinkage;
3. why the features must be standardized and why the standardization is repeated
   inside every cross-validation fold: not in the deck (the penalized criterion
   shows the standardized features $\tilde x_{ij}$; the removed slide
   Standardization had the figure);
4. how the squared bias, the variance and the test MSE of the predictions, over
   repeated training samples, change with $\lambda$, and why shrinkage helps more
   when the training sample is small: slides 12 and 13 (the figures; the
   definitions are in the notes, removed slide Squared bias and variance);
5. choosing $\lambda$ by cross-validation, refitting to all the training data,
   evaluating once on the test data and comparing with least squares: slides 15
   and 16 (the qualification that the test gain is a favorable draw is in
   slide 16's `say:`);
6. interpreting ridge estimates as shrunken but not zero: slide 10 (the estimate
   path); the comparison with least squares estimates and the reading of the
   estimates are not in the deck (removed slides Coefficient comparison and
   Interpretation).

Optional: glmnet scaling (slide 9); the extra tabs of Data (2) and Prediction
spread (12) are the next to go. Item counts (6) is core but second in the drop
order. If time is short, drop in this order: glmnet scaling (9; say that
`glmnet()`'s `lambda` differs from this chapter's by a factor $n/s_y$), Item
counts (6; say the single order that determines `item_20` over Penalized
criterion), then the extra tabs of Data (leave it on Distance, hour, items) and
of Prediction spread (show the first and last tabs); the drop order frees about 5
minutes. Three transition slides (5, 11, 14), no live widget, no code slide and no
console slide.

**Counts by type** (19 slides including the title): 4 figure slides (Least
squares, Item counts, Estimate path, Cross-validation), 3 tabset slides (Data,
Prediction spread, Training sample size), 1 table slide (Test evaluation), 3
equation slides (Penalized criterion, Closed form, glmnet scaling), 2 words-only
slides (Delivery times, Features), the agenda and the closing slide, 3 transitions
and the title slide.

**The favorable draw.** The chapter says plainly that ridge regression's 7.5% lower
test MSE (slide 16) is the gain on this one training sample and that "this
training sample is a favorable draw". The slide that carried the repeated-sample
numbers (Favorable draw) was removed 2026-10-22; the qualification is now in
slide 16's `say:` (over 500 repeated training samples of 100 orders the whole
procedure beats least squares in 72% of them, by 3.7% on average, and over samples
of 300 orders it wins in 44% and loses 0.2% on average). The deck keeps the 7.5%
out of every slide's words: it is the table's last column and a number in slide
16's `say:`.

Nothing here is new content. Every `show:` points at something that already
exists in `20-ridge-regression.qmd`, so the deck distills the notes and never
invents. If a slide needs something the chapter doesn't have, flag it with
`needs:` and it goes back through `notes-author` and `proof-reader` first. No
slide in this outline needs one. Four slides lay out the chapter's own words in a
form the chapter does not have (1's list, 3's list, 17's takeaways and the
agenda); each is marked with a `note:`. The chapter shows its Data
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
parameter; $\widehat\beta^R_\lambda$ the ridge estimate. The equations are copied
from the chapter's source with `\widehat` for `\hat`; where the chapter writes
`\hat\beta^R_\lambda` the slide writes `\widehat\beta^R_\lambda`.

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

**Timing:** 19 slides including the title slide (slides 0 to 17 plus the title
slide): 3 transitions (no time), 14 `core` slides (the agenda, 12 content slides
and the closing slide) and 1 `optional`. The estimates, in minutes: 0 (0.5),
1 (2), 2 (3), 3 (1.5), 4 (3), 6 (1.5), 7 (3.5), 8 (3), 10 (3.5), 12 (4),
13 (4), 15 (3.5), 16 (3), 17 (1), about 37 minutes of core slides; the optional
slide adds 9 (1), so the whole deck is about 38 minutes with about 12 minutes of
buffer in the period. (These estimates are higher than the 2026-10-17 draft's,
which came to 38 minutes for 26 slides, after the deck was taught.) The slowest
are the two bias-variance slides, Prediction spread (12, three tabs) and Training
sample size (13, two tabs). If the lecture is running behind, the drop order
above frees about 5 minutes.

---

## 0. Today
tag: core
show: none, a nested bulleted list
words: agenda as a nested outline: Delivery times, with Data, Features and Least squares nested beneath it; Ridge regression, with Item counts, Penalized criterion, Closed form and Estimate path nested beneath it; Bias-variance tradeoff, with Prediction spread and Training sample size nested beneath it; Tuning parameter selection, with Cross-validation and Test evaluation nested beneath it
say: distilled from the chapter's six learning objectives and the slides this deck spends time on: the ridge criterion, the tuning parameter and the unpenalized intercept; the closed form of the estimate; the estimates moving smoothly toward zero without reaching it; the predictions of ridge regression over repeated training samples, and why shrinkage helps more when the training sample is small; choosing lambda by cross-validation on the training data and evaluating once on the test data; the mean and variance of the ridge estimator, why the features must be standardized (the scale figure), the squared bias and variance definitions and their decomposition, the repeated-sample comparison of the whole procedure with least squares, the comparison of the ridge and least squares estimates, the glmnet conversion of lambda (optional slide), the orthogonal-case aside, the glmnet check of the conversion, the Beyond this course callouts and the chapter's hand-off to the lasso are in the notes and not in the agenda; one running example, the delivery times of orders from one restaurant, and the question is how long a new order will take when only 100 orders have been recorded; Delivery times covers the data, the features and the least squares fit, with no transition slide of its own; the other three parts each have one; the timing note in the speaker notes: if time is short drop in this order glmnet scaling, Item counts, the extra tabs of Data and of Prediction spread
note: the notes chapter's learning objectives are the source; the chapter has no "Today" section. The DS3030 title slide carries the chapter title. Delivery times (the data, the features and the least squares fit) is one top-level item; it has no transition slide. Ridge regression, Bias-variance tradeoff and Tuning parameter selection each have one (5, 11, 14). The optional slide (glmnet scaling) is not listed. Only what the deck spends slides on is listed. Layout: the list is set in two columns (Delivery times and Ridge regression on the left, the other two parts on the right). Prediction spread and Item counts are slide titles that are not chapter headings (see their `note:`).

## 1. Delivery times
tag: core
show: none, a words-only data slide (a short itemized list)
words: "Question: how long will a food delivery order take?"; "Response variable: `time_to_delivery`, in minutes"; "Explanatory variables: `hour`, `day`, `distance`, `item_01`, ..., `item_27`"; then "Training orders: 100, a small random sample"; "Test orders: 9,912, every other order"
reveal: on arrival: the question, the response variable and the explanatory variables; click 1: the training orders and test orders lines
say: the question is how long a delivery will take, from the time the order is placed until it arrives; the data are modeldata::deliveries, 10,012 orders from one restaurant; the response is time_to_delivery in minutes; the explanatory variables are the hour the order was placed (a decimal hour on a 24-hour clock), the day of the week, the delivery distance in miles, and 27 columns item_01, item_02, ... that count how many of each menu item the order contains; the test orders are split off first, before any plotting or fitting; the training data are a small random sample of orders; every other order is test data; the training sample size was chosen to be small relative to the 36 coefficients of the model, so that their estimates are poorly determined; the bias-variance section also shows what happens with 300 training orders; the next lecture, on the lasso, uses the same split and the same folds
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
say: ridge regression keeps every feature but pulls the estimates toward zero

## 6. Item counts
tag: core
show: figure — item-count-figure (the number of training orders containing each menu item), the figure alone
words: none
say: the figure counts how many of the 100 training orders contain each menu item; each item appears in between 1 and 20 of the training orders, a median of 11; item_20 appears in only one order, so its least squares estimate is set almost entirely by how far that order's delivery time is from the prediction of the other features, its error epsilon_i included; ridge regression keeps every feature but pulls the estimates toward zero
note: the chapter's `item-count-figure`, the data that opens `## Ridge regression`, alone. **The slide title is not a chapter heading** (the chapter has no heading for this figure); "Item counts" names what it plots. The 1, 20, 11 and `item_20` are inline R in the chapter, quoted from the frozen markdown, and are in `say:` only. The figure is tall (6 by 5.5 inches), so it is set at height 540. Core but second in the drop order (say the single order that determines `item_20` over Penalized criterion).

## 7. Penalized criterion
tag: core
show: equation — the chapter's criterion display, with a four-label symbol legend
words: after the display, an itemized list of four labels: "$\tilde x_{ij} = \left(x_{ij} - \bar x_j\right)/s_j$ — feature $j$ of order $i$, standardized", "$\lambda \ge 0$ — tuning parameter", "$\lambda\sum_{j=1}^p\beta_j^2$ — shrinkage penalty", "$\beta_0$ — intercept, not penalized"
reveal: on arrival: the display; click 1: the four labels
say: ridge regression estimates the coefficients by minimizing the display; the mean x-bar_j is the mean of feature j over the n training orders and s_j its standard deviation, computed with divisor n; the intercept beta_0 and the coefficients beta_1, ..., beta_p of the standardized features are on the standardized scale: each beta_j is the change in mean delivery time per standard deviation of its feature, and equals s_j times the coefficient of feature j on the original scale of the model; the RSS rewards values of the coefficients that fit the training orders; the penalty charges lambda per unit of squared coefficient, so an estimate grows only as far as the drop in RSS pays for it; the intercept is not penalized: it is the mean delivery time when every standardized feature is at its mean of zero, and penalizing it would pull every prediction toward zero minutes, an arbitrary point; without a penalty on beta_0, adding a constant to every y_i adds the same constant to the intercept and changes no slope
note: the display is the chapter's `### Penalized criterion` display, verbatim without its trailing comma; the four labels are the chapter's `where` bullets and its sentence "The intercept is not penalized", cut. The display is set at 0.75em and the legend at 0.6em, as on the subset selection deck's criteria slides.

## 8. Closed form
tag: core
show: equation — the chapter's two right-hand sides, one display, with a two-label legend and the two limits
words: the display $\widehat\beta_0 = \bar y, \qquad \widehat\beta^R_\lambda = \left(\tilde{\mathbf{X}}^\top\tilde{\mathbf{X}} + \lambda\mathbf{I}_p\right)^{-1}\tilde{\mathbf{X}}^\top\left(y - \bar y\mathbf{1}\right)$; then an itemized list of two labels: "$\tilde{\mathbf{X}}$ — standardized features, without a column of ones", "$\mathbf{I}_p$ — $p \times p$ identity matrix"; then two limits: "$\lambda = 0$: least squares", "$\lambda \to \infty$: $\widehat\beta^R_\lambda \to 0$, the null model"
reveal: on arrival: the display; click 1: the two labels; click 2: the two limits
say: setting the derivatives of the criterion to zero gives beta-hat_0 = y-bar and the ridge estimate; each column of X-tilde sums to zero, so the derivative with respect to beta_0 does not involve the slopes, and the criterion is a convex quadratic, so this is its minimum; for lambda greater than 0 the matrix X-tilde^T X-tilde + lambda I_p is invertible even when X-tilde^T X-tilde is not, so the ridge estimate is unique even when p is at least n; at lambda = 0 the ridge estimate is the least squares estimate on the standardized features, which gives the same predictions as least squares on the features as recorded; as lambda goes to infinity every estimated slope goes to zero and every prediction is y-bar, the null model; here beta-hat_0 = y-bar is the standardized-scale intercept and the ridge estimate is the estimate of the standardized-scale coefficients; an estimate on the original scale is the ridge estimate divided by s_j, and the original-scale intercept estimate is y-bar minus the sum over j of x-bar_j times the ridge estimate_j over s_j; the chapter's ridge_fit() computes the closed form and returns the estimates on the original scale
note: the display joins the right-hand sides of the chapter's two derivative displays of `### Closed form` (the arrows and derivative expressions are cut; the derivation is parked); the labels are the chapter's symbol definitions, cut, and the two limits are its two bullets, cut. The display is set at 0.75em, the legend at 0.6em and the limits at 0.8em. The `ridge_fit()` code is not shown.

## 9. glmnet scaling
tag: optional
show: equation — the chapter's `glmnet()` criterion and the conversion of $\lambda$, with a two-label legend
words: the display $\frac{1}{2n}RSS + \frac{\lambda_{\text{glmnet}}}{2}\sum_{j=1}^p\beta_j^2$, then the display $\lambda = \frac{n\,\lambda_{\text{glmnet}}}{s_y}$, then an itemized list of two labels: "$\lambda_{\text{glmnet}}$ — the value `glmnet()` calls `lambda`", "$s_y$ — standard deviation of $y$, divisor $n$"
reveal: on arrival: the criterion; click 1: the conversion; click 2: the two labels
say: glmnet::glmnet() with alpha = 0 fits ridge regression, but its documented criterion is the first display; multiplying that criterion by 2n gives RSS + n lambda_glmnet times the sum of squared coefficients; two more steps happen inside glmnet() for a numeric response: it divides y by its standard deviation s_y, fits, and multiplies the estimates by s_y afterward (fitting y/s_y with penalty n lambda_glmnet gives the same criterion divided by s_y^2, so this step alone would give lambda = n lambda_glmnet), and it also divides the supplied lambda_glmnet by s_y before fitting y/s_y (for the lasso's absolute-value penalty this division exactly undoes the effect of dividing y by s_y; glmnet() applies it to the squared penalty too, where it does not); the net effect, checked numerically in the notes, is that lambda_glmnet corresponds to the lambda of this chapter's criterion by the second display; glmnet() standardizes the features itself, with divisor n, and reports estimates on the original scale; from here on lambda is this chapter's, converted where glmnet() is used; optional: first in the drop order (say that glmnet's lambda differs from this chapter's by a factor n over s_y)
note: the two displays are the chapter's `### glmnet scaling` displays, verbatim; the two labels are the chapter's `where` clause, cut. The numerical check (`glmnet-check`, with its difference of the order of $10^{-13}$) is not shown and is parked. Both displays are set at 0.75em and the legend at 0.6em.

## 10. Estimate path
tag: core
show: figure — path-figure (each standardized estimate against $\lambda$, titled "Ridge estimate path, 100 training orders", with the vertical axis "Standardized estimate (minutes per standard deviation)", grouped as distance, hour, the 6 day dummies and the 27 items), the figure alone
words: none
say: the figure plots each standardized estimate of the ridge fit to the 100 training orders against lambda, from 0.01 to 1,000; at the left the estimates are those of least squares; the largest are hour (4.5), daySat (3.2) and distance (2.8) minutes per standard deviation, and 31 of the 35 are within a minute of zero; as lambda grows the estimates move toward zero smoothly, and none reaches it: at lambda = 1,000 the hour estimate is still 0.43; the length of the vector of standardized estimates falls at every step of the grid, from 6.89 to 0.66, but a single estimate need not: 20 of the 35 move away from zero somewhere along the path, and 8 change sign, among them 3 of the 6 day dummies; the dummy variables of one categorical explanatory variable are correlated, since an order placed on one day was placed on no other, and the penalty shrinks them together
note: the chapter's `path-figure` under `### Estimate path`, alone. The 0.01, 1,000, 4.5, 3.2, 2.8, 31, 35, 0.43, 6.89, 0.66, 20, 8 and 3 are inline R in the chapter, quoted from the frozen markdown, and are in `say:` only. The chapter's `### Estimate path` replaced its `### Coefficient path` (the figure's title and vertical axis changed with it); the slide title follows. The path is the deck's evidence that ridge estimates are shrunken but not zero.

---

# Bias-variance tradeoff

## 11. Bias-variance tradeoff
tag: core
show: none (transition slide, title only)
words: none
say: to see what shrinkage does to predictions, this section draws repeated training samples; of the 9,912 test orders, 4,000 are the test orders at which every prediction is made, and the remaining 5,912 test orders are the orders from which the repeated training samples are drawn; both are this chapter's test orders too: the demonstration chooses nothing, and the delivery model is chosen and fit from the 100 training orders alone; from the remaining test orders, 500 training samples of 100 orders were drawn, ridge regression was fit to each sample at each lambda on a grid, and each fit predicted the 4,000 test orders; the test MSE in this section's figures is the mean squared error at those 4,000 test orders, averaged over the samples
note: the slide is the section's transition; the chapter's paragraph that opens `## Bias-variance tradeoff` is in `say:`. The two content slides after it (Prediction spread and Training sample size) carry its figures; the subsection between them (`### Squared bias and variance`, the definitions and the decomposition) is not in the deck (parked below).

## 12. Prediction spread
tag: core
show: tabset — the chapter's three-tab spread figures with its own tab names, full width: "$\lambda = 0$" (spread-ls-figure), "$\lambda = 15.8$" (spread-mid-figure), "$\lambda = 1{,}000$" (spread-large-figure)
words: none
say: the tabs plot the predictions of 8 of the 4,000 test orders for three values of lambda; each violin shows one order's predictions over the 500 training samples, and the cross marks its fitted value from least squares fit to the 4,000 test orders themselves; with lambda = 0, least squares, each order's predictions are centered near its cross but spread over several minutes; at lambda = 15.8 they spread less and are pulled slightly toward the mean; at lambda = 1,000 they spread least, but they are pulled toward the mean delivery time, above the cross for the quick orders and below it for the slow ones; if time is short, show the first and last tabs
note: the chapter's own three-tab set (`#### $\lambda = 0$`, `#### $\lambda = 15.8$`, `#### $\lambda = 1{,}000$`) under `## Bias-variance tradeoff`, which the chapter shows before its `### Squared bias and variance` subsection. **The slide title is not a chapter heading** (the section itself is slide 11's transition); "Prediction spread" names what the violins show. The three figures are violin plots with quartile lines and the median; no boxplot to flag. The 500, 100, 15.8 and 1,000 are inline R in the chapter, quoted from the frozen markdown, and are in `say:` only. No fragments. If time is short, show the first and last tabs.

## 13. Training sample size
tag: core
show: tabset — the chapter's two-tab figures with its own tab names, full width: "$n = 100$" (bv-100-figure), "$n = 300$" (bv-300-figure)
words: none
say: the tabs plot the squared bias, the variance and their sum against lambda, from 500 training samples of 100 orders and, separately, 500 of 300 orders; each sample's ridge fit at each lambda predicts the 4,000 test orders, and each term is averaged over those test orders and over the samples (the notes define the terms); variance plus squared bias is the test MSE minus MSE*, which does not depend on lambda (MSE* = 13.71), so it is smallest at the lambda with the smallest test MSE, marked by the dotted line; with n = 100, least squares has squared bias 0.30 and variance 8.57; as lambda grows the variance falls and the squared bias rises, slowly at first, so their sum falls to its minimum at lambda = 15.8; there the test MSE is 21.24 against 22.58 for least squares, 5.9% lower; beyond the minimum the squared bias dominates and the test MSE climbs toward that of the null model; with n = 300 the variance of least squares is only 1.94, so there is little for shrinkage to remove before the squared bias from shrinking the large estimates of hour, distance and the days outweighs it: the smallest test MSE, at lambda = 1.0, is less than 0.1% below that of least squares; how much shrinkage helps depends on the data and on the sample size, so lambda has to be chosen from the training data
note: the chapter's own two-tab set (`#### $n = 100$`, `#### $n = 300$`) under `### Training sample size`; no fragments. The 100, 300, 500, 4,000, 0.30, 8.57, 15.8, 21.24, 22.58, 5.9%, 1.94, 1.0 and 0.1% are inline R in the chapter, quoted from the frozen markdown, and are in `say:` only (the slide carries no label). The 5.9% is the gain of the best fixed $\lambda$, not of cross-validation. The figure's legend (Variance plus squared bias, Squared bias, Variance) names the three curves; their definitions are in the chapter's `### Squared bias and variance`, which the deck does not show, so the instructor says them (parked below). The 13.71 is inline R in the chapter and is in `say:` only.

---

# Tuning parameter selection

## 14. Tuning parameter selection
tag: core
show: none (transition slide, title only)
words: none
say: lambda is chosen like any tuning parameter: by k-fold cross-validation on the training data, then a refit to all the training data and one evaluation on the test data

## 15. Cross-validation
tag: core
show: figure — cv-figure (the 10-fold cross-validation estimate of the test MSE against $\lambda$: the curve, a dashed line labeled "Least squares, $\lambda = 0$" and a labeled point "Chosen, $\lambda = 28.2$" at the smallest estimate; no standard-error bars), the figure alone
words: none
say: cv.glmnet() computes the 10-fold cross-validation estimate CV_(10)(lambda) for every lambda on a grid, with the folds drawn with the split; for each fold glmnet() standardizes and fits from the other 9 folds and predicts the held-out fold; the held-out folds are validation sets; the figure plots the estimate against lambda, with the estimate for least squares on the same folds as a dashed line and the chosen lambda, the one with the smallest estimate, as a point; the estimate falls from 29.23 for least squares to its smallest value, 24.57, at lambda = 28.2 (lambda_glmnet = 2.071), and rises again beyond it, above the least squares estimate from lambda = 112 on; the estimated reduction, 15.9%, is small relative to its uncertainty: plus or minus one standard error is 19.62 to 29.52 at the minimum and 23.51 to 34.95 for least squares, intervals that overlap almost entirely; the curve is flat near its minimum: from lambda = 18 to 35 the estimate is within 1% of its smallest value; in 2 of the 10 folds some item appears in none of the training folds, and glmnet() gives it an estimate of zero; the repeated training samples of the previous section put the smallest average test MSE at lambda = 15.8; cross-validation sees only the 100 training orders and chooses a larger value; optional footnote of the chapter: the lambda axis is this chapter's lambda only approximately, because cv.glmnet() converts with the n and s_y of all 100 training orders but each fold is fit to 90 orders with their own s_y, so the lambda a fold applies is 0.87 to 0.95 times the plotted value; applying this chapter's lambda exactly in every fold gives a smallest estimate of 24.49 at lambda = 25.1; no conclusion changes
note: the chapter's `cv-figure` under `### Cross-validation`, alone. The chapter's figure no longer draws standard-error bars ("Plots show the takeaway"); the plus-or-minus-one-standard-error intervals are a sentence of the chapter and are in `say:` only, with their numbers. The 10, 29.23, 24.57, 28.2, 2.071, 112, 15.9%, 19.62, 29.52, 23.51, 34.95, 0.87, 0.95, 24.49, 25.1, 18, 35, 2 and 15.8 are inline R in the chapter, quoted from the frozen markdown, and are in `say:` only. The one-standard-error rule is in the chapter's `### Beyond this course` callout and is not used. The `cv.glmnet()` call is not shown.

## 16. Test evaluation
tag: core
show: table — test-table-display (kable: least squares and ridge, with the $\lambda$ used, the training MSE, the 10-fold CV estimate and the test MSE; copied from the frozen markdown), the table alone
words: none
say: cv.glmnet() also fits the whole path to all 100 training orders, so predicting with s = "lambda.min" uses the model refit to all the training data; the chosen model is evaluated once on test data, the 9,912 test orders, with least squares for comparison; ridge regression's test MSE is 20.38, against 22.02 for least squares, 7.5% lower; the paired difference in squared error over the test orders has mean 1.64 and standard error 0.18, so the improvement is not an accident of which orders are test orders; that standard error treats the two fitted models as fixed: it reflects only which orders are test orders, not which training orders were drawn; both cross-validation estimates are above the test MSE: each fit in cross-validation uses 90 orders, and with so few orders per feature the error falls quickly as orders are added; an estimate from 100 orders is also noisy; the reduction cross-validation estimated, 15.9%, is 2.1 times the 7.5% reduction on the test orders; the 7.5% is the gain on this one training sample, a favorable draw: over 500 repeated training samples of 100 orders, the same procedure, lambda by 10-fold cross-validation and then a refit, has a lower MSE at the 4,000 test orders than least squares in 72% of the samples and a higher one in 28%, and its average MSE is 3.7% below that of least squares; with training samples of 300 orders it has the lower MSE in only 44% and its average MSE is 0.2% above that of least squares; do not quote the 7.5% as the gain to expect
note: the table is the chapter's `test-table-display` (the kable in `test-table`), copied verbatim from the frozen markdown, header `$\lambda$` kept; no caption on the chapter's table, none added. The 9,912, 20.38, 22.02, 7.5%, 1.64, 0.18, 90, 15.9% and 2.1 are inline R in the chapter, quoted from the frozen markdown, and are in `say:` only; the table's values are the chunk's own output. **Not overstated:** no slide's words state the 7.5%; the table shows the two test MSEs, and the qualification (the chapter's favorable-draw paragraph, whose slide was removed 2026-10-22) is in `say:`. The 72%, 28%, 3.7%, 44% and 0.2% are inline R in the chapter, quoted from the frozen markdown, and are in `say:` only.

## 17. Conclusion
tag: core
show: none, a flat bulleted list of five takeaways
words: five lines, in the order of the lecture: "Ridge penalizes the squared coefficients, not the intercept"; "The ridge estimate has a closed form between least squares and the null model"; "Estimates shrink smoothly toward zero as $\lambda$ grows, and none reaches it"; "The gain over least squares is largest for small training samples"; "Choose $\lambda$ by cross-validation, evaluate once on test data"
say: the next lecture, the lasso, replaces the squared penalty with lambda times the sum of the absolute values of the coefficients, which sets some estimates exactly to zero, and compares the two on the same training and test orders; the standard errors and p-values from lm() do not apply to ridge estimates, which are shrunken
note: the five takeaways are drawn from the chapter's `## Conclusion` paragraphs (the criterion and the unpenalized intercept; the closed form between the two limits; the estimates shrink smoothly and "no estimate reaches zero"; "the gain over least squares is largest when least squares has large variance, with few training observations per feature, and can vanish when it does not"; choosing $\lambda$ by cross-validation then one evaluation on test data), each supported by a slide that remains (7, 8, 10, 13, 15 and 16). Trimmed 2026-10-22: the takeaways on standardization inside every fold, on trading bias for variance and on ridge losing to least squares on a particular training sample are gone with their slides (Standardization, Shrinkage, Favorable draw). A flat list with no nesting, no example numbers and no concept-name list; it does not mirror slide 0. Default font, one column, one line per item.

---

# Removed from the deck

Taken out 2026-10-22 after the deck was taught, each with its asset and original
content (updated to the chapter's current wording) so it can come back. The slide
numbers in parentheses are the numbers before the removal; the deck is now 19
slides and these are not numbered.

### Shrinkage (was slide 10)
tag: optional (was first in the drop order)
show: equation — the chapter's display of the mean and variance of the ridge estimate, with a one-label legend
words: the display $E\left[\widehat\beta^R_\lambda\right] = \mathbf{W}_\lambda\tilde{\mathbf{X}}^\top\tilde{\mathbf{X}}\beta = \beta - \lambda\mathbf{W}_\lambda\beta, \qquad Var\left[\widehat\beta^R_\lambda\right] = \sigma^2\mathbf{W}_\lambda\tilde{\mathbf{X}}^\top\tilde{\mathbf{X}}\mathbf{W}_\lambda$, then "$\mathbf{W}_\lambda = \left(\tilde{\mathbf{X}}^\top\tilde{\mathbf{X}} + \lambda\mathbf{I}_p\right)^{-1}$"
reveal: on arrival: the display; click 1: the label
say: the closed form, applied to whatever responses a training sample gives, is the ridge estimator: the rule that turns a training sample into an estimate; bias and variance are properties of the estimator, of how its estimates vary over repeated training samples, not of the estimate from one sample; treat the features as fixed and suppose the linear model is correct, so the expected centered response is X-tilde beta and its variance is sigma^2 I_n; the bias, minus lambda W_lambda beta, of the ridge estimator is zero at lambda = 0 and grows with lambda; its variance is smaller than the variance of the least squares estimator sigma^2 A^{-1}, where A = X-tilde^T X-tilde is assumed invertible; take any p-vector a and write v = W_lambda a, so that a = (A + lambda I_p) v; the linear combination a^T beta-hat^R has variance sigma^2 v^T A v, and the least squares a^T beta-hat has variance sigma^2 a^T A^{-1} a = sigma^2 (v^T A v + 2 lambda v^T v + lambda^2 v^T A^{-1} v); the last two terms are nonnegative for lambda at least 0: v^T v is a sum of squares, and with u = A^{-1} v, v^T A^{-1} v = u^T X-tilde^T X-tilde u is the sum of squares of X-tilde u; so every linear combination of the estimates, every prediction included, has variance no larger under ridge regression than under least squares, and strictly smaller when lambda is above 0 and a is not zero; the derivation and the aside for uncorrelated features (the shrinkage factor n/(n + lambda), which approaches 1 as n grows, so ridge regression departs most from least squares when the training sample is small) are in the notes; if it comes back, it was first in the drop order (say that the ridge estimator is biased toward zero but, for every lambda above 0, has smaller variance than the least squares estimator, over Closed form)
note: the display is the chapter's `### Shrinkage` display, verbatim without its trailing period; the label is the chapter's definition of $\mathbf{W}_\lambda$. The $v = \mathbf{W}_\lambda a$ argument (the $v^\top v$ and $v^\top\mathbf{A}^{-1}v$ terms) is in `say:` and the orthogonal-case display is in `say:` by reference only; both are parked. The objective's wording is "derive the mean and variance of the ridge estimator to show that it trades bias for variance"; the derivation is parked and this slide shows its result. The display is set at 0.7em and the label at 0.6em.

### Standardization (was slide 11)
tag: core
show: figure — scale-figure (the distance estimate against $\lambda$ for ridge with distance in miles, with distance in feet, and with standardized features, with the least squares estimate as a grey line), the figure alone
words: none
say: least squares is scale equivariant: recording distance in feet instead of miles divides its estimate by 5,280 and leaves every prediction unchanged; the figure fits ridge regression to the training orders with centered but unstandardized features, once with distance in miles and once in feet, and with standardized features; the grey line is the least squares estimate; all three agree with least squares as lambda goes to 0; as lambda grows the estimate in miles shrinks, to 0.30 minutes per mile at lambda = 1,000; the estimate in feet is never shrunk: it rises to 3.18, above its least squares value of 2.79, as distance takes over part of the effect of the features that are shrunk; with standardized features the fit is the same in either unit (the two distance estimates at lambda = 50 agree to within the tolerance of all.equal()); the ridge penalty is not scale equivariant: in feet, the same effect needs a coefficient 5,280 times smaller, whose square the penalty barely charges; without standardization the amount of shrinkage a feature receives depends on its units; the means and standard deviations are computed from the data the model is fit to, so standardization is a data-dependent step: as in the Cross-Validation lecture, it is repeated inside every fold from the training folds only; glmnet() standardizes whatever data it is given, so cv.glmnet() does this automatically
note: the chapter's `scale-figure` under `### Standardization`, alone. The 5,280, 0.30, 3.18, 2.79, 1,000 and 50 are inline R in the chapter, quoted from the frozen markdown, and are in `say:` only. The fold rule (the objective's "standardization is repeated inside every cross-validation fold") is in `say:`; the closing slide no longer carries it.

### Squared bias and variance (was slide 15)
tag: core
show: equation — the chapter's three displays (the average prediction and the variance; the squared bias and the MSE; the decomposition), with a three-line symbol legend
words: the display $\bar f_\lambda(x_i) = \frac{1}{M}\sum_{m=1}^M\widehat f^{(m)}_\lambda(x_i), \qquad \text{Variance}(\lambda) = \frac{1}{|\mathcal{T}|}\sum_{i \in \mathcal{T}}\frac{1}{M}\sum_{m=1}^M\left[\widehat f^{(m)}_\lambda(x_i) - \bar f_\lambda(x_i)\right]^2$; then the display $\text{Bias}^2(\lambda) = \frac{1}{|\mathcal{T}|}\sum_{i \in \mathcal{T}}\left[\bar f_\lambda(x_i) - f^*(x_i)\right]^2, \qquad \text{MSE}(\lambda) = \frac{1}{|\mathcal{T}|}\sum_{i \in \mathcal{T}}\frac{1}{M}\sum_{m=1}^M\left[y_i - \widehat f^{(m)}_\lambda(x_i)\right]^2$; then the display $\text{MSE}(\lambda) = \text{MSE}^* + \text{Bias}^2(\lambda) + \text{Variance}(\lambda)$; then an itemized list of three labels: "$\widehat f^{(m)}_\lambda(x_i)$ — ridge prediction of order $i$ from sample $m$", "$\mathcal{T}$ — test orders at which every prediction is made; $f^*(x_i)$ — least squares fit to them", "$\text{MSE}^*$ — does not depend on $\lambda$"
reveal: on arrival: the average prediction and variance display; click 1: the squared bias and MSE display; click 2: the decomposition; click 3: the three labels
say: index the test orders at which predictions are made by i in T (4,000 of them) and the training samples by m = 1, ..., M, where M = 500 is the number of repeated training samples, each of n of the 5,912 remaining test orders; the bar-f_lambda(x_i) is the average prediction of order i; the f*(x_i) is the fitted value of order i from least squares fit to the 4,000 test orders in T, the closest a linear function of these features comes to their delivery times; it explains R^2 = 71% of their variability, and it is itself estimated, from 4,000 orders, so even least squares has a small squared bias; Variance measures how much a prediction depends on which orders were sampled, and Bias^2 how far the average prediction is from f*; both are estimates from M samples; the bias is measured against the best linear function of these features, not against the true mean delivery time, so error from a nonlinear effect of hour, for example, is in neither term; expanding the square in MSE around the average prediction, the cross term sums to zero over m; expanding again around f*, the cross term is zero because least squares residuals are orthogonal to every linear function of the features; so MSE = MSE* + Bias^2 + Variance, where MSE* = 13.71 does not depend on lambda; in the simulation the two sides differ by at most 1.2 x 10^-13, rounding error; if time is short, say the decomposition and skip the definitions
note: the three displays are the chapter's `### Squared bias and variance` displays, verbatim with `\widehat` for `\hat` and without trailing commas or the period; the three labels are the chapter's `where` bullets, cut (the first and third bullets' definitions of $M$, $y_i$ and $\bar f_\lambda$ are in `say:`). The expansion of the square and its orthogonality argument are in `say:` by reference only and parked. The 4,000, 500, 5,912, 71%, 13.71 and the $10^{-13}$ are inline R in the chapter, quoted from the frozen markdown, and are in `say:` only. The two definition displays are set at 0.55em, the decomposition at 0.75em and the legend at 0.5em so all four reveals fit one slide (checked in a 1280 by 720 render with every fragment visible).

### Favorable draw (was slide 20)
tag: core
show: none, a short itemized list of two lines
words: two lines: "$n = 100$: ridge has the lower MSE in 72% of the samples and a higher one in 28%; its average MSE is 3.7% below least squares"; "$n = 300$: ridge has the lower MSE in 44% of the samples and a higher one in 56%; its average MSE is 0.2% above least squares"
say: this training sample is a favorable draw; over the 500 repeated training samples of 100 orders, the same procedure, lambda by 10-fold cross-validation and then a refit, has a lower MSE at the 4,000 test orders than least squares in 72% of the samples and a higher one in 28%; its average MSE is 3.7% below that of least squares, and the 7.5% gain on the test orders is 2.0 times as large; the median gain over the samples is 2.9%, 90% of the gains lie between -9.9% and 15.4%, and 25.6% of the samples gain at least as much as this one, which puts it at about the 74th percentile; the average gain is less than the 5.9% of the best fixed lambda, because cross-validation chooses lambda from noisy estimates; with training samples of 300 orders, ridge regression has the lower MSE in only 44% of the samples and a higher one in 56%, and its average MSE is 0.2% above that of least squares; on these data, shrinkage helps modestly with 100 training orders and not at all with 300
note: **not a figure or table the chapter has**: the two lines are the chapter's own sentences of the paragraph beginning "This training sample is a favorable draw" under `### Test evaluation`, laid out as a list and cut (a re-layout, not new content). The title was the chapter's own phrase, since that subsection's heading is `### Test evaluation` (slide 16's). The 72%, 28%, 3.7%, 44%, 56% and 0.2% are inline R in the chapter, quoted from the frozen markdown, and are on the slide; the 500, 100, 300, 2.0, 2.9%, -9.9%, 15.4%, 25.6%, 74th and 5.9% are in `say:` only (the median gain, the 90% range and the percentile stay out of the slide, which stays two lines). This slide kept the 7.5% of the Test evaluation slide from being read as the expected gain; with it gone, the qualification (72%, 28%, 3.7%, 44%, 0.2%) is in Test evaluation's `say:`.

### Ridge coefficients (transition) (was slide 21)
tag: core
show: none (transition slide, title only)
words: none
say: the ridge estimates of the delivery model, from the training orders and the lambda chosen by cross-validation, against those of least squares

### Coefficient comparison (was slide 22)
tag: core
show: figure — coef-compare-figure (the ridge and least squares estimates of every feature, on the original scale), the figure alone
words: none
say: the figure compares the ridge estimates, on the original scale, with the least squares estimates, both from the 100 training orders; the next slide reads them in order
note: the chapter's `coef-compare-figure` under `## Ridge estimates` (then `## Ridge coefficients`), alone. **The slide title is not a chapter heading** (the chapter's heading is the section's `## Ridge estimates`, formerly `## Ridge coefficients`); "Coefficient comparison" named the figure. The figure is the tall one of the chapter (7.5 by 7.5 inches), set at height 540; no bullet lines under it.

### Interpretation (was slide 23)
tag: core
show: none, a short itemized list
words: five lines: "Intercept, original scale: $\widehat\beta_0 = -4.8$ minutes, for a Monday order at hour 0, distance 0, no items"; "Hour: 1.46 minutes per hour (least squares: 1.87)"; "Distance: 2.19 minutes per mile (least squares: 2.79)"; "Day: difference from an otherwise identical Monday order"; "Items: minutes per additional unit of the item"; then two lines: "No estimate is zero: all 35 features are kept"; "`lm()` standard errors and $p$-values do not apply"
reveal: on arrival: the five estimate lines; click 1: the two closing lines
say: read in order; intercept: on the original scale, beta-hat_0 = -4.8 minutes is the predicted time of a Monday order placed at hour 0, at distance 0, with no items, far outside the data; the standardized-scale intercept is y-bar = 26.7 minutes, the prediction at the feature means; it sets the level: a Monday order with no items at the training orders' mean hour, 16.2, and mean distance, 3.05 miles, has predicted time 25.6 minutes; hour and distance: each hour later in the day adds 1.46 minutes (least squares: 1.87), and each mile adds 2.19 minutes (least squares: 2.79), holding the other features fixed; day: each day estimate is the predicted difference from an otherwise identical order on Monday, the reference; ridge regression lowers all 6 of them, by 2.4 to 3.7 minutes, which mostly moves Monday rather than the other days relative to each other: Saturday minus Tuesday is 7.5 minutes under least squares and 6.5 under ridge; lowering all the day estimates by the same amount, and raising the intercept by it, changes only the predictions of Monday orders, so it shortens the vector of estimates at the cost of fitting just 4 training orders less well; Wed, Thu and Sun, slower than Monday under least squares, are faster under ridge regression, the sign changes of the estimate path; comparisons with Monday are poorly determined by either method; items: each additional unit of an item changes the predicted time by its estimate; the items that slow deliveries most are item_12, item_01 and item_03, at 2.23, 1.50 and 1.37 minutes per item; the item estimate that changes most is that of item_20, in 1 training order: -4.62 minutes per item under least squares and -1.38 under ridge regression; the estimates are shrunken as a whole: the vector of standardized estimates has length 4.86, against 6.90 for least squares; no estimate is zero; ridge regression keeps all 35 features; because the ridge estimator is biased toward zero, the standard errors, t-statistics and p-values that lm() reports, which assume the unbiased least squares estimator, do not apply, and glmnet() reports none
note: the chapter's bulleted list that follows `coef-compare-figure` (now under `## Ridge estimates`) (Intercept, Hour and distance, Day, Items), cut to labels with the chapter's numbers for the intercept, hour and distance, plus the two closing sentences of the section ("No estimate is zero" and the `lm()` statement), laid out as a list (a re-layout, not new content). The intercept is read first, per `CONVENTIONS.md`. The -4.8, 1.46, 1.87, 2.19, 2.79 and 35 are inline R in the chapter, quoted from the frozen markdown, and are on the slide; the 26.7, 16.2, 3.05, 25.6, 2.4, 3.7, 7.5, 6.5, 4, 2.23, 1.50, 1.37, 1, -4.62, -1.38, 4.86 and 6.90 are in `say:` only. The intercept's slide label names its scale (the chapter writes "On the original scale" in the same place); the item_20 sentence and the length of the vector of estimates are the chapter's, which now places them in the Items bullet and after the list. The Reference level `### Beyond this course` bullet (the ridge fit depends on which day is the reference) is not used; the discussion of the day estimates is in `say:` only.

---

# Not in this deck

Cut from the lecture's core line, with their assets and original content, so
they can come back (the removed slides above are not repeated here).

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
  its result was the removed Shrinkage slide; the argument is in that entry's `say:`.
- **Orthogonal case** (the chapter's last paragraph under `### Shrinkage`:
  $\widehat\beta^R_{\lambda j} = \frac{n}{n + \lambda}\widehat\beta_j$, its mean
  squared error display and the $\lambda = p\sigma^2/\sum_j\beta_j^2$ that
  minimizes the sum): it would come back as an optional equation slide after
  the removed Shrinkage slide; its conclusion (ridge departs most from least squares when the
  training sample is small) is in that entry's `say:`.
- **Expansion of the squared error** (the cross-term argument under
  `### Squared bias and variance`): its result is the decomposition on the removed Squared bias and variance slide;
  the argument is in that entry's `say:`.
- **Day-estimate discussion** (the chapter's `**Day.**` bullet: ridge lowers all
  six day estimates, mostly moving Monday, three change sign): in the removed
  Interpretation entry's `say:`.
- **Chapter code callouts** (`### Code`) and the visible code chunks (`features`,
  `ridge-fit`, `glmnet-check`, `cv-ridge`, `test-evaluation`): not shown; the deck
  never shows a chunk's source.
- **`### Beyond this course` (never used):** the one-standard-error rule
  (`lambda.1se`, the callout under `### Cross-validation`), and the Bayesian
  interpretation, effective degrees of freedom and reference-level bullets (the
  callout at the end of `## Ridge estimates`).

---

# Reference: assets used by this deck

- **Figures (PNG in `_freeze/06-regularization/20-ridge-regression/figure-html/`,
  each with a `-1.png` suffix):** numeric-figure, day-figure (the two tabs of
  slide 2), ls-figure (4), item-count-figure (6), path-figure (10),
  spread-ls-figure, spread-mid-figure, spread-large-figure (the three tabs of
  slide 12), bv-100-figure, bv-300-figure (the two tabs of slide 13), cv-figure
  (15). That is 11 of the 13 chunk figures in the freeze directory. **Not on any
  slide now:** scale-figure (the removed Standardization slide) and
  coef-compare-figure (the removed Coefficient comparison slide).
- **Tables (kable, copied from the frozen markdown):** `test-table-display` (slide
  16, the `test-table` kable). It is the chapter's only table.
- **Console output (frozen markdown):** none; the chapter prints no console
  output, and the deck has no code slide.
- **Equations on slides:** the ridge criterion (7); the intercept and the ridge
  estimate, the two right-hand sides of the derivative displays (8); the
  `glmnet()` criterion and the conversion $\lambda = n\lambda_{\text{glmnet}}/s_y$
  (9). **Not on any slide now:** the mean and variance of the ridge estimate
  (removed Shrinkage); the average prediction, the variance, the squared bias,
  the MSE and its decomposition (removed Squared bias and variance). **Parked:**
  the model display, the two derivative displays and $Q$, the positive
  semidefinite argument, the orthogonal-case displays and the expansion of the
  squared error. Every equation that mentions `\hat` is written with `\widehat`
  in the deck.
- **Numbers quoted from inline R in the frozen markdown (never retyped or
  recomputed). On slides:** 100 and 9,912 (1); $p = 35$, 27 and 6 (3). The deck's
  `derived-from` comment records `2cc8a47`. **In speaker notes only:**
  10,012, 4, 6, 351, 0.07, 97% (1, 2); 10.13, 22.02, 2.17, 2.12, 36% (4); 1, 20, 11
  (6); 0.01, 1,000, 4.5, 3.2, 2.8, 31, 0.43, 6.89, 0.66, 20, 8, 3 (10); 9,912,
  4,000, 5,912, 500, 100, 15.8, 8 (11, 12); 0.30, 8.57, 21.24, 22.58, 5.9%, 1.94,
  1.0, 13.71 (13); 29.23, 24.57, 28.2, 2.071, 112, 15.9%, 19.62, 29.52, 23.51,
  34.95, 18, 35, 2, 15.8, 0.87, 0.95, 24.49, 25.1 (15); 20.38, 7.5%, 1.64, 0.18,
  90, 2.1, 72%, 28%, 3.7%, 44%, 0.2% (16). The numbers of the removed slides
  (the standardization figure's 5,280, 0.30, 3.18 and 2.79; the favorable-draw
  2.0, 2.9%, -9.9%, 15.4%, 25.6% and 74th; the interpretation's -4.8, 1.46,
  1.87, 2.19, 2.79, 26.7, 16.2, 3.05, 25.6, 2.4, 3.7, 7.5, 6.5, 4, 2.23, 1.50,
  1.37, -4.62, -1.38, 4.86, 6.90 and 35; the squared bias slide's 71% and
  $10^{-13}$) are in the removed entries above.
- **Chunk names to confirm at build time:** the freeze directory's `figure-html/`
  holds the 13 PNGs (each with a `-1.png` suffix), 11 used; the notes' tab names
  are "Distance, hour, items / Day" (slide 2), "$\lambda = 0$ / $\lambda = 15.8$ /
  $\lambda = 1{,}000$" (12) and "$n = 100$ / $n = 300$" (13); `result.markdown` has one
  table block and no `cell-output-stdout` or `cell-output-stderr` blocks.

Not available to slides: anything inside a `### For example,` or
`### Beyond this course` callout (here, the one-standard-error rule callout under
Cross-validation and the Bayesian interpretation, effective degrees of freedom and
reference-level callout at the end of Ridge estimates; the chapter has no
`### For example,` callout).
