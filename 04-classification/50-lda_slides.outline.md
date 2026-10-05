# Slide outline: Linear Discriminant Analysis

Outline for `50-lda_slides.qmd` (Mon 2026-10-05). **This file is the spec; the
deck is built from it.** Edit it freely: reorder, cut, reword, change
`tag:`, add notes. When it says what you want, ask for the deck to be built
(or refreshed) and `slides-author` will implement exactly these slides.

Shortened 2026-10-05 to the lecture's core line: the data, one-feature LDA,
multiple-feature LDA, then three examples (the two logistic regression comparisons and the student strata). The
evaluation slides (confusion matrix through AUC), the student strata and the
printed R output are parked in the last section, not deleted.

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
say: what you plan to say aloud         <- speaker notes, never on the slide
needs: ...                              <- only if something is missing from the chapter
```

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

**Timing:** 18 slides, 16 tagged `core` and 2 `optional`, about 2 to 3
minutes each since several slides carry two equations or a whole tabset.

---

## 0. Today
tag: core
show: none
words: agenda as noun phrases — Bayes' theorem · LDA, one feature and several · comparison with logistic regression

---

# 13.1 Generative classifiers

## 1. Credit card default data
tag: core
show: table — class-summary-table
words: "ISLR2::Default · analyzed in the logistic regression lectures"
say: the data run through the whole lecture

## 2. Balance within each class
tag: core
show: figure — default-hist-figure (the within-class histograms)
words: "Defaulters carry larger balances"

## 3. Balance, all customers
tag: optional
show: figure — default-stack-figure
words: "Stacked counts: each class's share of a bar is its share of customers"

## 4. Bayes' theorem and Bayes classifier
tag: core
show: equation — 13.1.2, the p_k(x) display ending in `\propto \pi_k f_k(x)`, and equation — 13.1.3, `\hat y(x) = \arg\max_k p_k(x)` with the error probability display, on one slide
words: "Model f_k(x) and π_k, reverse the conditioning, assign the class with the largest posterior"
note: this combines the Bayes' theorem and Bayes classifier slides

---

# 13.2 One-feature LDA (balance)

## 5. Fitted Gaussian densities
tag: core
show: figure — balance-gauss-figure
words: "One-feature LDA: Gaussian densities fitted to each class"
say: the start of 13.2; the histograms with the fitted N(μ̂_k, σ̂²) over them

## 6. Gaussian class-conditional densities
tag: core
show: equation — 13.2.1, the model `P(Y=k)=\pi_k`, `X \mid Y=k \sim N(\mu_k,\sigma^2)`
words: "Same σ² in every class"

## 7. Discriminant function and decision boundary
tag: core
show: equation — 13.2.3, δ_k(x) as intercept + slope · x, and equation — 13.2.4, the log posterior odds and x*, on one slide
words: "Linear in x; the boundary is where the two discriminants are equal"
note: this combines the discriminant-function and decision-boundary slides

## 8. Prior-weighted densities
tag: core
show: tabset — three tabs: "Equal priors" (balance-equal-figure), "Estimated priors" (balance-weighted-figure), "Discriminant functions" (balance-delta-figure)
words: "Equal priors put the boundary at the midpoint; the small prior for Yes moves it toward the defaulters' mean"

## 9. Parameter estimation
tag: core
show: equation — 13.2.2, `\hat\pi_k`, `\hat\mu_k`, `\hat\sigma^2` (pooled, divisor n − K)
words: "Closed form: proportions, means, pooled variance"

---

# 13.3 Multiple-feature LDA (balance and income)

## 10. Balance and income
tag: core
show: figure — additive-densities-figure (the scatterplot of balance against income with the fitted class contours and the two class means)
words: "Two continuous features; one contour set per class"
say: the start of 13.3; the same image is the first tab of slide 13

## 11. Multivariate Gaussian model and parameter estimation
tag: core
show: equation — 13.3.1, the model `P(Y=k)=\pi_k`, `X \mid Y=k \sim N_p(\mu_k, \Sigma)`, and equation — 13.3.2, `\hat\mu_k` and `\hat\Sigma`, on one slide
words: "Shared Σ, pooled over classes with divisor n − K"
note: this puts the statistical model on the parameter-estimation slide

## 12. Matrix-form discriminant and linear decision boundary
tag: core
show: equation — 13.3.3, δ_k(x) intercept + slope form, and equation — 13.3.4, `\beta_0 + x^\top\beta`, on one slide
words: "Still linear in x; a hyperplane, a line when p = 2"
note: this combines the matrix-form and linear-boundary slides

## 13. Fitted densities and priors
tag: core
show: tabset — three tabs: "Fitted densities" (additive-densities-figure), "Equal priors" (additive-equal-figure), "Estimated priors" (additive-estimated-figure)
words: "Boundary through the crossings of the prior-weighted contours"
say: the first tab repeats slide 10's image, which is fine here because it keeps the tabs in one flow

---

# Examples

## 14. Simple logistic regression comparison
tag: core
show: figure — balance-posterior-figure
words: "Balance alone: LDA is a logistic curve, slightly flatter than logistic regression"

## 15. Multiple logistic regression comparison
tag: core
show: figure — additive-posterior-figure
words: "Balance and income: posterior probability by income quartile"

## 16. Student strata
tag: core
show: figure — strata-figure
words: "Separate models for students and non-students; each panel over its own incomes"

## 17. Conclusion
tag: optional
show: none
words: the bare concept names from the chapter's `## Conclusion`, no recap sentences — Bayes' theorem · generative classifier · LDA · discriminant function · linear boundary
note: the old deck ended with evaluation; this one ends on the examples, so this slide is optional

---

# Not in this deck

Slides cut from the earlier 49-slide outline. They are parked here with their
assets so they can come back, or become the next lecture's deck.

- **Printed R output:** `console — balance-lda`, `console — additive-lda`
  (`MASS::lda(default ~ balance)` and `MASS::lda(default ~ balance + income)`).
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
