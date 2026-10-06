# Slide outline: Linear Discriminant Analysis

Outline for `50-lda_slides.qmd` (Mon 2026-10-05). **This file is the spec; the
deck is built from it.** Edit it freely: reorder, cut, reword, change
`tag:`, add notes. When it says what you want, ask for the deck to be built
(or refreshed) and `slides-author` will implement exactly these slides.

Shortened 2026-10-05 to the lecture's core line: the data, one-feature LDA,
multiple-feature LDA, then three examples (the two logistic regression comparisons and the student strata). The
evaluation slides (confusion matrix through AUC) are parked in the last
section, not deleted. Two R-code slides (11 and 17) and four transition slides (1, 6, 12, 18) were added 2026-10-06.

Nothing here is new content. Every `show:` points at something that already
exists in `50-lda.qmd`, so the deck distills the notes and never invents. If a
slide needs something the chapter doesn't have, flag it with `needs:` and it
goes back through `notes-author` and `proof-reader` first.

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

**Timing:** 23 slides, 21 tagged `core` and 2 `optional`, about 2 to 3
minutes each since several slides carry two equations or a whole tabset.

---

## 0. Today
tag: core
show: none
words: agenda as noun phrases — Bayes' theorem · LDA, one feature and several · comparison with logistic regression

## 1. Motivation
tag: core
show: none (transition slide, title only)
words: none

---

# 13.1 Generative classifiers

## 2. Credit card default data
tag: core
show: table — class-summary-table
words: "ISLR2::Default · analyzed in the logistic regression lectures"
say: the data run through the whole lecture

## 3. Balance within each class
tag: core
show: figure — default-hist-figure (the within-class histograms)
words: "Defaulters carry larger balances"

## 4. Balance, all customers
tag: optional
show: figure — default-stack-figure
words: "Stacked counts: each class's share of a bar is its share of customers"

## 5. Bayes' theorem and Bayes classifier
tag: core
show: equation — 13.1.2, the p_k(x) display ending in `\propto \pi_k f_k(x)`, then a three-item list (π_k — prior, f_k(x) — class density, p_k(x) — posterior), then equation — 13.1.3, `\hat y(x) = \arg\max_k p_k(x)`, on one slide
words: none beyond the list
reveal: on arrival: the posterior equation; click 1: the three-item list; click 2: the argmax equation
note: this combines the Bayes' theorem and Bayes classifier slides; the error-probability display and the closing sentence were cut 2026-10-06

---

# 13.2 One-feature LDA (balance)

## 6. One Feature
tag: core
show: none (transition slide, title only)
words: none

## 7. Fitted Gaussian densities
tag: core
show: figure — balance-gauss-figure
words: "One-feature LDA: Gaussian densities fitted to each class"
say: the start of 13.2; the histograms with the fitted N(μ̂_k, σ̂²) over them

## 8. Gaussian model and parameter estimation
tag: core
show: equation — 13.2.1, the model `Y_i \stackrel{ind}{\sim} \text{Categorical}\left(\pi_1, \ldots, \pi_K\right), \qquad X_i \mid Y_i = k \stackrel{ind}{\sim} N\left(\mu_k, \sigma^2\right), \qquad i = 1, \ldots, n`, and equation — 13.2.2, `\hat\pi_k`, `\hat\mu_k`, `\hat\sigma^2` (pooled, divisor n − K), on one slide
words: between the model and the estimates, "Same σ² in every class"; after the estimates, "Closed-form estimates: proportions, means, pooled variance"
reveal: on arrival: the model and "Same σ² in every class"; click 1: the estimating equations and the closing line
note: this puts the one-feature parameter estimation on the model slide, as slide 14 does for the multivariate case; the model display is larger than the estimates; updated 2026-10-06 to the chapter's `\stackrel{ind}{\sim}` model statement (Categorical prior, index range), set at 0.75 of the slide font so the one-line display fits 1280 px

## 9. Discriminant function
tag: core
show: equation — 13.2.3, the expanded `\log[\pi_k f_k(x)]` display; then, in order, "Dropping the terms that do not involve k gives the discriminant function", equation — δ_k(x) as intercept + slope · x, "Linear in x", "Decision boundary: where the two discriminants are equal, δ_1(x) = δ_2(x)", equation — the log posterior odds, and equation — 13.2.4, x*, on one slide
words: "Dropping the terms that do not involve k gives the discriminant function", "Linear in x" and "Decision boundary: where the two discriminants are equal, δ_1(x) = δ_2(x)"
reveal: on arrival: the expanded log[π_k f_k(x)]; click 1: the "Dropping…" line, δ_k and "Linear in x"; click 2: the decision-boundary line and the log-odds equation; click 3: x*
note: this combines the discriminant-function and decision-boundary slides, and follows the notes in dropping the k-free terms rather than writing them into δ_k; the title stays on one line

## 10. Prior-weighted densities
tag: core
show: tabset — three tabs: "Equal priors" (balance-equal-figure), "Estimated priors" (balance-weighted-figure), "Discriminant functions" (balance-delta-figure)
words: "Equal priors put the boundary at the midpoint; the small prior for Yes moves it toward the defaulters' mean"

## 11. Fitting one-feature LDA
tag: core
show: none, code — `MASS::lda(default ~ balance, data = Default)`, `fit$prior`, `fit$means`, `fit$scaling`, `predict(fit, data.frame(balance = 1500))$posterior`, each with its printed output
words: none beyond the code and a comment naming π̂_k, μ̂_k and the coefficients of linear discriminants
say: the fit prints the same prior, means and scaling the chapter shows; `predict()$posterior` is how to get p_k(x) at a new customer
note: added 2026-10-06 after class, when the deck had no R code. The fit and its three printed blocks are the chapter's `balance-lda` chunk; the `$` extractions and the `predict()` call at balance 1500 are not in the chapter, so their output came from running the code, not from the frozen markdown. They go back through `notes-author` if the chapter should show them too.

---

## 12. Multiple Features
tag: core
show: none (transition slide, title only)
words: none

---

# 13.3 Multiple-feature LDA (balance and income)

## 13. Balance and income
tag: core
show: figure — additive-densities-figure (the scatterplot of balance against income with the fitted class contours and the two class means)
words: "Two continuous features; one contour set per class"
say: the start of 13.3; the same image is the first tab of slide 16

## 14. Multivariate Gaussian model
tag: core
show: equation — 13.3.1, the model `Y_i \stackrel{ind}{\sim} \text{Categorical}\left(\pi_1, \ldots, \pi_K\right), \qquad X_i \mid Y_i = k \stackrel{ind}{\sim} N_p\left(\mu_k, \Sigma\right), \qquad i = 1, \ldots, n`, and equation — 13.3.2, `\hat\mu_k` and `\hat\Sigma`, on one slide
words: between the model and the estimates, "Shared Σ"; after the estimates, "Pooled over classes with divisor n − K"
reveal: on arrival: the model and "Shared Σ"; click 1: the estimating equations and the closing line
note: this puts the statistical model and its parameter estimation on one slide; updated 2026-10-06 to the chapter's `\stackrel{ind}{\sim}` model statement (Categorical prior, index range), set at 0.75 of the slide font so the one-line display fits 1280 px

## 15. Matrix-form discriminant
tag: core
show: equation — 13.3.3, the expanded `\log[\pi_k f_k(x)]` display; "Dropping the terms that do not involve k gives the discriminant function"; δ_k(x) intercept + slope form; "Linear in x"; then the boundary line and equation — 13.3.4, `\beta_0 + x^\top\beta`, on one slide
words: "Dropping the terms that do not involve k gives the discriminant function", "Linear in x" and "Decision boundary δ_1(x) = δ_2(x): a hyperplane, a line when p = 2"
reveal: on arrival: the expanded log[π_k f_k(x)]; click 1: the "Dropping…" line, δ_k and "Linear in x"; click 2: the boundary line and the log-odds equation
note: this combines the matrix-form and linear-boundary slides

## 16. Fitted densities and priors
tag: core
show: tabset — three tabs: "Fitted densities" (additive-densities-figure), "Equal priors" (additive-equal-figure), "Estimated priors" (additive-estimated-figure)
words: "Boundary through the crossings of the prior-weighted contours"
say: the first tab repeats slide 13's image, which is fine here because it keeps the tabs in one flow

## 17. Fitting multiple-feature LDA
tag: core
show: none, code — `MASS::lda(default ~ balance + income, data = Default)`, `fit2$prior`, `fit2$means`, `fit2$scaling`, `predict(fit2, data.frame(balance = 1500, income = 40000))$posterior`, each with its printed output
words: none beyond the code
say: the formula interface is unchanged; `means` now has a column per feature, and `scaling` is proportional to Σ̂⁻¹(μ̂_Yes − μ̂_No)
note: added 2026-10-06; the same provenance as slide 11 (the fit is the chapter's `additive-lda` chunk).

---

## 18. Comparison to Logistic Regression
tag: core
show: none (transition slide, title only)
words: none

---

# Examples

## 19. Simple logistic regression comparison
tag: core
show: figure — balance-posterior-figure
words: "Balance alone: LDA is a logistic curve, slightly flatter than logistic regression"

## 20. Multiple logistic regression comparison
tag: core
show: figure — additive-posterior-figure
words: "Balance and income: posterior probability by income quartile"

## 21. Student strata
tag: core
show: figure — strata-figure
words: "Separate models for students and non-students; each panel over its own incomes"

## 22. Conclusion
tag: optional
show: none
words: the bare concept names from the chapter's `## Conclusion`, no recap sentences — Bayes' theorem · generative classifier · LDA · discriminant function · linear boundary
note: the old deck ended with evaluation; this one ends on the examples, so this slide is optional

---

# Not in this deck

Slides cut from the earlier 49-slide outline. They are parked here with their
assets so they can come back, or become the next lecture's deck.

- **Coefficient comparison tables:** `table — coef-table-1`,
  `table — coef-table-2` (examples now show only the plots).
- **Credit card data detail:** `figure — default-scatter-figure`,
  `figure — default-income-figure` (income histograms, bimodal because of
  students), `table — delta-table-2` (fitted discriminants).
- **13.4 Classifier evaluation:** `figure — score-hist-figure`,
  `table — confusion-template-table`, `table — confusion-lda-table`,
  `equation — 13.4.2` (sensitivity and specificity),
  `table — confusion-template-k-table` (multiple classes), the four-checkbox
  rate plot (`link — #threshold-choice`, interactive), `table — compare-table`,
  the ROC slider (`link — #roc-curve`, interactive), `figure — roc-figure`,
  `equation — 13.4.6` (AUC = P(S₊ > S₋)), `figure — auc-figure-display`
  (two panels), `table — auc-table`.
- **13.6 Student strata, other outputs:** `table — strata-summary-table`,
  `figure — strata-data-figure`, `table — strata-table`.

The two interactive figures (the ROC threshold slider and the four-checkbox
rate plot) cannot run in a static deck. If they come back, they would be
`link:` slides, or fixed settings exported as PNGs through `notes-author`.

---

# Reference: assets used by this deck

- **Figures (PNG in `_freeze/04-classification/50-lda/figure-html/`):**
  default-hist-figure, default-stack-figure, balance-gauss-figure,
  balance-equal-figure, balance-weighted-figure, balance-delta-figure,
  balance-posterior-figure, additive-densities-figure, additive-equal-figure,
  additive-estimated-figure, additive-posterior-figure, strata-figure.
- **Tables (kable):** class-summary-table.
- **Equations:** the numbered displays in 13.1 to 13.3; refer to them by
  section and a few words, as above.

Not available to slides: anything inside a `### For example,` or
`### Beyond this course` callout (the toy separation fit, Fisher's
discriminant, the cost-based threshold, the multi-class ROC pointer).
