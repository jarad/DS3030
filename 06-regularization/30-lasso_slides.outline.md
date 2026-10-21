# Slide outline: The Lasso

(drafted 2026-10-17, revised 2026-10-17)

Outline for `30-lasso_slides.qmd` (Fri 2026-10-23, one 50-minute period, MWF
1:10-2:00; ISLR2 6.2.2 and 6.2.3, the third lecture of Chapter 6). **This file
is the spec; the deck is built from it, and this file describes the deck as it
stands.** Edit it freely: reorder, cut, reword, change `tag:`, add notes. When it
says what you want, ask for the deck to be refreshed and `slides-author` will
implement exactly these slides.

Drafted 2026-10-17 against `30-lasso.qmd`, and revised the same day after the chapter was revised and re-rendered (new Question, a corrected geometry paragraph with a fourth tab, recomputed soft-thresholding numbers at $\lambda = 150$, new notes on the path, cross-validation and test evaluation, a new `### Coefficient bias` subsection and a longer Conclusion). The chapter is **not yet committed**, so the
deck's `derived-from` comment records `uncommitted` in place of a hash; replace it
with the chapter's short hash (`git log -1 --format=%h --
06-regularization/30-lasso.qmd`) once the chapter is committed. The frozen output
`_freeze/06-regularization/30-lasso/execute-results/html.json` is current: its
recorded `hash` (it changes with every re-render) equals the md5 of the chapter
file as it stands, which includes the "Slides for this lecture" link on the line
after `# The Lasso` (inserted when this outline was drafted, followed by a
re-render of the chapter).

**Where this deck sits in the period.** The whole 50-minute period is this deck.
It is sized for that: 27 slides including the title, three transitions and the
closing slide, of which 19 core slides (the agenda, 17 content slides and the
closing slide) come to about 38 minutes at the estimates below (the fourth tab of
Constraint regions, two features is the one addition, about a minute), and 4
optional slides come to about 5.5 more, leaving about 6 minutes of the period as a
buffer for questions and for the tabs the instructor wants to dwell on.

The chapter's `##` sections are Delivery times, Lasso, Coefficient path, Tuning
parameter selection, Repeated training samples and Conclusion. It is about 1,050
lines, most of it collapsed code, with 15 figures, 1 kable table and no console
output (no chunk prints text; the chapter's inline R carries the numbers), on the
ridge lecture's running example (`modeldata::deliveries`, 10,012 delivery orders
from one restaurant, of which 100 are the training orders, with the ridge
lecture's split and folds). **The deck spends slides on a subset of it.** The core
line is: what ridge left open, that all 35 ridge estimates are nonzero at every
$\lambda$ (Delivery times); the two features the geometry uses, the penalized
criterion, the two limits of $\lambda$, the constraint regions and their
two-feature figure, soft thresholding and its figure, and the coefficient path
with the number of nonzero estimates (Lasso, Coefficient path); the
cross-validation curve, the test evaluation table, the coefficient figure and its
reading (Tuning parameter selection); and the repeated-sample violins, the
repeated-sample result and the selected sets (Repeated training samples), with
the coefficient-bias violins as an optional last slide of that section. The deck
does **not** cover the derivation of soft thresholding (the one-coefficient problem
and its three cases), the argument for $\lambda_{\max}$, the coordinate descent
paragraph, the `glmnet()` conversion (only an optional slide) or the
`### Beyond this course` callout; those are parked under "Not in this deck" below.
Mapped onto the chapter's six learning objectives:

1. the lasso criterion and its constrained form, the contrast with ridge, and the
   fits at $\lambda \to 0$ and $\lambda \ge \lambda_{\max}$: slides 6, 7, 8 (the
   constrained form with ridge's), 10 (optional: the $\ell_0$ budget of best subset
   selection);
2. why some lasso estimates are exactly zero and ridge estimates, except by coincidence, are not, from the
   constraint regions over the RSS contours: slides 5, 8, 9;
3. soft thresholding of the least squares estimate for orthogonal features, against
   ridge's proportional shrinkage: slides 11 and 12 (the derivation steps are in
   slide 11's `say:`);
4. reading a coefficient path: which features enter first and how many estimates
   are nonzero at each $\lambda$: slide 14;
5. choosing $\lambda$ by cross-validation, evaluating once on test data and comparing
   the lasso, ridge and least squares by test MSE and by the features they keep:
   slides 16, 17, 18, 19, and 21 and 22 for how far the comparison generalizes;
6. the instability of the selected set, and why the nonzero lasso estimates are biased toward zero and
   `lm()`'s standard errors and $p$-values do not apply: slides 23, 24 (optional:
   the bias itself) and 19.

Optional: glmnet scaling (slide 13), Best subset selection (10), Data (2) and Coefficient bias (24). If time
is short, drop in this order: glmnet scaling (13; say that `glmnet()`'s `lambda`
differs from this chapter's by the factor $2n$, with no $s_y$), Best subset selection
(10; say that best subset selection is the same problem with a budget on the number
of nonzero coefficients), Data (2; the Delivery times slide already names the
variables), Coefficient bias (24; say that the lasso's and ridge's average
estimates are below least squares'), then the extra tabs of Constraint regions,
two features (9; show "+ Lasso" and "+ Ridge", and skip "Estimates at the corner"). Three transition slides (4, 15, 20), no live widget, no
code slide and no console slide.

**Not overstating the lasso's advantage.** The chapter says plainly that the lasso's
test MSE of 16.96 (slide 17) is the gain on this one training sample, 16.8% below
ridge's 20.38 and 23.0% below least squares' 22.02, and that over 500 samples of 100
orders the average MSE of the whole procedure (cross-validation, then a refit) is
19.19 for the lasso, 21.74 for ridge and 22.58 for least squares: the lasso is below
least squares in 94% of the samples and its average gain is 15.0%, "a smaller gain
than the 23.0% on the test orders". Over samples of 300 orders the averages are
16.04, 15.97 and 15.94: the lasso wins in 56% of the samples but its average MSE is
0.6% above least squares. The chapter adds that this training sample is a favorable draw for the lasso (median gain 13.5%; 18.4% of the samples gain at least as much; about the 82nd percentile), said in slide 22's `say:`. The deck keeps the 23.0% out of every slide's words (it is
in the table's last column and in slide 17's `say:`) and puts the repeated-sample
numbers on their own slide (22, Average over samples), straight after the violins,
with the $n = 300$ line next to the $n = 100$ line, so the test gain is never shown
without its qualification. The closing slide says that the gain depends on the data
and the sample size.

Nothing here is new content. Every `show:` points at something that already
exists in `30-lasso.qmd`, so the deck distills the notes and never invents. If a
slide needs something the chapter doesn't have, flag it with `needs:` and it goes
back through `notes-author` and `proof-reader` first. No slide in this outline needs
one. Seven slides lay out the chapter's own words in a form the chapter does not
have (1's list, 7's two limits, 8's lead line and labels, 19's list, 22's two lines
and 25's takeaways, and 5's title); each is marked with a `note:`. The chapter shows
its Data subsection (the question, the data and the item figure) as one block;
slide 1 lays out its prose and slide 2 shows its figure.

**Response variable and explanatory variables.** For `modeldata::deliveries`
(slide 1, a words-only slide that precedes the data figures) the response variable
is `time_to_delivery`, in minutes; the explanatory variables are `hour`, `day`,
`distance` and the 27 item counts `item_01`, ..., `item_27`. The $p = 35$
**features** are `hour`, `distance`, the 27 item counts and 6 day dummies with
Monday the reference level (said on slide 3; the deck does not repeat the ridge
lecture's Features slide). The deck uses "explanatory variables" for the raw
columns and "features" for the columns that enter the model, per `CONVENTIONS.md`.

**Symbols,** per `CONVENTIONS.md` and the chapter: $n = 100$ the number of training
orders and $p = 35$ the number of features; $\tilde x_{ij}$ the standardized
features and $\tilde{\mathbf{X}}$ their matrix; $\lambda$ the tuning parameter and
$s$ the budget; $\widehat\beta^L_{\lambda j}$ the lasso estimate and
$\widehat\beta^R_{\lambda j}$ the ridge estimate of standardized coefficient $j$.
The equations are copied from the chapter's source with `\widehat` for `\hat`; where
the chapter writes `\hat\beta^L_{\lambda j}` the slide writes
`\widehat\beta^L_{\lambda j}`.

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
other nested groupings cycling `()`, `[]`, `{}`) and `\widehat` for `\hat`. Inside
`$...$` a percent sign is written `\%` and a thousands comma `{,}` (none is needed
on these slides).

**Timing:** 27 slides including the title slide (slides 0 to 25 plus the title
slide): 3 transitions (no time), 19 `core` slides (the agenda, 17 content slides
and the closing slide) and 4 `optional`. The estimates, in minutes: 0 (0.5),
1 (1.5), 3 (2), 5 (1), 6 (2), 7 (1), 8 (1.5), 9 (4.5), 11 (2), 12 (2.5), 14 (3),
16 (2.5), 17 (2.5), 18 (2), 19 (2.5), 21 (2.5), 22 (2), 23 (2.5), 25 (0.5), about
38 minutes of core slides (38.5 to be exact); the optional slides add 2 (1.5),
10 (1), 13 (1.5) and 24 (1.5), about 5.5 minutes, so the whole deck is about 44
minutes with about 6 minutes of buffer in the period. **Coefficient bias (24) is
tagged optional, not core,** so the core budget stays at about 38 minutes after the
fourth Constraint regions tab; the bias is also said on slide 19's closing line and
in the Conclusion's last takeaway, so dropping the slide loses the evidence for it,
not the statement. The slowest are the three slides that make the geometric
argument (Constraint regions, two features, 9, four tabs; Soft thresholding, 11,
and its figure, 12) and the coefficient path (14, two tabs). If the lecture is
running behind, the drop order above frees about 5.5 minutes (more with the tabs).

---

## 0. Today
tag: core
show: none, a nested bulleted list
words: agenda as a nested outline: Delivery times (no children); Lasso, with Penalized criterion, Constraint regions, Soft thresholding and Coefficient path nested beneath it; Tuning parameter selection, with Cross-validation, Test evaluation and Lasso coefficients nested beneath it; Repeated training samples, with Test MSE and Selected sets nested beneath it
say: distilled from the chapter's six learning objectives and the slides this deck spends time on: the lasso criterion and its contrast with ridge; why the L1 constraint region gives exact zeros; soft thresholding of the least squares estimate for orthogonal features; reading the coefficient path and the number of nonzero estimates; choosing lambda by cross-validation, one test evaluation, and the comparison of lasso, ridge and least squares; the instability of the selected set and the bias of the nonzero lasso estimates; the derivation of soft thresholding, the argument for lambda-max, the coordinate descent paragraph, the glmnet conversion of lambda (optional slide), the l0 budget of best subset selection (optional slide), the Coefficient bias figure (optional slide), the Beyond this course callout and the hand-off to principal components are in the notes and not in the agenda; this lecture is the sequel to the ridge lecture on the same data, the same split and the same folds, and the question it opens from is what ridge left open: all 35 ridge estimates are nonzero; Delivery times has no transition slide of its own and Coefficient path, a chapter section of its own, is shown inside the Lasso part; the other three parts each have one transition; the timing note in the speaker notes: if time is short drop in this order glmnet scaling, Best subset selection, Data, Coefficient bias, the extra tabs of Constraint regions, two features
note: the notes chapter's learning objectives are the source; the chapter has no "Today" section. The DS3030 title slide carries the chapter title. Delivery times is a top-level item with no children (Data is optional, so it is not listed; its one content slide, Ridge coefficients, is not listed separately). Lasso, Tuning parameter selection and Repeated training samples each have one transition (4, 15, 20). The chapter's `## Coefficient path` is shown inside the Lasso part with no transition of its own, to avoid a transition for one slide. The optional slides (Data, Best subset selection, glmnet scaling, Coefficient bias) are not listed. Layout: the list is set in two columns (Delivery times and Lasso on the left, the other two parts on the right), as on the ridge deck, since 13 lines do not fit one column at the deck's font size.

## 1. Delivery times
tag: core
show: none, a words-only data slide (a short itemized list)
words: "Question: does a model that keeps only some of the 35 features predict delivery times better than one that uses all of them?"; "Response variable: `time_to_delivery`, in minutes"; "Explanatory variables: `hour`, `day`, `distance`, `item_01`, ..., `item_27`"; then "Training orders: 100, the ridge lecture's sample"; "Test orders: 9,912, the ridge lecture's test orders"
reveal: on arrival: the question, the response variable and the explanatory variables; click 1: the training orders and test orders lines
say: this is the ridge lecture's data, the split and the folds, so the lasso is compared with ridge regression and least squares on exactly the same training and test orders; the question is whether a model that keeps only some of the 35 features predicts delivery times better than one that uses all of them; the data are modeldata::deliveries, 10,012 orders from one restaurant; the response is time_to_delivery in minutes; the explanatory variables are the hour the order was placed (a decimal hour on a 24-hour clock), the day of the week, the delivery distance in miles, and 27 columns item_01, item_02, ... that count how many of each menu item the order contains; day enters the model as 6 dummy variables with Monday as the reference level, so there are 35 features; the training sample is deliberately small relative to the 36 coefficients of the model, so that they are poorly determined; the repeated samples at the end also use 300 training orders
note: the chapter's `**Question.**` and `**Data.**` paragraphs under `### Data`, laid out as a list (a re-layout, not new content); the chapter's sentence "the split and the folds are the ridge lecture's: 100 training orders and 9,912 test orders" gives the last two lines. The 35, 9,912 and 100 are inline R in the chapter, quoted from the frozen markdown, and are on the slide; the 10,012, 36, 6 and 300 are in `say:` only. The Question is the chapter's revised one. Words-only, so the response variable and the explanatory variables may be listed on the slide; the data figure that follows carries no list. The title is the chapter's `## Delivery times`.

## 2. Data
tag: optional
show: figure — item-figure (the delivery times of the training orders that contain each item, with a median bar per item and a dashed line at the overall median), the figure alone
words: none
say: the figure plots, for each of the 27 items, the delivery times of the training orders that contain it; each item is in between 1 and 20 of the 100 training orders; the median delivery time of the orders containing an item ranges from 22.9 to 31.4 minutes, around the overall median of 26.5, and the times of the orders containing any one item vary widely; these orders also differ in distance, hour and day, which the ridge lecture showed matter, so a difference between items here need not be an effect of the items; if time is short, skip this slide
note: the chapter's `item-figure` under `### Data`, alone. The 27, 1, 20, 22.9, 31.4 and 26.5 are inline R in the chapter, quoted from the frozen markdown (the 27 is the chapter's own `item_27`), and are in `say:` only. The figure is tall (7 by 7 inches), so it is set at height 540. It draws points with a median bar, not a boxplot; nothing to flag. Optional: third in the drop order.

## 3. Ridge coefficients
tag: core
show: figure — ridge-path-figure (the standardized coefficients of ridge regression fit to the 100 training orders against $\lambda$, grouped as distance, hour, the 6 day dummies and the 27 items), the figure alone
words: none
say: the figure repeats the ridge lecture's coefficient path, each standardized coefficient of ridge regression fit to the training orders against lambda; the ridge estimates shrink toward zero as lambda grows, but at every one of the 101 values of lambda on the grid all 35 are nonzero; at lambda = 1,000 the item estimate closest to zero, that of item_23, is still 4.0 x 10^-3 minutes per standard deviation
note: the chapter's `ridge-path-figure` under `### Ridge coefficients`, alone. **The slide title is the chapter's own heading** and the figure opens the lecture from what ridge left open, before any criterion. The 101, 35, 1,000, `item_23` and $4.0 \times 10^{-3}$ are inline R in the chapter, quoted from the frozen markdown, and are in `say:` only.

---

# Lasso

## 4. Lasso
tag: core
show: none (transition slide, title only)
words: none
say: the lasso keeps the structure of ridge regression, the RSS plus a penalty, and changes the penalty to lambda times the sum of the absolute values of the coefficients; that change sets some estimates exactly to zero

## 5. Two features
tag: core
show: figure — two-feature-figure (the delivery time against the standardized distance and the standardized hour of the 100 training orders, two panels), the figure alone
words: none
say: the geometry of this section uses two features, the standardized distance and hour of the training orders; the figure plots the delivery time against each; delivery time rises with both, and the two are nearly uncorrelated in the training orders (correlation 0.06)
note: the chapter's `two-feature-figure` that opens `## Lasso`, alone. **The slide title is not a chapter heading** (the chapter has no heading for this figure); "Two features" names what it plots. The 0.06 is inline R in the chapter, quoted from the frozen markdown, and is in `say:` only.

## 6. Penalized criterion
tag: core
show: equation — the chapter's lasso criterion display, with a four-label symbol legend
words: after the display, an itemized list of four labels: "$\tilde x_{ij}$ — feature $j$ of order $i$, standardized", "$\lambda \ge 0$ — tuning parameter", "$\lambda\sum_{j=1}^p\left|\beta_j\right|$ — $\ell_1$ penalty; ridge: $\ell_2$ penalty $\lambda\sum_{j=1}^p\beta_j^2$", "$\beta_0$ — intercept, not penalized"
reveal: on arrival: the display; click 1: the four labels
say: the lasso estimates the coefficients by minimizing the display; the features are standardized with divisor n and beta_0, beta_j are on the standardized scale, as in the ridge lecture; the intercept is not penalized and the features are standardized, for the reasons the ridge lecture gave, and the l1 penalty is no more scale equivariant than the l2 penalty; the criterion is convex but not differentiable where some beta_j = 0, and in general its minimum has no closed form, unlike ridge regression
note: the display is the chapter's `### Penalized criterion` display, verbatim without its trailing comma and with the legend cut from the chapter's `where` bullets; the ridge penalty in the third label is the chapter's "in place of ridge regression's $\ell_2$ penalty". The display is set at 0.75em and the legend at 0.6em, as on the ridge deck's criterion slide.

## 7. Maximum lambda
tag: core
show: equation — the chapter's $\lambda_{\max}$ display, with the two limits and the training orders' value
words: the display $\lambda \ge \lambda_{\max} = \max_{j}\, 2\left|\sum_{i=1}^n\tilde x_{ij}\left(y_i - \bar y\right)\right|$; then an itemized list of two limits: "$\lambda = 0$: least squares", "$\lambda \ge \lambda_{\max}$: $\widehat\beta_0 = \bar y$ and every slope estimate is zero, the null model"; then "Training orders: $\lambda_{\max} = 967.4$, set by `hour`"
reveal: on arrival: the display; click 1: the two limits; click 2: the training orders line
say: at lambda = 0 the lasso is least squares; unlike ridge regression, it reaches the null model at a finite lambda; at beta = 0, changing one coefficient beta_j to t changes the RSS by -2t times the sum over i of x-tilde_ij (y_i - y-bar), plus n t^2, and the penalty by lambda times the absolute value of t, so no estimate can leave zero when lambda is at least lambda-max; the standardized features are centered, so whatever the slopes, the intercept that minimizes the criterion is beta-hat_0 = y-bar, the mean delivery time of the training orders; because the criterion is convex and the penalty is a sum over j, every slope estimate is zero and every prediction is y-bar, the null model; for the training orders lambda-max = 967.4, set by hour, the feature most correlated with the delivery time
note: the display is the chapter's `\lambda_{\max}` display in `### Penalized criterion`, verbatim without its trailing comma and with the chapter's "$\lambda \ge$" inequality that precedes it in the sentence; the two limits are the chapter's "At $\lambda = 0$ the lasso is least squares" and "$\hat\beta_0 = \bar y$ and every slope estimate is zero", cut; the last line is the chapter's inline-R sentence. **The slide title is not a chapter heading** (it is a sub-part of `### Penalized criterion`; "Maximum lambda" names the display). The 967.4 and `hour` are inline R in the chapter, quoted from the frozen markdown, and are on the slide. The change-in-RSS argument is in `say:` only and parked. The display is set at 0.75em and the limits at 0.8em.

## 8. Constraint regions
tag: core
show: equation — the chapter's constrained forms for the lasso and ridge, with a two-label legend
words: lead line "Minimize the RSS subject to"; the display $\sum_{j=1}^p\left|\beta_j\right| \le s, \qquad\text{and for ridge regression}\qquad \sum_{j=1}^p\beta_j^2 \le s$; then an itemized list of two labels: "$s \ge 0$ — budget", "smaller $\lambda$, larger $s$"
reveal: on arrival: the lead line and the display; click 1: the two labels
say: minimizing the lasso criterion is equivalent to minimizing the RSS subject to the first constraint, and ridge regression to the second; each lambda corresponds to some budget s, a smaller lambda to a larger s; the budget s is the textbook's symbol and is unrelated to the standard deviations s_j and s_y; for the two standardized features the region is a diamond for the lasso and a disk for ridge regression, and the RSS has elliptical contours centered at the least squares estimate; the constrained estimate is where the smallest contour touches the region
note: the display is the chapter's `### Constraint regions` display, verbatim; the lead line and the labels are the chapter's sentences "Minimizing the lasso criterion is equivalent to minimizing the RSS subject to" and "each $\lambda$ corresponds to some $s$, a smaller $\lambda$ to a larger $s$", cut. The display is set at 0.75em and the legend at 0.6em.

## 9. Constraint regions, two features
tag: core
show: tabset — the chapter's four-tab geometry figures with its own tab names, full width: "RSS contours" (geometry-base-figure), "+ Lasso" (geometry-lasso-figure), "+ Ridge" (geometry-ridge-figure), "Estimates at the corner" (geometry-corner-figure)
words: none
say: the RSS contours of the two standardized features, centered at the least squares estimate (3.05, 4.64); the estimate lies outside both regions, so each constrained estimate is on the boundary; with budget s = 1.5 the smallest contour touches the diamond at its corner (0.00, 1.50): the estimate of the distance coefficient is exactly zero; the disk, through the same corners, is touched at (0.85, 1.24), where neither estimate is zero; which point of the boundary is touched depends on where the least squares estimate is; the last tab draws, for s = 1.5, the least squares estimates whose lasso estimate is the corner, a wedge (shaded), and those whose ridge estimate is the axis point (0, 1.5), a single ray (dashed); the ray is tilted 3.7 degrees from the hour axis, and would run along the axis only if the features were uncorrelated, so that only a least squares estimate on the axis would give a zero estimate; either way the ray has no area, and a zero ridge estimate is a coincidence; the wedge has area, and the least squares estimate of the training orders falls inside it, near its edge (u = 0.97, the edge being at u = 1): the lasso keeps the distance estimate at zero for every budget below s = 1.59; modest claim: the figure shows one budget and two nearly uncorrelated features, so it illustrates the mechanism but does not show how often it acts; in p dimensions the region has corners and edges on which many beta_j are zero at once, and the least squares estimates whose lasso estimate lies on one of them fill a set of positive volume, whereas for ridge regression those that give some ridge estimate exactly zero fill a set of zero volume; the derivation of the ray and the wedge is in the notes; if time is short, show the middle two tabs
note: the chapter's own four-tab set (`#### RSS contours`, `#### + Lasso`, `#### + Ridge`, `#### Estimates at the corner`) under `### Constraint regions`; no fragments. **The chapter's fourth tab is new**, and **the earlier sentence "a disk has no corners, so a contour touches it on an axis only if the least squares estimate is on that axis" (false) is replaced** in `say:` by the chapter's statement of the ray and the wedge. **The slide title is "Constraint regions, two features"** since slide 8 carries the heading; the figures are 6 by 6 (the fourth, about 6 by 6.2) inches, allowed up to 460 px high by a deck style rule (`.tab-content.square-tabs`) so the tab labels and the figure fit; in a 1280 by 720 render the plot shows at about 410 px, and its axis text and the fourth tab's small caption are small. **The fourth tab does not crowd the slide:** four tab labels fit on one row, and the figure sits at the same height as the other three. The 3.05, 4.64, 1.5, 0.00, 1.50, 0.85, 1.24, 3.7, 0.97 and 1.59 are inline R in the chapter, quoted from the frozen markdown, and are in `say:` only.

## 10. Best subset selection
tag: optional
show: equation — the chapter's $\ell_0$ budget, with a two-label legend
words: the display $\sum_{j=1}^p\mathrm{I}\left(\beta_j \ne 0\right) \le s$; then an itemized list of two labels: "$\sum_j\mathrm{I}\left(\beta_j \ne 0\right)$ — number of nonzero coefficients, the $\ell_0$ penalty", "lasso: a convex relaxation"
reveal: on arrival: the display; click 1: the two labels
say: best subset selection is the same problem with the budget sum of the indicators that beta_j is not zero, at most s, on the number of nonzero coefficients; that count, used as a penalty, is the l0 penalty; it is not convex, and minimizing it means searching over subsets; the lasso replaces it with a convex relaxation, the l1 budget, which can be minimized quickly; if time is short, drop this slide
note: the display is the one inside the chapter's closing paragraph of `### Constraint regions` ("Best subset selection is the same problem with the budget ..."), without the surrounding sentence; the labels are that sentence, cut. **The slide title is not a chapter heading** (the chapter names the method in a link, not a heading); it names the lecture the paragraph points to. The display is set at 0.75em and the legend at 0.6em. Optional: second in the drop order.

## 11. Soft thresholding
tag: core
show: equation — the chapter's lasso and ridge estimates for orthogonal standardized features, with a five-label legend
words: lead line "Orthogonal standardized features: $\tilde{\mathbf{X}}^\top\tilde{\mathbf{X}} = n\mathbf{I}_p$"; the display $\widehat\beta^L_{\lambda j} = \text{sign}\left(\widehat\beta_j\right)\left(\left|\widehat\beta_j\right| - \frac{\lambda}{2n}\right)_+, \qquad \widehat\beta^R_{\lambda j} = \frac{n}{n + \lambda}\widehat\beta_j$; then an itemized list of five labels: "$\widehat\beta_j$ — least squares estimate", "$\widehat\beta^L_{\lambda j}$ — lasso estimate", "$\widehat\beta^R_{\lambda j}$ — ridge estimate", "$(u)_+ = \max(u, 0)$", "$\lambda/(2n)$ — threshold"
reveal: on arrival: the lead line and the display; click 1: the five labels
say: when the standardized features are orthogonal the least squares estimate of coefficient j is the sum over i of x-tilde_ij (y_i - y-bar), divided by n, and the RSS equals a constant plus n times the sum of the squared differences beta_j - beta-hat_j, so the lasso criterion splits into one problem per coefficient: minimize n (beta_j - beta-hat_j)^2 + lambda |beta_j|; for beta_j > 0 the derivative 2n (beta_j - beta-hat_j) + lambda is zero at beta-hat_j - lambda/(2n), which is positive only if beta-hat_j > lambda/(2n); for beta_j < 0, likewise beta-hat_j + lambda/(2n), negative only if beta-hat_j < -lambda/(2n); otherwise the absolute value of beta-hat_j is at most lambda/(2n), the criterion decreases toward zero from both sides, and the minimum is zero; together they give the display; the map from the least squares estimate to the lasso estimate is soft thresholding at lambda/(2n); ridge regression multiplies every estimate by n/(n + lambda), so it moves the large estimates furthest, where the lasso moves every estimate larger than the threshold toward zero by the same amount, and sets the others to zero; in general the lasso is computed by coordinate descent: glmnet() cycles through the coefficients, minimizing over one at a time with the others fixed, and with the others fixed the problem in beta_j is this one-coefficient problem with beta-hat_j replaced by the least squares coefficient of the partial residuals, so each step is a soft thresholding
note: the display is the chapter's `### Soft thresholding` display, verbatim with `\widehat` for `\hat` and without its trailing comma; the lead line is the chapter's "When the standardized features are orthogonal, $\tilde{\mathbf{X}}^\top\tilde{\mathbf{X}} = n\mathbf{I}_p$"; the five labels are the chapter's `where` bullets and the sentence defining $\widehat\beta_j$, cut. The derivation (the RSS display, the three bullets and the one-coefficient problem) is in `say:` only and parked, as is the coordinate descent paragraph. The display is set at 0.7em and the legend at 0.6em.

## 12. Lasso and ridge estimates
tag: core
show: figure — soft-figure (least squares, ridge and lasso estimates against the least squares estimate of an orthogonalized feature at $\lambda = 150$, with the `glmnet()` estimates as circles), the figure alone
words: none
say: the delivery features are not orthogonal, so the figure uses orthogonalized versions, sqrt(n) times an orthonormal basis for the span of the standardized training features, 35 centered columns with X-tilde^T X-tilde = n I_p exactly and no meaning of their own; the lines are the formulas at lambda = 150 and the circles are the lasso estimates glmnet() computes for these features, with lambda converted as on the next slide; at lambda = 150 the ridge factor n/(n + lambda) is 0.40; ridge regression multiplies every estimate by that factor, so it moves the large estimates furthest; the lasso threshold lambda/(2n) is 0.75, in the units of the estimates; the lasso moves every estimate larger than 0.75 in absolute value toward zero by exactly that amount, and sets the other 28 of the 35 to zero, moving each of them by its own magnitude; the glmnet() estimates match soft thresholding to within 1.4 x 10^-15
note: the chapter's `soft-figure` under `### Soft thresholding`, alone. **The slide title is not a chapter heading** (the chapter's heading is slide 11's); "Lasso and ridge estimates" names the figure. The 35, 150, 0.40, 0.75, 28 and $1.4 \times 10^{-15}$ are inline R in the chapter, quoted from the frozen markdown, and are in `say:` only. The figure is tall (6 by 6.5 inches), so it is set at height 540; no bullet lines under it.

## 13. glmnet scaling
tag: optional
show: equation — the chapter's `glmnet()` criterion and the conversion of $\lambda$, with a two-label legend
words: the display $\frac{1}{2n}RSS + \lambda_{\text{glmnet}}\sum_{j=1}^p\left|\beta_j\right|$, then the display $\lambda = 2n\,\lambda_{\text{glmnet}}$, then an itemized list of two labels: "$\lambda_{\text{glmnet}}$ — the value `glmnet()` calls `lambda`", "no $s_y$, unlike ridge regression's $\lambda = n\lambda_{\text{glmnet}}/s_y$"
reveal: on arrival: the criterion; click 1: the conversion; click 2: the two labels
say: glmnet::glmnet() with alpha = 1 fits the lasso, with the documented criterion in the first display, or multiplied by 2n, RSS + 2n lambda_glmnet times the sum of the absolute coefficients; as the ridge lecture explained, glmnet() also divides y and the supplied lambda_glmnet by s_y; fitting y/s_y with coefficients beta/s_y and tuning parameter lambda_glmnet/s_y divides both the RSS and the penalty by s_y^2, which leaves the minimizer unchanged; for the lasso the two divisions cancel, so lambda = 2n lambda_glmnet, with no s_y, unlike ridge regression's n lambda_glmnet/s_y; the circles in the soft thresholding figure were computed at lambda_glmnet = 150/(2 x 100) = 0.75 and fall on the formula, which checks the conversion; the s_y of ridge regression's conversion must not be carried over: the analogous lambda = 2n lambda_glmnet / s_y would supply lambda_glmnet = 5.51, s_y = 7.35 times as large, and glmnet() would then set all 35 estimates to zero, against the 28 of soft thresholding at lambda = 150; from here on lambda is this chapter's, converted where glmnet() is used; optional: first in the drop order (say that glmnet's lambda differs from this chapter's by the factor 2n)
note: the two displays are the chapter's `### glmnet scaling` displays, verbatim (the first without its trailing comma, the second without its trailing comma); the two labels are the chapter's `where`-style sentences, cut. The 0.75, 5.51, 7.35, 35 and 28 are inline R in the chapter, quoted from the frozen markdown, and are in `say:` only. The `to_glmnet()` code chunk is not shown. Both displays are set at 0.75em and the legend at 0.6em. Optional: first in the drop order.

## 14. Coefficient path
tag: core
show: tabset — the chapter's two-tab path figures with its own tab names, full width: "Coefficient path" (lasso-path-figure), "Nonzero estimates" (nonzero-figure)
words: none
say: the tabs plot the lasso estimates of the standardized coefficients, fit to the training orders, against lambda, from 0.1 to 1,000, and the number of nonzero estimates, with ridge regression's for comparison; read from the right: at lambda = 1,000, above lambda-max = 967.4, every estimate is zero; as lambda decreases the first features to enter are hour, distance and daySat; hour enters at lambda-max itself; the grid does not contain the points of entry, and the largest grid values of lambda at which the three are nonzero are 891, 631 and 447; each estimate leaves zero continuously rather than jumping to its least squares value; at lambda = 100, 14 of the 35 estimates are nonzero; at lambda = 10, 29; on this path no estimate returns to zero once it has entered; an estimate can return to zero when features are correlated, and the largest absolute correlation between two of the 35 training features is 0.47; at lambda = 0.1 all 35 are nonzero, within 0.01 minutes per standard deviation of least squares; the number of nonzero estimates plays the role of the model size d of subset selection
note: the chapter's own two-tab set (`#### Coefficient path`, `#### Nonzero estimates`) under `## Coefficient path`; no fragments. The 0.1, 1,000, 967.4, 891, 631, 447, 100, 14, 35, 10, 29, 0.47 and 0.01 are inline R in the chapter, quoted from the frozen markdown, and are in `say:` only. The slide sits inside the Lasso part with no transition (see slide 0).

---

# Tuning parameter selection

## 15. Tuning parameter selection
tag: core
show: none (transition slide, title only)
words: none
say: lambda is chosen like any tuning parameter: by k-fold cross-validation on the training data, then a refit to all the training data and one evaluation on the test data

## 16. Cross-validation
tag: core
show: figure — cv-figure (the 10-fold cross-validation estimate of the test MSE against the lasso's $\lambda$, with grey bars of plus and minus one standard error, horizontal lines for least squares and for ridge regression's smallest estimate, and a dotted line at the lasso's smallest estimate), the figure alone
words: none
say: cv.glmnet() computes the 10-fold cross-validation estimate CV_(10)(lambda) on the grid of the path, with the ridge lecture's folds; inside each fold glmnet() standardizes from the other 9 folds only; ridge regression is cross-validated on the same folds and grid as in the ridge lecture; the figure plots the estimate for the lasso, with the estimates for least squares and for ridge regression at its chosen lambda as horizontal lines; the estimate is smallest, 20.20, at lambda = 89.1 (lambda_glmnet = 0.446), where the lasso estimates of 14 coefficients are nonzero, against 29.23 for least squares and 24.57 for ridge regression at lambda = 28.2; the minimum is shallow: from lambda = 50 to 158, with 20 down to 6 nonzero lasso estimates, the cross-validation estimate is within 5% of its smallest value; these estimates are uncertain: plus or minus one standard error is 16.65 to 23.76 for the lasso at its minimum and 23.51 to 34.95 for least squares, intervals that overlap only from 23.51 to 23.76; the difference, 9.03, is 1.6 times the least squares standard error and 2.5 times the lasso's; for ridge regression at its minimum the interval is 19.62 to 29.52, which covers 58% of the lasso's; optional footnote of the chapter: each fold is fit to 90 orders, so by lambda = 2n lambda_glmnet the lambda a fold applies is 0.90 times the plotted value, which uses all 100 training orders; applying this chapter's lambda exactly in every fold gives a smallest estimate of 20.21 at lambda = 79.4, and no conclusion below changes
note: the chapter's `cv-figure` under `### Cross-validation`, alone. The 10, 20.20, 89.1, 0.446, 14, 29.23, 24.57, 28.2, 50, 158, 20, 6, 5%, 16.65, 23.76, 23.51, 34.95, 9.03, 1.6, 2.5, 19.62, 29.52, 58%, 90, 0.90, 20.21 and 79.4 are inline R in the chapter, quoted from the frozen markdown, and are in `say:` only. The one-standard-error rule is in the chapter's `### Beyond this course` callout and is not used. The `cv.glmnet()` call is not shown.

## 17. Test evaluation
tag: core
show: table — test-table-display (kable: least squares, ridge and lasso, with the $\lambda$ used, the number of nonzero estimates, the training MSE, the 10-fold CV estimate and the test MSE; copied from the frozen markdown), the table alone
words: none
say: cv.glmnet() also fits the path to all 100 training orders, so predicting with s = "lambda.min" uses the refit; the three chosen models are evaluated once on the 9,912 test orders; the lasso's test MSE is 16.96, against 20.38 for ridge regression and 22.02 for least squares, 16.8% and 23.0% lower; the paired difference in squared error, ridge minus lasso, has mean 3.42 and standard error 0.16 over the test orders; as in the ridge lecture, that standard error treats the fitted models as fixed and says nothing about another training sample; the repeated samples at the end of the lecture do, and show that 23.0% is the gain on this one training sample, not the gain to expect, so do not quote it as such; all three cross-validation estimates are above the test MSEs, by factors of 1.19 to 1.33: each fit in cross-validation uses 90 orders, and with so few orders per feature the error falls quickly as orders are added, and an estimate from 100 orders is also noisy; the lasso and ridge estimates are, in addition, each the smallest over a grid of lambda values, selected for being low, so as estimates of the chosen model's error they are optimistic; the least squares estimate involves no such choice
note: the table is the chapter's `test-table-display` (the kable in `test-table`), copied verbatim from the frozen markdown, header `$\lambda$` kept; no caption on the chapter's table, none added. In the render the first column wraps "Least squares" onto two lines (pandoc's column widths for the copied table; the table is not edited). The 9,912, 16.96, 20.38, 22.02, 16.8%, 23.0%, 3.42, 0.16, 1.19 and 1.33 are inline R in the chapter, quoted from the frozen markdown, and are in `say:` only; the table's values are the chunk's own output. **Not overstated:** no slide's words state the 16.96 or the 23.0%; the table shows the three test MSEs and slides 21 and 22 carry the qualification.

## 18. Lasso coefficients
tag: core
show: figure — coef-figure (the least squares, ridge and lasso coefficients of every feature, on the original scale), the figure alone
words: none
say: the figure compares the coefficients of the three fits, on the original scale, all fit to the 100 training orders; the lasso keeps 14 of the 35 features and its other estimates are exactly zero; the next slide reads them in order
note: the chapter's `coef-figure` under `### Lasso coefficients`, alone. The figure is the tallest of the chapter (7.5 by 8.5 inches), set at height 540; no bullet lines under it. The 14 and 35 are in the chapter's table and inline R, quoted from the frozen markdown, and are in `say:` only.

## 19. Interpretation
tag: core
show: none, a short itemized list
words: five lines: "Intercept, original scale: $\widehat\beta_0 = -10.5$ minutes, for a Monday order at hour 0, distance 0, no items"; "Hour: 1.76 minutes per hour (ridge 1.46, least squares 1.87)"; "Distance: 2.37 minutes per mile (ridge 2.19, least squares 2.79)"; "Day: keeps Tue, Fri, Sat; drops Wed, Thu, Sun, predicted like Monday"; "Items: keeps 9 of 27, minutes per additional unit of the item"; then two lines: "Nonzero lasso estimates are shrunken toward zero, so biased"; "`lm()` standard errors and $p$-values do not apply"
reveal: on arrival: the five coefficient lines; click 1: the two closing lines
say: read in order; intercept: on the original scale, beta-hat_0 = −10.5 minutes is the predicted time of a Monday order placed at hour 0, at distance 0, with no items, far outside the data; the standardized-scale intercept is y-bar = 26.7 minutes; a Monday order with no items at the training orders' mean hour, 16.2, and mean distance, 3.05 miles, has predicted time 25.3 minutes; hour and distance: each hour later adds 1.76 minutes (ridge 1.46, least squares 1.87), and each mile adds 2.37 minutes (ridge 2.19, least squares 2.79), holding the other features fixed; relative to least squares, ridge regression shrinks the two by 22% and 21%, the lasso by 6% and 15%; day: the lasso keeps the dummies for Tue, Fri and Sat, with estimates −1.1, 2.0 and 4.4 minutes, and drops those for Wed, Thu and Sun; as in the Subset Selection lecture, a dropped dummy merges its day into the reference, so the model predicts Wed, Thu and Sun orders like otherwise identical Monday orders; items: the lasso keeps 9 of the 27 items; each unit of item_01, item_03, item_27 and item_07 raises the predicted time, by 1.00, 0.41, 0.28 and 0.13 minutes, and each unit of item_16, item_26, item_08, item_18 and item_11 lowers it, by 1.55, 0.60, 0.30, 0.27 and 0.23 minutes; the other 18 items do not affect the prediction; read these signs with care: item_16, with the most negative item estimate, is in only 3 of the training orders, and the repeated samples show how much the kept items depend on the training sample (from Selected sets: its lasso estimate is −1.55, but least squares on the evaluation orders gives 0.27 with p-value 0.28, so it is not shown to slow deliveries; the lasso fit also drops item_10, the most often selected item); of the 14 nonzero lasso estimates, 13 are smaller in absolute value than their least squares counterparts; the nonzero lasso estimates are shrunken toward zero, by lambda/(2n) in the orthogonal case, so they are biased, and the repeated samples show the bias; because the features were selected using the same data, the standard errors, t-statistics and p-values that lm() would report, for the lasso fit or for least squares refit to the selected features, do not apply, as in the subset selection lecture; glmnet() reports none
note: the chapter's bulleted list that follows `coef-figure` (Intercept, Hour and distance, Day, Items), cut to labels with the chapter's numbers for the intercept, hour and distance, plus the closing sentences of the section (the shrinkage and `lm()` statements), laid out as a list (a re-layout, not new content). The intercept is read first, per `CONVENTIONS.md`. The -10.5, 1.76, 1.46, 1.87, 2.37, 2.19, 2.79, 9 and 27 are inline R in the chapter, quoted from the frozen markdown, and are on the slide; the 26.7, 16.2, 3.05, 25.3, −1.1, 2.0, 4.4, the item estimates, 22%, 21%, 6%, 15%, 3, 0.27, 0.28, 18, 14 and 13 are in `say:` only. **Added from the revised chapter:** the shrinkage percentages and the item_16 caution are in `say:` only, not on the slide. The day line names the kept and dropped days, which the chapter's inline R lists.

---

# Repeated training samples

## 20. Repeated training samples
tag: core
show: none (transition slide, title only)
words: none
say: the ridge lecture divided the test orders into 4,000 evaluation orders and a pool of 5,912 and drew 500 samples of n pool orders; the next random draws here are the same, so the samples, and the folds drawn within each, are the ridge lecture's; in each sample lambda is chosen by 10-fold cross-validation, for the lasso and for ridge regression on the same folds, each is refit, and its MSE at the evaluation orders is compared with that of least squares fit to the same sample, for n = 100 and n = 300

## 21. Test MSE
tag: core
show: figure — rep-figure (violin plots of the percent change in MSE at the evaluation orders relative to least squares, for ridge and the lasso, over 500 training samples of 100 orders and of 300 orders), the figure alone
words: none
say: the figure plots, for each sample, the percent change in MSE relative to least squares, in violins with quartile lines and the median; below 0 is better than least squares; the facts the speaker reads off the violins are on the next slide
note: the chapter's `rep-figure` under `### Test MSE`, alone. The figure is already a violin plot with quartile lines; no boxplot to flag. No numbers other than the figure's.

## 22. Average over samples
tag: core
show: none, a short itemized list of two lines
words: two lines: "$n = 100$: the lasso has the lower MSE than least squares in 94% of the samples; its average MSE is 15.0% below"; "$n = 300$: the lasso has the lower MSE in 56% of the samples; its average MSE is 0.6% above least squares"
say: with n = 100 the average MSE is 19.19 for the lasso, 21.74 for ridge regression and 22.58 for least squares; the lasso has a lower MSE than least squares in 94% of the samples and than ridge regression in 94%; ridge regression beats least squares in 72%, the ridge lecture's figure; on these data, with 100 training orders, the lasso's advantage is not an accident of one training sample, although its average MSE, 15.0% below that of least squares, is a smaller gain than the 23.0% on the test orders; this training sample is a favorable draw for the lasso: the median gain over the samples is 13.5%, 90% of the gains lie between −1.9% and 31.5%, and 18.4% of the samples gain at least as much as this one, about the 82nd percentile; with n = 300 the averages are 16.04, 15.97 and 15.94; the lasso beats least squares in 56% of the samples, but its average MSE is 0.6% above that of least squares: it loses less often than it wins, but by more; with 300 orders least squares has little variance left to remove, and neither penalty improves on it on average
note: **not a figure or table the chapter has**: the two lines are the chapter's own sentences of the two paragraphs after `rep-figure` under `### Test MSE`, laid out as a list and cut (a re-layout, not new content). The title is not a chapter heading; "Average over samples" names what the lines report. The 94%, 15.0%, 56% and 0.6% are inline R in the chapter, quoted from the frozen markdown, and are on the slide; the 19.19, 21.74, 22.58, 94% (ridge), 72%, 23.0%, 13.5%, −1.9%, 31.5%, 18.4%, 82nd percentile, 16.04, 15.97 and 15.94 are in `say:` only. This slide is what keeps the test MSE of slide 17 from being read as the gain to expect.

## 23. Selected sets
tag: core
show: figure — freq-figure (the share of the 500 training samples in which the lasso keeps each feature, for $n = 100$ and $n = 300$, with a star on the features kept by the lasso fit to the training orders), the figure alone
words: none
say: the figure plots how often the lasso kept each feature over the samples; with n = 100, hour and distance are kept in 100.0% and 99.8% of the samples and each item in between 35% and 53%; the lasso keeps a median of 16 features, from 4 to 35, and the 500 samples give 494 different selected sets; with n = 300 it keeps more, a median of 29, and each item in more samples; the selected items are not the only items that slow deliveries: outside the workflow, least squares fit to the 4,000 evaluation orders gives 25 of the 27 items a positive estimate with p-value below 0.05, a median of 0.6 minutes per item, the largest for item_01 and item_10, the two items the lasso keeps most often; even item_10 is kept in only 53% of the samples; the lasso fit to the training orders drops item_10 and gives item_16 its most negative item estimate, −1.55 minutes, where least squares on the evaluation orders gives 0.27 (p-value 0.28); of the 5 items with negative estimates in the lasso fit to the training orders, 4 have a positive estimate with p-value below 0.05 on the evaluation orders; almost every item slows deliveries a little; with 100 orders those small effects are estimated with large error, and which of them clear the threshold depends on the noise in the sample; the lasso predicts better here by setting to zero estimates too noisy to help the predictions, not by finding the items whose effect is zero; a dropped item is not shown to have no effect
note: the chapter's `freq-figure` under `### Selected sets`, alone. The 100.0%, 99.8%, 35%, 53%, 16, 4, 35, 500, 494, 29, 4,000, 25, 27, 0.6, 5, 4, −1.55, 0.27 and 0.28 are inline R in the chapter, quoted from the frozen markdown, and are in `say:` only. The figure is tall (7.5 by 8 inches), so it is set at height 540; no bullet lines under it. The paragraph about the items that slow deliveries is in `say:` only (the chapter's "outside the workflow" illustration, not a slide).

## 24. Coefficient bias
tag: optional
show: figure — bias-figure (violin plots of the hour and distance coefficients, on the original scale, of least squares, ridge and the lasso over the 500 samples of 100 pool orders, with quartile lines, the mean as a diamond and the evaluation-orders least squares coefficient as a dashed line), the figure alone
words: none
say: the figure plots the estimates of the hour and distance coefficients, on the original scale, from the three fits to each of the 500 samples of 100 pool orders, in violins with quartile lines and the mean (diamond), with the least squares estimates from the 4,000 evaluation orders as dashed lines; over the samples, least squares averages 1.79 minutes per hour and 2.70 per mile, close to the evaluation orders' 1.73 and 2.82; the lasso averages 1.63 and 2.34 (zeros included), 9% and 13% below the least squares averages: the nonzero lasso estimates are biased toward zero; ridge regression averages 1.50 and 2.30, 16% and 15% below; the lasso plausibly predicts better than ridge regression on these data for two reasons: it sets to zero the item estimates too noisy to help the predictions, and ridge regression has one lambda for all 35 coefficients, so a lambda large enough to shrink the noisy item estimates also shrinks the large hour and distance estimates more than the lasso does, in the fit to the training orders and on average over the samples; neither reason has been isolated from the other here; optional: fourth in the drop order (say that the lasso's and ridge's average estimates are below least squares')
note: the chapter's new `bias-figure` under `### Coefficient bias`, alone, placed after Selected sets as in the chapter. The figure is already a violin plot; no boxplot to flag. Set at height 540 as the other wide figure (rep-figure); no bullet lines under it. **Core or optional: optional**, so the core budget stays at about 38 minutes after the fourth tab of slide 9 (see Timing). Not in the Today agenda: an optional slide is not listed (as with Data, Best subset selection and glmnet scaling), so the nested outline is unchanged. The 1.79, 2.70, 1.73, 2.82, 1.63, 2.34, 9%, 13%, 1.50, 2.30, 16% and 15% are inline R in the chapter, quoted from the frozen markdown, and are in `say:` only. The chapter's mechanism sentence ("plausibly ... Neither reason has been isolated") is in `say:` only.

## 25. Conclusion
tag: core
show: none, a flat bulleted list of five takeaways
words: five short lines, in the order of the lecture: "The lasso penalizes absolute coefficients, so some estimates are exactly zero"; "Soft thresholding shrinks estimates and zeroes the small ones"; "Choose $\lambda$ by cross-validation; evaluate once on test data"; "The lasso's gain depends on the data and the sample size"; "The selected set is unstable and the nonzero lasso estimates are biased"
say: the lasso's geometry gives exact zeros, where ridge regression's estimates are shrunken but, except by coincidence, not zero; the smallest cross-validation estimate is optimistic as an estimate of the chosen model's error, because lambda was chosen to make it small; whether the lasso predicts better than ridge regression or least squares depends on the data and the training sample size, and is best judged over repeated samples rather than one; the set of features it selects can change from sample to sample, especially when many features have small effects of similar size, so a dropped feature is not shown to have no effect; the nonzero lasso estimates are shrunken toward zero, so biased; lm() standard errors and p-values do not apply to the nonzero lasso estimates; the next lecture begins dimension reduction with principal components: directions of maximum variance in the features, their loadings and scores, and the proportion of variance each explains
note: shortened to five phrases after the instructor's review (the earlier six wrapped to two lines at the default font); the optimism of the smallest cross-validation estimate, the 'except by coincidence' qualification and 'toward zero' stay in the speaker notes. The takeaways are drawn from the chapter's `## Conclusion` paragraphs.
---

# Not in this deck

Cut from the lecture's core line, with their assets and original content, so
they can come back.

## Parked content

- **Derivation of soft thresholding** (the chapter's RSS display
  $RSS = \sum_i(y_i - \bar y)^2 - 2n\sum_j\beta_j\widehat\beta_j + n\sum_j\beta_j^2 = c + n\sum_j(\beta_j - \widehat\beta_j)^2$,
  the one-coefficient problem and its three bullets): the `derive` objective's
  content; only the result is on slide 11 and the argument is in slide 11's
  `say:`.
- **Argument for $\lambda_{\max}$** (the change in the RSS and in the penalty when
  one estimate leaves zero): in slide 7's `say:`.
- **Coordinate descent** (the chapter's last paragraph under `### glmnet scaling`):
  in slide 11's `say:`.
- **glmnet check** (the chunk `glmnet-conversion` and the circles-on-the-line check
  of the conversion): the check is in slide 13's `say:`; the code is not shown.
- **Features and model equation** (the ridge lecture's `### Features` slide and the
  $p = 35$ features with 6 day dummies): in slide 1's `say:`; the chapter has no
  such subsection.
- **Selected items against least squares on the evaluation orders** (the chapter's
  "outside the workflow" paragraph): in slide 23's `say:` only.
- **Chapter code callouts** (`### Code`) and the visible code chunks
  (`delivery-split`, `features`, `lambda-max`, `glmnet-conversion`, `cv-lasso`,
  `test-evaluation`, `repeated-design`): not shown; the deck never shows a chunk's
  source.
- **`### Beyond this course` (never used):** the Bayesian interpretation, the
  elastic net, the one-standard-error rule, the group lasso and inference after
  selection (the callout at the end of `### Coefficient bias`).

---

# Reference: assets used by this deck

- **Figures (PNG in `_freeze/06-regularization/30-lasso/figure-html/`, each with a
  `-1.png` suffix):** item-figure (slide 2), ridge-path-figure (3),
  two-feature-figure (5), geometry-base-figure, geometry-lasso-figure,
  geometry-ridge-figure, geometry-corner-figure (the four tabs of slide 9), soft-figure (12),
  lasso-path-figure, nonzero-figure (the two tabs of slide 14), cv-figure (16),
  coef-figure (18), rep-figure (21), freq-figure (23), bias-figure (24). That is all
  15 of the 15 chunk figures in the freeze directory.
- **Tables (kable, copied from the frozen markdown):** `test-table-display` (slide
  17, the `test-table` kable). It is the chapter's only table.
- **Console output (frozen markdown):** none; the chapter prints no console output,
  and the deck has no code slide.
- **Equations on slides:** the lasso criterion (6); the $\lambda_{\max}$ condition
  (7); the constraint regions (8); the $\ell_0$ budget (10); the lasso and ridge
  estimates for orthogonal features, with the orthogonality condition (11); the
  `glmnet()` criterion and the conversion $\lambda = 2n\lambda_{\text{glmnet}}$
  (13). **Parked:** the RSS display and the one-coefficient problem of soft
  thresholding, the change-in-RSS argument for $\lambda_{\max}$, and the Bayesian
  display of the `### Beyond this course` callout. Every equation that mentions
  `\hat` is written with `\widehat` in the deck.
- **Numbers quoted from inline R in the frozen markdown (never retyped or
  recomputed). On slides:** 35, 9,912 and 100 (1); 967.4 (7); 14 is in the table (17);
  $-10.5$, 1.76, 1.46, 1.87, 2.37, 2.19, 2.79, 9 and 27 (19); 94%, 15.0%, 56% and
  0.6% (22). The deck's `derived-from` comment records `uncommitted`. **In speaker
  notes only:** 10,012, 36 (1); 1, 20, 22.9, 31.4, 26.5 (2); 101, 1,000,
  $4.0 \times 10^{-3}$ (3); 0.06 (5); 3.05, 4.64, 0.00, 1.50, 0.85, 1.24, 3.7, 0.97,
  1.59 (9); 150, 0.40, 0.75, 28, $1.4 \times 10^{-15}$ (12); 5.51, 7.35 (13); 891,
  631, 447, 29, 0.47, 0.01 (14); 20.20, 89.1, 0.446, 29.23, 24.57, 28.2, 50, 158,
  16.65, 23.76, 23.51, 34.95, 9.03, 1.6, 2.5, 19.62, 29.52, 58%, 0.90, 20.21, 79.4
  (16); 16.96, 20.38, 22.02, 16.8%, 23.0%, 3.42, 0.16, 1.19, 1.33 (17); 26.7, 16.2,
  25.3, $-1.1$, 2.0, 4.4, 1.00, 0.41, 0.28, 0.13, 1.55, 0.60, 0.30, 0.27, 0.23, 22%,
  21%, 6%, 15%, 3, 18, 14, 13 (19); 19.19, 21.74, 22.58, 72%, 13.5%, −1.9%, 31.5%,
  18.4%, 82nd percentile, 16.04, 15.97, 15.94 (22); 100.0%, 99.8%, 35%, 53%, 16, 4,
  494, 29, 25, 0.6, 5, 0.27, 0.28 (23); 1.79, 2.70, 1.73, 2.82, 1.63, 2.34, 9%, 13%,
  1.50, 2.30, 16%, 15% (24).
- **Chunk names to confirm at build time:** the freeze directory's `figure-html/`
  holds the 15 PNGs (each with a `-1.png` suffix), all 15 used; the notes' tab names
  are "RSS contours / + Lasso / + Ridge / Estimates at the corner" (slide 9) and "Coefficient path / Nonzero
  estimates" (14); `result.markdown` has one table block and no
  `cell-output-stdout` or `cell-output-stderr` blocks.

Not available to slides: anything inside a `### For example,` or
`### Beyond this course` callout (here, the Bayesian interpretation, elastic net,
one-standard-error rule, group lasso and inference-after-selection callout at the
end of Coefficient bias; the chapter has no `### For example,` callout).
