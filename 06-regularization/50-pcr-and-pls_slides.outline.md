# Slide outline: Principal Components Regression and Partial Least Squares

(drafted 2026-10-22; revised 2026-10-22 after the chapter's revision: the Repeated training samples subsection was removed and the headings Components kept and Directions kept renamed; second revision: the chapter's PCR test MSE and PLS test MSE subsections were merged into Test MSE, a Cross-validation estimates subsection was added to Comparison, and the wording cuts, whole-dollar prose and notation changes were mirrored)

Outline for `50-pcr-and-pls_slides.qmd` (one 50-minute period, MWF 1:10-2:00; ISLR2 6.3, the second lecture of dimension reduction). **This file is the spec; the deck is built from it, and this file describes the deck as it stands.** Edit it freely: reorder, cut, reword, change `tag:`, add notes. When it says what you want, ask for the deck to be refreshed and `slides-author` will implement exactly these slides.

Drafted 2026-10-22 against `50-pcr-and-pls.qmd`. The chapter is **not yet committed**, so the deck's `derived-from` comment records `uncommitted` in place of a hash; replace it with the chapter's short hash (`git log -1 --format=%h -- 06-regularization/50-pcr-and-pls.qmd`) once the chapter is committed. The frozen output `_freeze/06-regularization/50-pcr-and-pls/execute-results/html.json` is current: its recorded `hash` equals the md5 of the chapter file as it stands, which includes the "Slides for this lecture" link on the line after the chapter title.

**Where this deck sits in the period.** The whole 50-minute period is this deck: 25 slides including the title, two transitions and the closing slide. 22 of them are timed: 20 core slides (the agenda, 18 content slides and the closing slide) come to about 36.5 minutes at the estimates below, and 2 optional slides come to about 2.5 more, leaving about 11 minutes of the period as a buffer for questions and for the tabs the instructor wants to dwell on.

The chapter's `##` sections are Diamond prices, Principal components regression, Partial least squares, Comparison and Conclusion. It is about 1,650 lines, most of it collapsed code, with 11 figures, 3 kable tables and no console output (no chunk prints text; the chapter's inline R carries the numbers), on one running example (`ggplot2::diamonds`: 53,917 retained diamonds, of which 100 are the training diamonds and 53,817 the test diamonds; the response is the log of the price). **The deck spends slides on a subset of it.** The core line is: the data and the least squares fit (Diamond prices); the scores against log price, the PCR model and its estimates with their variance, the estimate on the standardized scale and the three consequences, the estimate path, the ridge shrinkage factors against PCR's, and the cross-validation curve for $M$ (Principal components regression); the slopes of log price on each feature, the first PLS direction and its criterion, how it compares with the first principal component and the least squares direction, the later directions, the PLS and PCR scores' variance and training $R^2$, and the cross-validation curves of PCR and PLS (Partial least squares); and the test MSE table (Comparison, whose only subsection is Test MSE). The deck does **not** cover the `### Dropped components` derivation, the `pcr()` and `plsr()` check, `### Cross-validation estimates` (its content is in slide 22's `say:`, no figure or table), `### Bias and variance`, the code chunks and the `### Beyond this course` callout; those are parked under "Not in this deck" below. Mapped onto the chapter's six learning objectives:

1. define PCR, write its model, derive each estimate and its variance $\sigma^2/(nv_m)$: slides 6 and 7 (the table on 8 shows the standard errors);
2. PCR is a linear model in the standardized features, $M = p$ is least squares, it is not variable selection, and when dropping a component lowers the mean squared error of the fitted values about the true mean at the training observations: slide 9 (the first three); the dropping condition, with its qualification that it is the error in estimating the mean (predicting a new response at the same features adds $\sigma^2$), is in `say:` of slide 8 and parked;
3. choose $M$ by $k$-fold cross-validation with the standardization and directions recomputed in each fold, and why PLS directions from all the training data make the estimate optimistic: slides 13 and 21 (the optimism is in `say:` of slide 21);
4. the first PLS direction as the unit vector with the largest squared covariance with the response, computed from the simple regression estimates, contrasted with the first principal component and the least squares direction: slides 15, 16, 17 and 18;
5. the later PLS directions from the residuals of the features, and why directions chosen with the response can lower the bias of a fit with $M$ directions but can add variance (the chapter's objective says to describe it): slide 19 and the Conclusion (the bias and variance sentence is in `say:` of slide 23 and the notes' `### Bias and variance` is parked);
6. the ridge shrinkage factor and the comparison of PCR, PLS and ridge regression: slides 11 and 12 (ridge against PCR); PLS is in the Conclusion.

Optional: Least squares (slide 3) and Loadings of three directions (slide 17). If time is short, drop in this order: Loadings of three directions (say the first PLS direction and the first principal component nearly coincide, and the least squares direction loads negatively on carat), Least squares (say the carat estimate is negative although carat and log price are positively correlated), Factors by component (say PCR's factors are 1 then 0 and ridge regression's lie between 0 and 1), then the Variance tab of Directions compared (show Training R²). Two transition slides (4 and 14); no live widget, no code slide and no console slide. The chapter's `## Comparison` is shown as a top-level agenda item with no transition, since it has one slide.

Nothing here is new content. Every `show:` points at something that already exists in `50-pcr-and-pls.qmd`, so the deck distills the notes and never invents. No slide in this outline needs a `needs:`. Slides 1, 3, 9, 11, 12 (title), 16, 17, 18, 19 and 23 lay out the chapter's own words as lists, or cut a display to its last link, in a form the chapter does not have; each is marked with a `note:`. Slides 8, 12, 17 and 18 have titles that are not chapter headings.

**Response variable and explanatory variables.** For `ggplot2::diamonds` (slide 1, a words-only slide that precedes the data figure) the response variable is `price`, in US dollars, and the model's response is $y_i = \log\left(\texttt{price}_i\right)$ (slide 3); the explanatory variables are `carat`, `depth`, `table`, `x`, `y` and `z`; the $p = 6$ **features** are the six standardized explanatory variables. The deck uses "explanatory variables" for the raw columns and "features" for what enters the analysis, per `CONVENTIONS.md`.

**Symbols,** per `CONVENTIONS.md` and the chapter: $n = 100$ the number of training diamonds, $p = 6$; $\tilde x_{ij}$ the standardized features, $\tilde x_i$ the row of one diamond and $\tilde{\mathbf{x}}_{\cdot j}$ the column of feature $j$; $\phi_m$ and $v_m$ the loading vector and variance of the $m$th principal component of the training features and $z_{im}$ its scores; $\theta_m$ the parameter of the regression on score $m$ and $\widehat\theta_m$ its estimate; $\widehat\beta$ the estimate on the standardized scale; $M \in \{0, 1, \ldots, p\}$ the number of components or directions kept, $M = 0$ the null model; $g_j$ the simple regression estimate of log price on feature $j$; $\phi^{\text{PLS}}_{m}$ and $z^{\text{PLS}}_{m}$ the PLS direction and scores. The chapter writes `\hat`; the deck writes `\widehat` everywhere it appears in an equation or a table header.

## How to read an entry

```
## N. Slide title                       <- reuse the chapter's own heading when there is one
tag: core | optional                    <- optional = first to drop if time is short
show: <type> — <asset>                  <- what is on the slide
words: "a short label, 0-1 lines"       <- the only prose on the slide; omitted on figure and tabset slides
reveal: <what appears on each click>    <- optional; omit when everything shows at once
say: what you plan to say aloud         <- speaker notes, never on the slide
note: build and provenance details      <- not on the slide, not spoken
```

`show:` types are as in the earlier outlines: `equation`, `figure`, `table`, `tabset`, `none`. A figure or tabset slide carries the figure alone and no `words:` line. Slides never draw from a `### For example,` or `### Beyond this course` callout. **Timing** estimates, in minutes, are with each slide below.

---

## 0. Today
tag: core (0.5)
show: none, a nested bulleted list
words: agenda as a nested outline: Diamond prices, with Data and Least squares nested beneath it; Principal components regression, with Model, Estimate path, Shrinkage factors and Components kept; Partial least squares, with First direction, Later directions, Directions compared and Directions kept; Comparison (no children: its one slide is Test MSE)
say: distilled from the chapter's six learning objectives and the slides this deck spends time on; the Dropped components derivation, the pcr() and plsr() checks, the Cross-validation estimates subsection (its content is in the Test MSE speaker notes), the Bias and variance subsection and the Beyond this course callout are in the notes and not in the agenda; the previous lecture replaced the p features by M < p principal components, and this one regresses the response on them, then on directions chosen with the response; M is the number of components or directions kept; the next lecture is high dimensions; timing note: drop in the order given in the outline
note: two columns as on the earlier decks, since the 15 lines do not fit one column at the deck's font size.

## 1. Diamond prices
tag: core (1)
show: none, a words-only data slide (a short itemized list)
words: "Question: do a few linear combinations of the six measurements predict price better than all six?"; "Response variable: `price`, in US dollars"; "Explanatory variables: `carat`, `depth`, `table`, `x`, `y`, `z`"; then "Training diamonds: 100"; "Test diamonds: 53,817"
reveal: on arrival: the question, response variable and explanatory variables; click 1: the training and test lines
say: the diamonds are those of the principal components lecture, with the 23 diamonds that have a dimension of 0 or larger than 20 mm removed, leaving 53,917; the test diamonds are split off before any plotting or fitting; the training sample size is that of the ridge and lasso lectures; the average variance of the least squares fitted values is sigma squared times p + 1 over n: with n = 100 training diamonds it is 7% of the error variance, and with all 53,917 diamonds it would be 0.013%, leaving a method that trades bias for variance little variance to remove; the depth z in mm is a distance, while the column depth is a percentage
note: the chapter's `**Question.**` and `**Data.**` paragraphs under `### Data`, compressed to a list, and the 100 and 53,817 of the sentence after the `split` chunk (inline R in the chapter, quoted from the frozen markdown). **The slide title is the chapter's `## Diamond prices`.**

## 2. Data
tag: core (1.5)
show: tabset — the chapter's own tab names: "Price" (price-figure), "Log price" (log-price-figure)
words: none
say: the tabs plot the price and the log price of the training diamonds against each explanatory variable; price is right skewed, the mean training price is above the median, and its spread grows with size; log price rises along a nearly straight line in x, y and z with a spread that does not grow, and bends against carat; depth and table percentage show little relation to either response; the response is therefore the natural log of price, whose relationships with the dimensions are close to linear and whose spread is close to constant, and every mean squared error below is in squared log dollars
note: the chapter's `#### Price` and `#### Log price` tabs under `### Data`; no fragments. The figures are 8 by 5 inches. The mean, median and ratios in the chapter's paragraph are inline R and are not quoted.

## 3. Least squares
tag: optional (1)
show: none, a short itemized list of three lines
words: "Response: $y_i = \log\left(\texttt{price}_i\right)$"; "Training MSE 0.0618, test MSE 0.0726"; "Carat estimate −1.86 (standard error 0.24), correlation of carat with log price 0.88"
say: least squares on the six explanatory variables; the carat estimate is negative although carat and log price are strongly positively correlated; the estimate compares diamonds of equal length, width and depth, and among those the fit predicts the heavier ones to be cheaper; the principal components below separate that contrast from overall size; if time is short, skip this slide
note: the chapter's `### Least squares` sentences and the response definition of `### Data`, laid out as a list (a re-layout, not new content). The 0.0618, 0.0726, −1.86, 0.24 and 0.88 are inline R in the chapter, quoted from the frozen markdown. Optional: second in the drop order.

---

# Principal components regression

## 4. Principal components regression
tag: transition (0)
show: none (transition slide, title only)
say: PCR regresses the response on the first M principal components of the training features, computed without the response; the lecture shows the model, its estimates, its relation to ridge regression and how M is chosen

## 5. Scores and price
tag: core (2)
show: figure — scores-figure (log price against the scores of each of the six components of the training features, one panel each with its PVE and correlation), the figure alone
words: none
say: log price rises along a nearly straight line in the first scores, correlation 0.937; the second and third components explain 32.8% of the variance of the features between them, and their scores are nearly uncorrelated with log price (−0.013 and −0.022); the fourth explains 0.50%, and its scores have correlation −0.249; the last two are flat; the training loadings of the first four components are within 0.06 of those computed from all 53,917 diamonds, so the components keep the interpretations of the principal components lecture: PC1 is size, PC2 and PC3 combine depth and table percentage, and PC4 contrasts weight with the three dimensions
note: the chapter's `scores-figure` under `### Scores and price`, alone (the title is the chapter's heading). The figure is 8.5 by 5.5 inches, left to auto-stretch. The numbers are inline R in the chapter, quoted from the frozen markdown, and are in `say:` only.

## 6. Model
tag: core (2)
show: equation — the chapter's PCR model with a four-label legend
words: the display $y_i = \theta_0 + \sum_{m=1}^M\theta_m z_{im} + \epsilon_i, \qquad \epsilon_i \stackrel{ind}{\sim} N\left(0, \sigma^2\right)$; then an itemized list of four labels: "$y_i$ — log price of training diamond $i$", "$z_{im} = \tilde x_i\phi_m$ — score on the $m$th principal component", "$M \in \{0, 1, \ldots, p\}$ — number of components kept", "$\theta_0, \ldots, \theta_M$ — coefficients; $\epsilon_i$ — error with variance $\sigma^2$"
reveal: on arrival: the display; click 1: the four labels
say: the model is fit by least squares; the score is the standardized features of diamond i times the loading vector of component m, both computed from the training diamonds; a test diamond is standardized with the training means and standard deviations and projected on the training loading vectors, as a new diamond would be; M = 0, with no scores, is the null model; the scores have mean 0 and are uncorrelated, so the normal equations separate, which the next slide uses
note: the chapter's `### Model` display, verbatim without its trailing comma; the legend is cut from the chapter's `where` bullets. The display is set at 0.7em and the legend at 0.6em. The chapter calls the $\theta$'s "coefficients"; they are parameters, not estimates (values computed from the sample are labeled "estimate" elsewhere on the deck), and the label is kept.

## 7. Component estimates
tag: core (2.5)
show: equation — the chapter's normal-equation display and the mean and variance display, with labels
words: the display $\widehat\theta_0 = \bar y, \qquad \widehat\theta_m = \frac{z_m^\top\left(y - \bar y\mathbf{1}\right)}{z_m^\top z_m} = \frac{z_m^\top\left(y - \bar y\mathbf{1}\right)}{nv_m}, \quad m = 1, \ldots, M$ with the two labels "$\widehat\theta_m$ — simple regression estimate of $y$ on $z_m$", "$v_m$ — variance of the $m$th scores"; then the display $E\left[\widehat\theta_m\right] = \theta_m, \qquad Var\left[\widehat\theta_m\right] = \frac{z_m^\top z_m\,\sigma^2}{\left(nv_m\right)^2} = \frac{\sigma^2}{nv_m}$
reveal: on arrival: the estimate display and its labels; click 1: the mean and variance display
say: each estimate is the estimate of the simple linear regression of y on z_m alone, so keeping one more component leaves the earlier estimates unchanged; treat the features as fixed and suppose the linear model in all p features is correct
note: the chapter's `### Model` displays, verbatim without trailing punctuation, with `\hat` changed to `\widehat`; the labels are cut from the chapter's sentence "Each $\hat\theta_m$ is the estimate of the simple linear regression". The displays are set at 0.7em and the labels at 0.6em.

## 8. Estimates and standard errors
tag: core (2)
show: table — theta-table (kable: variance, estimate, standard error and ratio for the six components; copied from the frozen markdown), the table alone
words: none
say: the table gives, for each component of the training features, its variance, the estimate and the standard error sigma-hat over the square root of n v_m; the standard error of the last estimate is 118 times that of the first, the square root of v_1 over v_6; the estimates for PC5 and PC6 are 0.3 and 0.1 standard errors from zero, and the estimate for PC4, −1.47, is 10 standard errors from zero; a diamond heavier than its dimensions suggest is predicted to be cheaper; dropping a component lowers the mean squared error of the fitted values about the true mean at the training diamonds, with the features fixed, exactly when theta_m squared times v_m is less than sigma squared over n, that is when the absolute value of theta_m is less than the standard error of its estimate (the Dropped components subsection, parked); this is the error in estimating the mean, and the expected squared error in predicting a new response at the same features adds sigma squared, which no choice of M changes; PCR can drop only the components after the last one it keeps, so keeping PC4 means keeping PC2 and PC3 as well
note: the chapter's `theta-table` (the kable built in the collapsed `theta` chunk and displayed in `theta-table`), copied verbatim from the frozen markdown with `\hat` in the two headers changed to `\widehat`; no caption on the chapter's table, none added. **The slide title is not a chapter heading** (the table sits under `### Model`). The numbers in `say:` are inline R in the chapter, quoted from the frozen markdown.

## 9. Standardized-scale estimates
tag: core (2.5)
show: equation — the chapter's substitution display, with a two-label legend, then a three-line list of the chapter's three consequences
words: the display $\widehat y_i = \bar y + \sum_{m=1}^M\widehat\theta_m\sum_{j=1}^p\phi_{jm}\tilde x_{ij} = \bar y + \sum_{j=1}^p\widehat\beta_j\tilde x_{ij}, \qquad \widehat\beta = \boldsymbol{\Phi}_M\widehat\theta$; the labels "$\boldsymbol{\Phi}_M$ — $p \times M$ matrix of the first $M$ loading vectors", "$\widehat\beta_j$ — PCR estimate on the standardized scale"; then three lines: "$M = p$ is least squares", "$M = 0$ is the null model: the tuning parameter $M$", "Not variable selection: every $\widehat\beta_j$ is in general nonzero"
reveal: on arrival: the display and its labels; click 1: the three lines
say: substituting the scores into the fitted values shows PCR is a linear model in the p standardized features, fit under a constraint: its estimate must lie in the span of the first M loading vectors; the estimate on the original scale is beta-hat_j over s_j, as in the ridge lecture; M = p is least squares because the p by p loading matrix is orthogonal, so the scores span the same column space as the features; M = 0 and M = p play the roles that lambda to infinity and lambda = 0 play in ridge regression; every loading is nonzero, so predicting a new diamond needs all six explanatory variables whatever M is
note: the chapter's `### Standardized-scale estimates` display and bold consequence labels, cut to labels (a re-layout, not new content). The display is set at 0.7em, the legend at 0.6em and the list at 0.7em.

## 10. Estimate path
tag: core (2)
show: figure — path-figure (each standardized PCR estimate against $M$, from the null model to least squares), the figure alone
words: none
say: up to M = 3 the four size features have nearly equal estimates, 0.234 to 0.240: the first component spreads the effect of size evenly over them, and PC2 and PC3 barely change it; at M = 4 the carat estimate turns negative, to −1.04, and the estimates for x, y and z rise: PC4 separates weight from the dimensions; at M = p the estimates are those of least squares; no estimate is zero at any M of 1 or more
note: the chapter's `path-figure` under `### Estimate path`, alone. The figure is 7.5 by 4.8 inches. The numbers are inline R in the chapter, quoted from the frozen markdown, and are in `say:` only.

## 11. Shrinkage factors
tag: core (2)
show: equation — the last link of the chapter's ridge fitted values display, with the chapter's two comparison sentences as two lines
words: the display $\widehat y^R_\lambda = \bar y\mathbf{1} + \sum_{m=1}^p\frac{v_m}{v_m + \lambda/n}\,\widehat\theta_mz_m$; then two lines: "Ridge regression: every term times $v_m/\left(v_m + \lambda/n\right)$, between 0 and 1", "PCR: the first $M$ terms times 1, the rest times 0"
reveal: on arrival: the display; click 1: the two lines
say: with the standardized features and the ridge criterion, the matrix X-tilde transpose X-tilde is n R, whose eigenvectors are the loading vectors, so ridge regression acts on the principal components; it keeps every component and multiplies its least squares term by a factor that is smallest for the components with the least variance; PCR multiplies by 1 or 0, keeping or dropping each component as subset selection keeps or drops each feature
note: the chapter's `### Shrinkage factors` display, **cut to its last link** (the chapter's display is a chain whose earlier links are the closed form of ridge fitted values; the last link is the chapter's own text), and its two comparison sentences, cut to lines (a re-layout, not new content). The display is set at 0.7em and the lines at 0.7em.

## 12. Factors by component
tag: core (1.5)
show: figure — factor-figure (the factor on each component's term for PCR with $M = 4$ and ridge regression at three $\lambda$), the figure alone
words: none
say: at lambda = 10 the PC4 term keeps 23% of its least squares size, where PCR with M = 4 keeps all of it, while PCR keeps the PC2 and PC3 terms in full although their estimates are small; the closed-form ridge estimate and Phi times the shrunken theta-hat agree to within 3.8 times 10 to the minus 15 (the chapter's check)
note: the chapter's `factor-figure` under `### Shrinkage factors`, alone. **The slide title is not a chapter heading** (the figure sits under `### Shrinkage factors`, slide 11's title). The 23% and the check are inline R in the chapter, quoted from the frozen markdown.

## 13. Components kept
tag: core (2)
show: figure — pcr-cv-figure ($\text{CV}_{(10)}(M)$ against $M$ with the chosen $M$ and least squares labeled), the figure alone
words: none
say: M is chosen by 10-fold cross-validation on the training diamonds; the standardization and the principal components are computed from the data the model is fit to, so in each fold they are recomputed from the training folds only; the estimate for the null model is 1.063; with one component it falls to 0.1399, and it rises with the second and third components, to 0.1505, which add a variance of sigma squared over n each to the fit but almost nothing to its mean; the fourth component halves it, to 0.0744; beyond that the estimate rises again, to 0.0778 for least squares, and the smallest estimate is at M = 4; principal components do not use the response, so computing them once from all the training diamonds changes the estimate by at most 0.00103; for PLS, below, it would not
note: the chapter's `pcr-cv-figure` under `### Components kept`, alone. The figure is 7 by 4.2 inches. The numbers are inline R in the chapter, quoted from the frozen markdown, and are in `say:` only. The chapter's `### pcr()` check (the `pcr_path()` function and its agreement with `pls::pcr()`) is parked.

---

# Partial least squares

## 14. Partial least squares
tag: transition (0)
show: none (transition slide, title only)
say: PCR chose its directions without the response: PC2 and PC3 explain 32.8% of the variance of the features and add 0.0006 to the training R squared of log price, while PC4 explains 0.50% and adds 0.062; partial least squares chooses its directions with the response
note: the numbers are inline R in the chapter's `### Features and price`, quoted from the frozen markdown.

## 15. Features and price
tag: core (1.5)
show: figure — slope-figure (log price against each standardized feature of the training diamonds, with the least squares line and slope in each panel), the figure alone
words: none
say: the four size features have slopes 0.901 to 0.969 log dollars per standard deviation, depth −0.144 and table 0.213; each feature has mean 0 and variance 1, so its slope, one over n times the sum of the feature times the centered response, is also the sample covariance of the feature with log price
note: the chapter's `slope-figure` under `### Features and price`, alone. The figure is 8.5 by 5.5 inches. The numbers in `say:` are inline R in the chapter, quoted from the frozen markdown.

## 16. First direction
tag: core (2.5)
show: equation — the chapter's PLS loading display, with a two-label legend, then the chapter's bold criterion sentence as a line
words: the display $\phi^{\text{PLS}}_{j1} = \frac{g_j}{\sqrt{\sum_{l=1}^p g_l^2}}, \qquad g_j = \frac{1}{n}\sum_{i=1}^n\tilde x_{ij}\left(y_i - \bar y\right)$; then two labels "$g_j$ — simple regression estimate of $y$ on feature $j$", "$\phi^{\text{PLS}}_1 = g/\left\|g\right\|$ — first PLS direction"; then the line "The first PLS direction is the unit vector whose scores have the largest squared covariance with the response"
reveal: on arrival: the display and its labels; click 1: the criterion line
say: a feature gets a large loading when it is strongly related to the response, not when it varies with the other features; the scores of a unit vector a have mean 0 and sample covariance with y equal to a-transpose g, and by the Cauchy-Schwarz inequality the square of that is at most g-norm squared, with equality only at a = plus or minus g over its norm; the first principal component is the unit vector whose scores have the largest variance; the squared covariance factors as the squared correlation of the scores with y times the variance of the scores times the variance of y, so PLS balances two goals: the first principal component maximizes the variance of the scores alone and the least squares fitted values maximize the squared correlation alone
note: the chapter's `### First direction` display, verbatim without its trailing comma; the legend is cut from the chapter's `where` bullets; the criterion line is the chapter's bold sentence, shortened by dropping its comparison with the first principal component (which is in `say:`). The factorization display and the Cauchy-Schwarz argument are in `say:` only and parked. The display is set at 0.7em, the legend at 0.6em and the line at 0.7em.

## 17. Loadings of three directions
tag: optional (1.5)
show: figure — direction-figure (the loadings of the first principal component, the first PLS direction and the least squares direction), the figure alone
words: none
say: the figure plots the loadings of the three directions, each of unit length; on these diamonds the first PLS direction and the first principal component nearly coincide, their loadings within 0.021 of each other, because the direction in which the features vary most, size, is also the one most related to log price; the least squares direction loads negatively on carat and leans on the contrast between weight and the dimensions that PC4 carries; if time is short, skip this slide
note: the chapter's `direction-figure` under `### First direction`, alone. **The slide title is not a chapter heading.** The figure is 7 by 4.5 inches. The 0.021 is inline R in the chapter, quoted from the frozen markdown. Optional: first in the drop order.

## 18. Criteria of three directions
tag: core (1.5)
show: table — summary-table (kable: variance of scores, squared correlation and squared covariance with log price for the three directions; copied from the frozen markdown), the table alone
words: none
say: each direction wins on its own criterion: the first principal component has the largest variance, 4.0012, the least squares direction the largest squared correlation, 0.9408, the training R squared of least squares, and the first PLS direction the largest squared covariance, 3.6712; the least squares direction has variance only 0.397
note: the chapter's `summary-table` (the kable built in the collapsed `first-direction` chunk and displayed in `summary-table`), copied verbatim from the frozen markdown; no caption on the chapter's table, none added. **The slide title is not a chapter heading** (the table sits under `### First direction`). The numbers in `say:` are inline R in the chapter, quoted from the frozen markdown.

## 19. Later directions
tag: core (2.5)
show: equation — the chapter's residual-feature display and the display of the second direction and its scores, then the chapter's three bold property labels as a list
words: the display $\tilde{\mathbf{x}}^{(2)}_{\cdot j} = \tilde{\mathbf{x}}_{\cdot j} - \frac{\left(z^{\text{PLS}}_1\right)^\top\tilde{\mathbf{x}}_{\cdot j}}{\left(z^{\text{PLS}}_1\right)^\top z^{\text{PLS}}_1}\,z^{\text{PLS}}_1$ with two labels "$\tilde{\mathbf{x}}_{\cdot j}$ — column $j$ of $\tilde{\mathbf{X}}$, feature $j$ over the training diamonds", "$\tilde{\mathbf{x}}^{(2)}_{\cdot j}$ — residuals of column $j$ regressed on $z^{\text{PLS}}_1$"; then the display $\phi^{\text{PLS}}_2 \propto \left(\tilde{\mathbf{X}}^{(2)}\right)^\top\left(y - \bar y\mathbf{1}\right), \qquad z^{\text{PLS}}_2 = \tilde{\mathbf{X}}^{(2)}\phi^{\text{PLS}}_2$; then three lines "The scores are uncorrelated", "PLS is a linear model in the features", "$M = p$ is least squares"
reveal: on arrival: the residual display and its label; click 1: the second-direction display; click 2: the three lines
say: the second PLS direction repeats the construction on what the first scores do not explain; direction m uses the residuals of the features after regressing them on the first m minus 1 scores; the scores are uncorrelated because every column of the residual features is orthogonal to the earlier scores, so as for PCR the estimate on M PLS scores is the simple regression estimate on each; PLS is a linear model in the features because each residual matrix is the feature matrix minus multiples of earlier scores, which are combinations of the features; with M = p the p scores span the column space of the features, as they do here
note: the chapter's `### Later directions` displays, verbatim without trailing punctuation, and the bold labels of its three properties, cut to lines (a re-layout, not new content); the two labels under the first display are the chapter's `where` bullets (the column of $\tilde{\mathbf{X}}$ and the residual column), cut; the chapter's columns are $\tilde{\mathbf{x}}_{\cdot j}$ and $\tilde{\mathbf{x}}^{(2)}_{\cdot j}$, in bold with a dot for the row index. The displays are set at 0.7em, the label at 0.6em and the list at 0.7em. The `pls_path()` function and the `plsr()` check are parked.

## 20. Directions compared
tag: core (2)
show: tabset — the chapter's own tab names: "Variance" (variance-figure), "Training R²" (r2-figure)
words: none
say: the tabs compare the PLS directions with the principal components of the training features: the variance of the scores on each direction, and the training R squared of the regression of log price on the first M directions; the principal component variances fall by construction; the PLS variances do not: the second PLS direction has variance 0.147, against 1.390 for PC2, and the third and fourth are larger than the second, 0.393 and 0.414; PLS scores are uncorrelated too; the training R squared of PLS rises with each of the first four directions, from 0.879 to 0.941, while that of PCR stays near 0.878 until PC4 lifts it to 0.941; PLS fits the training diamonds at least as well as PCR at every M less than p, and both reach the least squares fit at M = p; if time is short, show Training R² only
note: the chapter's two-tab set under `### Directions compared`; no fragments. The figures are 7 by 4.3 inches. The numbers are inline R in the chapter, quoted from the frozen markdown, and are in `say:` only.

## 21. Directions kept
tag: core (2)
show: figure — cv-figure ($\text{CV}_{(10)}(M)$ for PCR and PLS, with the chosen $M$ of each circled), the figure alone
words: none
say: PLS directions use the response, so they too are recomputed from the training folds in each fold; at M = 3, where the two curves differ most, the PLS estimate is 0.1165 against 0.1505 for PCR, because the PLS directions after the first carry part of what PC4 adds; PLS reaches its smallest estimate, 0.0745, at M = 4, and PCR its smallest, 0.0744, at M = 4, both below the least squares estimate of 0.0778; computing the PLS directions once from all 100 training diamonds, and cross-validating only the regression on their scores, lowers the estimate by as much as 0.0160, at M = 3 (14% of the estimate there), against at most 0.00103 for PCR; the log prices of each held-out fold then helped choose the directions they are predicted with, so the estimate is optimistic; the size of the optimism depends on M: at the chosen M = 4 it is only 0.0001, and the estimates computed outside the folds would choose M = 4, the same value; the directions are part of the fit, and anything the fit computes from the data is recomputed inside each fold
note: the chapter's `cv-figure` under `### Directions kept`, alone. The figure is 7 by 4.3 inches. The numbers are inline R in the chapter, quoted from the frozen markdown, and are in `say:` only. The chapter's `### Bias and variance` is parked.

---

# Comparison (no transition slide: one slide)

## 22. Test MSE
tag: core (2)
show: table — test-table-display (kable: $M$, training MSE, 10-fold CV estimate and test MSE of least squares, PCR and PLS; copied from the frozen markdown), the table alone
words: none
say: the table compares the three fits: PCR and PLS with their chosen M, and least squares (M = p), each fit to all the training diamonds and evaluated once on the 53,817 test diamonds; on this training sample PCR and PLS with M = 4 tie least squares: the test MSEs are within 0.21% of one another; dropping PC5 and PC6 removed estimates that were smaller than their standard errors, but on this training sample their least squares terms happened to help slightly on the test diamonds; the paired difference in squared error over the test diamonds, least squares minus PLS, has mean −0.00015 and standard error 0.00009, so on this training sample least squares predicts the test diamonds slightly better; as in the ridge lecture, that standard error treats the fitted models as fixed and says nothing about another training sample; one training sample of 100 diamonds cannot show whether either method helps on average, and the lecture after next compares PCR and PLS with least squares over repeated training samples; from the chapter's Cross-validation estimates subsection: all three cross-validation estimates are above the test MSEs, by 0.0052, 0.0017 and 0.0017 for least squares, PCR and PLS; choosing the smallest estimate on a noisy curve cannot be the reason, since least squares involves no choice; fitting each fold to 90 diamonds rather than 100 explains little: least squares fit to the training folds of each fold has test MSE 0.0735 on average, against 0.0726 for the fit to all 100, a difference of 0.0009; one diamond accounts for more than the gap: the heaviest training diamond, with its low price, contributes 12% of the least squares estimate, and removing it lowers the three estimates by 0.0090, 0.0087 and 0.0087, to 0.0688, 0.0657 and 0.0657; the three estimates also agree closely with one another, because they are means of the held-out squared errors of the same 100 diamonds on the same folds, and those squared errors have correlation at least 0.998 across the three fits, which explains why the three move together, not why they exceed the test MSEs
note: the chapter's `compare_table` (the kable built in the collapsed `test-table` chunk and displayed in `test-table-display`), copied verbatim from the frozen markdown; no caption on the chapter's table, none added. The title is the chapter's `### Test MSE`; the chapter's `### Cross-validation estimates`, which follows it, has no figure or table and is in `say:` only. The numbers in `say:` are inline R in the chapter, quoted from the frozen markdown.

## 23. Conclusion
tag: core (1)
show: none, a flat bulleted list of five takeaways
words: five short lines, in the order of the lecture: "Dimension reduction regresses on $M < p$ directions"; "PCR keeps or drops components; ridge regression shrinks them all"; "PLS uses the response: it can lower bias but can add variance"; "Recompute the directions in each cross-validation fold"; "Neither method selects variables"
say: dimension reduction regresses the response on M < p linear combinations of the standardized features, and controls the flexibility of the fit through M; because the scores are uncorrelated each estimate is the simple regression estimate on its own scores; either method is a linear model in all p features with a constrained estimate, so neither selects variables; in PCR the estimate on component m has variance sigma squared over n v_m, so the components with the least variance have the noisiest estimates; PLS balances the variance of the scores against their correlation with the response; choosing the directions with the response can lower bias for a given M but can add variance, since training fit alone cannot distinguish lower bias from fitting noise and the directions depend on the training responses, which PCR's do not (the Bias and variance subsection, parked); M is chosen by k-fold cross-validation with every data-dependent step recomputed from the training folds in each fold; the next lecture, high dimensions, turns to data with more features than observations
note: five phrases drawn from the chapter's `## Conclusion` paragraphs; one line each at the default font, no nesting, no example numbers.

---

# Not in this deck

Cut from the lecture's core line, with their assets and original content, so they can come back.

- **Dropped components** (the chapter's `### Dropped components`: the mean squared error display $\frac{\sigma^2}{n} + \sum_{m=1}^M\frac{\sigma^2}{n} + \sum_{m=M+1}^p\theta_m^2v_m$ and the condition $\theta_m^2v_m < \sigma^2/n$): equations only, no figure or table, and a derivation; the condition is in slide 8's `say:` and the table on slide 8 carries its last column (the ratio of each estimate to its standard error).
- **`pcr()` and `plsr()` checks** (the `pcr-path`, `pcr-check`, `pls-path` and `pls-check` chunks): code and agreement to within about $10^{-12}$ and smaller; not shown.
- **Cross-validation estimates** (the chapter's `### Cross-validation estimates`, prose only, why the CV estimates exceed the test MSEs): in slide 22's `say:`.
- **Bias and variance** (the chapter's `### Bias and variance`): prose only; its sentence on bias and variance is in slide 23's `say:`.
- **Repeated training samples** (the subsection removed from the chapter and moved to the 2026-11-02 comparison lecture; its `gain-figure` PNG is no longer used by the deck).
- **Factorization of the squared covariance and the Cauchy-Schwarz argument** (`### First direction`): in slide 16's `say:`.
- **Chapter code callouts** (`### Code`) and the visible code chunks: not shown.
- **`### Beyond this course` (never used):** other PLS algorithms, supervised principal components, kernel PCR and PLS, PLS for classification.

---

# Reference: assets used by this deck

- **Figures (PNG in `_freeze/06-regularization/50-pcr-and-pls/figure-html/`, each with a `-1.png` suffix):** price-figure and log-price-figure (the two tabs of slide 2), scores-figure (5), path-figure (10), factor-figure (12), pcr-cv-figure (13), slope-figure (15), direction-figure (17), variance-figure and r2-figure (the two tabs of slide 20), cv-figure (21). That is 11 of the chapter's figures; `gain-figure-1.png` remains in the freeze directory but the chapter no longer has that chunk and the deck does not use it.
- **Tables (kable, copied from the frozen markdown):** `theta-table` (slide 8), `summary-table` (18), `test-table-display` (22). The chapter's three tables.
- **Console output (frozen markdown):** none.
- **Equations on slides:** the PCR model (6); the normal equations and the mean and variance of the estimates (7); the standardized-scale fitted values (9); ridge fitted values as a sum over components, last link (11); the first PLS direction (16); the residual features and the second direction (19). **Parked:** the dropped-components error and the squared covariance factorization. Every `\hat` of the chapter is `\widehat` on the slides.
- **Numbers quoted from inline R in the frozen markdown (never retyped or recomputed). On slides:** 100 and 53,817 (1); 0.0618, 0.0726, −1.86, 0.24 and 0.88 (3); the tables' own values (8, 18, 22). The chapter's `### Test MSE` now says one training sample cannot show whether either method helps on average; no gain percentage or `unfavorable draw` claim is on any slide. All others are in `say:` only.
