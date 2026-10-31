# Slide outline: High Dimensions

(drafted 2026-10-28; synced 2026-10-28 with the chapter's revision: the observation is a meat, the AIC forms are separated, the default glmnet lasso predicts better than the exact lasso, the Selected channels claim is fold to fold)

Outline for `60-high-dimensions_slides.qmd` (Fri 2026-10-30, one 50-minute period, MWF 1:10-2:00; ISLR2 6.4, high-dimensional data, the last lecture of the regularization chapter before the comparison lecture). **This file is the spec; the deck is built from it, and this file describes the deck as it stands.** Edit it freely: reorder, cut, reword, change `tag:`, add notes. When it says what you want, ask for the deck to be refreshed and `slides-author` will implement exactly these slides.

Drafted 2026-10-28 against `60-high-dimensions.qmd`. The deck's `derived-from` comment records the chapter's commit (`git log -1 --format=%h -- 06-regularization/60-high-dimensions.qmd`). The frozen output `_freeze/06-regularization/60-high-dimensions/execute-results/html.json` is current: its recorded `hash` equals the md5 of the chapter file as it stands, which includes the "Slides for this lecture" link on the line after `# High Dimensions`.

**Where this deck sits in the period.** The whole 50-minute period is this deck: 18 slides including the title, two transitions and the closing slide (slides 0 to 16 below plus the title slide). 15 of them are timed core slides (the agenda, 13 content slides and the closing slide) and come to about 36.5 minutes at the estimates below; 1 optional slide adds about 2.5 more, leaving about 11 minutes of the period as a buffer for questions and for the tabs the instructor wants to dwell on. The deck is shorter than the earlier ones (18 slides against 25 or 26) on purpose: this chapter's content is a few figures and equations, and every slide that would carry only prose was cut (see "Not in this deck").

The chapter's `##` sections are Meat spectra, Least squares, Regularization and Conclusion. It is about 1,290 lines, most of it collapsed code (including a 90-line exact lasso solver), with 8 figures, 1 kable table and no console output (no chunk prints text; the chapter's inline R carries the numbers), on one running example (`modeldata::meats`: 193 distinct meats, of which a training sample of 50 meats and 143 test meats; the response is `fat`, in percent; 100 absorbance channels are the explanatory variables, so $p = 100 > n = 50$). **The deck spends slides on a subset of it.** The core line is: the data and its dimensions (Meat spectra); the perfect least squares fit, the sweep over the number of channels, why the usual least squares numbers do not warn of the failure and why $C_p$, BIC and AIC cannot choose a model size (Least squares); and the correlation of fat with each channel, the four methods, how each is computed, the cross-validation curves, the test MSEs and the unstable set of selected channels (Regularization). Mapped onto the chapter's five learning objectives:

1. why $\mathbf{X}^\top\mathbf{X}$ is singular, the estimate is not unique, and a fit can have training RSS 0 and $R^2 = 1$: slides 1, 4 and 5 (the sweep shows the training $R^2$ reaching 1);
2. the training $R^2$, training MSE, overall $F$-test and $\widehat\sigma$ at $d$ close to $n$, and why none estimates the test MSE: slides 5 (the two tabs) and 6;
3. why $C_p$, AIC and BIC cannot choose a model size when $p \ge n - 1$ (with $\sigma^2$ fixed at the full-model estimate it is $0/0$ and setting it to 0 reduces $C_p$ and BIC to the training MSE; with $\sigma^2$ estimated in each model, as `AIC()` and `BIC()` do, both go to $-\infty$ at a perfect fit): slides 7 and 8 (AIC is optional);
4. choosing $\lambda$ or $M$ by $k$-fold cross-validation with every data-dependent step recomputed in each fold, and comparing the chosen fits with the null model by test MSE: slides 10, 11 (the recomputation is its last line), 13 and 14; slide 12 (optional) is how ridge regression and the lasso are computed;
5. why, with highly correlated features, the set the lasso selects changes from fold to fold within a training sample and is not the set that matters: slides 15 and 16 (the last line of the Conclusion).

Optional: Computation (slide 12) and AIC (slide 8). Channels and fat (slide 10) is core but third in the drop order. If time is short, drop in this order: Computation (say that glmnet meets its stopping rule far from the minimum on these channels, so ridge regression uses its closed form and the lasso an active-set method), AIC (say that `AIC()` and `BIC()` go to minus infinity as RSS goes to 0), Channels and fat (say that no single channel predicts fat well), then the Lasso tab of Tuning. Two transition slides (3 and 9); no live widget, no code slide and no console slide. The chapter's `## Meat spectra` has no transition: its two slides are shown as one agenda item.

Nothing here is new content. Every `show:` points at something that already exists in `60-high-dimensions.qmd`, so the deck distills the notes and never invents. No slide in this outline needs a `needs:`. Slides 1, 4, 6, 7, 8 and 11 lay out the chapter's own words as lists, or cut a sentence to a line, in a form the chapter does not have; each is marked with a `note:`. Slide 8 has a title that is not a chapter heading.

**Response variable and explanatory variables.** For `modeldata::meats` (slide 1, a words-only slide that precedes the data figure) the response variable is `fat`, in percent; the explanatory variables are the absorbances `x_001`, ..., `x_100` at 100 channels (850 nm to 1050 nm); the $p = 100$ **features** are the 100 standardized absorbances (the chapter standardizes them for the four methods; least squares uses the raw absorbances). The deck uses "explanatory variables" for the raw columns and "features" for what enters the analysis, per `CONVENTIONS.md`.

**Symbols and vocabulary,** per `CONVENTIONS.md` and the chapter: an observation is a **meat** (defined once in the chapter's Data), a *training sample* is the set of 50 meats, the others are *test meats*; $n = 50$ the number of training meats, $p = 100$ the number of channels; $d$ the number of features in a least squares fit of the sweep; $\mathbf{X}$ the $n \times (p + 1)$ model matrix and $b$ a candidate estimate; $RSS$ the training residual sum of squares; $\tilde{\mathbf{X}}$ the matrix of standardized features, $\tilde{\mathbf{x}}_{\cdot j}$ its column $j$; $\lambda \ge 0$ the tuning parameter; $\mathbf{I}_p$ the identity matrix; $\widehat\beta^R_\lambda$ and $\widehat\beta^L_\lambda$ the ridge and lasso estimates; $r$ the residual vector of the lasso fit; $M$ the number of components or directions kept. The chapter writes `\hat`; the deck writes `\widehat` everywhere it appears in an equation.

## How to read an entry

```
## N. Slide title                       <- reuse the chapter's own heading when there is one

- **tag:** core | optional                    <- optional = first to drop if time is short
- **show:** <type> — <asset>                  <- what is on the slide
- **words:** "a short label, 0-1 lines"       <- the only prose on the slide; omitted on figure and tabset slides
- **reveal:** <what appears on each click>    <- optional; omit when everything shows at once
- **say:** what you plan to say aloud         <- speaker notes, never on the slide
- **note:** build and provenance details      <- not on the slide, not spoken
```

`show:` types are as in the earlier outlines: `equation`, `figure`, `table`, `tabset`, `none`. A figure or tabset slide carries the figure alone and no `words:` line. Slides never draw from a `### For example,` or `### Beyond this course` callout. **Timing** estimates, in minutes, are with each slide below.

---

## 0. Today

- **tag:** core (0.5)
- **show:** none, a nested bulleted list
- **words:** agenda as a nested outline: Meat spectra, with Data nested beneath it; Least squares, with Perfect fits, Channel sweep, Inference, Penalized criteria and AIC; Regularization, with Channels and fat, Four methods, Computation, Tuning, Test MSE and Selected channels
- **say:** distilled from the chapter's five learning objectives and the slides this deck spends time on; why Cp, AIC and BIC fail is given in both forms (sigma squared fixed at the full-model estimate, 0/0; sigma squared estimated in each model, minus infinity); the Dimensions subsection (p = 100 and n = 50 are on the Meat spectra slide), the glmnet and active-set solver code, the Beyond this course callout and the hand-off to the next lecture are in the notes and not in the agenda; every earlier lecture in this chapter had more training observations than features, this lecture's data have more features than training observations, so least squares fails outright and the choice of flexibility decides whether a fit predicts at all; timing note: drop in the order given in the outline
- **note:** two columns as on the earlier decks, since the 14 lines do not fit one column at the deck's font size. The agenda lists the optional slides AIC and Computation because the deck spends a slide on each.

## 1. Meat spectra

- **tag:** core (1.5)
- **show:** none, a words-only data slide (a short itemized list)
- **words:** "Question: from a small training sample, how well can the fat content of chopped meat be predicted from its absorbance at each of 100 channels?"; "Observation: a meat, a sample of finely chopped meat"; "Response variable: `fat`, in percent"; "Explanatory variables: absorbance at 100 channels, `x_001`, ..., `x_100`"; then "Training sample: 50 meats, so $p = 100 > n = 50$"; "Test meats: 143"
- **reveal:** on arrival: the question, observation, response variable and explanatory variables; click 1: the training sample and test meats lines
- **say:** each row is one meat, a sample of finely chopped meat; the notes call the observations meats and keep the word sample for a set of observations, as in training sample; the analyzer, the wavelengths and what absorbance is; water, fat and protein absorb differently, so the spectrum carries information about the composition; fat is measured by slow chemical analysis, and predicting it from the spectrum is the practical goal; of the 215 rows, 22 repeat an earlier row in all 103 columns and are removed, leaving 193 meats, of which a training sample of 50 meats and 143 test meats, split off before any plotting or fitting; more features than training observations is the high-dimensional setting
- **note:** the chapter's `**Question.**` and `**Data.**` paragraphs under `### Data` and the dimensions sentence of `### Dimensions`, compressed to a list; the 50 and 143 are inline R in the chapter, quoted from the frozen markdown. The chapter's sentence "these notes call the observations meats ..." is in `say:`. **The slide title is the chapter's `## Meat spectra`.**

## 2. Data

- **tag:** core (2)
- **show:** figure — spectra-figure (the spectra of six training meats, one line each, colored and labeled by fat content), the figure alone
- **words:** none
- **say:** the training meats range from 1.4% to 49.1% fat; every spectrum has the same shape, rising to a peak near channel 64, and the spectra differ mostly by a vertical shift; the shift is only loosely related to fat (correlation of fat with a meat's mean absorbance 0.47); the fattest meats shown also have a bump or shoulder near channel 42 that the leaner ones lack; the fat content is in the details of the shape, which no single channel records; every pair of channels has correlation at least 0.981 and adjacent channels at least 0.99985
- **note:** the chapter's `spectra-figure` under `### Data`, alone. The figure is 8 by 4.5 inches, shown at `height=600` (the slide honors it). The numbers are inline R in the chapter, quoted from the frozen markdown, and are in `say:` only. The chapter's `### Dimensions` (the correlations between channels, no figure) is in `say:` here and the p and n of it on slide 1.

---

# Least squares

## 3. Least squares

- **tag:** transition (0)
- **show:** none (transition slide, title only)
- **say:** with p + 1 > n, least squares has no unique fit; this part shows the perfect fit, how the sweep over the number of channels behaves on the test meats, and why the usual numbers from a least squares fit and the penalized criteria cannot warn of the failure

## 4. Perfect fits

- **tag:** core (3)
- **show:** equation — the chapter's normal equations, with a three-label legend, then two lines of the chapter's consequences and the definition of RSS
- **words:** the display $\mathbf{X}^\top\mathbf{X}\,b = \mathbf{X}^\top y$; the labels "$\mathbf{X}$ — $n \times (p + 1)$ model matrix, a column of ones and one column per channel", "$b$ — $(p + 1)$-vector of candidate estimates, the intercept first", "$y$ — $n$-vector of the training responses"; then two lines "$p + 1 > n$: $\mathbf{X}^\top\mathbf{X}$ is singular, so the estimate is not unique", "Rank $n$: the fitted values equal the responses, training RSS 0 and training $R^2 = 1$", and the label "$RSS = \sum_{i=1}^n\left(y_i - \widehat y_i\right)^2$ — training residual sum of squares"
- **reveal:** on arrival: the display and its labels; click 1: the two lines and the RSS label
- **say:** the model matrix has rank at most n, so with p + 1 > n the matrix X-transpose X has rank at most n < p + 1 and is singular; if beta-hat solves the normal equations so does beta-hat plus v for every v with Xv = 0, a space of dimension at least p + 1 − n, and every solution has the same fitted values; when the rank is n the columns of X span all of R^n, so y is itself a combination of them; lm() on all 100 channels returns estimates for the intercept and the first 49 channels and NA for the other 51, so it has picked one of the infinitely many solutions by setting those 51 estimates to zero; the rank is 50 and the training R squared 1.0000
- **note:** the chapter's `### Perfect fits` display, verbatim, its `where` bullets cut to labels, its two consequence sentences cut to lines, and the RSS definition the chapter now gives (a re-layout, not new content). The display is set at 0.75em, the legend and the RSS label at 0.6em and the lines at 0.7em. The `all-channels` chunk's numbers (49, 51, 50, 1.0000) are inline R in the chapter, quoted from the frozen markdown, in `say:` only.

## 5. Channel sweep

- **tag:** core (4.5)
- **show:** tabset — the chapter's own tab names: "Training R²" (r2-figure), "Test MSE" (test-figure)
- **words:** none
- **say:** the perfect fit does not need all 100 channels: any n − 1 = 49 channels give one; the sweep fits least squares on the first d channels of a random ordering, for d = 1, ..., 49, where d is the number of features in the model, as in the subset selection lecture; the training R squared rises with every channel added, from 0.228 with one channel to 0.956 with 10 and to 1 at d = 49, where the training MSE is 0; the test MSE falls at first, to 9.69 at d = 19, then climbs: at d = 49 it is 4,988, 32 times the test MSE of the null model, 154.0; with d + 1 = n the fit passes through every training meat, so its fitted values carry all of the noise in the responses; its estimates run from −425,568 to 523,355 percentage points of fat per unit of absorbance, and a test spectrum that differs slightly from the training spectra in a direction in which they barely vary is multiplied by these estimates; the training R squared cannot see any of this
- **note:** the chapter's `#### Training R²` and `#### Test MSE` tabs under `### Channel sweep`; no fragments. Each figure is 7 by 4.2 inches (the PNGs are 1344 by 806). The deck's stylesheet adds `.tall-tabs` (`max-height: 560px`) to the tabset so the tabs show the figures at 560 pixels, larger than the earlier decks' 420 and `.square-tabs` 460 (the tick labels would be 12.2 and 13.4 pixels). The numbers are inline R in the chapter, quoted from the frozen markdown, and are in `say:` only.

## 6. Inference

- **tag:** core (3)
- **show:** equation — the chapter's null hypothesis of the overall $F$-test, then three lines of the chapter's numbers at $d = 46$
- **words:** the display $H_0: \beta_1 = \cdots = \beta_d = 0$; then three lines "$d = 46$: overall $F$-test $p$-value 0.0016, training $R^2$ 0.9993", "None of the 46 estimates has a $p$-value below 0.05", "$\widehat\sigma = 1.49$ percentage points, but the test root mean squared error is 18.3"
- **reveal:** on arrival: the display; click 1: the three lines
- **say:** the usual output of lm() does not warn of the failure either; d = 46 is the largest d whose overall F-test has p-value below 0.01; the residual standard error is 1.49 percentage points of fat but the test MSE is 337, 2.2 times the test MSE of the null model, a root mean squared error of 18.3 percentage points; each number answers its own question: the F-test asks whether fat is related to the 46 channels at all, and it is; sigma-hat estimates the standard deviation of the errors epsilon_i in y_i = beta_0 + the sum of beta_j x_ij + epsilon_i, not of the prediction errors, which add the variance of the estimates, and with 3 residual degrees of freedom that variance is enormous; none of them estimates how well the fit predicts new meats
- **note:** the chapter's `### Inference` $H_0$ (inline in a sentence, set as a display) and its numbers (inline R in the chapter, quoted from the frozen markdown, laid out as lines: a re-layout, not new content; the line compares $\widehat\sigma$ with the root mean squared error, in the same units, where the chapter's sentence compares it with the test MSE and then gives the root mean squared error). The chapter's definition of $d = 46$ ("the largest $d$ whose overall $F$-test has $p$-value below 0.01") and the model for $\epsilon_i$ are in `say:` only. The display is set at 0.75em and the lines at 0.7em. This is the one slide in the deck whose body is numbers rather than a figure or table; it carries the equation $H_0$ and exists for learning objective 2.

## 7. Penalized criteria

- **tag:** core (2.5)
- **show:** equation — the chapter's $C_p$ and BIC display, then three lines
- **words:** the display $C_p = \frac{1}{n}\left(RSS + 2d\widehat\sigma^2\right), \qquad \text{BIC} = \frac{1}{n}\left[RSS + \log(n)\,d\widehat\sigma^2\right]$; then the lines "$\sigma^2$ fixed at $\widehat\sigma^2$ from the model with all $p$ features: its $RSS$ over $n - \text{rank}(\mathbf{X})$", "$\text{rank}(\mathbf{X}) = n$: $\widehat\sigma^2 = 0/0$, undefined", "$\widehat\sigma^2 = 0$: $C_p$ and BIC reduce to $RSS/n$, smallest for the largest model"
- **reveal:** on arrival: the display; click 1: the first two lines; click 2: the third line
- **say:** Cp and BIC are from the subset selection lecture, with sigma squared fixed at sigma-hat squared from the model with all p candidate features: its RSS divided by its residual degrees of freedom, n minus rank(X), which is n − p − 1 only when X has full column rank; with all 100 channels rank(X) = n, so the RSS and the residual degrees of freedom are both 0 and sigma-hat squared = 0/0 is undefined; the largest model with a unique fit, d = n − 1, is no help: its RSS is 0 with n − d − 1 = 0 residual degrees of freedom; setting sigma-hat squared to 0 reduces Cp and BIC to RSS/n, the training MSE, smallest, at 0, for the largest model; any other estimate of sigma squared would come from a smaller model, which would have to be chosen first
- **note:** the chapter's `### Penalized criteria` display, verbatim with `\hat` changed to `\widehat` and without its trailing comma, and its first paragraph cut to lines (a re-layout, not new content). The display is set at 0.7em and the lines at 0.7em. The instructor kept this slide as it is.

## 8. AIC

- **tag:** optional (1.5)
- **show:** equation — the chapter's $-2\log L$ display, between three lines
- **words:** the line "Subset selection lecture's AIC: $\sigma^2$ fixed at $\widehat\sigma^2$, equivalent to $C_p$"; then the line "`AIC()` and `BIC()` in R: $\sigma^2$ estimated in each model by $RSS/n$" and the display $-2\log L = n\log\left(2\pi\,RSS/n\right) + n$; then the line "As $RSS \to 0$, $-2\log L \to -\infty$: both smallest at $d = 49$, where they are $-\infty$"
- **reveal:** on arrival: the first line; click 1: the second line and the display; click 2: the last line
- **say:** the subset selection lecture's AIC also fixes sigma squared at sigma-hat squared, which makes it equivalent to Cp, so it fails the same way; AIC() and BIC() in R use a different form: the Gaussian log-likelihood with sigma squared estimated separately in each model by RSS/n, so that minus 2 log L is n log(2 pi RSS/n) plus n, plus a penalty of 2 or log(n) per estimated parameter; as RSS goes to 0, minus 2 log L goes to minus infinity and no finite penalty offsets it; over the sweep AIC() is smallest at d = 49, where it is minus infinity, and BIC() at d = 49, where it is minus infinity; once the training error can reach 0, none of the criteria can stop the search at a smaller model; if time is short, skip this slide
- **note:** the chapter's `### Penalized criteria` second paragraph (the display is inline in the chapter, set as a display here) cut to lines. **The slide title is not a chapter heading** (the paragraph sits under `### Penalized criteria`, slide 7's title). The 49 is inline R in the chapter, quoted from the frozen markdown. Optional: second in the drop order. The lines are set at 0.7em and the display at 0.75em.

---

# Regularization

## 9. Regularization

- **tag:** transition (0)
- **show:** none (transition slide, title only)
- **say:** ridge regression, the lasso, PCR and PLS constrain the fit; this part shows what a single channel offers, the four methods, how each tuning parameter is chosen, how the chosen fits do on the test meats, and which channels the lasso selects

## 10. Channels and fat

- **tag:** core (1.5)
- **show:** figure — cor-figure (the correlation of fat with each channel's absorbance, against channel), the figure alone
- **words:** none
- **say:** the figure plots, for the training meats, the correlation of fat with each channel's absorbance; no channel predicts fat well alone: the correlations run from 0.409 to 0.546, at channel 41, so the best single channel explains 30% of the variance of fat in the training meats; the correlations change smoothly from channel to channel, as the channels themselves do; predicting fat well needs a combination of many channels, and with p > n the combination must be constrained; if time is short, skip this slide
- **note:** the chapter's `cor-figure` under `### Channels and fat`, alone. The figure is 7 by 3.8 inches, shown at `height=600`. The numbers are inline R in the chapter, quoted from the frozen markdown, and are in `say:` only. Third in the drop order.

## 11. Four methods

- **tag:** core (3)
- **show:** none, a list of the chapter's four methods with a symbol label and two lines of the cross-validation rule
- **words:** four lines "Ridge regression: minimize $RSS + \lambda\sum_{j=1}^p\beta_j^2$", "Lasso: minimize $RSS + \lambda\sum_{j=1}^p\left|\beta_j\right|$", "PCR: regress fat on the first $M$ principal component scores", "PLS: regress fat on $M$ directions chosen with the response"; the label "$\lambda \ge 0$ — tuning parameter"; then two lines "$\lambda$ or $M$ chosen by 10-fold cross-validation", "Standardization, components and directions recomputed in each fold"
- **reveal:** on arrival: the four methods and the label; click 1: the two cross-validation lines
- **say:** each method is fit to the 50 training meats with the standardized features, the absorbance of meat i at channel j standardized with the mean and standard deviation, divisor n, of channel j over the training meats; X-tilde is the n by p matrix of standardized features; for any lambda > 0 the matrix X-tilde transpose X-tilde plus lambda I_p, with I_p the p by p identity matrix, is positive definite, so the ridge estimate is unique even with p > n; the lasso sets some estimates to exactly zero; each of lambda and M is chosen by 10-fold cross-validation on the folds drawn with the training sample, with the standardization, the principal components and the PLS directions recomputed from the training folds in each fold
- **note:** the chapter's `### Four methods` bullets, cut to lines, its definition of $\lambda$ cut to a label, and its last paragraph cut to the two cross-validation lines (a re-layout, not new content). The list is set at 0.75em and the label at 0.6em.

## 12. Computation

- **tag:** optional (2.5)
- **show:** equation — the chapter's ridge closed form and the lasso conditions, each with a legend
- **words:** the display $\widehat\beta^R_\lambda = \left(\tilde{\mathbf{X}}^\top\tilde{\mathbf{X}} + \lambda\mathbf{I}_p\right)^{-1}\tilde{\mathbf{X}}^\top\left(y - \bar y\mathbf{1}\right)$ with the labels "$\mathbf{I}_p$ — $p \times p$ identity matrix", "$\bar y$ — mean of the training responses $y$; $\mathbf{1}$ — $n$-vector of ones"; then the display $\tilde{\mathbf{x}}_{\cdot j}^\top r = \frac{\lambda}{2}\,\text{sign}\left(\widehat\beta^L_{\lambda j}\right)$ if $\widehat\beta^L_{\lambda j} \ne 0$, $\left|\tilde{\mathbf{x}}_{\cdot j}^\top r\right| \le \frac{\lambda}{2}$ if $\widehat\beta^L_{\lambda j} = 0$, with the labels "$r = y - \bar y\mathbf{1} - \tilde{\mathbf{X}}\widehat\beta^L_\lambda$ — residuals", "$\tilde{\mathbf{x}}_{\cdot j}$ — column $j$ of $\tilde{\mathbf{X}}$"
- **reveal:** on arrival: the ridge closed form and its labels; click 1: the lasso conditions and their labels
- **say:** glmnet() fits ridge regression and the lasso by coordinate descent, updating one estimate at a time, and stops when no update in a pass changes the criterion by more than a tolerance, its argument thresh, times the criterion of the null model; on these channels it meets that rule far from the minimum of the criterion, as the Test MSE slide shows, and a tighter thresh and a larger maxit close the gap but can take minutes for each fit; so ridge regression uses its closed form, from the ridge lecture, computed from the singular value decomposition, and the lasso estimate is the one that satisfies the lasso conditions: the first sets the derivative of the criterion in beta_j to zero, the second says that moving beta_j away from zero would raise the penalty by more than it lowers the RSS; an active-set method solves the first condition exactly on a set of nonzero estimates with fixed signs and changes the set until the second holds for every other channel (its code is in the notes' collapsed callout and not on a slide); over the 71 values of lambda on the lasso grid, the conditions hold to within a fraction 1.3 x 10^-5 of lambda/2; if time is short, skip this slide
- **note:** the chapter's `### Computation` ridge display (verbatim, `\hat` to `\widehat`, trailing comma dropped, set at 0.8em, its symbols cut to labels at 0.6em), the lasso conditions display (verbatim, `\hat` to `\widehat`, trailing comma dropped, set at 0.7em) and its two `where` bullets cut to labels. The active-set solver's code (the `lasso_std` function and the `fits` chunk) is in `say:` as a one-sentence description and is parked; the numbers (0.99985 is on the Test MSE slide, 71 and 1.3 x 10^-5 here) are inline R in the chapter, quoted from the frozen markdown, and are in `say:` only. The comparison with the default `glmnet()` fits is in slide 14's `say:`, where the chapter now puts it. Optional: first in the drop order. The instructor kept this slide as it is.

## 13. Tuning

- **tag:** core (5)
- **show:** tabset — the chapter's own tab names: "Ridge" (ridge-cv-figure), "Lasso" (lasso-cv-figure), "PCR and PLS" (direction-cv-figure)
- **words:** none
- **say:** the 10-fold cross-validation estimate against lambda for ridge regression and the lasso and against M for PCR and PLS, each with the null model's estimate as a dashed line; all four curves fall from the null model's estimate, 192.8, to a minimum between 10.2 and 10.9 and rise again as the fit becomes more flexible; ridge regression chooses lambda = 1.6 x 10^-4, small in absolute terms, but the principal component variances v_m of the standardized channels fall from 99.3 for the first component to 6.2 x 10^-7 for the 15th, and the factor v_m/(v_m + lambda/n) of the PCR lecture keeps at least half of the term of the first 12 components and shrinks the rest toward zero; the lasso chooses lambda = 3.2 x 10^-3 with 20 nonzero estimates, and its curve is jagged at small lambda where channels enter and leave the active set; PCR chooses M = 12 components and PLS M = 10 directions; if time is short, skip the Lasso tab
- **note:** the chapter's three-tab set under `### Tuning`; no fragments. The ridge and lasso figures are 7 by 4.2 inches (1344 by 806) and the PCR and PLS figure 7 by 4.5 (1344 by 864). The deck's `.tall-tabs` (560 pixels) is used, as on slide 5. The numbers are inline R in the chapter, quoted from the frozen markdown, and are in `say:` only.

## 14. Test MSE

- **tag:** core (3.5)
- **show:** table — test-table (kable: tuning parameter, number of nonzero estimates, 10-fold CV estimate and test MSE of the null model, ridge regression, the lasso, PCR and PLS; copied from the frozen markdown), the table alone
- **words:** none
- **say:** each method with its chosen tuning parameter, fit to all 50 training meats, and the null model are evaluated once on the 143 test meats; every method predicts the test meats far better than the null model: test MSEs 8.1 to 13.3 against 154.0, and against 4,988 for least squares on 49 channels; the ordering among them, ridge regression best and the lasso worst, holds on this training sample of 50 meats, another training sample could rank them differently, and one training sample cannot show which method is best on average; the default glmnet() fits would have told a different story about which channels the lasso uses: at the chosen lambda the default lasso fit, with thresh = 1e-7, has 99 nonzero estimates, against 20 for the active-set fit, and a criterion 2.5 times the minimum, although its test MSE, 9.93, is lower than the active-set fit's, 13.26: a fit that stops far from the lasso's minimum keeps almost every channel, and on this training sample dense fits predict better; with neighboring channels correlated at least 0.99985, a change to one estimate in a pass of coordinate descent is almost undone by the change to its neighbor, so each update lowers the criterion little and the stopping rule is met early; the default ridge fit's test predictions differ from the closed form by up to 5.8 percentage points; a much tighter tolerance brings glmnet() close to the exact fits: with thresh = 1e-12 and maxit = 1e9 its lasso fits for lambda >= 1 predict the test meats to within 0.050 of the active-set fits, and the remaining gap is glmnet()'s, since at lambda = 1 its criterion is 714.9403 against 714.9391 for the active-set fit; with thresh = 1e-14 and maxit = 1e7 its ridge fit at lambda = 1 predicts them to within 3.1 x 10^-4 of the closed form
- **note:** the chapter's `test_table` (the kable built in the collapsed `test-mse` chunk and displayed in `test-table`), copied verbatim from the frozen markdown; no caption on the chapter's table, none added. The chapter's labels are now short (rows Null, Ridge, Lasso, PCR, PLS; columns Method, Tuning, Nonzero, 10-fold CV, Test MSE), so no cell wraps on the slide. The title is the chapter's `### Test MSE`. The numbers are inline R in the chapter, quoted from the frozen markdown, and are in `say:` only.

## 15. Selected channels

- **tag:** core (4)
- **show:** figure — selected-figure (the channels with a nonzero lasso estimate at the chosen $\lambda$, fit to all 50 training meats and to the training folds of each fold, one row per fit), the figure alone
- **words:** none
- **say:** the lasso chose 20 channels; the figure marks the channels with a nonzero estimate in the lasso fit to all 50 training meats and to the training folds of each fold, 45 meats each; the 11 fits select 11 different sets of 16 to 23 channels each; only 3 channels are selected by every fit and 51 of the 100 by at least one; every pair of channels has correlation at least 0.981, so the lasso's choice among them turns on small differences among the training meats in each fold; the selected set is one of many sets that predict fat, not the set of wavelengths at which fat absorbs; the fold fits have test MSEs from 10.7 to 30.6, and ridge regression, PCR and PLS give every channel a nonzero estimate and, on this training sample, predict the test meats better than the lasso; the lasso lecture found the same instability across repeated training samples, here it appears across the folds of a single training sample; a channel the lasso drops is not shown to be unrelated to fat
- **note:** the chapter's `selected-figure` under `### Selected channels`, alone. The figure is now 8 by 4.2 inches (1536 by 806), shown at `height=600` (the slide honors it; the width is 1143 pixels). The numbers are inline R in the chapter, quoted from the frozen markdown, and are in `say:` only. The chapter no longer says that the differences are shifts to a nearby channel. The chapter's `### Beyond this course` callout (minimum-norm interpolation and double descent, inference after selection, grouped and smooth penalties, lasso algorithms) is not used.

## 16. Conclusion

- **tag:** core (1)
- **show:** none, a flat bulleted list of six takeaways
- **words:** six short lines, in the order of the lecture: "Least squares fails when $p + 1 > n$"; "Training $R^2$ and training MSE cannot choose among fits"; "$C_p$, BIC and AIC with fixed $\sigma^2$ need an estimate that is $0/0$"; "`AIC()` and `BIC()` go to $-\infty$ at a perfect fit"; "Cross-validate $\lambda$ or $M$, recomputing every step in each fold"; "Correlated features: the lasso's set changes from fold to fold"
- **say:** when p is close to or above n, least squares fails: X-transpose X is singular, the normal equations have infinitely many solutions, and when X has rank n every one fits the training responses exactly; as the number of features approaches n the training error falls toward zero while the test error rises sharply; the training R squared and training MSE always improve with more features, and the overall F-test and sigma-hat answer other questions; Cp, BIC and AIC with sigma squared fixed at the estimate from the model with all p features need that estimate, which is 0/0 when p >= n − 1, and setting it to 0 turns them into the training MSE; AIC and BIC with sigma squared estimated in each model go to minus infinity at a perfect fit; ridge regression, the lasso, PCR and PLS constrain the fit and a tuning parameter chosen by k-fold cross-validation decides how much; every data-dependent step is recomputed from the training folds inside each fold, then the chosen model is refit to all the training data and evaluated once on test data; with highly correlated features many different sets of features predict about equally well, so the set the lasso selects changes from fold to fold within a training sample and does not identify the features that matter; the next lecture compares subset selection, ridge regression, the lasso, PCR and PLS across repeated training samples
- **note:** six phrases drawn from the chapter's `## Conclusion` paragraphs (the third and fourth are its two AIC forms); one line each at the default font, no nesting, no example numbers.

---

# Not in this deck

Cut from the lecture's core line, with their assets and original content, so they can come back.

- **Dimensions** (the chapter's `### Dimensions`: $p = 100$, $n = 50$ and the correlations between channels, prose only): the $p$ and $n$ are on slide 1 and the correlations are in slide 2's `say:`; it has no figure, table or equation of its own.
- **Exact lasso solver code** (the `fits` chunk: `sd_n`, `standardize`, `original_scale`, `ridge_std`, `lasso_std`, `penalized_path`, the grids and the lasso-condition check): code in a collapsed callout; described in one sentence in slide 12's `say:` and not shown.
- **Cross-validation, test MSE, `glmnet()` comparison and fold-fit code** (the `cv`, `test-mse` and `selected` chunks): code; not shown.
- **`### Beyond this course` (never used):** minimum-norm interpolation and double descent, inference after selection, grouped and smooth penalties, lasso algorithms.
- **Chapter code callouts** (`### Code`) and the visible `split` and `all-channels` chunks: not shown.

---

# Reference: assets used by this deck

- **Figures (PNG in `_freeze/06-regularization/60-high-dimensions/figure-html/`, each with a `-1.png` suffix):** spectra-figure (slide 2), r2-figure and test-figure (the two tabs of slide 5), cor-figure (10), ridge-cv-figure, lasso-cv-figure and direction-cv-figure (the three tabs of slide 13), selected-figure (15). That is all 8 of the chapter's figures.
- **Tables (kable, copied from the frozen markdown):** test-table (slide 14). The chapter's only table.
- **Console output (frozen markdown):** none.
- **Equations on slides:** the normal equations (4); the null hypothesis of the overall $F$-test (6); $C_p$ and BIC (7); $-2\log L$ (8); the ridge and lasso criteria (11, as lines); the ridge closed form and the lasso conditions (12). Every `\hat` of the chapter is `\widehat` on the slides.
- **Numbers quoted from inline R in the frozen markdown (never retyped or recomputed). On slides:** 100 and 50 and 143 (1); 46, 0.0016, 0.9993, 1.49 and 18.3 (6); 49 (8); the table's own values (14). All others are in `say:` only.

---

# Reference: figure legibility

The effective tick-label size is 8.8/72 x (display height in pixels / figure height in inches) at the slide's 1280 by 720 design size, with the figure height in inches the PNG height divided by 192 (all figures use the default `theme_bw()` 11 pt base, so the tick labels are 8.8 pt). Measured in headless Chrome: each figure is displayed at the height shown, and the slide's `scale` is 0.9 at a 1280 by 720 viewport because of reveal's default margin, which multiplies every size below by 0.9 on a screen that is exactly 1280 by 720.

| Slide | Figure | PNG (px) | Figure height (in) | Display height (px) | Effective tick size (px) | At scale 0.9 |
|:--|:--|:--|--:|--:|--:|--:|
| 2 Data | spectra-figure | 1536 x 864 | 4.50 | 600 | 16.3 | 14.7 |
| 5 Channel sweep, Training R² | r2-figure | 1344 x 806 | 4.20 | 560 | 16.3 | 14.7 |
| 5 Channel sweep, Test MSE | test-figure | 1344 x 806 | 4.20 | 560 | 16.3 | 14.7 |
| 10 Channels and fat | cor-figure | 1344 x 729 | 3.80 | 600 | 19.3 | 17.4 |
| 13 Tuning, Ridge | ridge-cv-figure | 1344 x 806 | 4.20 | 560 | 16.3 | 14.7 |
| 13 Tuning, Lasso | lasso-cv-figure | 1344 x 806 | 4.20 | 560 | 16.3 | 14.7 |
| 13 Tuning, PCR and PLS | direction-cv-figure | 1344 x 864 | 4.50 | 560 | 15.2 | 13.7 |
| 15 Selected channels | selected-figure | 1536 x 806 | 4.20 | 600 | 17.5 | 15.7 |

No figure is under 14 px at the design size, or at scale 0.9 apart from direction-cv-figure (13.7). The tabset figures would be 12.2 px (4.2 inch figures) and 11.4 px (the 4.5 inch one) at the earlier decks' 420 px tab height, which is why this deck adds `.tall-tabs` at 560 px.
