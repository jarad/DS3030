# DS 3030 - Canvas Link Changes

A running list of `.qmd` chapter files that were **renamed** or **introduced**,
so Canvas can be kept in sync. A renamed file breaks any existing Canvas link
that points at its old rendered page directly (see `CLAUDE.md`); a new file
has no Canvas link yet. Check off a row once Canvas has been updated.

Update this whenever a chapter file is renamed or a new one is registered in
`_quarto.yml`.

## Fall 2026

| Date | Change | Old path | New path | Done |
| ---- | ------ | -------- | -------- | ---- |
| 2026-09-17 | Rename | regression/03-1-slr.qmd | regression/03-10-slr.qmd | x |
| 2026-09-17 | Rename | regression/03-2-mlr.qmd | regression/03-20-mlr.qmd | x |
| 2026-09-17 | Rename | regression/03-3-feature-engineering.qmd | regression/03-30-feature-engineering.qmd | x |
| 2026-09-17 | Rename | regression/03-4-flexibility.qmd | regression/03-40-flexibility.qmd | x |
| 2026-09-17 | New | | regression/03-15-capm.qmd | x |
| 2026-09-19 | Rename | learning/02-1-overview.qmd | 02-learning/10-overview.qmd | x |
| 2026-09-19 | Rename | learning/02-2-regression.qmd | 02-learning/20-regression.qmd | x |
| 2026-09-19 | Rename | learning/02-3-classification.qmd | 02-learning/30-classification.qmd | x |
| 2026-09-19 | Rename | regression/03-10-slr.qmd | 03-regression/10-slr.qmd | x |
| 2026-09-19 | Rename | regression/03-15-capm.qmd | 03-regression/15-capm.qmd | x |
| 2026-09-19 | Rename | regression/03-20-mlr.qmd | 03-regression/20-mlr.qmd | x |
| 2026-09-19 | Rename | regression/03-30-feature-engineering.qmd | 03-regression/30-feature-engineering.qmd | x |
| 2026-09-19 | Rename | regression/03-40-flexibility.qmd | 03-regression/40-flexibility.qmd | x |
| 2026-09-19 | New | | 04-classification/10-logistic-regression.qmd | |
| 2026-09-19 | New | | 04-classification/20-multiple-logistic-regression.qmd | |
| 2026-09-19 | New | | 04-classification/30-flexible-logistic-regression.qmd | |
| 2026-09-19 | New | | 04-classification/40-problems-in-logistic-regression.qmd | |
| 2026-10-01 | New | | 04-classification/50-lda.qmd | |
| 2026-10-01 | New | | 04-classification/60-qda-naive-bayes.qmd | |
| 2026-10-01 | New | | 04-classification/70-generalized-linear-models.qmd | |
| 2026-10-06 | New (split from 04-classification/50-lda.qmd) | | 04-classification/55-classifier-evaluation.qmd | |

The 2026-10-06 split moved LDA's Classifier evaluation, Credit card findings,
and Student strata sections out of `04-classification/50-lda.html` into
`04-classification/55-classifier-evaluation.html`. A Canvas link to one of
those sections by anchor (for example `50-lda.html#threshold-choice`,
`#roc-curve`, `#auc`, or `#student-strata`) must now point at the same
anchor on `55-classifier-evaluation.html`. Adding the chapter also shifts
the book's chapter numbers from it on: QDA and naive Bayes is now chapter 15
and generalized linear models chapter 16.
