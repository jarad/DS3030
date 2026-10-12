# Slide outline: Generalized Linear Models

Outline for `70-generalized-linear-models_slides.qmd` (Mon 2026-10-12, one
50-minute period, MWF 1:10-2:00). **The deck exists and was built from this
file; this file now describes the deck as it stands.** Edit it freely: reorder,
cut, reword, change `tag:`, add notes. When it says what you want, ask for the
deck to be refreshed and `slides-author` will implement exactly these slides.

Drafted 2026-10-08 against `70-generalized-linear-models.qmd` at `cc6686a`
(`cc6686a367677d5fae1f2cde124fc516ee41fd7a`), which is the deck's
`derived-from` hash. **Revised 2026-10-12 after the instructor's edits to the
deck**: the Poisson mean and variance derivation slide was removed, the two
log-count slides became one, lists replaced the `·` separators, and the Fitting
slide gained a console printout. The chapter was edited the same day to add the
`bike-glm-summary` chunk and its introducing sentence, and re-rendered; the
frozen output
`_freeze/04-classification/70-generalized-linear-models/execute-results/html.json`
holds that chunk's output. The chapter now has the "Slides for this lecture"
link on its third line, inserted when the deck was built.

The chapter's `##` sections are Count response, Generalized linear models,
Poisson regression and Conclusion. The core line is: the count response
(bike rentals, the hourly counts with their mean-variance plot, the Poisson
distribution), why linear regression fails and the log-count linear regression
remedy with its residuals, the GLM's three components and its three special
cases, Poisson regression (the log-linear model, the log-likelihood and score
equations with iteratively reweighted least squares, the fitted coefficients
and means, the coefficient and rate-ratio interpretation), inference (Wald tests
and intervals, the drop-in-deviance test), and overdispersion (the Pearson
residuals, the variance check, what overdispersion does to standard errors and
tests). Mapped onto the chapter's six learning objectives:

1. three components and the special cases: slides 9, 10, 11;
2. linear regression fails, log-count against Poisson: slides 6, 7, 12 (and 18);
3. log-likelihood, score equations, no closed form: slides 15, 16;
4. $e^{\beta_0}$ and rate ratios, Wald tests and intervals: slides 19, 20, 21;
5. drop-in-deviance test: slides 22, 23;
6. Pearson residuals and overdispersion: slides 25, 26, 27.

Cut to optional, in the order they would go: Fitting (17) and the Conclusion
slide (28). If time is still short, drop in this order: Observed hourly means
(14), Variance function (11) and Interaction test (23; keep the equations on
22). Cut from the deck entirely and parked below: the Poisson mean and variance
derivations, the repeated mean-variance plot, the sources of overdispersion, the
score-check numbers, the working-day interaction ratios, and every
`### Beyond this course` pointer. The Jensen's inequality content now lives only
in the speaker notes of slide 7. Four transition slides (1, 8, 13, 24), as in
the QDA and evaluation decks, one live widget (slide 5, the Poisson slider),
and two console slides (17, 23).

Nothing here is new content. Every `show:` points at something that already
exists in `70-generalized-linear-models.qmd`, so the deck distills the notes and
never invents. If a slide needs something the chapter doesn't have, flag it with
`needs:` and it goes back through `notes-author` and `proof-reader` first. No
slide in this outline needs one.

**Independence notation.** Every slide that states a model writes it with
`\stackrel{ind}{\sim}` exactly as the chapter's current display does (slides 7,
9, 15), per `CONVENTIONS.md`. The GLM symbols are `CONVENTIONS.md`'s: $\mu_i =
E[Y_i \mid x_i]$ for the mean (not the discriminant analysis class mean
$\mu_k$), $\eta_i = x_i\beta$ for the linear predictor, $g$ for the link,
$\phi\,V(\mu_i)$ for the variance, and "rate ratio" for $e^{\beta_j}$. $D$ on
slide 22 is the deviance, never an indicator. $p$ is the number of features
throughout; no slide uses $p$ for a probability. The deck calls the raw columns
"explanatory variables" (slide 2), per `CONVENTIONS.md`, and "features" only for
the columns that enter the model.

## How to read an entry

```
## N. Slide title                       <- reuse the chapter's own heading when there is one
tag: core | optional                    <- optional = first to drop if time is short
show: <type> — <asset>                  <- what is on the slide (types below)
words: "a short label, 0-1 lines"       <- the only prose on the slide
reveal: <what appears on each click>    <- optional; omit when everything shows at once
say: what you plan to say aloud         <- speaker notes, never on the slide
needs: ...                              <- only if something is missing from the chapter
```

`reveal:` lists the clicks in order, as "on arrival: ...; click 1: ...; click 2: ...".
Each click is one `{.fragment}` block in the deck. Use it on slides that stack
several equations, so the content appears as it is discussed.

`show:` types: `equation` (copied from the chapter's source; `\widehat` for
`\hat` in slides), `figure` (the named chunk's PNG from `_freeze/`), `table`
(the named kable chunk, copied from the frozen markdown), `tabset` (several
figures on ONE slide as a `.panel-tabset`, one tab per figure; the tab labels
are the chapter's own tab names), `console` (a chunk's printed R output,
verbatim), `ojs` (the chapter's `{ojs}` cells copied verbatim, with the
`<script type="ojs-define">` data block copied verbatim from the frozen output;
needs a web connection when presented), `link` (a pointer back to the notes
page, for anything that cannot be a static image), `none` (a words-only slide).
A slide may combine two `show:` items, for example an equation pair or a table
beside a figure.

Slides never draw from a `### For example,` or `### Beyond this course`
callout.

Equations use the bracket convention (`E[\cdot]` and `Var[\cdot]` always square,
other nested groupings cycling `()`, `[]`, `{}`) and `\widehat` for `\hat`.

**Timing:** 29 slides (0 to 28): 4 transitions (no time), 23 `core` content
slides (slide 0 and 22 more) and 2 `optional`. At about 2 minutes each the 23
core slides come to roughly 45 minutes, which fits 50 only because the quick
ones (0, 2, 4, 11, 12, 14, 15, 23) take a minute to a minute and a half;
the three slowest are slide 3 (the three-tab Hourly counts), slide 16
(Maximum likelihood estimation, the lecture's derivation) and slide 5 (the
slider, worked live). The two optional slides add about 3 minutes if there is
room.

---

## 0. Today
tag: core
show: none, a bulleted list
words: agenda as nine noun phrases, one per line — Count response · Poisson distribution · Log-count regression · Generalized linear models · Poisson regression · Maximum likelihood · Rate ratios · Inference · Overdispersion
say: distilled from the chapter's six learning objectives, each compressed to a noun phrase (three components and special cases; linear regression's failure and log-count regression; the score equations; coefficient interpretation and Wald inference; the drop-in-deviance test; Pearson residuals and overdispersion); the DS3030 title slide carries the chapter title; the timing note is in the speaker notes: optional slides in the order they would go (Fitting, Conclusion), then the drop order (Observed hourly means, Variance function, Interaction test, keeping the equations on Drop-in-deviance test)

## 1. Count Response
tag: core
show: none (transition slide, title only)
words: none

---

# Count Response

## 2. Bike rentals
tag: core
show: none, an itemized list — the chapter's data statement, the response variable and five explanatory variables
words: "`ISLR2::Bikeshare`: 8,645 hours of one year in Washington, D.C." as a line, then an itemized list: "Response variable: `bikers`, the number of bikes rented in the hour" and "Explanatory variables:" with five nested items — "`hr`: hour of the day, 0 to 23", "`workingday`: working day or not", "`mnth`: month", "`temp`: temperature, rescaled to [0, 1]", "`weathersit`: weather"
say: a count is a nonnegative integer, its mean must be positive and its spread typically grows with its mean, unlike the quantitative response of the regression lectures and the binary one of the logistic regression lectures; the question is how the hourly count depends on time of day, working day, month, temperature and weather; casual and registered are pieces of the response and no model uses them; 115 hours of the year have no record (365 days of 24 hours, against 8,645 records)
note: no figure or table in the chapter for this subsection; the slide is words only, and the 8,645 and 365 are inline R in the chapter ("`r fmt(nrow(Bikeshare))` hours ... `r max(Bikeshare$day)` days"), quoted from the frozen markdown at build time. The explanatory variable list is the chapter's five bullets, cut to a label each. The mutated `bike` data frame (working, weather, temp_c) is built in the `bike-eda` Code callout and is not shown.

## 3. Hourly counts
tag: core
show: tabset — three tabs with the chapter's own names: "Distribution" (count-hist-figure), "Hourly profile" (count-hour-figure), "Mean and variance" (mean-variance-figure)
words: none beyond the tab names
say: Distribution: counts from 1 to 651, median 109, mean 143.8, strongly right-skewed. Hourly profile: working days peak twice, at hour 8 and hour 17, the commute; non-working days rise to a midday plateau; the two profiles differ in shape, not just in level, and the spread is larger where the mean is higher. Mean and variance: one point per hour-by-working-day group (48 of them) at its mean and variance on log scales; the variance climbs with the mean, on a line of slope 1.75 on these axes, and all 48 points lie above the dashed line where the variance equals the mean; month, temperature and weather vary within each group, so part of each group's variance is variation they could explain; the third tab is the same image as the chapter's figure that opens the Generalized Linear Models section, so say so aloud when the deck reaches that section (slide 8)
note: the chapter's own tabset; the third tab is the same image as the chapter's `glm-mean-variance-figure` (which opens the GLM section), reused by saying so aloud when the deck reaches slide 8. The chapter's slope and the 48-of-48 are inline R, quoted from the frozen markdown if put on the slide.

## 4. Poisson distribution
tag: core
show: equation — `P(Y = y) = \frac{\mu^{y} e^{-\mu}}{y!}, \qquad y = 0, 1, 2, \ldots`, then `E[Y] = Var[Y] = \mu`
words: after the first equation, "μ > 0 — mean"
reveal: on arrival: the mass function and the "μ > 0 — mean" label; click 1: the display `E[Y] = Var[Y] = \mu`
say: the dashed line of the previous slide is the variance of the standard model for a count; the chapter writes μ for the Poisson mean (the symbol the GLMs below use for a mean) where ISLR2 writes λ
note: the "$y! = 1 \times 2 \times \cdots \times y$, $0! = 1$" bullet is not on the slide. The second display is the chapter's statement that the mean and the variance are both μ, written `E[Y] = Var[Y] = \mu` (square brackets), a display and not a words line; the chapter's two derivations of it are not in the deck (parked below).

## 5. Poisson distribution, slider
tag: core
show: ojs — poisson-slider and poisson-slider-plot (the chapter's mean slider: black lollipops for the probability mass function, a dashed line at the mean, a shaded band one standard deviation $\sqrt{\mu}$ either side), with `poisson_pmf` from the frozen `ojs-define` block (R chunk `poisson-slider-define`)
words: an itemized list of two lines — "Mean μ from 1 to 40", "Band: one standard deviation, √μ"
say: work the slider live; at a mean near 1 most of the probability sits at 0, 1 and 2 and the distribution is strongly right-skewed; as μ grows it moves right, becomes nearly symmetric and widens, its standard deviation √μ growing with the mean; both axes rescale, so read the spread and heights from the axis labels; the busiest bike group has mean 395, so the Poisson standard deviation is 19.9, against an observed standard deviation of 164.4 (variance 27,031): the gap the mean-variance plot showed for every group; the figure needs an internet connection; while the slider has focus reveal.js ignores the arrow keys, so click an empty part of the slide to go on
note: the cells are verbatim from the chapter (`poisson-slider`, `poisson-slider-plot`) except sizes; the data block is a single `<script type="ojs-define">` (about 56 KB, in the frozen `include-in-header`) copied verbatim from the frozen output, never retyped. The busiest-group numbers are inline R in the chapter, quoted from the frozen markdown.

## 6. Linear regression fails
tag: core
show: figure — lm-residual-figure (each hour's residual against its least squares fitted value, dashed vertical line at a fitted value of 0)
words: an itemized list of two lines above the figure — "895 of 8,645 hours have a negative fitted mean", "Residuals fan out to the right"
say: the linear regression uses the 61 features of `bike_formula` (hour dummies, working day, their products, month dummies, temperature in degrees Celsius, weather dummies); three failures: negative fitted means (895 hours, 10.4%, the smallest at −140.9 bikers, and a mean count cannot be negative); variance growing with the mean (residual standard deviation 37.6 where the fitted value is below 50 and 90.5 where it is above 300, while every `lm()` test and interval assumes one common variance); and additive effects, a winter month, a cold hour or rain shifting every hour by the same number of riders, which at night is enough to push the fit below zero (460 of the 895 negative fitted values are in clear weather, and the median temperature of all 895 is 3.3 degrees Celsius against 15.5 for all hours)
note: the three failures are the chapter's numbered list; they are in the say line, not on the slide, to keep the slide to the figure and two labels. Every number is inline R in the chapter, quoted from the frozen markdown.

## 7. Log-count linear regression
tag: core
show: equation and figure — `\log Y_i \mid x_i \stackrel{ind}{\sim} N\left(x_i\gamma, \sigma^2\right)` above log-residual-figure (each hour's residual against its fitted log count)
words: none beyond the equation
say: the regression lectures' remedy for a positive response whose spread grows with its mean is least squares on log Y_i with the same features; γ and σ² are this model's coefficients and error variance; it needs every y_i > 0, and no hour has zero bikers, so log y_i is defined for all 8,645 hours; its smallest back-transformed fitted value is 0.75 bikers, so no fitted value is negative, and the residuals no longer fan out to the right: they narrow as the mean grows (standard deviation 0.55 below 50 and 0.23 above 300 on the log scale), so one common σ² still does not describe the data. Second paragraph of the speaker notes (Jensen, not on the slide): exponentiating a fitted value gives e^{x_i γ̂}, which estimates e^{E[log Y_i | x_i]} and not the mean count: by Jensen's inequality it is at most the mean, and it is the median of Y_i given x_i under the normal model; averaged within each of the 48 hour-by-working-day combinations the back-transformed fits fall below the observed mean in 45, with a median ratio of 0.93; if the contrast needs more time this is where to spend it; the Jensen derivation is in the chapter
note: replaces the old pair "Log-count linear regression" and "What log-count estimates". The exponentiated-product display, its words line and the two Jensen displays are not on the slide; the Jensen content (45 of 48, 0.93) is in the speaker notes only. The figure is the chapter's `log-residual-figure`, no longer parked. The chapter's `x_i` here is a row of the model matrix, a leading 1 and the 61 features. Every number is inline R in the chapter, quoted from the frozen markdown.

## 8. Generalized Linear Models
tag: core
show: none (transition slide, title only)
words: none
say: the chapter's section opens with the mean-variance plot repeated; the deck does not repeat the image, since the third tab of Hourly counts (slide 3) already showed it; say "the same plot, variance far above constant" aloud

---

# Generalized Linear Models

## 9. Three components
tag: core
show: equation — `Y_i \mid x_i \stackrel{ind}{\sim} \text{a distribution with mean } \mu_i, \qquad g(\mu_i) = \eta_i, \qquad \eta_i = x_i\beta`
words: after the equation, an itemized list of three labels: "μ_i = E[Y_i | x_i] — mean of the response" · "η_i — linear predictor" · "g — link function, strictly monotone"
reveal: on arrival: the equation; click 1: the three symbol labels
say: the Problems in Logistic Regression lecture wrote linear and logistic regression as one distributional statement each; both have the same three parts, a distribution, a linear predictor and a link, and a GLM keeps them while letting each vary; the distribution of Y_i given x_i is the random component; dummy variables, polynomials, step functions and interactions enter the linear predictor exactly as they did before; the link connects the two, μ_i = g⁻¹(η_i), and g⁻¹ carries the real line onto the values a mean can take, (0, 1) for a probability and (0, ∞) for a count, so every β gives a valid mean; this μ_i is the mean of observation i, unrelated to the class means μ_k of the discriminant analysis lectures; ISLR2 writes η for the link itself, these notes write g; for the bike counts the linear regression is the GLM with a normal random component and the identity link, which does nothing to keep x_i β̂ positive, so 895 fitted means fell below zero
note: the statement is the chapter's "Three components" display, verbatim; the labels are its bulleted symbol definitions, compressed. The old closing line "Random component · Linear predictor · Link" is no longer on the slide. Matches the chapter's heading.

## 10. Special cases
tag: core
show: table — glm-table-display (Model, Response, Distribution of $Y_i$, Link $g(\mu_i)$, Mean $\mu_i$, Variance, `glm()` family, for linear, logistic and Poisson regression)
words: none beyond the table
say: for each model the table gives the response type, the distribution of Y_i, the link, the mean as a function of η_i, the variance and the `glm()` family that fits it (`family = gaussian` gives the same estimates as `lm()`); in logistic regression the mean μ_i = P(Y_i = 1 | x_i) is the probability the earlier lectures wrote p(x_i), so the credit card default lectures are this table's logistic regression row
note: the chapter's seven-column table; the slide sets it at about 0.55em for width, as the QDA deck's pairing table. The Mean and Variance columns carry the identity, logit and log rows' $\mu_i$ forms.

## 11. Variance function
tag: core
show: equation and table — `Var[Y_i \mid x_i] = \phi\, V(\mu_i)`, then a small table with columns Distribution, $V(\mu)$, $\phi$ and rows Normal ($1$, $\sigma^2$), Bernoulli ($\mu(1 - \mu)$, $1$), Poisson ($\mu$, $1$)
words: after the equation, an itemized list of two labels — "V — variance function", "φ — dispersion parameter"
reveal: on arrival: the equation and the two labels; click 1: the table
say: each distribution fixes how the variance depends on the mean; linear regression's constant variance is the special case V(μ) = 1, the assumption the fanning residuals contradicted; the other two models require the variance to change with the mean, as the bike counts' variance did; the Bernoulli and the Poisson have no variance parameter separate from the mean, so φ = 1, which is the assumption the overdispersion slides test
note: the display and the two labels are the chapter's; the table lays out the chapter's two bullets (V: 1, μ(1 − μ), μ; φ: σ², 1, 1) as rows, with the same values and no new content, but it is a re-layout, not a table the chapter contains. Third to drop if time is short (the table on slide 10 already has a Variance column).

## 12. Transforming the mean
tag: core
show: equation — `\text{log-count linear regression: } E[\log Y_i \mid x_i] = x_i\gamma, \qquad \text{Poisson regression: } \log E[Y_i \mid x_i] = x_i\beta`
words: "A GLM transforms the mean, not the response" and "A log link never takes log y_i: a count of 0 is fine"
reveal: on arrival: the equation; click 1: the two words lines
say: both models put the linear predictor on a log scale, of different quantities; the log-count model takes the logarithm of y_i, so it fails for a count of zero (bikers has none, but counts in general can); the log link takes the logarithm of the mean, never of y_i
note: the title is new; the chapter makes the point in the sentence "A GLM transforms the mean, not the response" under "Special cases". The equation is the chapter's own display, verbatim, and the objective's contrast.

## 13. Poisson Regression
tag: core
show: none (transition slide, title only)
words: none

---

# Poisson Regression

## 14. Observed hourly means
tag: core
show: figure — observed-means-figure (hourly means of the count by weather, in rows, and working-day status, in columns, each panel on its own vertical scale, dotted line at zero)
words: "Rain scales the profile: 0.54 times clear at 3 a.m., 0.63 times at 5 p.m."
say: each weather row repeats the hourly profile of the clear row at a lower level; on working days the rain/snow mean is 0.54 times the clear mean at 3 a.m. and 0.63 times at 5 p.m., while the differences are 2.2 and 161.1 riders, so rain is a multiplicative effect, not a constant number of riders at every hour
note: the chapter's figure opens the section and has no heading, so the title is new, from the figure's title ("Observed hourly means"). The ratios and differences are inline R, quoted from the frozen markdown. Second to drop if time is short.

## 15. Log-linear model
tag: core
show: equation — `Y_i \mid x_i \stackrel{ind}{\sim} \text{Poisson}(\mu_i), \qquad \log \mu_i = x_i\beta = \beta_0 + \beta_1 x_{i1} + \cdots + \beta_p x_{ip}`, then `\mu_i = e^{x_i\beta} = e^{\beta_0} \times e^{\beta_1 x_{i1}} \times \cdots \times e^{\beta_p x_{ip}}`
words: after the first equation, "Poisson random component, log link"; after the second, "Features add on the log scale, multiply on the scale of the mean"
reveal: on arrival: the model and its label; click 1: the inverse-link product and its label
say: Poisson regression is the GLM with a Poisson random component and a log link; the mean is positive for every β and every row x_i; a weather dummy multiplies every hour's mean by the same factor e^{β_j}, the scaling of the rain/snow row in the previous figure
note: both displays copied verbatim from the chapter's Log-linear model subsection.

## 16. Maximum likelihood estimation
tag: core
show: equation — `\ell(\beta) = \sum_{i=1}^n \left[y_i \log \mu_i - \mu_i - \log(y_i!)\right] = \sum_{i=1}^n \left[y_i\, x_i\beta - e^{x_i\beta} - \log(y_i!)\right]`, then `\sum_{i=1}^n x_{ij}\left(y_i - \mu_i\right) = 0, \qquad j = 0, 1, \ldots, p`
words: after the second display, an itemized list of two lines — "Same form as the logistic regression score equations", "No closed form: μ_i = e^{x_iβ} is nonlinear in β" — then "Solved by iteratively reweighted least squares"
reveal: on arrival: the log-likelihood; click 1: the score equations; click 2: the two-item list; click 3: the iteratively reweighted least squares line
say: the lecture's derivation, the slowest slide after the Hourly counts tabset; the log-likelihood is the sum of the logs of the Poisson mass functions of independent observations; log(y_i!) does not involve β and so does not affect the maximizer; differentiate with respect to β_j using ∂e^{x_i β}/∂β_j = x_ij e^{x_i β} and set to zero, with x_i0 = 1; they have exactly the form of the logistic regression score equations with μ_i in place of p(x_i); at the solution the residuals y_i − μ̂_i, where μ̂_i = e^{x_i β̂} is the fitted mean, sum to zero and are orthogonal to every feature; because μ_i is nonlinear in β the equations in general have no closed-form solution: with only the hour-by-working-day dummies the solution is the cell means, but with a quantitative feature such as temperature it has none; `glm()` solves them with the algorithm it used for logistic regression, each iteration a weighted least squares problem with weights recomputed from the current estimate
note: both displays copied verbatim from the chapter's Maximum likelihood estimation subsection; the chapter's `\hat\mu_i` fitted-mean sentence stays in the say line. This is the lecture's derivation slide (objective 3).

## 17. Fitting
tag: optional
show: code and console — the `bike-lm` line `bike_formula <- bikers ~ hr * working + mnth + temp_c + weather`, the `bike-glm` line `bike_glm <- glm(bike_formula, data = bike, family = poisson)`, and the `bike-glm-summary` call `printCoefmat(summary(bike_glm)$coefficients[c("(Intercept)", "workingYes", "temp_c", "weathercloudy/misty", "weatherrain/snow"), ])` as the slide's code block, then the printout of that call: five rows (the intercept and the working day, temperature, cloudy/misty and rain/snow coefficients) with Estimate, Std. Error, z value and Pr(>|z|) columns, and the "Signif. codes" line, copied verbatim from the frozen `bike-glm-summary` console block
words: none
reveal: on arrival: the code; click 1: the printout
say: optional, the score equations already state the consequence; same formula as `lm()`, with `family = poisson` for the Poisson random component and the log link; the model has 62 coefficients and `glm()` reports convergence after 4 iterations; the intercept's score equation makes the fitted means sum to the observed counts, 1,243,103 each; a dummy variable's equation makes the fitted means average to the observed mean where that dummy is 1, so both models reproduce the observed mean of each of the 48 hour-by-working-day combinations (largest gap 6.9 × 10⁻⁸ bikers); the printout is five of the 62 rows of `summary(bike_glm)$coefficients`: the estimate, standard error, Wald z statistic and p-value of the intercept and the working day, temperature and weather coefficients; the rate ratios slide interprets them
note: the code is a plain source block with no chunk label; the printout is the frozen `bike-glm-summary` console block (the `cell-output-stdout` fenced text), copied verbatim, so nothing is run, in a plain unlabeled ``` block, and sits in a fragment. The chapter was edited 2026-10-12 to add that chunk and the sentence before it, and re-rendered; the old statement that the chapter prints no console output for these chunks is obsolete (the `bike-lm` and `bike-glm` chunks themselves still print nothing). `bike` (the `bike-eda` Code callout's `working`, `weather`, `temp_c` columns) is not shown. 62, 4 and the two sums are inline R in the chapter, quoted from the frozen markdown. Optional because the score equations on slide 16 already state the consequence. The estimates and z values here are the ones the rate-ratio table (slide 20) exponentiates and slide 21 summarizes (|z| from 30.7 to 142.9 are the cloudy/misty and rain/snow z values printed here).

## 18. Fitted means
tag: core
show: figure — fitted-means-figure (observed hourly means, open circles, with one line per model through its fitted means: linear regression dashed, log-count linear regression dot-dash, Poisson regression solid; same weather-by-working-day panels)
words: none (figure only, no bullet lines)
say: pooled over weather, linear and Poisson regression agree, since both reproduce each hour-by-working-day mean; they differ only in how they split each combination across the weather rows; in the rain/snow row linear regression subtracts its constant weather coefficient from every hour and its lines fall as low as −83.7 bikers, where the observed means never fall below 2.6; the Poisson lines scale the profile down instead and follow the points closely, overnight included; the log-count lines also scale the profile and stay positive (smallest overnight 2.1 bikers in the rain/snow row) but lie below the observed mean at 122 of the 144 points, against 68 for the Poisson lines, and total 1,202,378 bikers against the 1,243,103 observed: consistent with a fit that estimates e^{E[log Y_i | x_i]} rather than the mean count
note: the figure is tall (8 by 7 inches, six panels with a bottom legend), so the slide sets it as large as the height allows. Every number is inline R in the chapter, quoted from the frozen markdown.

## 19. Coefficient interpretation
tag: core
show: equation — `\log \mu(x_j + 1) - \log \mu(x_j) = \beta_j, \qquad \frac{\mu(x_j + 1)}{\mu(x_j)} = e^{\beta_j}`
words: "e^{β_0} — mean count when every feature is zero" on arrival; after the equation, "e^{β_j} — rate ratio: factor multiplying the mean count per one-unit increase in feature j, other features fixed"
reveal: on arrival: the $e^{\beta_0}$ line; click 1: the equation; click 2: the rate-ratio line
say: write μ(x) for the mean count at a row of feature values x = (1, x_1, …, x_p); at x = (1, 0, …, 0), log μ(x) = β_0, so e^{β_0} is the mean count at the reference levels of the dummy variables; increasing feature j by one unit with every other feature fixed, every term of the linear predictor except the jth cancels; e^{β_j} is the odds ratio of logistic regression with the mean count in place of the odds; e^{β_j} = 1 means no association; c units multiply the mean by e^{cβ_j}; for a dummy variable e^{β_j} is the mean at the indicated level divided by the mean at the reference level; with an interaction x_j x_l the rate ratio for x_j depends on x_l
note: β_0 is read first, as `CLAUDE.md` requires; the equation is the chapter's display with its `\mu(x_j)`, `\mu(x_j + 1)` definitions said, not written. "Rate ratio" per `CONVENTIONS.md`.

## 20. Rate ratios
tag: core
show: table — rate-ratio-table (Coefficient, Estimate, $e^{\widehat\beta_j}$ for the intercept, working day at hour 0, temperature per degree C, cloudy/misty vs. clear, rain/snow vs. clear)
words: three lines, one per click — "Intercept: 28.9 bikers at hour 0, non-working day, January, clear, 0 °C (linear regression: −10.9)" · "Rain/snow: ×0.560, a 44% reduction at every hour" · "5 °C: ×1.084, an increase of 8.4%"
reveal: on arrival: the table; click 1: the intercept line; click 2: the rain/snow line; click 3: the temperature line
say: the intercept is read first: e^{β̂_0} = 28.9 is a realistic winter night, unlike the linear regression's −10.9 bikers for the same conditions; because hour and working day interact the working-day coefficient compares the two kinds of day at the reference hour only: at midnight a working day's estimated mean is 0.40 times a non-working day's, and at 8 a.m. the ratio adds the hr8:workingYes coefficient to the exponent, e^{−0.919 + 2.442} = 4.59; each additional degree Celsius multiplies the mean by 1.0162, holding hour, working day, month and weather fixed; rain or snow multiplies the mean by 0.560 relative to clear weather, the scaling in the rain/snow row of the fitted-means figure, and cloudy or misty weather by 0.935
note: the table is the chapter's kable, copied verbatim from the frozen markdown; the slide's lines are inline R from the paragraphs after it, quoted not retyped. Title is new (the chapter has no heading for the table). The estimates in its Estimate column are the ones printed on slide 17. (The deck's speaker notes for this slide still end with the sentence that the chapter prints no `summary(bike_glm)` and that this table is the only display of the fitted coefficients; that is now stale, since slide 17 prints them, and the sentence is left out here.)

## 21. Inference
tag: core
show: equation — `z = \frac{\widehat\beta_j - \beta_j^0}{\text{SE}\left(\widehat\beta_j\right)}`, then `\widehat\beta_j \pm z_{1-\alpha/2}\,\text{SE}\left(\widehat\beta_j\right)`
words: after the first equation, "≈ N(0, 1) under H_0: β_j = β_j^0"; after the second, "Exponentiate the endpoints: interval for the rate ratio e^{β_j}"; then an itemized list of five items — "|z| from 30.7 to 142.9, so every 95% interval excludes 1", "Working day at hour 0: (0.386, 0.412)", "5 °C: (1.081, 1.086)", "Cloudy/misty: (0.931, 0.939)", "Rain/snow: (0.555, 0.564)"
reveal: on arrival: the z statistic and its label; click 1: the Wald interval and the exponentiate line; click 2: the five-item list
say: inference repeats the logistic regression lectures: in large samples β̂_j is approximately normal, SE(β̂_j) comes from the curvature of ℓ at β̂, and the Wald interval is what `confint.default()` returns; exponentiating its endpoints gives an interval for the rate ratio; for the four rate ratios of the table |z| ranges from 30.7 to 142.9; if the last click is too crowded, keep only the |z| range and the rain/snow interval
note: the two displays are the chapter's; the numbers are inline R, quoted from the frozen markdown. The |z| range is the cloudy/misty (−30.681) and rain/snow (−142.910) z values printed on slide 17. Title is the chapter's.

## 22. Drop-in-deviance test
tag: core
show: equation — `D = 2\left[\ell_{\text{sat}} - \ell\left(\widehat\beta\right)\right]`, then `G^2 = D_r - D_f = -2\left[\ell\left(\widehat\beta_r\right) - \ell\left(\widehat\beta_f\right)\right]`
words: after the first equation, an itemized list of two labels — "D — deviance, not an indicator", "ℓ_sat — saturated model, μ_i = y_i"; after the second, "Under H_0: the k dropped coefficients are zero, G² ≈ χ²_k" and "anova(reduced, full, test = \"Chisq\")"
reveal: on arrival: the deviance and its two labels; click 1: the G² display; click 2: the χ²_k line and the `anova()` call
say: for a count response `glm()` reports the residual deviance; the saturated model gives each observation its own mean μ_i = y_i, the largest log-likelihood any mean model can reach, and does not involve β, so for a reduced model nested in a full one G² = D_r − D_f, the statistic of the multiple logistic regression lecture (for a binary response ℓ_sat = 0, which is why that lecture wrote D = −2ℓ(β̂)); a group of coefficients, here every product of an hour dummy with the working-day indicator, is tested together; no single z-test asks whether working and non-working days share one hourly profile up to a constant factor
note: the displays are the chapter's, with `\widehat` for `\hat`; D is the deviance here, per `CONVENTIONS.md` and the chapter's one-sentence statement. The title is new (the chapter has no heading for the paragraph).

## 23. Interaction test
tag: core
show: code and console — `bike_additive <- glm(bikers ~ hr + working + mnth + temp_c + weather, data = bike, family = poisson)`, `interaction_test <- anova(bike_additive, bike_glm, test = "Chisq")` and `interaction_test`, with the printed output of `interaction_test` (the Analysis of Deviance Table: Resid. Df 8606 and 8583, Resid. Dev 228046 and 99377, Df 23, Deviance 128669, Pr(>Chi) < 2.2e-16 ***)
words: "G² = 128,669 on k = 23 degrees of freedom, against a χ²_23 mean of 23"
say: fourth to drop if time is short (keep Drop-in-deviance test); the full model has the 23 hour-by-working-day products, the additive one omits them; the deviance drops by 128,669 on 23 degrees of freedom, against a χ²_23 mean of 23: the data are inconsistent with one hourly profile, up to a constant factor, shared by both kinds of day; this test assumes Var[Y_i | x_i] = μ_i, which the next slides question
note: code above, the printed output below it. The output is the frozen `interaction-test` console block (the `cell-output-stdout` fenced text), copied verbatim, so nothing is run; the G² and k are inline R in the chapter, quoted from the frozen markdown. `bike` is not defined on the slide (see slide 17); the chunk's closing lines (`G2 <- ...`, `k <- ...`) are not shown. Fourth to drop if time is short (keep slide 22).

## 24. Overdispersion
tag: core
show: none (transition slide, title only)
words: none

---

# Overdispersion

## 25. Pearson residuals
tag: core
show: equation — `Var[Y_i \mid x_i] > \mu_i`, then `\frac{y_i - \widehat\mu_i}{\sqrt{\widehat\mu_i}}`, then `\widehat\phi = \frac{1}{n - (p+1)}\sum_{i=1}^n \frac{\left(y_i - \widehat\mu_i\right)^2}{\widehat\mu_i}`
words: before the first equation, "Overdispersion:" (the inequality is inline on the same line, not a display); after the second, "Pearson residual: standardized by the Poisson standard deviation"; after the third, an itemized list of two lines — "φ̂ — estimates the dispersion parameter, fixed at 1 by the Poisson model", "Well above 1: overdispersion"
reveal: on arrival: "Overdispersion:" and the inequality; click 1: the Pearson residual and its label; click 2: the φ̂ equation and its two-item list
say: the Poisson model has no variance parameter, so every standard error and deviance test above is computed under Var[Y_i | x_i] = μ_i; if that holds then E[(Y_i − μ_i)²/μ_i | x_i] = 1, so the average squared Pearson residual should be close to 1; the divisor n − (p + 1) accounts for the p + 1 estimated coefficients, as in σ̂² = RSS/[n − (p + 1)]
note: the three expressions are the chapter's, the second written as a display (it is inline in the chapter) and the first inline on the slide. The title is new, from the chapter's bolded term.

## 26. Variance check
tag: core
show: figure — variance-check-figure (twenty groups of hours binned by fitted mean, each at its average fitted mean and average squared residual on log scales, dashed line at variance = mean)
words: an itemized list of two lines above the figure — "All 20 bins above the dashed line", "φ̂ = 11.3 (additive model: 25.6)"
say: the figure bins the hours into 20 groups by fitted mean; all 20 bins have an average squared residual above the dashed line; the average squared Pearson residual is φ̂ = 11.3: the hourly counts have about 11 times the variance around their fitted means that a Poisson distribution allows; the additive model's φ̂ is 25.6, so the hour-by-working-day features explained part of the excess variation, but φ̂ remains far above 1
note: the title is new (the chapter has no heading for the figure). The 20, 11.3, 25.6 and "about 11" are inline R in the chapter, quoted from the frozen markdown at build time.

## 27. Effects of overdispersion
tag: core
show: none, a short list and one equation — "β̂, fitted means, rate ratios: still sensible if the mean model is right", "Standard errors too small: z too large, intervals too narrow", "G² too large against χ²_k: G²/φ̂ ≈ χ²_k", then `G^2 / \widehat\phi = 11{,}380`
words: the three list lines, then after the equation "495 times its 23 degrees of freedom: the interaction test's conclusion survives"
reveal: on arrival: the three list lines; click 1: the equation and the closing line
say: the score equations involve y_i only through y_i − μ_i, never its variance, so if the mean model is right β̂ and the fitted means stay sensible; the standard errors, computed as if the variance were μ_i, are too small; if Var[Y_i | x_i] = φ μ_i then G² is approximately φ χ²_k, so G²/φ̂ is approximately χ²_k, and for the bike counts G²/φ̂ is 11,380, still 495 times its 23 degrees of freedom; overdispersion has two sources, as in the problems in logistic regression lecture: explanatory variables missing from the model that vary among observations with the same x_i (plausibly, conditions shared by the hours of one day), and events within one count that are not independent, such as riders who rent together; adding features addresses only the first
note: the three list lines are the chapter's three consequences, cut to a clause each; 11,380 and 495 are inline R in the chapter, quoted from the frozen markdown. The two sources are in the say line only. Quasi-Poisson and negative binomial regression are in the chapter's `### Beyond this course` callout and are not used; say aloud that they exist only if the instructor wishes.

## 28. Conclusion
tag: optional
show: none, a bulleted list
words: the bare concept names from the chapter's `## Conclusion`, no recap sentences, one per line — Generalized linear model · Poisson regression · Rate ratio · Log-count linear regression · Score equations · Wald tests · Drop-in-deviance test · Overdispersion
say: optional; the lecture may end on slide 27 with the next lecture's preview said aloud: the resampling unit begins on Wednesday 2026-10-14 with cross-validation, which estimates test error by repeatedly holding out part of the data and uses those estimates to choose among models and flexibility settings (ISLR2 Chapter 5)

---

# Not in this deck

Cut from the lecture's core line, with their assets, so they can come back.

- **Poisson mean and variance derivations** (the old optional slide between
  Poisson distribution and the slider): the chapter's two displays,
  `E[Y] = \sum_{y=1}^\infty y\, \frac{\mu^{y} e^{-\mu}}{y!} = \mu \sum_{y=1}^\infty \frac{\mu^{y-1} e^{-\mu}}{(y-1)!} = \mu`
  then
  `Var[Y] = E[Y(Y - 1)] + E[Y] - \mu^2 = \mu^2 + \mu - \mu^2 = \mu`.
  Say: drop the y = 0 term and cancel y against y!; the last sum adds the
  probability mass function over every count; the same step applied twice gives
  E[Y(Y − 1)] = μ². The objectives do not ask for this derivation; it only
  supports "mean equals variance" (slide 4's second display). Would go back as
  an optional slide after slide 4, with the `E[Y]` display on arrival and the
  `Var[Y]` display on click 1.
- **Repeated mean-variance plot:** `figure — glm-mean-variance-figure` (the same
  image as `mean-variance-figure`, slide 3's third tab).
- **Hourly counts, text only:** the chapter's two sentences on the peaks at
  hours 8 and 17 and on the slope 1.75 are in slide 3's `say:`.
- **Score check:** the largest gap between the observed and fitted means of the
  48 combinations, 6.9 × 10⁻⁸ bikers, and the sum identity (in slide 17's
  `say:`, optional).
- **Jensen's inequality displays** (`E[\log Y_i \mid x_i] \le \log E[Y_i \mid x_i]`
  and `e^{E[\log Y_i \mid x_i]} \le E[Y_i \mid x_i]`) and the exponentiated
  log-count product: not on any slide; the Jensen content is in slide 7's
  `say:` (second paragraph).
- **Working-day interaction ratios:** 0.40 at midnight and 4.59 at 8 a.m. (text
  and inline R only, in slide 20's `say:`).
- **Sources of overdispersion:** missing explanatory variables and dependent
  events within a count (text only, in slide 27's `say:`).
- **Beyond this course (never used):** the exponential family and canonical
  link; gamma, probit, multinomial and ordinal regression (the callout under
  "Special cases"); quasi-Poisson and negative binomial regression, with the
  $\sqrt{\widehat\phi}$ factor and the widened rain/snow interval (the callout
  under "Overdispersion").

---

# Reference: assets used by this deck

- **Figures (PNG in `_freeze/04-classification/70-generalized-linear-models/figure-html/`,
  each with a `-1.png` suffix):** count-hist-figure, count-hour-figure,
  mean-variance-figure (the three tabs of slide 3), lm-residual-figure (6),
  log-residual-figure (7), observed-means-figure (14), fitted-means-figure (18),
  variance-check-figure (26). Parked: glm-mean-variance-figure.
- **Tables (kable, copied from the frozen markdown):** glm-table-display (10),
  rate-ratio-table (20). The small table on slide 11 (Variance function) is not
  a chapter table; it re-lays-out the chapter's two bullets.
- **Console output (frozen markdown):** the `bike-glm-summary` printout (slide
  17: five rows of `printCoefmat(summary(bike_glm)$coefficients[...])`) and the
  `interaction-test` printout (slide 23). The `bike-lm` and `bike-glm` chunks
  print nothing.
- **Interactive widget (OJS):** the `{ojs}` cells `poisson-slider` and
  `poisson-slider-plot` (slide 5), copied from the chapter source; their data
  are the single `<script type="ojs-define">` block (`poisson_pmf`), copied
  verbatim from the `include-in-header` field of
  `_freeze/04-classification/70-generalized-linear-models/execute-results/html.json`.
  If the chapter's `poisson-slider-define` chunk changes, recopy the block.
- **Equations:** the Poisson mass function and `E[Y] = Var[Y] = \mu` (4); the
  log-count model (7); the GLM statement (9); the variance function (11); the
  mean-transformation display (12); the Poisson regression model and its
  inverse link (15); the log-likelihood and score equations (16); the one-unit
  rate-ratio display (19); the z statistic and Wald interval (21); the deviance
  and G² (22); the overdispersion inequality, the Pearson residual and φ̂ (25);
  `G^2 / \widehat\phi` (27). The bike-count equations that mention `\hat` are
  written with `\widehat` in the deck.
- **Numbers quoted from inline R in the frozen markdown (never retyped or
  recomputed):** 8,645 hours (2; 365 days in its speaker notes); 1 to 651,
  median 109, mean 143.8, slope 1.75, 48 groups (3); the busiest group's mean
  395, Poisson standard deviation 19.9, observed 164.4 and variance 27,031 (5);
  895, 8,645, 10.4%, −140.9, 37.6, 90.5, 460, 3.3, 15.5 (6); 0.75, 0.55, 0.23,
  45 of 48 and 0.93 (7, speaker notes only); 0.54, 0.63, 2.2, 161.1 (14); 62, 4,
  1,243,103, 6.9 × 10⁻⁸ (17, speaker notes; the printout's estimates, standard
  errors, z values and p-values are the frozen console text); −83.7, 2.6, 2.1,
  122 of 144 and 68, 1,202,378 and 1,243,103 (18); the rate-ratio table's
  values, 28.9, −10.9, 0.40, 4.59, 1.0162, 1.084, 8.4%, 0.560, 44%, 0.935 (20);
  |z| from 30.7 to 142.9 and the four intervals (21); G² = 128,669 on k = 23
  (23); φ̂ = 11.3, 25.6, about 11 and 20 bins (26); 11,380 and 495 (27).
- **Chunk names to confirm at build time:** the freeze directory's
  `figure-html/` holds count-hist-figure, count-hour-figure, mean-variance-figure,
  lm-residual-figure, log-residual-figure, glm-mean-variance-figure,
  observed-means-figure, fitted-means-figure and variance-check-figure, each
  with a `-1.png` suffix; a frozen PNG exists for every figure named above, and
  the `glm-table-display`, `rate-ratio-table`, `bike-glm-summary` and
  `interaction-test` outputs are in `result.markdown`.

Not available to slides: anything inside a `### For example,` or
`### Beyond this course` callout (here, the callout on other distributions,
links and class structures under Special cases, and the quasi-Poisson and
negative binomial callout under Overdispersion).
