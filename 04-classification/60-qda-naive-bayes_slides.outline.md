# Slide outline: Quadratic Discriminant Analysis and Naive Bayes

Outline for `60-qda-naive-bayes_slides.qmd` (Wed 2026-10-07, one 50-minute
period). **This file is the spec; the deck is built from it.** Edit it freely:
reorder, cut, reword, change `tag:`, add notes. When it says what you want, ask
for the deck to be built (or refreshed) and `slides-author` will implement
exactly these slides.

Drafted 2026-10-06 against `60-qda-naive-bayes.qmd` at `e347c90`. The chapter
is the largest of the unit, so the core line is: the data and the three-way
setup, QDA (model, fit, discriminant, boundary, bias-variance tradeoff), naive
Bayes (conditional independence, fit, additive log odds, diagonal covariance,
boundary), then the classifier comparison (fitted boundaries, boundary shapes
and the five-method table, simulated scenarios, test performance). Cut to
optional, in the order they would go: the Student strata section (one slide;
an additional analysis that changes no conclusion), the QDA coefficient table,
the estimated covariance matrices, the mixed-feature-types printout, the naive
Bayes parameter count, and the Conclusion slide. Cut from the deck entirely
and parked below: the repeated scatterplots (`qda-data-figure` and
`nb-data-figure` are the same image as `default-eda-figure`), the class
density display, the one-feature log odds display, the fitted-KNN details
(standardization, the rule for K), the tilt and income-slope comparison of
naive Bayes with LDA, and the strata summary table and scatterplot. Two R-code
slides (6 and 18), and four transition slides (1, 4, 15, 23) as in the LDA
deck.

Nothing here is new content. Every `show:` points at something that already
exists in `60-qda-naive-bayes.qmd`, so the deck distills the notes and never
invents. If a slide needs something the chapter doesn't have, flag it with
`needs:` and it goes back through `notes-author` and `proof-reader` first. (No
slide in this outline needs one.)

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
verbatim), `link` (a pointer back to the notes page, for anything that cannot
be a static image), `none` (a words-only slide). A slide may combine two
`show:` items, for example an equation pair or a table beside a figure.

Slides never draw from a `### For example,` or `### Beyond this course`
callout.

Equations use the bracket convention for the logarithm of a product,
`\log\left[\pi_k f_k(x)\right]`, and for the log posterior odds,
`\log\left[\frac{p_2(x)}{1 - p_2(x)}\right]`, as the chapter does.

**Timing:** 32 slides: 4 transitions (no time), 22 `core` content slides
(slide 0 and 21 more) and 6 `optional`. At about 2 to 3 minutes each, 21
content slides fits 50 minutes only because the quick ones (3, 20, 22, 24,
25) take a minute or less, so this is a tight lecture. If time runs short, drop in this order: 12 (one-feature
second branch), 26 (boundary shapes equation; keep the table on 27), 14
(variability tabset).

---

## 0. Today
tag: core
show: none
words: agenda as noun phrases — QDA · Bias-variance tradeoff · Naive Bayes · Classifier comparison

## 1. Generative Classifiers
tag: core
show: none (transition slide, title only)
words: none

---

# Generative classifiers

## 2. Credit card default data
tag: core
show: figure — default-eda-figure (income against balance for the training customers, each class's 95% normal-theory ellipse)
words: "ISLR2::Default · fit on a random half, test on the other half"
say: the data run through the whole lecture; the models are fit to the training half, so every error rate here is a test error rate, unlike the training rates of the LDA lecture; the defaulters' ellipse is narrower in balance, which one shared covariance matrix cannot describe
note: `qda-data-figure` (start of QDA) and `nb-data-figure` (start of naive Bayes) are the same image; the deck uses it once, here, and says "the same scatterplot" aloud at each section. The split is the chapter's `default-split` chunk; the two halves' sizes are inline R in the chapter ("5,000 each"), quoted from the frozen markdown at build time if wanted.

## 3. Bayes' theorem and LDA
tag: core
show: equation — the posterior display, `p_k(x) = P(Y = k \mid X = x) = \frac{\pi_k f_k(x)}{\sum_{l=1}^K \pi_l f_l(x)}`, then a three-item list (LDA: `X \mid Y = k \sim N_p(\mu_k, \Sigma)`, one Σ shared; QDA: class-specific Σ_k; naive Bayes: independent features)
words: "Generative classifiers differ only in the model for f_k(x)" and the three-item list
reveal: on arrival: the posterior equation; click 1: the "differ only in" line; click 2: the three-item list
say: the recap of the LDA lecture; π̂_k = n_k/n for every generative classifier; the next two sections change f_k(x) in the two directions the list names
note: the list is the chapter's own three sentences (the LDA assumption, QDA's change, naive Bayes's change) compressed to labels

---

# Quadratic Discriminant Analysis

## 4. Quadratic Discriminant Analysis
tag: core
show: none (transition slide, title only)
words: none

## 5. Class-specific covariance matrices
tag: core
show: equation — the QDA model, `P(Y = k) = \pi_k`, `X \mid Y = k \sim N_p(\mu_k, \Sigma_k)`, and the class-k sample covariance matrix `\hat\Sigma_k = \frac{1}{n_k - 1}\sum_{i:\, y_i = k}(x_i - \hat\mu_k)(x_i - \hat\mu_k)^\top`, on one slide
words: between the model and the estimate, "Own Σ_k in every class"; after the estimate, "Each Σ_k from its own class alone, divisor n_k − 1; π̂_k and μ̂_k as in LDA"
reveal: on arrival: the model and "Own Σ_k in every class"; click 1: the Σ̂_k equation and the closing line
say: the ellipses of slide 2 now each get their own size, shape and orientation; Σ̂_k is invertible only if n_k > p, which is why the defaulters' small class matters later
note: combines the chapter's "Class-specific covariance matrices" and "Class-specific covariance estimates" subsections, as the LDA deck combined model and estimation. The class density display is parked.

## 6. Fitting QDA
tag: core
show: none, code — the `default-split` chunk (`set.seed(20261001)`, `train_id`, `train`) and `default_qda <- MASS::qda(default ~ balance + income, data = train)`, with the printed output of `default_qda`
words: none beyond the code
say: same formula as `MASS::lda()`; the printout gives the priors and the class means, the same ones `lda()` reports for these training customers; the covariance matrices are not printed
note: code on the left, the printed output on the right. Everything here is the chapter's own: the output is the frozen `default-qda` console block (Call, Prior probabilities of groups, Group means), copied verbatim, so no output has to come from running the code. The three split lines are the chapter's `default-split` chunk, shown so `train` is defined on the slide; the naive Bayes code slide (18) reuses `train` without repeating them.

## 7. Estimated covariance matrices
tag: optional
show: equation — the two fitted matrices, `\hat\Sigma_{\text{No}} = ...`, `\hat\Sigma_{\text{Yes}} = ...`, from the chapter's inline-R display (numbers baked into the frozen markdown)
words: "Squared dollars: balance, income"
say: the matrices `qda()` does not print; the square-rooted diagonals are the standard deviations quoted on slide 2
note: optional; copy the display from the frozen markdown, never recompute.

## 8. Quadratic discriminant
tag: core
show: equation — the expanded `\log\left[\pi_k f_k(x)\right] = \log \pi_k - \frac{p}{2}\log(2\pi) - \frac{1}{2}\log\left|\Sigma_k\right| - \frac{1}{2}\left(x - \mu_k\right)^\top \Sigma_k^{-1}\left(x - \mu_k\right)`; then, in order, "Dropping the terms that do not involve k gives the discriminant function", the quadratic discriminant δ_k(x) display (five terms), and "Quadratic in x"
words: "Dropping the terms that do not involve k gives the discriminant function" and "Quadratic in x"
reveal: on arrival: the expanded log[π_k f_k(x)]; click 1: the "Dropping…" line, δ_k and "Quadratic in x"
say: for QDA the only term dropped is −(p/2)log(2π); contrast LDA, where the x^T Σ^{-1} x and log|Σ| terms were the same in every class and dropped out; here both survive, because Σ_k differs by class — the quadratic term is the new curvature and −½log|Σ_k| penalizes a class spread over a larger volume; with a common Σ both cancel and δ_k reduces to the LDA discriminant
note: follows the chapter and the LDA deck's convention (drop the k-free terms in prose, do not write them into δ_k). The two surviving terms are the chapter's two bullets; they are in the `say:` line, not on the slide, to keep the slide to equations and two labels. Move them to a click if you want them seen.

## 9. Quadratic decision boundary
tag: core
show: equation — the K = 2 log posterior odds, `\log\left[\frac{p_2(x)}{1 - p_2(x)}\right] = \delta_2(x) - \delta_1(x) = \beta_0 + x^\top\left(\Sigma_2^{-1}\mu_2 - \Sigma_1^{-1}\mu_1\right) - \frac{1}{2}x^\top \left(\Sigma_2^{-1} - \Sigma_1^{-1}\right) x`
words: after the equation, "Boundary: log posterior odds = 0, a conic section when p = 2; up to two points when p = 1"
reveal: on arrival: the log-odds equation; click 1: the boundary line
say: an intercept, p linear terms and p(p+1)/2 squares and cross-products; the boundary is a curve, not a line
note: the p = 1 case (up to two boundary points) is also in the chapter's one-feature log-odds display, parked below; slide 12 shows it.

## 10. QDA log posterior odds
tag: optional
show: table — qda-discriminant-table (the six coefficients of QDA's estimated log posterior odds of default)
words: "Estimated log posterior odds of default; income terms per $1,000"
say: with squares and cross-products no single coefficient is the effect of balance; the negative balance² coefficient is what bends the boundary back in slide 11
note: heading is the chapter's own table caption, not a subsection title; the table sits under "Quadratic discriminant".

## 11. QDA and LDA boundaries
tag: core
show: figure — qda-boundary-figure
words: "Within the training balances, QDA's boundary runs close to LDA's line; beyond them it has a second branch"
say: the shaded region is beyond the largest training balance, so the second branch is an extrapolation of Gaussian tails

## 12. Second boundary branch
tag: core
show: tabset — two tabs: "Prior-weighted densities" (qda-one-qda-figure), "Discriminant functions" (qda-one-delta-figure)
words: "One feature: the class with the larger variance is assigned in both tails"
say: with balance alone the discriminant functions are two downward parabolas that cross twice, where the LDA lecture's straight lines crossed once; the second crossing is past every customer in either half
note: the chapter's heading for this material is the sentence "The second branch is easiest to see with one feature", not a subsection title, so this title is new; it is the same discussion as "Quadratic decision boundary". Move to optional if time is short (first to drop).

## 13. Bias-variance tradeoff
tag: core
show: equation — the parameter counts, `\text{LDA: } Kp + \frac{p(p+1)}{2}, \qquad \text{QDA: } Kp + K\,\frac{p(p+1)}{2}`, then table — parameter-table (p = 1, 2, 5, 10, 50 for K = 2)
words: after the table, "Shared Σ: bias · Class Σ_k: variance"
reveal: on arrival: the parameter-count equation; click 1: the table and the closing line
say: QDA's count grows like Kp²/2 against LDA's p²/2; LDA's shared Σ makes its boundary the wrong shape however much data it sees; each of QDA's covariance estimates comes from one class's observations alone and varies from one training set to the next; for the credit card data QDA estimates the defaulters' three covariance entries from only the training defaulters
note: the counts exclude the K − 1 free priors, as the chapter states

## 14. Boundary variability
tag: core
show: tabset — two tabs: "Small training sets" (variability-small-figure), "Large training sets" (variability-large-figure)
words: "LDA's bias stays; QDA's variance shrinks with n"
say: simulated data with a known Bayes boundary, since the credit card data cannot supply one: 20 fitted boundaries per panel; small n_k: LDA lines vary in angle and miss the curvature, QDA curves follow the shape but scatter; large n_k: LDA tightens around one line that still misses the curvature, QDA collapses onto the Bayes boundary; so LDA wins when n is small relative to the covariance parameters or the Σ_k are close to equal, QDA when they clearly differ and n is large enough
note: this is the one place the QDA part uses simulated parameters; it is the chapter's own choice, for the stated reason (a known Bayes boundary).

---

# Naive Bayes

## 15. Naive Bayes
tag: core
show: none (transition slide, title only)
words: none

## 16. Conditional independence
tag: core
show: equation — the naive Bayes model, `P(Y = k) = \pi_k`, `X_1, \ldots, X_p \text{ are independent given } Y = k`, `X_j \mid Y = k \sim f_{kj}`, then the product `f_k(x) = f_{k1}(x_1) \times f_{k2}(x_2) \times \cdots \times f_{kp}(x_p) = \prod_{j=1}^p f_{kj}(x_j)`
words: after the product, "Each f_kj modeled and estimated on its own; features of different types, densities of different types"
reveal: on arrival: the model; click 1: the product and the closing line
say: the same scatterplot as slide 2: the ellipses tilt only slightly, so ignoring the within-class correlation ignores only that tilt; the assumption is conditional on the class — features can be independent within each class and correlated overall

## 17. Mixed feature types
tag: optional
show: three-item list — "Quantitative: Gaussian, X_j | Y = k ~ N(μ_kj, σ²_kj)", "Binary: Bernoulli, θ_kj = P(X_j = 1 | Y = k)", "Categorical: one probability per level in each class", then console — `mixed_nb$tables$student` from the chapter's `nb-mixed` chunk
words: the three list labels
reveal: on arrival: the three-item list; click 1: the printed `student` table
say: the second column of the `student` table is θ̂_k, the share of students among each class's training customers (about 30% of non-defaulters, 36% of defaulters); no Gaussian assumption is made for `student`, but conditional independence still is, so the term ignores that students have much lower incomes
note: the list is the chapter's three bullets under "Conditional independence", compressed to labels; the console is the chapter's frozen `nb-mixed` output, verbatim. The shift in log posterior odds from being a student (a number in the chapter's inline R) is not on the slide.

## 18. Fitting naive Bayes
tag: core
show: none, code — `default_nb <- e1071::naiveBayes(default ~ balance + income, data = train)` and `default_nb`, with the printed output of `default_nb`
words: none beyond the code
say: same formula again; A-priori probabilities are π̂_k, the same as QDA's; under Conditional probabilities the first column is each class's mean and the second its standard deviation, the Gaussian μ̂_kj and σ̂_kj; the header "Naive Bayes Classifier for Discrete Predictors" is e1071's fixed label although both features are continuous
note: code on the left, the printed output on the right. Everything here is the chapter's own: the output is the frozen `default-nb` console block, copied verbatim, so no output has to come from running the code. `train` is the split on slide 6.

## 19. Additive log posterior odds
tag: core
show: equation — `\log\left[\frac{p_2(x)}{1 - p_2(x)}\right] = \log\frac{\pi_2}{\pi_1} + \sum_{j=1}^p \log\frac{f_{2j}(x_j)}{f_{1j}(x_j)} = \log\frac{\pi_2}{\pi_1} + \sum_{j=1}^p g_j(x_j)`
words: after the equation, "g_j(x_j) — contribution of feature j"; then "Additive model, no interactions"
reveal: on arrival: the equation; click 1: the g_j label; click 2: "Additive model, no interactions"
say: the log of a product is a sum, so each feature shifts the log odds by an amount that does not depend on the other features' values; Gaussian with class-specific variances makes g_j quadratic in x_j, with a shared variance linear, and Bernoulli linear
note: the three forms of g_j (quadratic, linear, Bernoulli) are in the say line, not on the slide; the Bernoulli g_j display is parked.

## 20. Diagonal covariance
tag: core
show: equation — the product-of-normals identity, `\prod_{j=1}^p \frac{1}{\sqrt{2\pi}\,\sigma_{kj}}\exp\left[-\frac{\left(x_j - \mu_{kj}\right)^2}{2\sigma_{kj}^2}\right] = \frac{1}{(2\pi)^{p/2}\left|\Lambda_k\right|^{1/2}}\exp\left[-\frac{1}{2}\left(x - \mu_k\right)^\top \Lambda_k^{-1}\left(x - \mu_k\right)\right]`, then `\Lambda_k = \text{diag}\left(\sigma_{k1}^2, \ldots, \sigma_{kp}^2\right)`
words: after the identity, "Gaussian naive Bayes is QDA with every Σ_k diagonal; shared variances, LDA with Σ diagonal"
reveal: on arrival: the identity; click 1: the Λ_k definition and the closing line
say: for these customers the naive Bayes means are QDA's and its standard deviations are the square roots of the diagonals of QDA's Σ̂_k; Λ̂_k is Σ̂_k with the within-class correlation set to zero

## 21. Parameter count
tag: optional
show: equation — Gaussian naive Bayes's `2Kp` parameters against QDA's `Kp + Kp(p+1)/2`, from the chapter's inline math, then "K = 2, p = 50: 200 against 2,650" (quoted from the frozen markdown)
words: "Linear in p, each parameter from one feature in one class"
say: the saving is larger still for binary features: a joint probability mass function has 2^p cells per class, against p Bernoulli probabilities; the price is bias whenever features are dependent within a class, which only matters if it changes the side of the threshold
note: optional because it repeats slide 13's point for naive Bayes; the chapter has no table with a naive Bayes column, so this is an inline-math slide, not a table. The 200 and 2,650 are inline R in the chapter; copy from the frozen markdown, never retype.

## 22. Naive Bayes boundary
tag: core
show: figure — nb-boundary-figure
words: "Naive Bayes and QDA boundaries: close, both with a second branch"
say: the two boundaries stay close within the training balances; naive Bayes's balance term is quadratic for the same reason as QDA's

---

# Classifier comparison

## 23. Classifier Comparison
tag: core
show: none (transition slide, title only)
words: none

## 24. KNN classification
tag: core
show: equation — `\hat p_{\text{Yes}}(x_0) = \frac{1}{K}\sum_{i \in \mathcal{N}_0}\mathrm{I}(y_i = \text{Yes})`
words: "N_0 — the K training points closest to x_0; assign Yes when the vote exceeds 0.5"
say: the flexibility lecture's KNN, now with a vote; features are standardized first; K is fixed at the smallest odd integer above √n here (71 for these 5,000 training customers, a rule of thumb, since choosing K from the data is the next unit); from here to the end of the comparison K is the number of neighbors, not the number of classes
note: the standardization sentence and the rule for K are parked; the K = 71 is inline R in the chapter.

## 25. Fitted boundaries
tag: core
show: figure — comparison-boundaries-figure (all five classifiers' 0.5 boundaries over the training customers)
words: "Logistic regression, LDA: lines · QDA, naive Bayes: curves · KNN: jagged"
say: at middle incomes, near where most defaulters sit, the five boundaries lie close together; QDA and naive Bayes have second branches beyond the training balances; KNN's course out there is also an extrapolation

## 26. Boundary shapes
tag: core
show: equation — the aligned display of the log posterior odds forms: logistic regression and LDA `\beta_0 + \sum_{j=1}^p \beta_j x_j`; QDA `\beta_0 + \sum_{j=1}^p \beta_j x_j + \sum_{j \le l} \gamma_{jl} x_j x_l`; Gaussian naive Bayes `\beta_0 + \sum_{j=1}^p \left(\beta_j x_j + \gamma_{jj} x_j^2\right)`
words: "KNN: no formula, any shape"
say: logistic regression and LDA share the linear form and differ only in estimation; naive Bayes is the most restricted quadratic form, QDA's with only the squares; first to drop if time is short, since slide 27 states the same assumptions
note: the chapter's aligned display is one block; it cannot be revealed line by line without being split, so it is static.

## 27. Five classifiers
tag: core
show: table — comparison-table-display (Method, Assumption, Estimation for the five classifiers)
words: "Increasing n favors QDA and KNN · increasing p favors naive Bayes and LDA"
say: the table summarizes all five; increasing n favors the more flexible methods whose lower bias becomes affordable; increasing p favors the more restricted ones, since naive Bayes's count grows linearly in p and LDA's like p²/2 against QDA's p²; KNN suffers most from the curse of dimensionality and has no coefficients to interpret
note: the table sits under "Boundary shapes" in the chapter, so the title is new; the words line is the chapter's last paragraph of that subsection, compressed.

## 28. Simulated scenarios
tag: core
show: tabset — two tabs: "Scenarios" (scenario-data-figure), "Test error rates" (scenario-error-figure)
words: "Each scenario makes a different method's assumptions hold"
say: four scenarios with equal priors: linear, quadratic, independent with p = 10, non-linear (a sine boundary with 10% of labels flipped); 100 training sets of 100 observations per scenario, scored on one large test set; the dashed line is the Bayes error rate, the floor no classifier beats on average; the winner in the quadratic, independent and non-linear scenarios is the most restrictive method whose assumptions still hold; with K = 1 KNN's variance erases its non-linear advantage
note: the scenario descriptions are the chapter's four bullets; they are in the say line, not on the slide.

## 29. Test performance
tag: core
show: table — performance-table (training error, test error, test sensitivity, test specificity, test AUC for the six classifiers)
words: "Fit on the training half; scored on the test half at threshold 0.5"
say: the four model-based classifiers have test error rates within a narrow range, only a few points better than predicting No for every customer, and differ more in sensitivity; KNN with K = 1 shows the optimism plainly, a training error rate of 0.00% against its test rate; to answer the opening question on this split, QDA and naive Bayes do no better than LDA and logistic regression, and both KNN classifiers do worse than every model-based classifier
note: every number in the say line is inline R in the chapter's frozen markdown; quote it from there at build time if any is put on the slide.

## 30. Student strata
tag: optional
show: table — strata-table (training error, test error, test sensitivity, test AUC for QDA and logistic regression, single fit against stratified)
words: "Stratifying changes no test error rate by more than 0.14 percentage points"
say: an additional analysis: QDA fit separately to students and non-students beside a logistic regression interacted with student status; each stratified model estimates twice as many parameters, which tends to make its training error rate more optimistic, so the test rates are the fair comparison
note: the 0.14 (and the AUC change, 0.0017) are inline R in the chapter, copied from the frozen markdown. The strata summary table and the scatterplot by student status are parked.

## 31. Conclusion
tag: optional
show: none
words: the bare concept names from the chapter's `## Conclusion`, no recap sentences — QDA · Quadratic boundary · Bias-variance tradeoff · Naive Bayes · Conditional independence · Diagonal covariance · Classifier comparison
note: optional; the lecture may end on slide 29 or 30 with the next lecture's preview said aloud (generalized linear models).

---

# Not in this deck

Cut from the lecture's core line, with their assets, so they can come back.

- **Repeated scatterplot:** `figure — qda-data-figure`, `figure — nb-data-figure`
  (the same image as `default-eda-figure`, shown on slide 2).
- **QDA, theory displays:** the class-conditional density `f_k(x)` for
  `N_p(\mu_k, \Sigma_k)`; the one-feature log posterior odds display (the
  quadratic in x with up to two roots).
- **Naive Bayes, theory displays:** the Bernoulli density
  `f_{kj}(x_j) = \theta_{kj}^{x_j}(1 - \theta_{kj})^{1 - x_j}`; the Bernoulli
  `g_j(x_j)` display.
- **Naive Bayes compared with QDA and LDA:** the discussion of how each model's
  balance threshold moves with income, and naive Bayes's income term against
  LDA's income slope (text only in the chapter; no figure).
- **KNN details:** the standardization rule and the rule for K.
- **Student strata, other outputs:** `table — strata-summary-table`,
  `figure — strata-data-figure`.

---

# Reference: assets used by this deck

- **Figures (PNG in `_freeze/04-classification/60-qda-naive-bayes/figure-html/`):**
  default-eda-figure, qda-boundary-figure, qda-one-qda-figure,
  qda-one-delta-figure, variability-small-figure, variability-large-figure,
  nb-boundary-figure, comparison-boundaries-figure, scenario-data-figure,
  scenario-error-figure.
- **Tables (kable):** qda-discriminant-table, parameter-table,
  comparison-table-display, performance-table, strata-table.
- **Console output (frozen markdown):** the `default-qda` and `default-nb`
  printouts (slides 6 and 18), `nb-mixed` (slide 17). The slide-6 split lines
  come from `default-split`; no console output on any code slide has to come
  from running the code.
- **Equations:** the displays in the Bayes' theorem recap, QDA (model,
  covariance estimate, expanded log and discriminant, log odds, parameter
  counts), naive Bayes (model, product, additive log odds, diagonal-covariance
  identity) and Classifier comparison (KNN vote, boundary shapes); refer to
  them by subsection and a few words, as above.
- **Chunk names to confirm at build time:** the chapter's figure chunks that
  the freeze directory has under `figure-html/` match the names above; a
  frozen PNG exists for each figure named here.

Not available to slides: anything inside a `### For example,` or
`### Beyond this course` callout (here, the regularized discriminant analysis
pointer and the nonparametric naive Bayes pointer).
