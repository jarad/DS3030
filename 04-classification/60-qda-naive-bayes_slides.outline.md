# Slide outline: Quadratic Discriminant Analysis and Naive Bayes

Outline for `60-qda-naive-bayes_slides.qmd` (Fri 2026-10-09, one 50-minute
period). **This file is the spec; the deck is built from it.** Edit it freely:
reorder, cut, reword, change `tag:`, add notes. When it says what you want, ask
for the deck to be built (or refreshed) and `slides-author` will implement
exactly these slides.

Drafted 2026-10-06 against `60-qda-naive-bayes.qmd` at `e347c90`; revised the
same day after the chapter's rewrite (independence notation, KNN section,
rewritten Boundary shapes) and refreshed against the committed chapter at
`9ae5029` (the pairing table puts each $p = 2$ value on its own line below the
formula, the Student strata table gains two naive Bayes rows, the KNN section
gains a KNN-only boundary figure). Revised again 2026-10-06 on request: the KNN
transition is titled "K-Nearest Neighbors", a code slide for fitting KNN
(21) follows KNN classification, and four Comparing methods slides (Parameter
count, Five classifiers, Bias-variance tradeoff, Boundary variability) are
parked below, so the deck is now 32 slides (0 to 31). The chapter is the
largest of the unit, so the core line is: the data and the three-way setup, QDA
(model, fit, class contours, discriminant, boundary), naive Bayes (conditional
independence, fit, additive log odds, diagonal covariance, boundary), KNN (vote,
fit), then the comparison of methods (fitted boundaries, boundary shapes,
simulated scenarios, test performance).

**Final order of the last section (2026-10-06):** Comparing methods opens with
Fitted boundaries, then Boundary shapes (equations, the pairing table, the
paired boundaries), Simulated scenarios, Test performance, Student strata. The
Parameter count, Five classifiers, Bias-variance tradeoff and Boundary
variability slides were removed from the body on request and are parked under
"Not in this deck". $K$ is the number of neighbors from the KNN slide on; no
slide in the body counts parameters with $K$ classes any more.

Cut to optional, in the order they would go: Boundary shapes, fitted pairs
(slide 27), Mixed feature types (14), KNN boundary (22), Student strata (30),
and the Conclusion slide (31). Cut from the
deck entirely and parked below: the repeated scatterplot (`nb-data-figure` is
the same image as `default-eda-figure`), the class density display, the
one-feature log odds display, the QDA covariance-matrix display and coefficient
table (removed 2026-10-06), the fitted-KNN details that are not on slide 21
(the rule for K), the tilt and income-slope comparison of naive Bayes with
LDA, the strata summary table and scatterplot, and the four removed Comparing
methods slides. Three R-code slides (6, 15 and 21), and five
transition slides (1, 4, 12, 19, 23) as in the LDA deck.

Nothing here is new content. Every `show:` points at something that already
exists in `60-qda-naive-bayes.qmd`, so the deck distills the notes and never
invents. If a slide needs something the chapter doesn't have, flag it with
`needs:` and it goes back through `notes-author` and `proof-reader` first. (No
slide in this outline needs one.)

**Independence notation.** Every slide that states a model writes it with
`\stackrel{ind}{\sim}` exactly as the chapter's current display does (slides 3,
5, 13, 14, 17), per `CONVENTIONS.md`.

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
`\log\left[\frac{p_2(x)}{1 - p_2(x)}\right]`, as the chapter does. No equation
writes the terms that do not involve k: they are dropped in words.

**Timing:** 32 slides: 5 transitions (no time), 22 `core` content slides
(slide 0 and 21 more) and 5 `optional`. At about 2 to 3 minutes each, 21
content slides fits 50 minutes only because the quick ones (7, 10, 18, 24, 28)
take a minute or less. If time runs short, drop in this order: 27 (paired
boundaries), 14 (mixed feature types), 22 (KNN boundary), 11 (one-feature
second branch), 25 (boundary shapes equations; keep the pairing table on 26).

---

## 0. Today
tag: core
show: none
words: agenda as noun phrases — QDA · Naive Bayes · KNN · Comparing methods

## 1. Motivation
tag: core
show: none (transition slide, title only)
words: none

---

# Motivation

## 2. Credit card default data
tag: core
show: figure — default-eda-figure (income against balance for the training customers, each class's 95% normal-theory ellipse)
words: "ISLR2::Default · fit on a random half, test on the other half"
say: the data run through the whole lecture; the models are fit to the training half, so every error rate here is a test error rate, unlike the training rates of the Classifier Evaluation lecture; the defaulters' ellipse is narrower in balance, which one shared covariance matrix cannot describe
note: `qda-data-figure` (start of QDA, reused on slide 7) and `nb-data-figure` (start of naive Bayes) are the same image; the deck uses it here and on slide 7, and says "the same scatterplot" aloud at the start of naive Bayes. The split is the chapter's `default-split` chunk; the two halves' sizes are inline R in the chapter ("5,000 each"), quoted from the frozen markdown at build time if wanted.

## 3. Generative classifiers
tag: core
show: equation — the LDA recap display, `p_k(x) \propto \pi_k f_k(x)` (the denominator and the equality chain are dropped), then the three models, each the chapter's own display with `\stackrel{ind}{\sim}`: LDA `Y_i \stackrel{ind}{\sim} \text{Categorical}\left(\pi_1, \ldots, \pi_K\right), \qquad X_i \mid Y_i = k \stackrel{ind}{\sim} N_p\left(\mu_k, \Sigma\right), \qquad i = 1, \ldots, n`, QDA the same with `\Sigma_k`, naive Bayes the same with `X_{ij} \mid Y_i = k \stackrel{ind}{\sim} f_{kj}` over `i` and `j`
words: "Generative classifiers differ only in the model for f_k(x)", then the bare labels "LDA", "QDA", "Naive Bayes", one above each model
reveal: on arrival: `p_k(x) \propto \pi_k f_k(x)`; click 1: the "differ only in" line, the label "LDA" and its model; click 2: "QDA" and its model; click 3: "Naive Bayes" and its model
say: the recap of the LDA lecture; the prior is estimated by n_k/n for every generative classifier; the next two sections change f_k(x) in the two directions the second and third models name; the ∝ form is the LDA lecture's last display, since the chapter's own display keeps the full ratio
note: the model displays are the chapter's three, copied in full (so each shows the Categorical prior and the index range) and set small to fit the slide width; the comments that used to follow each label (one Σ shared, class-specific Σ_k, independent features) are said aloud, not shown.

---

# Quadratic Discriminant Analysis

## 4. Quadratic Discriminant Analysis
tag: core
show: none (transition slide, title only)
words: none

## 5. Class-specific covariance matrices
tag: core
show: equation — the QDA model, `Y_i \stackrel{ind}{\sim} \text{Categorical}\left(\pi_1, \ldots, \pi_K\right), \qquad X_i \mid Y_i = k \stackrel{ind}{\sim} N_p\left(\mu_k, \Sigma_k\right), \qquad i = 1, \ldots, n`, and the class-k sample covariance matrix `\widehat\Sigma_k = \frac{1}{n_k - 1}\sum_{i:\, y_i = k}(x_i - \widehat\mu_k)(x_i - \widehat\mu_k)^\top`, on one slide
words: between the model and the estimate, "Own Σ_k in every class"; after the estimate, "Each Σ_k from its own class alone, divisor n_k − 1; π̂_k and μ̂_k as in LDA"
reveal: on arrival: the model and "Own Σ_k in every class"; click 1: the Σ̂_k equation and the closing line
say: the ellipses of slide 2 now each get their own size, shape and orientation; Σ̂_k is invertible only if n_k > p, which is why the defaulters' small class matters later
note: combines the chapter's "Class-specific covariance matrices" and "Class-specific covariance estimates" subsections, as the LDA deck combined model and estimation. The class density display is parked.

## 6. Fitting QDA
tag: core
show: none, code — the `default-split` chunk (`set.seed(20261001)`, `train_id`, `train`) and `default_qda <- MASS::qda(default ~ balance + income, data = train)`, with the printed output of `default_qda`
words: none beyond the code
say: same formula as `MASS::lda()`; the printout gives the priors and the class means, the same ones `lda()` reports for these training customers; the covariance matrices are not printed
note: code on the left, the printed output on the right. Everything here is the chapter's own: the output is the frozen `default-qda` console block (Call, Prior probabilities of groups, Group means), copied verbatim, so no output has to come from running the code. The three split lines are the chapter's `default-split` chunk, shown so `train` is defined on the slide; the naive Bayes code slide (15) reuses `train` without repeating them.

## 7. Fitted class contours
tag: core
show: figure — qda-data-figure (the training scatterplot with each class's 95% normal-theory ellipse, solid for non-defaulters and dashed for defaulters: a contour of a Gaussian density with that class's sample mean and covariance matrix, i.e. QDA's fitted class densities)
words: "Each class's ellipse: a contour of a Gaussian density with that class's sample mean and covariance matrix"
say: this is QDA's fit: the two ellipses have their own size and orientation; `qda()` does not print the covariance matrices, but these contours are them; the square-rooted diagonals and correlations are the standard deviations and correlations quoted with the first scatterplot
note: replaces the slide that displayed the two fitted matrices (parked). The chapter has no figure of "fitted QDA contours" as such, so this is the QDA section's own scatterplot (`qda-data-figure`, the same image as slide 2's), whose ellipses are exactly the contours of QDA's fitted class densities, per the chapter's own description; if you want a different graphic, name it.

## 8. Quadratic discriminant
tag: core
show: equation — the expanded `\log\left[\pi_k f_k(x)\right] = \log \pi_k - \frac{p}{2}\log(2\pi) - \frac{1}{2}\log\left|\Sigma_k\right| - \frac{1}{2}\left(x - \mu_k\right)^\top \Sigma_k^{-1}\left(x - \mu_k\right)`; then, in order, "Dropping the terms that do not involve k gives the discriminant function", the quadratic discriminant δ_k(x) display (five terms), and "Quadratic in x"
words: "Dropping the terms that do not involve k gives the discriminant function" and "Quadratic in x"
reveal: on arrival: the expanded log[π_k f_k(x)]; click 1: the "Dropping…" line, δ_k and "Quadratic in x"
say: for QDA the only term dropped is −(p/2)log(2π); contrast LDA, where the x^T Σ^{-1} x and log|Σ| terms were the same in every class and dropped out; here both survive, because Σ_k differs by class — the quadratic term is the new curvature and −½log|Σ_k| penalizes a class spread over a larger volume; with a common Σ both cancel and δ_k reduces to the LDA discriminant
note: follows the chapter and the LDA deck's convention (drop the k-free terms in prose, do not write them into δ_k). The two surviving terms are the chapter's two bullets; they are in the `say:` line, not on the slide, to keep the slide to equations and two labels. Both equations are set as large as the slide width allows (about 0.85 and 0.78 of the slide font).

## 9. Quadratic decision boundary
tag: core
show: equation — the K = 2 log posterior odds, `\log\left[\frac{p_2(x)}{1 - p_2(x)}\right] = \delta_2(x) - \delta_1(x) = \beta_0 + x^\top\left(\Sigma_2^{-1}\mu_2 - \Sigma_1^{-1}\mu_1\right) - \frac{1}{2}x^\top \left(\Sigma_2^{-1} - \Sigma_1^{-1}\right) x`
words: after the equation, "Boundary: log posterior odds = 0, a conic section with two features; up to two points with one feature"
reveal: on arrival: the log-odds equation; click 1: the boundary line
say: an intercept, p linear terms and p(p+1)/2 squares and cross-products; the boundary is a curve, not a line
note: the one-feature case (up to two boundary points) is also in the chapter's one-feature log-odds display, parked below; slide 11 shows it.

## 10. QDA and LDA boundaries
tag: core
show: figure — qda-boundary-figure
words: "Within the training balances, QDA's boundary runs close to LDA's line; beyond them it has a second branch"
say: the shaded region is beyond the largest training balance, so the second branch is an extrapolation of Gaussian tails

## 11. Second boundary branch
tag: core
show: tabset — two tabs: "Prior-weighted densities" (qda-one-qda-figure), "Discriminant functions" (qda-one-delta-figure)
words: "One feature: the class with the larger variance is assigned in both tails"
say: with balance alone the discriminant functions are two downward parabolas that cross twice, where the LDA lecture's straight lines crossed once; the second crossing is past every customer in either half
note: the chapter's heading for this material is the sentence "The second branch is easiest to see with one feature", not a subsection title, so this title is new; it is the same discussion as "Quadratic decision boundary". Move to optional if time is short.

---

# Naive Bayes

## 12. Naive Bayes
tag: core
show: none (transition slide, title only)
words: none

## 13. Conditional independence
tag: core
show: equation — the naive Bayes model, `Y_i \stackrel{ind}{\sim} \text{Categorical}\left(\pi_1, \ldots, \pi_K\right), \qquad X_{ij} \mid Y_i = k \stackrel{ind}{\sim} f_{kj}, \qquad i = 1, \ldots, n, \quad j = 1, \ldots, p`, then the product `f_k(x) = f_{k1}(x_1) \times f_{k2}(x_2) \times \cdots \times f_{kp}(x_p) = \prod_{j=1}^p f_{kj}(x_j)`
words: after the model, "∼ind — independent over observations i and features j"; after the product, "Each f_kj modeled and estimated on its own; features of different types, densities of different types"
reveal: on arrival: the model and the "independent over" line; click 1: the product and the closing line
say: the same scatterplot as slide 2: the ellipses tilt only slightly, so ignoring the within-class correlation ignores only that tilt; independence over observations is what LDA and QDA also assume, independence over features given the class is the naive assumption; the assumption is conditional on the class — features can be independent within each class and correlated overall

## 14. Mixed feature types
tag: optional
show: three-item list — "Quantitative: Gaussian, X_ij | Y_i = k ∼ind N(μ_kj, σ²_kj)", "Binary: Bernoulli, X_ij | Y_i = k ∼ind Bernoulli(θ_kj)" with θ_kj = P(X_ij = 1 | Y_i = k), "Categorical: X_ij | Y_i = k ∼ind Categorical(θ_kj1, …, θ_kjM_j)"
words: the three list labels
say: each f_kj describes one feature in one class, so a feature of any type enters through its own density; `naiveBayes()` keeps the Gaussian densities for balance and income and adds a probability table for `student`; no Gaussian assumption is made for `student`, but conditional independence still is, so the term ignores that students have much lower incomes
note: the list is the chapter's three bullets under "Conditional independence", each model written with `\stackrel{ind}{\sim}` as the chapter does. The `student` probability table from the chapter's `nb-mixed` chunk was removed from this slide 2026-10-06 (the Default-student table, with its shares of students among the classes' training customers).

## 15. Fitting naive Bayes
tag: core
show: none, code — `default_nb <- e1071::naiveBayes(default ~ balance + income, data = train)` and `default_nb`, with the printed output of `default_nb`
words: none beyond the code
say: same formula again; A-priori probabilities are π̂_k, the same as QDA's; under Conditional probabilities the first column is each class's mean and the second its standard deviation, the Gaussian μ̂_kj and σ̂_kj; the header "Naive Bayes Classifier for Discrete Predictors" is e1071's fixed label although both features are continuous; `laplace = 0` in the printed call is e1071's default (no smoothing): a positive value adds that count to every level of a categorical feature when estimating the class-conditional probabilities, so an unseen level does not get probability 0; it has no effect on numeric features such as balance and income
note: code on the left, the printed output on the right. Everything here is the chapter's own: the output is the frozen `default-nb` console block, copied verbatim, so no output has to come from running the code. `train` is the split on slide 6. The `laplace` explanation is a speaker note only; it is not in the chapter.

## 16. Additive log posterior odds
tag: core
show: equation — `\log\left[\frac{p_2(x)}{1 - p_2(x)}\right] = \log\frac{\pi_2}{\pi_1} + \sum_{j=1}^p \log\frac{f_{2j}(x_j)}{f_{1j}(x_j)}` (the chapter's display without its last equality, `= \log\frac{\pi_2}{\pi_1} + \sum_{j=1}^p g_j(x_j)`)
words: after the equation, "Feature j contributes its own log ratio, log(f_2j(x_j)/f_1j(x_j)), a function of x_j alone"; then "Additive model, no interactions"
reveal: on arrival: the equation; click 1: the log-ratio line; click 2: "Additive model, no interactions"
say: the log of a product is a sum, so each feature shifts the log odds by an amount that does not depend on the other features' values; Gaussian with class-specific variances makes each log ratio quadratic in x_j, with a shared variance linear, and Bernoulli linear
note: the chapter names the log ratio g_j(x_j); the slide shows the log ratio itself, per the 2026-10-06 request, and drops the g_j equality. The three forms of the log ratio (quadratic, linear, Bernoulli) are in the say line, not on the slide; the Bernoulli display is parked.

## 17. Diagonal covariance
tag: core
show: equation — the Gaussian naive Bayes statement, `X_{ij} \mid Y_i = k \stackrel{ind}{\sim} N\left(\mu_{kj}, \sigma_{kj}^2\right)` (the chapter's inline statement of the quantitative case, set as a display), then the equivalent joint model, `Y_i \stackrel{ind}{\sim} \text{Categorical}\left(\pi_1, \ldots, \pi_K\right), \qquad X_i \mid Y_i = k \stackrel{ind}{\sim} N_p\left(\mu_k, \Lambda_k\right), \qquad i = 1, \ldots, n`, with `\Lambda_k = \text{diag}\left(\sigma_{k1}^2, \ldots, \sigma_{kp}^2\right)`
words: after the first equation, "Given Y_i = k: a product of p independent normal densities"; before the joint model, "Equivalent to a multivariate normal with a diagonal covariance matrix"; after, "Gaussian naive Bayes is QDA with every Σ_k diagonal; shared variances, LDA with Σ diagonal"
reveal: on arrival: the Gaussian naive Bayes statement and its label; click 1: the "Equivalent to…" line, the joint model and the Λ_k definition; click 2: the closing line
say: the product of the p independent marginals is the same distribution as the multivariate normal with diagonal covariance (the density identity is parked); the independence over features appears as the zero off-diagonal entries of Λ_k; for these customers the naive Bayes means are QDA's and its standard deviations are the square roots of the diagonals of QDA's Σ̂_k; Λ̂_k is Σ̂_k with the within-class correlation set to zero
note: replaces the density-identity display (parked), as requested; the three displays are the chapter's own (the first is its inline statement, written as a display).

## 18. Naive Bayes boundary
tag: core
show: figure — nb-boundary-figure
words: "Naive Bayes and QDA boundaries: close, both with a second branch"
say: the two boundaries stay close within the training balances; naive Bayes's balance term is quadratic for the same reason as QDA's

---

# K-Nearest Neighbors

## 19. K-Nearest Neighbors
tag: core
show: none (transition slide, title only)
words: none

## 20. KNN classification
tag: core
show: equation — `\widehat p_k(x_0) = \frac{1}{K}\sum_{i \in \mathcal{N}_0}\mathrm{I}(y_i = k)`, with three labels, then the assignment rule and the two-class case
words: "x_0 — feature vector to classify", "N_0 — the K training points closest to x_0", "K — number of neighbors, not the number of classes"; then "Assign x_0 to the class with the largest p̂_k(x_0)"; then "Two classes: p̂_No(x_0) = 1 − p̂_Yes(x_0), so assign Yes when p̂_Yes(x_0) > 0.5"
reveal: on arrival: the equation and the three labels; click 1: the assignment line; click 2: the two-class line
say: the flexibility lecture's KNN, now with a vote; features are standardized first; K is fixed at the smallest odd integer above √n here (71 for these 5,000 training customers, a rule of thumb, since choosing K from the data is the next unit); from here to the end of the comparison K is the number of neighbors, not the number of classes
note: general first, as in the chapter; the two-class case is the chapter's last sentences of the subsection (the Yes/0.5 specialization is stated in words and inline math there, not as a displayed sum, so it is a one-line fragment, not an equation). The standardization sentence, the tie-breaking rule and the rule for K are parked (slide 21 shows `standardize()` as code); the K = 71 is inline R in the chapter.

## 21. Fitting KNN
tag: core
show: none, code — the setup the call needs, then `class::knn()` on three new customers with the printed output of `knn_new`: `k_default <- odd_above_sqrt(nrow(train))`, the chapter's `standardize()` function, `new_customers <- tibble(balance = c(1000, 2000, 2500), income = 40000)`, and `knn_new <- class::knn(train = standardize(train), test = standardize(new_customers), cl = train$default, k = k_default, prob = TRUE)` followed by `knn_new`
words: none beyond the code
say: `class::knn()` fits and classifies in one call; it takes the standardized training features, the standardized features of the customers to classify, the training classes and the number of neighbors; with `prob = TRUE` it also returns the winning class's share of the vote; three customers with the same income and increasing balances: No with every neighbor in the vote, then Yes with 0.535, then Yes with 0.718; the estimate p̂_Yes(x_0) is the vote share when the class is Yes and one minus it when the class is No
note: code on the left (52%), the printed output on the right (48%), code lines under about 38 characters (the long `standardize()` and `class::knn()` lines are wrapped; the call itself is unchanged). The output is the frozen `knn-new-customers` console block, copied verbatim. The pieces come from the chapter: `k_default` from its `knn-fit` chunk (a visible-on-expansion Code callout under "KNN boundary", `k_default <- odd_above_sqrt(nrow(train))`, which equals 71 for the 5,000 training customers); `odd_above_sqrt()` itself is defined in the chapter's setup chunk and is not shown on the slide; `standardize()` from the same `knn-fit` chunk, with its two long expressions wrapped; `new_customers` and the `class::knn()` call from the visible `knn-new-customers` chunk; `train` is the split on slide 6.

## 22. KNN boundary
tag: optional
show: figure — knn-boundary-figure (the KNN boundary with K = 71, black long-and-short dashes, over the training customers, balances beyond the largest training balance shaded)
words: "The boundary follows no formula: a jagged curve traced by the vote of the nearest training customers"
say: the KNN-only boundary, K = 71 as in Fitting KNN; it follows no formula, it is traced by the vote of the nearest training customers, and beyond the largest training balance it is still a vote among the same customers at the edge of the data; the Fitted boundaries slide draws this same curve beside the other four
note: new 2026-10-06 with the chapter's KNN section (subsections Neighbor vote, Number of neighbors, KNN boundary); the title is the chapter's subsection title. The words line is the chapter's first sentence of the subsection's closing paragraph, trimmed to one line; the rest of that paragraph is in the say line. Optional because the five-boundary figure draws the same curve. The "Number of neighbors" subsection has no slide of its own: the rule for K stays in slide 20's say line, and slide 21 shows `k_default`.

---

# Comparing methods

## 23. Comparing methods
tag: core
show: none (transition slide, title only)
words: none
note: the chapter's heading is "Classifier comparison"; the deck calls the section "Comparing methods", as requested.

## 24. Fitted boundaries
tag: core
show: figure — comparison-boundaries-figure (all five classifiers' 0.5 boundaries over the training customers)
words: "Logistic regression, LDA: lines · QDA, naive Bayes: curves · KNN, K = 71: jagged"
say: at middle incomes, near where most defaulters sit, the five boundaries lie close together; QDA and naive Bayes have second branches beyond the training balances; KNN's course out there is also an extrapolation
note: "K = 71" is confirmed by the chapter ("KNN with $K = 71$ neighbors black long-and-short dashes", inline R in the frozen markdown) and by the figure's legend ("KNN, K = 71"); the KNN-only version of this boundary is slide 22.

## 25. Boundary shapes
tag: core
show: equation — the aligned display of the log posterior odds forms: LDA `\beta_0 + \sum_{j=1}^p \beta_j x_j`; QDA `\beta_0 + \sum_{j=1}^p \beta_j x_j + \sum_{j \le l} \gamma_{jl} x_j x_l`; Gaussian naive Bayes `\beta_0 + \sum_{j=1}^p \left(\beta_j x_j + \gamma_{jj} x_j^2\right)`
words: "KNN: no formula, any shape"
say: LDA's log odds are linear in x, QDA's quadratic with squares and cross-products, Gaussian naive Bayes's additive, quadratic in each feature; the chapter's display no longer lists logistic regression, which is the next slide's point
note: the chapter's aligned display is one block with three lines (LDA, QDA, Gaussian naive Bayes); it cannot be revealed line by line without being split, so it is static. Second to drop if time is short, since slide 26 states the same forms.

## 26. Boundary shapes: pairs
tag: core
show: table — pair-table-display (log-odds form, generative classifier, its parameters, logistic regression features, its coefficients, with the count for p = 2 in parentheses on its own line below each formula)
words: "Logistic regression: linear in whatever features it is given" and "Parameter counts for two classes; below each formula, in parentheses, p = 2"
say: logistic regression is linear in whatever features it is given, so with squares among its features it has naive Bayes's form, and with squares and the product, QDA's; each generative classifier and the logistic regression of its form can produce exactly the same boundaries; the difference is estimation, joint likelihood against conditional likelihood, and the generative classifier has more free parameters because it also describes the features' distribution within each class
note: the table is the chapter's pairing table, copied from the frozen markdown, each $p = 2$ value after a `<br>` below its formula (as the chapter's `count_with_p2` builds it); the slide's table rule (0.6em) is kept for the width of the formula columns. The chapter's long paragraph on when each estimation wins is in the say line only.

## 27. Boundary shapes: fitted pairs
tag: optional
show: tabset — three tabs: "Linear" (pair-linear-figure), "Squares" (pair-squares-figure), "Squares and product" (pair-quadratic-figure)
words: "Each pair's fitted 0.5 boundary; beyond the training balances the pairs part"
say: within the training balances each pair's two boundaries cross 0.5 at nearly the same balances; beyond them the pairs part: naive Bayes and the logistic regression with squares both bend back below 0.5, naive Bayes near $3,800 and the logistic regression only near $21,900; of QDA and the logistic regression with squares and product, only QDA crosses back; the pairs agree where there are data and part where there are none
note: the three figures are the chapter's three-tab figure; the tab titles inside each figure are its own (for example "Squares: naive Bayes and logistic regression"). The balance gaps the chapter quotes are inline R and are not on the slide.

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
show: table — strata-table (training error, test error, test sensitivity, test AUC for six rows: QDA and logistic regression, single fit against stratified, then naive Bayes with balance and income against naive Bayes with student as a feature)
words: two lines — "Stratifying changes test error by at most 0.14 percentage points" and "Adding student to naive Bayes: test error rises 0.10 points, AUC falls 0.0022"
say: an additional analysis: QDA fit separately to students and non-students beside a logistic regression interacted with student status; each stratified model estimates twice as many parameters, which tends to make its training error rate more optimistic, so the test rates are the fair comparison; the 0.14 is the largest change in test error rate from stratifying QDA or logistic regression; naive Bayes can instead take student as one more feature, a Bernoulli term assumed independent of balance and income given default, so students and non-students share one set of balance and income densities; this costs 2 parameters against its 8 means and standard deviations; its two rows are the fit with balance and income alone and the fit with student added
note: the 0.14, the AUC change of at most 0.0017 (not on the slide), the 0.10 and the 0.0022 are inline R in the chapter, copied from the frozen markdown (the chapter says the naive Bayes error rate "rises by 0.10 percentage points" and its AUC "falls by 0.0022"). The table is rebuilt in the chapter with the two naive Bayes rows after the four QDA and logistic regression rows; the slide sets its table at 0.65em to fit six rows. The strata summary table and the scatterplot by student status are parked.

## 31. Conclusion
tag: optional
show: none
words: the bare concept names from the chapter's `## Conclusion`, no recap sentences — QDA · Quadratic boundary · Naive Bayes · Conditional independence · Diagonal covariance · K-nearest neighbors · Comparing methods
note: optional; the lecture may end on slide 29 or 30 with the next lecture's preview said aloud (generalized linear models). The last item is "Classifier comparison" in the chapter's wording, renamed to match the section title.

---

# Not in this deck

Cut from the lecture's core line, with their assets, so they can come back.

- **Repeated scatterplot:** `figure — nb-data-figure` (the same image as
  `default-eda-figure`, slide 2, and `qda-data-figure`, slide 7).
- **QDA, theory displays:** the class-conditional density `f_k(x)` for
  `N_p(\mu_k, \Sigma_k)`; the one-feature log posterior odds display (the
  quadratic in x with up to two roots).
- **QDA, fitted numbers (removed 2026-10-06):** the two fitted covariance
  matrices `\widehat\Sigma_{\text{No}}`, `\widehat\Sigma_{\text{Yes}}` (inline-R
  display) and `table — qda-discriminant-table` (the QDA log posterior odds
  coefficients).
- **Naive Bayes, theory displays:** the Bernoulli density
  `f_{kj}(x_j) = \theta_{kj}^{x_j}(1 - \theta_{kj})^{1 - x_j}`; the Bernoulli
  `g_j(x_j)` display; the Gaussian product-of-normals density identity
  (`\prod_j ... = ... \Lambda_k ...`, replaced on slide 17 by the independence
  statement and the joint model); `g_j(x_j)` itself (slide 16 shows its log
  ratio).
- **Naive Bayes, mixed features:** `console — nb-mixed` (the `student`
  probability table).
- **Naive Bayes compared with QDA and LDA:** the discussion of how each model's
  balance threshold moves with income, and naive Bayes's income term against
  LDA's income slope (text only in the chapter; no figure).
- **KNN details:** the standardization rule, the tie-breaking rule and the rule
  for K (the `standardize()` code is on slide 21; the rule for K is only the
  `k_default <- odd_above_sqrt(nrow(train))` line there).
- **Parameter count (removed 2026-10-06, was slide 27, optional):**
  `equation` — Gaussian naive Bayes's `2Kp` parameters against QDA's
  `Kp + Kp(p+1)/2` (the chapter's inline math), then "K = 2, p = 50: 200 against
  2,650" (inline R in the chapter's frozen markdown, never retyped). Words:
  "Linear in p, each parameter from one feature in one class". Say: the saving
  is larger still for binary features: a joint probability mass function has
  2^p cells per class, against p Bernoulli probabilities; the price is bias
  whenever features are dependent within a class, which only matters if it
  changes the side of the threshold; here K is the number of classes again,
  counting means and variances, not neighbors. Sat after Boundary shapes: fitted
  pairs.
- **Five classifiers (removed 2026-10-06, was slide 28, core):**
  `table — comparison-table-display` (Method, Assumption, Estimation for the
  five classifiers: logistic regression "Log odds linear in its features",
  "Conditional likelihood, iterative"; LDA, QDA, Gaussian naive Bayes "Joint
  likelihood, closed form"; KNN "None (stores data)"). Words: "Increasing n
  favors QDA and KNN · increasing p favors naive Bayes and LDA". Say: the table
  summarizes all five; increasing n favors the more flexible methods whose lower
  bias becomes affordable; increasing p favors the more restricted ones, since
  naive Bayes's count grows linearly in p and LDA's like p^2/2 against QDA's
  p^2; KNN suffers most from the curse of dimensionality and has no
  coefficients to interpret. The table sits under "Boundary shapes" in the
  chapter.
- **Bias-variance tradeoff (removed 2026-10-06, was slide 29, core):**
  `equation` — `\text{LDA: } Kp + \frac{p(p+1)}{2}, \qquad \text{QDA: } Kp + K\,\frac{p(p+1)}{2}`,
  then `table — parameter-table` (p = 1, 2, 5, 10, 50 for K = 2: LDA 3, 7, 25,
  75, 1,375; QDA 4, 10, 40, 130, 2,650). Words: "With K = 2 classes:" and
  "Shared Σ: bias · Class Σ_k: variance"; reveal: on arrival the equation,
  click 1 the "With K = 2 classes" line, the table and the closing line. Say: K
  is the number of classes in these counts, not neighbors; QDA's count grows like
  Kp^2/2 against LDA's p^2/2; LDA's shared Σ makes its boundary the wrong shape
  however much data it sees; each of QDA's covariance estimates comes from one
  class's observations alone and varies from one training set to the next; for
  the credit card data QDA estimates the defaulters' three covariance entries
  from only the training defaulters. The counts exclude the K − 1 free priors.
- **Boundary variability (removed 2026-10-06, was slide 30, optional):**
  `tabset` — two tabs: "Small training sets" (`variability-small-figure`),
  "Large training sets" (`variability-large-figure`). Words: "LDA's bias stays;
  QDA's variance shrinks with n". Say: simulated data with a known Bayes
  boundary, since the credit card data cannot supply one: 20 fitted boundaries
  per panel; small n_k: LDA lines vary in angle and miss the curvature, QDA
  curves follow the shape but scatter; large n_k: LDA tightens around one line
  that still misses the curvature, QDA collapses onto the Bayes boundary; so LDA
  wins when n is small relative to the covariance parameters or the Σ_k are
  close to equal, QDA when they clearly differ and n is large enough. The one
  place the lecture uses simulated parameters. The agenda and Conclusion no
  longer name the bias-variance tradeoff, since no slide covers it.
- **Student strata, other outputs:** `table — strata-summary-table`,
  `figure — strata-data-figure`.

---

# Reference: assets used by this deck

- **Figures (PNG in `_freeze/04-classification/60-qda-naive-bayes/figure-html/`):**
  default-eda-figure, qda-data-figure, qda-boundary-figure, qda-one-qda-figure,
  qda-one-delta-figure, nb-boundary-figure, knn-boundary-figure (slide 22),
  comparison-boundaries-figure,
  pair-linear-figure, pair-squares-figure, pair-quadratic-figure,
  scenario-data-figure, scenario-error-figure.
- **Tables (kable):** pair-table-display, performance-table, strata-table.
- **Console output (frozen markdown):** the `default-qda`, `default-nb` and
  `knn-new-customers` printouts (slides 6, 15 and 21). The slide-6 split lines come from
  `default-split`; no console output on any code slide has to come from
  running the code. Slide 21's setup code comes from the `knn-fit` and
  `knn-new-customers` chunks.
- **Equations:** the displays in the Bayes' theorem recap, the three model
  statements (LDA recap, QDA, naive Bayes, Gaussian naive Bayes as
  `N_p(\mu_k, \Lambda_k)`), QDA (covariance estimate, expanded log and
  discriminant, log odds), naive Bayes (product, additive log odds) and
  KNN (vote) and Comparing methods (boundary shapes); refer to
  them by subsection and a few words, as above.
- **Chunk names to confirm at build time:** the chapter's figure chunks that
  the freeze directory has under `figure-html/` match the names above; a
  frozen PNG exists for each figure named here.

Not available to slides: anything inside a `### For example,` or
`### Beyond this course` callout (here, the regularized discriminant analysis
pointer and the nonparametric naive Bayes pointer).
