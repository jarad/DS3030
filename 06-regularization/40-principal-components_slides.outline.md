# Slide outline: Principal Components

(drafted 2026-10-21)

Outline for `40-principal-components_slides.qmd` (Mon 2026-10-26, one 50-minute period, MWF
1:10-2:00; ISLR2 6.3, the first lecture of dimension reduction). **This file is the spec; the deck is built from it, and this file describes the deck as it stands.** Edit it freely: reorder, cut, reword, change `tag:`, add notes. When it says what you want, ask for the deck to be refreshed and `slides-author` will implement exactly these slides.

Drafted 2026-10-21 against `40-principal-components.qmd`. The chapter is **not yet committed**, so the deck's `derived-from` comment records `uncommitted` in place of a hash; replace it with the chapter's short hash (`git log -1 --format=%h -- 06-regularization/40-principal-components.qmd`) once the chapter is committed. The frozen output `_freeze/06-regularization/40-principal-components/execute-results/html.json` is current: its recorded `hash` equals the md5 of the chapter file as it stands, which includes the "Slides for this lecture" link on the line after `# Principal Components` (inserted when this outline was drafted, followed by a re-render of the chapter). The freeze directory also holds two stale PNGs from chunks that were merged away, `cumulative-figure-1.png` and `scores-figure-1.png`; the deck uses neither.

**Where this deck sits in the period.** The whole 50-minute period is this deck. It is sized for that: 26 slides including the title, four transitions and the closing slide, of which 19 core slides (the agenda, 17 content slides and the closing slide) come to about 37 minutes at the estimates below, and 2 optional slides come to about 3.5 more, leaving about 9 minutes of the period as a buffer for questions and for the tabs the instructor wants to dwell on.

The chapter's `##` sections are Diamond measurements, First principal component, Later components, Scaling, Interpretation, Unsupervised learning and Conclusion. It is about 990 lines, 415 of them collapsed code, with 13 figures, 1 kable table and no console output (no chunk prints text; the chapter's inline R carries the numbers), on one running example (`ggplot2::diamonds`: six numeric measurements of 53,917 retained diamonds; the price is never used until the Price slide). **The deck spends slides on a subset of it.** The core line is: the diamond data and which columns are the features, the correlated measurements and the standardized features (Diamond measurements); the two-feature picture of variance and distance, the loading vector and scores, the eigenvector result and the closest-line result (First principal component); the later components, the proportion of variance explained with its table and scree plot, and the choice of $M$ (Later components); the unstandardized first component (Scaling); the loadings of all six components and how to read them (Interpretation, Loadings); and the price against the scores and the unsupervised, not-variable-selection statement (Interpretation, Price and Prediction). The deck does **not** cover the recording-errors figure and the 23 removed diamonds, the two-feature eigenvalues $1 \pm r$, the first loading vector as a printed display for six features, the remaining-variation violins, the proof that the later components are the later eigenvectors, the `prcomp()` check, the outlier-sensitivity paragraph, the explanation of the sign of a loading vector as an equation or the `### Beyond this course` callout; those are parked under "Not in this deck" below. Mapped onto the chapter's six learning objectives:

1. the loading vector and scores of the first component, and the eigenvector result by maximizing the variance of the scores subject to $\left\|\phi_1\right\| = 1$: slides 5 (the tabs), 6 and 7;
2. why the first component is also the closest line: slides 5 (the last tab) and 8;
3. the later components as orthogonal directions of decreasing variance, the proportion of variance explained and its cumulative form, and choosing $M$ as a judgment: slides 10, 11, 12, 13 and 14;
4. why the features are standardized and which explanatory variable dominates the first component when they are not: slides 16 (optional) and 17, and slide 3 for the standardization itself;
5. interpreting loadings and scores, and the arbitrary sign: slides 19, 20 (the sign is the last line) and 21 (optional);
6. unsupervised, not variable selection, and the component with the most variance need not be the best predictor: slides 22 and 23.

Optional: Raw units (slide 16) and Scores (21). If time is short, drop in this order: Scores (21; say that the first two scores place each diamond and that price rises from left to right), Raw units (16; say that the six explanatory variables have standard deviations from 0.47 to 2.23 in different units), then the extra tabs of Two features (5; show "Data", "First component" and "All directions"), then the second click of Components kept (14). Four transition slides (4, 9, 15, 18), no live widget, no code slide and no console slide.

Nothing here is new content. Every `show:` points at something that already exists in `40-principal-components.qmd`, so the deck distills the notes and never invents. If a slide needs something the chapter doesn't have, flag it with `needs:` and it goes back through `notes-author` and `proof-reader` first. No slide in this outline needs one. Slides 1, 10, 14, 20, 23 and 24 lay out the chapter's own words as lists in a form the chapter does not have, and slides 12 and 20 have titles that are not chapter headings; each is marked with a `note:`.

**Response variable and explanatory variables.** For `ggplot2::diamonds` (slide 1, a words-only slide that precedes the data figure) the response variable is `price`, in US dollars, which the lecture does not use until slide 22; the explanatory variables are `carat`, `depth`, `table`, `x`, `y` and `z`; `cut`, `color` and `clarity` are categories with no numeric scale and are left out. The $p = 6$ **features** are the six standardized explanatory variables, and the price is not a feature (slide 1 says both). The deck uses "explanatory variables" for the raw columns and "features" for what enters the analysis, per `CONVENTIONS.md`.

**Symbols,** per `CONVENTIONS.md` and the chapter: $n$ the number of retained diamonds (53,917, in `say:` only) and $p = 6$ the number of features; $\tilde x_{ij}$ the standardized features, $\tilde{\mathbf{X}}$ their matrix and $\tilde x_i$ its row $i$; $\mathbf{R}$ the sample correlation matrix; $\phi_m$ the loading vector, $Z_m$ the component and $z_{im}$ the scores of component $m$; $v_m$ the variance of its scores (the eigenvalue of $\mathbf{R}$); $M$ the number of components kept. The equations are copied from the chapter's source; the chapter has no `\hat` in these equations, so `\widehat` is not needed, and the one `\hat` that the notes use in `say:` is not an equation.

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

`reveal:` lists the clicks in order, as "on arrival: ...; click 1: ...; click 2: ...". Each click is one `{.fragment}` block in the deck. Use it on slides that stack several equations or lines, so the content appears as it is discussed. Figures, tabsets and code slides carry no fragments.

`show:` types: `equation` (copied from the chapter's source; `\widehat` for `\hat` in slides), `figure` (the named chunk's PNG from `_freeze/`), `table` (the named kable chunk, copied from the frozen markdown), `tabset` (several figures on ONE slide as a `.panel-tabset`, one tab per figure; the tab labels are the chapter's own tab names), `code` (a chunk's source, shown as a plain code block), `console` (a chunk's printed R output, verbatim), `link` (a pointer back to the notes page, for anything that cannot be a static image), `none` (a words-only slide). A slide may combine two `show:` items, for example an equation beside a figure. `words:` is the only prose on a slide and never uses a middle-dot separator: several short claims are an itemized list (one idea per bullet) or a table. **A figure or tabset slide carries the figure alone, full width, and no `words:` line; the facts that were bullet lines go to the start of `say:`.** The exceptions are slides where the list is itself the content (the agenda, a symbol legend, a words-only data slide).

Slides never draw from a `### For example,` or `### Beyond this course` callout.

Equations use the bracket convention (`E[\cdot]` and `Var[\cdot]` always square, other nested groupings cycling `()`, `[]`, `{}`) and `\widehat` for `\hat`. Inside `$...$` a percent sign is written `\%` and a thousands comma `{,}` (none is needed on these slides).

**Timing:** 26 slides including the title slide (slides 0 to 24 plus the title slide): 4 transitions (no time), 19 `core` slides (the agenda, 17 content slides and the closing slide) and 2 `optional`. The estimates, in minutes: 0 (0.5), 1 (1.5), 2 (2), 3 (1.5), 5 (4), 6 (2.5), 7 (3), 8 (2), 10 (2), 11 (1.5), 12 (1), 13 (2), 14 (1.5), 17 (3), 19 (2.5), 20 (2), 22 (2), 23 (2), 24 (0.5), about 37 minutes of core slides; the optional slides add 16 (1.5) and 21 (2), about 3.5 minutes, so the whole deck is about 40.5 minutes with about 9 minutes of buffer in the period. The slowest are the four-tab Two features slide (5) and Maximum variance (7), the two slides that make the argument. If the lecture is running behind, the drop order above frees about 3.5 minutes at once and more with the tabs.

---

## 0. Today
tag: core
show: none, a nested bulleted list
words: agenda as a nested outline: Diamond measurements (no children); First principal component, with Loadings and scores, Maximum variance and Closest line nested beneath it; Later components, with Orthogonal directions, Variance explained and Components kept nested beneath it; Scaling (no children); Interpretation, with Loadings and Unsupervised learning nested beneath it
say: distilled from the chapter's six learning objectives and the slides this deck spends time on: the loading vector and scores of the first component and the eigenvector result; the closest-line view; the later components, the proportion of variance explained and the choice of M; why the features are standardized; reading the loadings; and that principal component analysis is unsupervised and not variable selection; the recording errors and the 23 removed diamonds, the two-feature eigenvalues, the remaining-variation violins, the proof for the later components, the prcomp() check, the outlier-sensitivity paragraph, the raw units and scores slides (optional) and the Beyond this course callout are in the notes and not in the agenda; this lecture begins dimension reduction: the previous three lectures kept some of the p features or shrank their estimates, and this one replaces the p features by M < p linear combinations of them, the principal components; here M is the number of components kept, and in the ridge and lasso lectures it was the number of repeated training samples; the next lecture regresses on them; the timing note in the speaker notes: if time is short drop in this order Scores, Raw units, the extra tabs of Two features, the second click of Components kept
note: the notes chapter's learning objectives are the source; the chapter has no "Today" section. The DS3030 title slide carries the chapter title. Diamond measurements and Scaling are top-level items with no children (Raw units and Scores are optional, so they are not listed). First principal component, Later components, Scaling and Interpretation each have one transition (4, 9, 15, 18); Diamond measurements opens the deck with no transition, and the chapter's `## Unsupervised learning` is shown inside the Interpretation part with no transition of its own, to avoid a transition for two slides. Layout: the list is set in two columns (Diamond measurements, First principal component and Later components on the left, Scaling and Interpretation on the right), as on the lasso deck, since 12 lines do not fit one column at the deck's font size.

## 1. Diamond measurements
tag: core
show: none, a words-only data slide (a short itemized list)
words: "Question: can fewer than six directions capture most of the variation in these numbers?"; "Explanatory variables: `carat`, `depth`, `table`, `x`, `y`, `z`"; then "Features: these six, standardized"; "Response variable: `price`, not used in this lecture"
reveal: on arrival: the question and the explanatory variables; click 1: the features line and the response variable line
say: diamonds are described by six numbers: weight, two proportions and three physical dimensions; ggplot2::diamonds records 53,940 diamonds, of which 53,917 are retained after 23 with an impossible or extreme dimension are removed (20 with a dimension of 0 mm and 3 with an extreme value of more than 20 mm, widths of 58.9 and 31.8 mm and a depth of 31.8 mm on diamonds whose other dimensions are 5.12 to 8.09 mm), a rule in the notes' Recording errors figure; carat is the weight (one carat is 200 mg); depth is the total depth percentage, the height of the diamond as a percentage of its average width, 100 z / [(x + y)/2], computed from the three dimensions; table is the width of the flat top facet as a percentage of the widest point; x, y and z are the length, width and depth in mm; cut, color and clarity are ordered categories with no numeric scale, so they are left out; the response variable is the price, which this lecture does not use, and it is not a feature; the features are the standardized explanatory variables, p = 6; the price comes back on the Price slide as an outside check
note: the chapter's `**Question.**` and `**Data.**` paragraphs under `### Data` and the sentence "The features are the standardized explanatory variables" of `### Features`, laid out as a list (a re-layout, not new content); the 6 is "six" in the chapter's own words and the $p = 6$ is inline R there. The 53,940, 53,917, 23, 20, 3, 58.9, 31.8, 5.12 and 8.09 are inline R in the chapter, quoted from the frozen markdown, and are in `say:` only. Words-only, so the response variable and the explanatory variables may be listed on the slide; the data figure that follows carries no list. **The slide title is the chapter's `## Diamond measurements`.** Recording errors (the chapter's `cleaning-figure`) is parked; see "Not in this deck".

## 2. Correlated measurements
tag: core
show: figure — pairs-figure (the scatterplot matrix of the six explanatory variables for 1,000 retained diamonds, with the correlations over all retained diamonds in the upper panels), the figure alone
words: none
say: the lower panels plot each pair of explanatory variables for 1,000 diamonds drawn at random from the retained ones and the upper panels give the correlations over all 53,917; carat, length, width and depth in mm rise together, with correlations 0.98 to 1.00; length, width and depth are close to linear in one another, and carat curves upward against each of them, since weight grows with volume; depth percentage and table are nearly unrelated to these four (correlations −0.03 to 0.20) and weakly to each other (−0.30); four of the six explanatory variables are close to one measurement, the size of the diamond; depth percentage is not a separate measurement: over the n retained diamonds, recorded depth differs from 100 z / [(x + y)/2] by a median of 0.03 percentage points, the size of the rounding in the recorded values; only 77 diamonds differ by more than 1 point, the largest by 44.5 points; the six explanatory variables therefore carry five measurements: weight, table and the three dimensions; depth percentage is nearly uncorrelated with size because it records the depth z relative to x and y, a shape, not a size
note: the chapter's `pairs-figure` under `### Correlated measurements`, alone. The figure is tall (8.5 by 8 inches); it is left to quarto's auto-stretch, which fits it to the space under the title. The 53,917, 1,000, 0.98, 1.00, −0.03, 0.20, −0.30, 0.03, 77 and 44.5 are inline R in the chapter, quoted from the frozen markdown, and are in `say:` only. The chapter's figure uses points, not boxplots; nothing to flag.

## 3. Features
tag: core
show: equation — the chapter's standardization display and the display of the sample correlation matrix, with a three-label legend and a one-label legend
words: the display $\tilde x_{ij} = \frac{x_{ij} - \bar x_j}{s_j}, \qquad s_j = \sqrt{\frac{1}{n}\sum_{i=1}^n\left(x_{ij} - \bar x_j\right)^2}$; then an itemized list of three labels: "$x_{ij}$ — explanatory variable $j$ of diamond $i$", "$\bar x_j$, $s_j$ — mean and standard deviation of explanatory variable $j$", "$\tilde x_{ij}$ — feature $j$ of diamond $i$"; then the display $\mathbf{R} = \frac{1}{n}\tilde{\mathbf{X}}^\top\tilde{\mathbf{X}}$ with the one-item legend "$\mathbf{R}$ — sample correlation matrix"
reveal: on arrival: the standardization display; click 1: the three labels; click 2: the display of $\mathbf{R}$ and its label
say: the features are the standardized explanatory variables, in the order carat, depth, table, x, y, z, so p = 6; the mean and the standard deviation (divisor n) are the ridge lecture's; each feature has mean 0 and (1/n) times the sum of its squares equal to 1; R is the p by p sample correlation matrix, whose entries are the upper panels of the scatterplot matrix; the bold R is a matrix and is unrelated to the coefficient of determination R^2, which appears once, in the section on price; the section on scaling shows what happens without standardization
note: the displays are the chapter's `### Features` displays, verbatim without the trailing comma of the first; the legend is cut from the chapter's `where` bullets. The first display is set at 0.7em, the legend at 0.6em and the second display at 0.7em.

---

# First principal component

## 4. First principal component
tag: core
show: none (transition slide, title only)
words: none
say: the first principal component is the direction in the p-dimensional feature space along which the diamonds vary most; this section shows it for two features, defines the loading vector and the scores, and shows that the direction of largest variance is also the line closest to the data

## 5. Two features
tag: core
show: tabset — the chapter's four-tab figures with its own tab names, full width: "Data" (dt-data-figure), "Depth axis" (dt-axis-figure), "First component" (dt-pc1-figure), "All directions" (dt-theta-figure)
words: none
say: the first tab plots standardized table against standardized depth for the first 250 diamonds of the subsample, and the other tabs add a direction through the origin and each diamond's perpendicular projection onto it; the cloud is tilted down to the right, the negative correlation r = −0.30 between depth and table; projected onto the depth axis, the diamonds' positions along the line have variance 1.00, the variance of standardized depth; along the line at 135 degrees, which runs with the tilt, they spread more, variance 1.30, and the projection segments are shorter; the last tab sweeps the direction through every angle: the variance of the positions along the line is largest at the same angle at which the mean squared distance to the line is smallest, and the two curves sum to p = 2 at every angle; for two standardized features with r not 0, the first principal component is always one of the two 45-degree lines (the eigenvalues of R are 1 ± r, with eigenvectors (1, 1)/sqrt 2 and (1, −1)/sqrt 2), the correlation deciding which one and how much variance it carries; with r = 0 the eigenvalues tie and every direction is a first component; if time is short, show "Data", "First component" and "All directions"
note: the chapter's own four-tab set (`#### Data`, `#### Depth axis`, `#### First component`, `#### All directions`) under `### Two features`; no fragments. The title is the chapter's heading. The first three figures are 6 by 6 (the second and third about 6 by 6.3) inches and the fourth 7 by 4.2, so the tabs use the lasso deck's `.square-tabs` rule (images up to 460 px high) so the tab labels and the figure fit. The 250, −0.30, 1.00, 135, 1.30 and 2 are inline R in the chapter, quoted from the frozen markdown, and are in `say:` only. The two-feature eigenvalues $1 \pm r$ are in `say:` only and parked.

## 6. Loadings and scores
tag: core
show: equation — the chapter's first-component display and score display, with a three-label legend and a one-label legend
words: the display $Z_1 = \phi_{11}\tilde X_1 + \phi_{21}\tilde X_2 + \cdots + \phi_{p1}\tilde X_p, \qquad \sum_{j=1}^p\phi_{j1}^2 = 1$; then an itemized list of three labels: "$Z_1$ — first principal component: the combination with the largest sample variance", "$\tilde X_j$ — feature $j$", "$\phi_{j1}$ — loading of feature $j$; $\phi_1 = \left(\phi_{11}, \ldots, \phi_{p1}\right)^\top$ — loading vector"; then the display $z_{i1} = \sum_{j=1}^p\phi_{j1}\tilde x_{ij} = \tilde x_i\phi_1$ with the one-item legend "$z_{i1}$ — score of diamond $i$"
reveal: on arrival: the first-component display; click 1: the three labels; click 2: the score display and its label
say: the first principal component is the linear combination of the features with the largest sample variance, subject to the loadings having unit sum of squares; without the constraint the variance could be made as large as desired by multiplying the loadings by a constant; the loading vector is a unit-length direction in the p-dimensional feature space; the score of diamond i is its signed position along that direction, and the n-vector of scores is z_1 = X-tilde phi_1; in the two-feature figure the line at angle theta has unit direction a = (cos theta, sin theta), each blue segment ends at the projection of a diamond onto it, and the first component is the line with the largest variance of the scores x-tilde_i a; the loading vector and the scores are computed from the n diamonds, so they are estimates; phi_j1 is the loading here, not the dispersion parameter phi of the generalized linear models lecture
note: the displays are the chapter's `### Loadings and scores` displays, verbatim without their trailing commas, with the legend cut from the chapter's `where` bullets and its sentence defining the score. The first display is set at 0.7em, the legend at 0.6em and the score display at 0.7em.

## 7. Maximum variance
tag: core
show: equation — the chapter's variance display, the stationarity display and the result, with labels
words: lead line "Sample variance of the scores of a unit vector $a$"; the display $\frac{1}{n}\sum_{i=1}^n\left(\tilde x_i a\right)^2 = \frac{1}{n}a^\top\tilde{\mathbf{X}}^\top\tilde{\mathbf{X}}a = a^\top\mathbf{R}a$; then the lead line "Maximize $a^\top\mathbf{R}a$ subject to $a^\top a = 1$" and the display $2\mathbf{R}a - 2va = 0 \quad\Rightarrow\quad \mathbf{R}a = va$ with the label "$v$ — Lagrange multiplier"; then an itemized list of two labels: "$\phi_1$ — eigenvector of $\mathbf{R}$ with the largest eigenvalue $v_1$", "$v_1$ — variance of the first component's scores"
reveal: on arrival: the lead line and the variance display; click 1: the maximization lead line, the stationarity display and the Lagrange label; click 2: the two result labels
say: the features have mean 0, so the scores of any unit vector a have mean 0 and sample variance a-transpose R a; to maximize it subject to a-transpose a = 1, introduce a Lagrange multiplier v and set the gradient of a-transpose R a minus v times (a-transpose a minus 1) to zero, which gives 2 R a minus 2 v a equal to zero, so R a = v a; so a maximizing direction is an eigenvector of R with eigenvalue v, and multiplying R a = v a on the left by a-transpose shows that the variance of its scores is v; of all the unit eigenvectors, the one with the largest eigenvalue gives the largest variance: phi_1 is the eigenvector of the sample correlation matrix with the largest eigenvalue v_1, and v_1 is the variance of the first component's scores; both are estimates, computed from the n diamonds, of the leading eigenvector and eigenvalue of the population correlation matrix of the explanatory variables; for the diamonds the estimated loading vector is (0.49, 0.00, 0.12, 0.50, 0.50, 0.50) in the order carat, depth, table, x, y, z, with v_1 = 4.00 against 1 for any single feature, and the loadings figure later in the deck shows it
note: the displays are the chapter's `### Maximum variance` displays, verbatim without their trailing periods; the lead lines and the two labels are the chapter's sentences "To maximize ... introduce a Lagrange multiplier $v$" and the bold sentence "$\phi_1$ is the eigenvector of the sample correlation matrix with the largest eigenvalue $v_1$, and $v_1$ is the variance of the first component's scores", cut. This slide is the `derive` objective's content; the steps are the three displays. The six-feature loading vector and $v_1 = 4.00$ are inline R in the chapter (`### Six features`), quoted from the frozen markdown, and are in `say:` only; the chapter's `### Six features` is not a slide of its own. The displays are set at 0.7em, the leads at 0.8em and the labels at 0.6em.

## 8. Closest line
tag: core
show: equation — the chapter's Pythagoras display and mean squared distance display, with a two-label legend
words: the display $\left\|\tilde x_i\right\|^2 = z_{i1}^2 + \left\|\tilde x_i - z_{i1}\phi_1^\top\right\|^2$; then the display $\frac{1}{n}\sum_{i=1}^n\left\|\tilde x_i - z_{i1}\phi_1^\top\right\|^2 = p - \phi_1^\top\mathbf{R}\phi_1$; then an itemized list of two labels: "$\left\|\tilde x_i - z_{i1}\phi_1^\top\right\|^2$ — squared distance from diamond $i$ to the line", "$\phi_1^\top\mathbf{R}\phi_1$ — variance of the scores"
reveal: on arrival: the Pythagoras display; click 1: the mean squared distance display; click 2: the two labels
say: because phi_1 has unit length, Pythagoras splits each diamond's squared distance from the origin into its squared score and its squared distance from the line; averaging over the diamonds, and using (1/n) times the sum of the squares of each feature equal to 1, the mean squared distance from the diamonds to the line through the origin in direction phi_1 is p minus the variance of the scores; the direction that maximizes the variance therefore minimizes the mean squared distance, so the first principal component is also the line closest to the data; in the last tab of Two features the two curves sum to p = 2 at every angle
note: the displays are the chapter's `### Closest line` displays, verbatim without their trailing periods; the labels are the chapter's sentence "The left side is the mean squared distance ... and it is $p$ minus the variance of the scores", cut. The conclusion sentence (the first component is also the closest line) is in `say:` only. The displays are set at 0.7em and the labels at 0.6em.

---

# Later components

## 9. Later components
tag: core
show: none (transition slide, title only)
words: none
say: the first component leaves most of the size features with almost nothing, but depth and table keep nearly all of their variance, so the next direction should be found mostly in depth and table; the remaining-variation violins in the notes show this (the remaining variances of the four size features are 0.007 to 0.027, and depth and table keep 1.000 and 0.943); this section describes all p components, how much variance each explains, and how many to keep
note: the chapter's `### Remaining variation` figure (`remaining-figure`) is parked; its numbers are in `say:` only.

## 10. Orthogonal directions
tag: core
show: equation — the chapter's ordering of the eigenvalues and the sum of the eigenvalues, with an itemized list of three results
words: lead line "$m$th component: maximum variance among unit vectors orthogonal to $\phi_1, \ldots, \phi_{m-1}$"; the display $v_1 \ge v_2 \ge \cdots \ge v_p \ge 0$; then an itemized list of three labels: "$\phi_m$ — eigenvector of $\mathbf{R}$ with the $m$th largest eigenvalue $v_m$", "$v_m$ — variance of the $m$th component's scores", "scores of different components are uncorrelated"; then the display $\sum_{m=1}^p v_m = \operatorname{tr}\left(\mathbf{R}\right) = p$ with the one-item legend "$p$ — total variance of the standardized features"
reveal: on arrival: the lead line and the ordering display; click 1: the three labels; click 2: the sum display and its label
say: the m-th principal component maximizes the sample variance of the scores among unit vectors orthogonal to phi_1, ..., phi_(m−1), for m = 2, ..., p; the eigenvectors of the symmetric matrix R can be chosen orthonormal and ordered by their eigenvalues, assuming no ties; any unit vector is a = the sum of c_m phi_m with the sum of c_m squared equal to 1, and a-transpose R a is the weighted average of the eigenvalues, the sum of c_m squared times v_m; orthogonality to phi_1, ..., phi_(m−1) forces the first m − 1 weights to zero, and the largest weighted average of v_m, ..., v_p puts all the weight on v_m; so phi_m is the eigenvector with the m-th largest eigenvalue and all p components come from one eigendecomposition; the scores are uncorrelated, because for m not equal to l their sample covariance is phi_m-transpose R phi_l = v_l phi_m-transpose phi_l = 0; the variances add up to p, the trace of R; for the diamonds the sum of the six eigenvalues is 6.00 and the largest correlation between two columns of scores is 2.9 x 10^−11 in absolute value; prcomp() with scale. = TRUE computes the same components: up to sign its loadings pca$rotation agree with the eigenvectors of R to within 1.4 x 10^−10 and its scores are sqrt((n − 1)/n) times the scores here because it standardizes with divisor n − 1, its variances pca$sdev^2, computed with divisor n − 1 as well, equal the eigenvalues v_m (to within 6.3 x 10^−13) because the two factors cancel, and its signs are whatever its algorithm returns
note: the lead line, the ordering and the three results are the chapter's `### Orthogonal directions` sentences and displays, laid out as a list (a re-layout, not new content); the sum display is the last link of the chapter's trace display ($\sum_m v_m = \operatorname{tr}\left(\boldsymbol{\Phi}^\top\mathbf{R}\boldsymbol{\Phi}\right) = \cdots = \operatorname{tr}\left(\mathbf{R}\right) = p$), cut to its last two links. The proof (the weighted average, the trace argument) and the `### prcomp` check are in `say:` only and parked. The 6.00, $2.9 \times 10^{-11}$, $1.4 \times 10^{-10}$, $6.3 \times 10^{-13}$ and $6.3 \times 10^{-10}$ are inline R in the chapter, quoted from the frozen markdown, and are in `say:` only. The chapter's `### Beyond this course` callout (the singular value decomposition, best low-dimensional approximation, variants) is never used. The ordering is set at 0.7em, the leads at 0.8em, the list at 0.7em and the sum display at 0.7em.

## 11. Variance explained
tag: core
show: equation — the chapter's proportion-of-variance display, with a three-label legend
words: the display $\text{PVE}_m = \frac{v_m}{\sum_{l=1}^p v_l} = \frac{v_m}{p}$; then an itemized list of three labels: "$v_m$ — variance of the $m$th component's scores", "$p$ — total variance of the standardized features", "$\sum_{m=1}^M\text{PVE}_m$ — cumulative PVE of the first $M$ components"
reveal: on arrival: the display; click 1: the three labels
say: the proportion of variance explained by component m is its variance over the total variance, which is p for p standardized features; the cumulative PVE of the first M components is the sum of the first M proportions; the next slide gives them for the diamonds
note: the display is the chapter's `### Variance explained` display, verbatim without its trailing comma; the labels are the chapter's `where` clause and its sentence about the cumulative PVE, cut. The display is set at 0.75em and the legend at 0.6em.

## 12. Variance explained by component
tag: core
show: table — pve-table (kable: variance, PVE and cumulative PVE of the six components; copied from the frozen markdown), the table alone
words: none
say: the first component explains 66.7% of the variance of the six features, the second 21.4% and the third 11.4%; together the first 3 explain 99.4%, and the last 3 share the remaining 0.56%; components with small variance are sensitive to a few bad rows: computed from all 53,940 diamonds, the 23 removed ones included, the first 3 variances change by at most 1.7%, but the last 3 sum to 0.100 instead of 0.034, 3.0 times as much
note: the chapter's `pve-table` (the kable in the collapsed `pve` chunk, displayed in `pve-table`), copied verbatim from the frozen markdown, header `$v_m$` kept; no caption on the chapter's table, none added. **The slide title is not a chapter heading** (the table sits under the chapter's `### Variance explained`, which is slide 11's title). The 66.7%, 21.4%, 11.4%, 3, 99.4%, 0.56%, 53,940, 23, 1.7%, 0.100, 0.034 and 3.0 are inline R in the chapter, quoted from the frozen markdown, and are in `say:` only; the table's values are the chunk's own output. The outlier-sensitivity paragraph is in `say:` only and parked.

## 13. Scree plot
tag: core
show: figure — scree-figure (the PVE of each component, the scree plot, and the cumulative PVE, with a dotted line at 90%), the figure alone
words: none
say: the figure plots the PVE of each component, the scree plot, and the cumulative PVE; the PVE falls by a factor of 22 from component 3 to component 4, the largest ratio between consecutive components; the dotted line is the 90% threshold; the cumulative PVE passes it at the third component
note: the chapter's `scree-figure` under `### Variance explained`, alone. **The slide title is "Scree plot",** the chapter's own bold term for the figure (the chapter has no heading for it). The 22, 90% and the third component are inline R in the chapter (`M_elbow`, `M_90`), quoted from the frozen markdown, and are in `say:` only.

## 14. Components kept
tag: core
show: none, a short itemized list
words: two lines: "Elbow: keep the components before the scree plot flattens", "Cumulative threshold: keep the fewest components whose cumulative PVE reaches a chosen level"; then "Diamonds: $M = 3$ by both rules"; then "Both are judgments"
reveal: on arrival: the two rules; click 1: the diamonds line; click 2: the judgments line
say: keeping the first M components replaces the p features by M new variables, the columns of scores z_1, ..., z_M, and M is the dimension of the reduced feature set; for the diamonds the PVE falls by a factor of 22 from component 3 to component 4, the largest ratio between consecutive components, so M = 3 by the elbow; at 90% (the dotted line), M = 3 as well, since the first 2 reach 88.1%; both are judgments, the elbow is read from a picture and the threshold is a choice; neither looks at the price; when the components are used to predict a response, the next lecture chooses M by cross-validation instead; if time is short, skip the second click
note: the bold rules of the chapter's `### Components kept`, cut to labels, plus the chapter's "Both are judgments", laid out as a list (a re-layout, not new content); the diamonds line is the chapter's inline-R "$M = 3$" of both bullets. The 3, 22, 90% and 88.1% are inline R in the chapter, quoted from the frozen markdown; the 3 is on the slide and the 22, 90% and 88.1% are in `say:` only. The title is the chapter's heading.

---

# Scaling

## 15. Scaling
tag: core
show: none (transition slide, title only)
words: none
say: so far the features were standardized; this section shows what changes when they are not, which is the objective to predict which explanatory variable dominates the first component

## 16. Raw units
tag: optional
show: figure — raw-figure (violin plots of the six explanatory variables as recorded, each centered at its mean, on one axis), the figure alone
words: none
say: the figure shows the six explanatory variables as recorded, each centered at its mean, on one axis; on their own scales they spread very differently: the standard deviations are carat 0.47, depth 1.43, table 2.23, x 1.12, y 1.11 and z 0.69, so table varies most and carat least, in units that cannot be compared; if time is short, skip this slide
note: the chapter's `raw-figure` under `### Raw units`, alone. The figure is already a violin plot with quartile lines; no boxplot to flag. The 0.47, 1.43, 2.23, 1.12, 1.11 and 0.69 are inline R in the chapter, quoted from the frozen markdown, and are in `say:` only. Optional: second in the drop order.

## 17. Unstandardized components
tag: core
show: figure — scaling-figure (the first loading vector for the standardized features, for the unstandardized variables and for the unstandardized variables with carat recorded in milligrams, as three panels, each with its PVE), the figure alone
words: none
say: principal components of the centered but unstandardized explanatory variables maximize a-transpose S a, with S the sample covariance matrix, whose diagonal holds the squared standard deviations of the Raw units slide; unstandardized, the first component is mostly table, loading 0.92, the variable with the largest variance, and it no longer measures size; recording weight in milligrams (1 carat = 200 mg) raises the standard deviation of carat to 94.8 and makes the first component almost entirely weight, loading 1.000, explaining 99.9% of a total variance that weight now dominates; standardized features remove the dependence on units: the correlation matrix is the same in carats or milligrams, and the standardized first loading vectors agree to within 1.7 x 10^−14; the features are therefore standardized before principal component analysis unless the explanatory variables share a unit in which their variances are comparable, as the three dimensions in mm would on their own; like the means and standard deviations of the ridge and lasso lectures, the loadings are computed from the data, so when components feed a model that is cross-validated, the standardization and the loadings are recomputed from the training folds in each fold
note: the chapter's `scaling-figure` under `### Unstandardized components`, alone. **The slide title is the chapter's heading.** The 0.92, 94.8, 1.000, 99.9% and $1.7 \times 10^{-14}$ are inline R in the chapter, quoted from the frozen markdown, and are in `say:` only. The figure is 8 by 3.8 inches, left to auto-stretch.

---

# Interpretation

## 18. Interpretation
tag: core
show: none (transition slide, title only)
words: none
say: this section reads the six components for the diamonds: what each loading vector means and how the scores place the diamonds; it closes with what principal component analysis does not do

## 19. Loadings
tag: core
show: figure — loadings-figure (the estimated loadings of all six components as bars, each panel labeled with its component and PVE), the figure alone
words: none
say: the figure plots the estimated loadings of all six components; a loading is the weight a feature receives in the component's score, and each is read relative to the others in its loading vector; PC1: carat, x, y and z load 0.49 to 0.50, table 0.12 and depth 0.00; four perfectly correlated features, uncorrelated with the others, would each load 1/sqrt 4 = 0.5; PC2: depth loads 0.73 and table −0.67, with the size features near zero; PC3: both load positively, 0.67 and 0.73; PC4 to PC6 contrast carat, x, y and z with one another, for example weight against the linear dimensions in PC4, whose carat loading is 0.87, and their variances are small because the four measurements rarely disagree; the next slide gives the reading of each
note: the chapter's `loadings-figure` under `### Loadings`, alone. The figure is 8.5 by 5.5 inches, left to auto-stretch; no bullet lines under it. The 0.49, 0.50, 0.12, 0.00, 0.73, −0.67, 0.67, 0.73 and 0.87 are inline R in the chapter, quoted from the frozen markdown, and are in `say:` only.

## 20. Reading the loadings
tag: core
show: none, a short itemized list
words: four lines: "PC1, size: high score is a large diamond"; "PC2, depth against table: high score is deep with a narrow table"; "PC3, depth and table together: high score is deep and wide-topped"; "PC4 to PC6, disagreements among the size measures"; then one line: "The sign of a loading vector is arbitrary"
reveal: on arrival: the four lines; click 1: the sign line
say: read in order; PC1 is size: a high score is a large diamond; PC2 is a contrast in shape between depth and table, as the two-feature figure found: a high score is a deep diamond with a narrow table, a low score a shallow one with a wide table; depth percentage is z relative to x and y, so the depth part of this component, and of PC3, re-expresses dimensions already in the data rather than adding a measurement; PC3 loads depth and table together: a high score is a diamond that is both deep and wide-topped; PC4 to PC6 are disagreements among carat, x, y and z; the sign: phi_m and −phi_m have the same length and give scores with the same variance, so the sign of a loading vector is arbitrary; flipping it flips every loading and every score of that component and changes no interpretation: "high PC2 is deep and narrow-topped" becomes "low PC2 is deep and narrow-topped"; the chapter flips each vector so that its largest loading in absolute value is positive, and prcomp() and other software may return either sign
note: the bold labels and "A high score is ..." sentences of the chapter's `### Loadings` bulleted list, cut, plus the first sentence of `### Sign`, laid out as a list (a re-layout, not new content). **The slide title is not a chapter heading** ("Reading the loadings" names the list); the sign line is the chapter's `### Sign`. The loading numbers (0.49 to 0.50, 0.12, 0.00, 0.73, −0.67, 0.67, 0.73, 0.87) are in slide 19's `say:` only. The sign argument is in `say:` only and parked.

## 21. Scores
tag: optional
show: figure — biplot-figure (the first two scores of the 1,000 subsampled diamonds, colored by price on a log scale, with the first two loadings of each feature as arrows), the figure alone
words: none
say: the biplot plots the first two scores of the 1,000 subsampled diamonds, colored by price, and draws the first two loadings of each feature as an arrow; the color changes from left to right, from the cheapest diamonds to the most expensive, and much less from bottom to top; the carat, x, y and z arrows nearly coincide and point along the first axis; depth points up and table down; each row of the n by M matrix of scores is a diamond described by M new variables in place of its p features, and with M = 2 the figure is that description; if time is short, skip this slide
note: the chapter's `biplot-figure` under `### Scores`, alone. The figure is 7.5 by 5.3 inches, left to auto-stretch; no bullet lines under it. The 1,000 is inline R in the chapter, quoted from the frozen markdown, and is in `say:` only. Optional: first in the drop order. The color of the points is the price, which the next slide uses; the figure does not say the price entered the analysis (it did not).

## 22. Price
tag: core
show: figure — price-figure (the price against the scores of each of the six components, with the correlation over all diamonds in each panel title), the figure alone
words: none
say: principal component analysis used the six features and never the price; the figure plots price against each component's scores for the subsampled diamonds, and each panel gives the correlation over all n diamonds; price rises with the first component's scores, steeply and with a curve, correlation 0.90; that is an observation about these data, not a fitted model, and nothing in the construction of the first component guaranteed it: the first component is the direction of largest variance among the features, the features of these diamonds happen to vary most in size, and price is also most strongly associated with size; among the later components the largest correlation in absolute value, 0.22, belongs to PC4, whose scores correlate more strongly with price than those of PC2 (0.05) or PC3 (−0.09), although PC4 explains only 0.52% of the variance while PC2 and PC3 explain 21.4% and 11.4%
note: the chapter's `price-figure` under `### Price`, alone. The figure is 8.5 by 5.5 inches, left to auto-stretch; no bullet lines under it. The 0.90, 0.22, 0.52%, 0.05, −0.09, 21.4% and 11.4% are inline R in the chapter, quoted from the frozen markdown, and are in `say:` only.

## 23. Prediction
tag: core
show: none, a short itemized list of three lines
words: three lines: "Unsupervised: computed from the features alone"; "The component with the most variance need not be the best predictor"; "Not variable selection: every component uses all $p$ features"
say: principal component analysis is unsupervised: the loadings, the scores and the variances are computed from the features alone, and the components are ordered by the variance of the features, not by any relation to a response; the component with the largest variance need not be the most useful for prediction; a component with little variance, such as PC4 here, can carry information about the response that the first few do not, and a rule that keeps the first M components by PVE can discard it; because the scores of different components are uncorrelated, the squared correlations of price with the six scores add: they sum to 0.861, which equals the R^2 of the least squares regression of price on all six scores, 0.861; of that total, PC4 accounts for 0.046, and PC2 and PC3 together for 0.010; this is an observation about these data, not principal components regression, and the bold R in this lecture is the correlation matrix, unrelated to R^2; principal components are also not variable selection: every component is a combination of all p features; even the smallest loading in absolute value, that of depth on PC1, is 4.6 x 10^−5, not zero, so computing even the first score of a new diamond requires all six explanatory variables, however few components a model keeps; the next lecture, principal components regression and partial least squares, regresses the price of the same diamonds on the first M components, chooses M by cross-validation, and compares the components with directions that partial least squares chooses using the response
note: the three claims are the chapter's `### Prediction` paragraphs, cut to labels, laid out as a list (a re-layout, not new content); it is the `unsupervised` objective's content. The $4.6 \times 10^{-5}$, `depth`, PC4, 0.861, 0.046, 0.010 and the six explanatory variables are inline R in the chapter, quoted from the frozen markdown, and are in `say:` only. The title is the chapter's heading.

## 24. Conclusion
tag: core
show: none, a flat bulleted list of five takeaways
words: five short lines, in the order of the lecture: "Components are directions of decreasing variance of the features"; "The first component is the top eigenvector and the closest line"; "Choose $M$ from the scree plot or a cumulative PVE; both are judgments"; "Standardize the features unless the units are comparable"; "Components ignore the response and use every feature"
say: the components are ordered by the variance of the standardized features, the proportion of variance explained by component m being v_m over p; the first component's loading vector is the unit vector that maximizes the sample variance of the scores, the eigenvector of the sample correlation matrix with the largest eigenvalue, and it also minimizes the mean squared distance from the data to a line, because the variance and that distance sum to p; the number of components M kept is the dimension of the reduced feature set, and the scree plot's elbow or a cumulative PVE threshold chooses it by judgment; components depend on the units of the explanatory variables, so the features are standardized unless the units are comparable; a component is interpreted from its loadings, whose overall sign is arbitrary; the components are computed without the response, the component with the most variance need not be the best predictor, a low-variance component can matter for prediction, and every component uses every feature; the next lecture, principal components regression and partial least squares, regresses the price of the same diamonds on the first M components, chooses M by cross-validation, and compares the components with directions that partial least squares chooses using the response
note: five phrases drawn from the chapter's `## Conclusion` paragraphs; one line each at the default font, no nesting, no example numbers. The last line draws on the Conclusion's third paragraph.

---

# Not in this deck

Cut from the lecture's core line, with their assets and original content, so they can come back.

## Parked content

- **Recording errors** (the chapter's `cleaning-figure`: the width and the depth against the length of all 53,940 diamonds, with the 23 removed ones marked): a data-processing step; the rule (a dimension of 0 or more than 20 mm) and the counts are in slide 1's `say:`. Its asset is unused.
- **Two-feature eigenvalues** (the chapter's $a^\top\mathbf{R}a = \cos^2\theta + \sin^2\theta + 2r\cos\theta\sin\theta = 1 + r\sin 2\theta$ and the eigenvalues $1 \pm r$): in slide 5's `say:`.
- **Six features** (the chapter's $\phi_1 = \left(0.49, 0.00, 0.12, 0.50, 0.50, 0.50\right)^\top$ with $v_1 = 4.00$): in slide 7's `say:`; the first panel of slide 19 shows it.
- **Remaining variation** (the chapter's `remaining-figure`, violins of $\tilde x_{ij} - z_{i1}\phi_{j1}$ for each feature): in slide 9's `say:`; its asset is unused.
- **Proof for the later components** (the weighted average $\sum_m c_m^2 v_m$, the uncorrelated scores and the trace argument for $\sum_m v_m = p$): in slide 10's `say:`.
- **`prcomp()` check** (the chunk `prcomp-check` and its agreement to within $1.4 \times 10^{-10}$): in slide 10's `say:`; the code is not shown.
- **Outlier sensitivity** (the chapter's paragraph on the removed diamonds and the last three variances): in slide 12's `say:`.
- **Sign of a loading vector as an equation** ($\left(-\phi_m\right)^\top\mathbf{R}\left(-\phi_m\right) = \phi_m^\top\mathbf{R}\phi_m$): in slide 20's `say:`.
- **Chapter code callouts** (`### Code`) and the visible code chunks (`features`, `eigen`, `prcomp-check`, `outliers`): not shown; the deck never shows a chunk's source.
- **`### Beyond this course` (never used):** the singular value decomposition, the best low-dimensional approximation and the variants (sparse, kernel and robust principal components), the callout under `### prcomp`.

---

# Reference: assets used by this deck

- **Figures (PNG in `_freeze/06-regularization/40-principal-components/figure-html/`, each with a `-1.png` suffix):** pairs-figure (slide 2), dt-data-figure, dt-axis-figure, dt-pc1-figure, dt-theta-figure (the four tabs of slide 5), scree-figure (13), raw-figure (16), scaling-figure (17), loadings-figure (19), biplot-figure (21), price-figure (22). That is 11 of the 13 chunk figures of the current chapter. **Unused chapter figures:** cleaning-figure (parked) and remaining-figure (parked). **Stale files in the freeze directory, never used:** `cumulative-figure-1.png` and `scores-figure-1.png` (from chunks merged away; the chapter has no chunk of either name).
- **Tables (kable, copied from the frozen markdown):** `pve-table` (slide 12, the kable built in the `pve` chunk). It is the chapter's only table.
- **Console output (frozen markdown):** none; the chapter prints no console output, and the deck has no code slide.
- **Equations on slides:** the standardization and the correlation matrix (3); the first component, its loading vector and the score (6); the variance, the stationarity condition and the result (7); Pythagoras and the mean squared distance (8); the eigenvalue ordering and the trace (10); the proportion of variance explained (11). **Parked:** the two-feature $1 + r\sin 2\theta$, the proof of the later components, the singular value decomposition of the `### Beyond this course` callout and the sign display. None of the slide equations uses `\hat`, so no `\widehat` is needed.
- **Numbers quoted from inline R in the frozen markdown (never retyped or recomputed). On slides:** $p = 6$ and "six" (1, 3, 6); $M = 3$ (14). **In speaker notes only:** 53,940, 53,917, 23, 20, 3, 58.9, 31.8, 5.12, 8.09 (1); 1,000, 0.98, 1.00, −0.03, 0.20, −0.30, 0.03, 77, 44.5 (2); 250, −0.30, 1.00, 135, 1.30 (5); 0.49, 0.00, 0.12, 0.50, 4.00 (7); 0.007, 0.027, 1.000, 0.943 (9); 6.00, $2.9 \times 10^{-11}$, $1.4 \times 10^{-10}$, $6.3 \times 10^{-13}$ (10); 66.7%, 21.4%, 11.4%, 99.4%, 0.56%, 1.7%, 0.100, 0.034, 3.0 (12); 22, 90% (13); 88.1% (14); 0.47, 1.43, 2.23, 1.12, 1.11, 0.69 (16); 0.92, 94.8, 1.000, 99.9%, $1.7 \times 10^{-14}$ (17); 0.49, 0.50, 0.12, 0.00, 0.73, −0.67, 0.67, 0.73, 0.87 (19); 0.90, 0.22, 0.52%, 0.05, −0.09 (22); $4.6 \times 10^{-5}$, 0.861, 0.046, 0.010 (23). The deck's `derived-from` comment records `uncommitted`.
- **Chunk names to confirm at build time:** the freeze directory's `figure-html/` holds 15 PNGs (each with a `-1.png` suffix), 11 used, 2 unused chapter figures and 2 stale; the notes' tab names are "Data / Depth axis / First component / All directions" (slide 5); `result.markdown` has one table block (`pve-table`) and no `cell-output-stdout` or `cell-output-stderr` blocks.

Not available to slides: anything inside a `### For example,` or `### Beyond this course` callout (here, the singular value decomposition, best low-dimensional approximation and variants callout under `### prcomp`; the chapter has no `### For example,` callout).
