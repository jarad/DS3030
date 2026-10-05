# Slide outline: Linear Discriminant Analysis

Outline for `50-lda_slides.qmd` (Mon 2026-10-05). **This file is the spec; the
deck is built from it.** Edit it freely: reorder, cut, reword, change
`tag:`, add notes. When it says what you want, ask for the deck to be built
(or refreshed) and `slides-author` will implement exactly these slides.

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
(the named kable chunk, copied from the frozen markdown), `console` (the
named chunk's printed R output, verbatim), `link` (a pointer back to the
notes page, for anything that cannot be a static image), `none` (a
words-only slide).

Slides never draw from a `### For example,` or `### Beyond this course`
callout.

**Timing guess:** 38 slides are tagged `core` and 10 `optional` (47 slides
counting the agenda). At about a minute per slide the `core` set already fills
a 50-minute class, so the `optional` slides are the first to leave to the
notes, and you may want to tag more slides `optional` (13.5.7 Student strata
and the 13.4 multiple-class slide are the other likely candidates).

## Open question about interactive figures

The notes have two Observable JS figures that cannot run in a static deck: the
threshold slider in 13.4.4 (ROC curve) and the checkbox plot in 13.5.5. Their
slides below use `link:` to the notes page. Alternatives: skip them, or tell
me two or three fixed settings to show (for example `t = 0.9, 0.5, 0.1`), and
those would need to be exported as PNGs through `notes-author` first.

---

## 0. Today
tag: core
show: none
words: agenda as noun phrases, from the learning objectives — Bayes' theorem · LDA, one feature and several · evaluating classifiers · credit card default

---

# 13.1 Generative classifiers

## 1. Generative classifiers
tag: core
show: equation — 13.1.1, the p_k(x) display ending in `\propto \pi_k f_k(x)`
words: "Model f_k(x) and π_k, then reverse the conditioning"
say: logistic regression models P(Y|X) directly; this reverses the conditioning with Bayes' theorem

## 2. Bayes classifier
tag: core
show: equation — 13.1.2, `\hat y(x) = \arg\max_k p_k(x)`, and the error probability display
words: "Smallest error rate at every x"

---

# 13.2 One-feature LDA

## 3. Gaussian class-conditional densities
tag: core
show: equation — 13.2.1, the model `P(Y=k)=\pi_k`, `X \mid Y=k \sim N(\mu_k,\sigma^2)`
words: "Same σ² in every class"

## 4. Discriminant function
tag: core
show: equation — 13.2.2, δ_k(x) written as intercept + slope · x
words: "intercept + slope · x"

## 5. Decision boundary
tag: core
show: equation — 13.2.3, the log posterior odds and x*
words: "Equal priors: midpoint of the means"

## 6. Prior-weighted densities, equal priors
tag: core
show: figure — theory-equal-figure
words: "π_k f_k(x); boundary where the curves cross"

## 7. Prior-weighted densities, unequal priors
tag: core
show: figure — theory-unequal-figure
words: "Smaller prior moves the boundary toward that class's mean"

## 8. Discriminant functions
tag: optional
show: figure — theory-delta-figure
words: "Two straight lines; the boundary is where they cross"

## 9. Parameter estimation
tag: core
show: equation — 13.2.4, `\hat\pi_k`, `\hat\mu_k`, `\hat\sigma^2` (pooled, divisor n − K)
words: "Closed form: proportions, means, pooled variance"

---

# 13.3 Multiple-feature LDA

## 10. Multivariate Gaussian densities
tag: core
show: equation — 13.3.1, the model with `N_p(\mu_k, \Sigma)`
words: "Shared Σ"

## 11. Matrix-form discriminant
tag: core
show: equation — 13.3.2, δ_k(x) intercept + slope form
words: "Still linear in x"

## 12. Linear decision boundary
tag: core
show: equation — 13.3.3, `\beta_0 + x^\top\beta`
words: "A hyperplane; a line when p = 2"

## 13. Class densities
tag: core
show: figure — theory-2d-densities-figure
words: "Same shape, different centers"

## 14. Equal priors
tag: core
show: figure — theory-2d-equal-figure
words: "Not perpendicular to the segment between the means"

## 15. Unequal priors
tag: core
show: figure — theory-2d-unequal-figure
words: "Boundary shifts parallel to itself"

## 16. Pooled covariance estimate
tag: optional
show: equation — 13.3.4, `\hat\mu_k` and `\hat\Sigma`
words: "Pooled over classes, divisor n − K"

---

# 13.4 Classifier evaluation

## 17. Confusion matrix
tag: core
show: table — confusion-template-table
words: "TP, FN, FP, TN; error rate = (FP + FN) / n"

## 18. Sensitivity and specificity
tag: core
show: equation — 13.4.2, sensitivity = TP/(TP+FN), specificity = TN/(TN+FP)
words: "Rates within each true class"

## 19. Multiple classes
tag: optional
show: table — confusion-template-k-table
words: "K × K; sensitivity and specificity one class versus the rest"

## 20. Classification threshold
tag: core
show: none
words: "Predict positive when p̂(x) > t · Lower t: sensitivity up, specificity down"
say: no figure here; the slider on the next slide makes the point

## 21. ROC curve
tag: core
show: link — the threshold slider in section 13.4.4 of the notes (`50-lda.html#roc-curve`)
words: "Sensitivity against 1 − specificity, over every threshold"
needs: static frames of the slider if you want it on the slide (see the open question above)

## 22. AUC
tag: core
show: equation — 13.4.5, `\text{AUC} = P(S_+ > S_-)` and `\Phi(\Delta/\sqrt{2})`
words: "Probability a random positive outscores a random negative"

## 23. AUC as area
tag: core
show: figure — auc-figure-display, panel 1 (`auc-figure-display-1.png`)
words: "The shaded area is the AUC"

## 24. Comparing classifiers with AUC
tag: core
show: figure — auc-figure-display, panel 2 (`auc-figure-display-2.png`)
words: "Same data, different classifiers; one number each"

---

# 13.5 Credit card default classification

## 25. Credit card default
tag: core
show: table — class-summary-table
words: "ISLR2::Default · analyzed in the logistic regression lectures"

## 26. Balance by default status
tag: core
show: figure — default-hist-figure
words: "Defaulters carry larger balances"

## 27. LDA with balance alone
tag: core
show: console — balance-lda
words: "`MASS::lda(default ~ balance)`"

## 28. LDA and logistic regression, balance alone
tag: core
show: table — coef-table-1
words: "Same form, different estimates"

## 29. Gaussian densities
tag: optional
show: figure — balance-gauss-figure
words: "Fitted N(μ̂_k, σ̂²) over the histograms"

## 30. Prior-weighted densities
tag: optional
show: figure — balance-weighted-figure
words: "The defaulter curve shrinks to a small bump"

## 31. Posterior probability
tag: core
show: figure — balance-posterior-figure
words: "LDA is a logistic curve, slightly flatter than logistic regression"

## 32. Balance and income
tag: core
show: figure — default-scatter-figure
words: "Both features continuous"

## 33. Income by default status
tag: optional
show: figure — default-income-figure
words: "Bimodal: students have much lower incomes"

## 34. LDA with balance and income
tag: core
show: console — additive-lda
words: "`MASS::lda(default ~ balance + income)`"

## 35. LDA and logistic regression, balance and income
tag: core
show: table — coef-table-2
words: "Income's slope is positive in both"

## 36. Decision boundaries
tag: core
show: figure — additive-boundary-figure
words: "Both nearly vertical: balance does the work"

## 37. Posterior probabilities
tag: optional
show: figure — additive-posterior-figure
words: "By income quartile"

## 38. Confusion matrix at t = 0.5
tag: core
show: table — confusion-lda-table
words: "Small error rate, low sensitivity"

## 39. Threshold choice
tag: core
show: link — the checkbox plot in section 13.5.5 of the notes (`50-lda.html#threshold-choice`)
words: "Error rate, sensitivity, specificity as t moves"
needs: static frames of the checkbox figure if you want it on the slide

## 40. Thresholds t = 0.5 and t = 0.2
tag: core
show: table — compare-table
words: "Lower t catches more defaulters at a cost in specificity"

## 41. ROC curves
tag: core
show: figure — roc-figure
words: "LDA and logistic regression nearly coincide"

## 42. AUC of each classifier
tag: core
show: table — auc-table
words: "Income adds little beyond balance"

## 43. Student strata
tag: optional
show: table — strata-summary-table
words: "Separate models for students and non-students"

## 44. Pooled comparison
tag: optional
show: table — strata-table
words: "Training rates; barely changes"

## 45. Stratified boundaries
tag: optional
show: figure — strata-figure
words: "Each panel over its own incomes"

---

## 46. Conclusion
tag: core
show: none
words: the bare concept names from the chapter's `## Conclusion`, no recap sentences — Bayes' theorem · generative classifier · LDA · discriminant function · linear boundary · confusion matrix · sensitivity and specificity · ROC and AUC

---

# Reference: assets available in the chapter

Named chunks whose output can go on a slide (anything else in the chapter is
code, a callout, or prose).

- **Figures (PNG in `_freeze/04-classification/50-lda/figure-html/`):**
  theory-equal-figure, theory-unequal-figure, theory-delta-figure,
  theory-2d-densities-figure, theory-2d-equal-figure,
  theory-2d-unequal-figure, auc-figure-display (two panels),
  default-hist-figure, balance-gauss-figure, balance-weighted-figure,
  balance-delta-figure, balance-posterior-figure, default-scatter-figure,
  default-income-figure, additive-boundary-figure, additive-posterior-figure,
  roc-figure, strata-figure.
- **Tables (kable):** confusion-template-table, confusion-template-k-table,
  class-summary-table, coef-table-1, coef-table-2, confusion-lda-table,
  compare-table, auc-table, strata-summary-table, strata-table.
- **Console output:** balance-lda, additive-lda (the third printed block,
  toy-lda, is inside a `### For example,` callout and cannot be used).
- **Interactive (notes page only):** the threshold slider (13.4.4) and the
  checkbox plot (13.5.5).
- **Equations:** the numbered displays in 13.1 to 13.4; refer to them by
  section and a few words, as above.

Not available to slides: anything inside a `### For example,` or
`### Beyond this course` callout (the toy separation fit, the cost-based
threshold, Fisher's discriminant, the multi-class ROC pointer).
