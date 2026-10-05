# Slide outline: Linear Discriminant Analysis

Outline for `50-lda_slides.qmd` (Mon 2026-10-05). **This file is the spec; the
deck is built from it.** Edit it freely: reorder, cut, reword, change
`tag:`, add notes. When it says what you want, ask for the deck to be built
(or refreshed) and `slides-author` will implement exactly these slides.

Rebuilt 2026-10-04 for the restructured chapter: the Default data run through
the whole chapter, so the slides follow the same order (data, then each piece
of theory with its fitted numbers). Nothing here is new content. Every `show:`
points at something that already exists in `50-lda.qmd`, so the deck distills
the notes and never invents. If a slide needs something the chapter doesn't
have, flag it with `needs:` and it goes back through `notes-author` and
`proof-reader` first.

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

**Timing guess:** 40 slides are tagged `core` and 10 `optional` (49
counting the agenda). At about a minute per slide the `core` set already fills
a 50-minute class, so the `optional` slides are the first to leave to the
notes; the Student strata slides (44 to 47) and the multiple-class slide are
the likeliest to move.

## Open question about interactive figures

The notes have two Observable JS figures that cannot run in a static deck: the
ROC threshold slider (13.4.5) and the four-checkbox rate plot (13.4.4). Their
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

## 1. Credit card default data
tag: core
show: table — class-summary-table
words: "ISLR2::Default · analyzed in the logistic regression lectures"
say: the data run through the whole lecture

## 2. Balance within each class
tag: core
show: figure — default-hist-figure, tab "Within each class" (`default-hist-figure-1.png`)
words: "Defaulters carry larger balances"

## 3. Balance, all customers
tag: core
show: figure — default-stack-figure
words: "Stacked counts: each class's share of a bar is its share of customers"

## 4. Bayes' theorem
tag: core
show: equation — 13.1.2, the p_k(x) display ending in `\propto \pi_k f_k(x)`
words: "Model f_k(x) and π_k, then reverse the conditioning"

## 5. Bayes classifier
tag: core
show: equation — 13.1.3, `\hat y(x) = \arg\max_k p_k(x)`, and the error probability display
words: "Smallest error rate at every x"

---

# 13.2 One-feature LDA (balance)

## 6. Gaussian class-conditional densities
tag: core
show: equation — 13.2.1, the model `P(Y=k)=\pi_k`, `X \mid Y=k \sim N(\mu_k,\sigma^2)`
words: "Same σ² in every class"

## 7. Parameter estimation
tag: core
show: equation — 13.2.2, `\hat\pi_k`, `\hat\mu_k`, `\hat\sigma^2` (pooled, divisor n − K)
words: "Closed form: proportions, means, pooled variance"

## 8. LDA with balance alone
tag: core
show: console — balance-lda
words: "`MASS::lda(default ~ balance)`"

## 9. Fitted Gaussian densities
tag: core
show: figure — balance-gauss-figure
words: "Fitted N(μ̂_k, σ̂²) over the histograms"

## 10. Discriminant function
tag: core
show: equation — 13.2.3, δ_k(x) written as intercept + slope · x
words: "intercept + slope · x"

## 11. Decision boundary
tag: core
show: equation — 13.2.4, the log posterior odds and x*
words: "Equal priors: midpoint of the means"

## 12. Equal priors
tag: core
show: figure — balance-equal-figure
words: "Counterfactual: equal priors put the boundary at the midpoint"

## 13. Estimated priors
tag: core
show: figure — balance-weighted-figure
words: "The small prior for Yes moves the boundary toward the defaulters' mean"

## 14. Discriminant functions
tag: optional
show: figure — balance-delta-figure
words: "Two straight lines; the boundary is where they cross"

## 15. LDA and logistic regression, balance alone
tag: core
show: table — coef-table-1
words: "Same form, different estimates"

## 16. Posterior probability
tag: core
show: figure — balance-posterior-figure
words: "LDA is a logistic curve, slightly flatter than logistic regression"

---

# 13.3 Multiple-feature LDA (balance and income)

## 17. Balance and income
tag: core
show: figure — default-scatter-figure
words: "Both features continuous"

## 18. Income by default status
tag: optional
show: figure — default-income-figure
words: "Bimodal: students have much lower incomes"

## 19. Multivariate Gaussian densities
tag: core
show: equation — 13.3.1, the model with `N_p(\mu_k, \Sigma)`
words: "Shared Σ"

## 20. Pooled covariance estimate
tag: core
show: equation — 13.3.2, `\hat\mu_k` and `\hat\Sigma`
words: "Pooled over classes, divisor n − K"

## 21. LDA with balance and income
tag: core
show: console — additive-lda
words: "`MASS::lda(default ~ balance + income)`"

## 22. Matrix-form discriminant
tag: core
show: equation — 13.3.3, δ_k(x) intercept + slope form
words: "Still linear in x"

## 23. Fitted discriminants
tag: optional
show: table — delta-table-2
words: "Fitted intercepts and slopes"

## 24. Linear decision boundary
tag: core
show: equation — 13.3.4, `\beta_0 + x^\top\beta`
words: "A hyperplane; a line when p = 2"

## 25. Fitted class densities
tag: core
show: figure — additive-densities-figure
words: "Same shape, different centers"

## 26. Equal priors
tag: optional
show: figure — additive-equal-figure
words: "Counterfactual boundary"

## 27. Estimated priors
tag: core
show: figure — additive-estimated-figure
words: "Boundary through the crossings of the weighted contours"

## 28. LDA and logistic regression, balance and income
tag: core
show: table — coef-table-2
words: "Income's slope is positive in both"

## 29. Decision boundaries
tag: core
show: figure — additive-boundary-figure
words: "Both nearly vertical: balance does the work"

## 30. Posterior probabilities
tag: optional
show: figure — additive-posterior-figure
words: "By income quartile"

---

# 13.4 Classifier evaluation

## 31. Classifier scores by true class
tag: core
show: figure — score-hist-figure
words: "Log posterior odds; dotted line at t = 0.5"

## 32. Confusion matrix
tag: core
show: table — confusion-template-table
words: "TP, FN, FP, TN; error rate = (FP + FN) / n"

## 33. Confusion matrix at t = 0.5
tag: core
show: table — confusion-lda-table
words: "Small error rate, low sensitivity"

## 34. Sensitivity and specificity
tag: core
show: equation — 13.4.2, sensitivity = TP/(TP+FN), specificity = TN/(TN+FP)
words: "Rates within each true class"

## 35. Multiple classes
tag: optional
show: table — confusion-template-k-table
words: "K × K; sensitivity and specificity one class versus the rest"

## 36. Classification threshold
tag: core
show: link — the four-checkbox rate plot in section 13.4.4 of the notes (`50-lda.html#threshold-choice`)
words: "Error rate, sensitivity, specificity as t moves"
needs: static frames of the checkbox figure if you want it on the slide

## 37. Thresholds t = 0.5 and t = 0.2
tag: core
show: table — compare-table
words: "Lower t catches more defaulters at a cost in specificity"

## 38. ROC curve
tag: core
show: link — the threshold slider in section 13.4.5 of the notes (`50-lda.html#roc-curve`)
words: "Sensitivity against 1 − specificity, over every threshold"
needs: static frames of the slider if you want it on the slide

## 39. ROC curves
tag: core
show: figure — roc-figure
words: "LDA and logistic regression nearly coincide"

## 40. AUC
tag: core
show: equation — 13.4.6, `\text{AUC} = P(S_+ > S_-)`
words: "Probability a random positive outscores a random negative"

## 41. AUC as area
tag: core
show: figure — auc-figure-display, panel 1 (`auc-figure-display-1.png`)
words: "The shaded area is the AUC"

## 42. Comparing classifiers with AUC
tag: core
show: figure — auc-figure-display, panel 2 (`auc-figure-display-2.png`)
words: "Same data, different classifiers; one number each"

## 43. AUC of each classifier
tag: core
show: table — auc-table
words: "Income adds little beyond balance"

---

# 13.6 Student strata

## 44. Students and non-students
tag: optional
show: figure — strata-data-figure
words: "Raw data, one panel per stratum"

## 45. Stratum summary
tag: optional
show: table — strata-summary-table
words: "Separate models for students and non-students"

## 46. Pooled comparison
tag: optional
show: table — strata-table
words: "Training rates; barely changes"

## 47. Stratified boundaries
tag: optional
show: figure — strata-figure
words: "Each panel over its own incomes"

---

## 48. Conclusion
tag: core
show: none
words: the bare concept names from the chapter's `## Conclusion`, no recap sentences — Bayes' theorem · generative classifier · LDA · discriminant function · linear boundary · confusion matrix · sensitivity and specificity · ROC and AUC

---

# Reference: assets available in the chapter

Named chunks whose output can go on a slide (anything else in the chapter is
code, a callout, or prose).

- **Figures (PNG in `_freeze/04-classification/50-lda/figure-html/`):**
  default-hist-figure (two tabs: within each class, all customers),
  default-stack-figure, balance-gauss-figure, balance-equal-figure,
  balance-weighted-figure, balance-delta-figure, balance-posterior-figure,
  default-scatter-figure, default-income-figure, additive-densities-figure,
  additive-equal-figure, additive-estimated-figure, additive-boundary-figure,
  additive-posterior-figure, score-hist-figure, roc-figure,
  auc-figure-display (two panels), strata-data-figure, strata-figure.
- **Tables (kable):** class-summary-table, coef-table-1, delta-table-2,
  coef-table-2, confusion-template-table, confusion-template-k-table,
  confusion-lda-table, compare-table, auc-table, strata-summary-table,
  strata-table.
- **Console output:** balance-lda, additive-lda (the printed block in
  toy-lda is inside a `### For example,` callout and cannot be used).
- **Interactive (notes page only):** the ROC threshold slider (13.4.5) and the
  four-checkbox rate plot (13.4.4).
- **Equations:** the numbered displays in 13.1 to 13.4; refer to them by
  section and a few words, as above.

Not available to slides: anything inside a `### For example,` or
`### Beyond this course` callout (the toy separation fit, Fisher's
discriminant, the cost-based threshold, the multi-class ROC pointer).
