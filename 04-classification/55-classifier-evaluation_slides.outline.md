# Slide outline: Classifier Evaluation

Outline for `55-classifier-evaluation_slides.qmd` (Wed 2026-10-07, one 50-minute
period; chapter 14). **This file is the spec; the deck is built from it.** Edit
it freely: reorder, cut, reword, change `tag:`, add notes. When it says what you
want, ask for the deck to be built and `slides-author` will implement exactly
these slides. The deck does not exist yet.

Drafted 2026-10-06 against `55-classifier-evaluation.qmd`, whose frozen output
(`_freeze/04-classification/55-classifier-evaluation/`, hash `639db023...`)
matches the current file. The chapter is new, **split from `50-lda.qmd` on
2026-10-06**: its evaluation material (confusion matrix through AUC), the credit
card findings and the student strata moved out of the LDA chapter, and the
slides parked in `50-lda_slides.outline.md` under "Not in this deck" are the raw
material here. The chapter is untracked in git, so no derived-from hash exists
yet; the deck's provenance comment should record the commit once the chapter is
committed.

The core line is: the credit card default data and the fitted classifiers the
chapter recaps (14.1), the confusion matrix, sensitivity and specificity,
threshold choice, the ROC curve and the AUC (14.2.1 to 14.2.6), the credit card
findings (14.3), and the student strata (14.4). Chapter sections and
subsections are numbered 14.1 (Credit card classifiers), 14.2 (Classifier
evaluation), 14.3 (Credit card findings), 14.4 (Student strata) and 14.5
(Conclusion); within 14.2, 14.2.1 Confusion matrix, 14.2.2 Sensitivity and
specificity, 14.2.3 Multiple classes, 14.2.4 Classification threshold, 14.2.5 ROC
curve, 14.2.6 AUC.

**Cut to optional, in the order they would go:** the student strata summary table
and the strata scatterplot (21, 22), Multiple classes (25, 26; the lecture's
`$K \times K$` learning objective is then covered by the notes only), the income
and balance scatterplot (3), ROC curves, same customers (18) and the Conclusion
slide (27). If time is still short, the Student strata section (23, 24) is the
part to give up, since nothing after it but the optional Multiple classes and
Conclusion slides depends on it. **Cut from the deck entirely and parked below:**
the AUC definition, the AUC estimate and the one-feature Gaussian AUC (moved out
on 2026-10-06), the error-minimizing threshold and the interactions with income
(text only in the chapter), the strata thresholds and prior-shift discussion
(text only), and every `### Beyond this course` pointer.

Two slides embed the chapter's Observable JS widgets live, the checkbox rate
plot and the ROC slider (11, 14). Four transition slides (1, 5, 10, 20), as in
the LDA and QDA decks; slide 10 introduces the Classification threshold
subsection and differs from slide 11's title only in case. The two Multiple
classes slides (25, 26) sit at the end, after the student strata and just before
the Conclusion, so the lecture's main line runs from the confusion matrix
straight through the threshold and the ROC curve.

Nothing here is new content. Every `show:` points at something that already
exists in `55-classifier-evaluation.qmd`, so the deck distills the notes and
never invents. If a slide needs something the chapter doesn't have, flag it with
`needs:` and it goes back through `notes-author` and `proof-reader` first. No
slide currently carries a `needs:`.

**Independence notation.** No slide in this deck states a model for the
observations, so none writes $\stackrel{ind}{\sim}$.

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
`<script type="ojs-define">` data blocks copied verbatim from the frozen output;
needs a web connection when presented), `link` (a pointer back to the notes
page, for anything that cannot be a static image), `none` (a words-only slide). A slide may combine two
`show:` items, for example an equation pair or a table beside a figure.

Slides never draw from a `### For example,` or `### Beyond this course`
callout.

Equations use the bracket convention (`\log\left[\frac{t}{1 - t}\right]`, never
braces or the same bracket at two levels) and `\widehat` for `\hat`. No equation
writes terms that do not involve $k$; none is needed here.

**Timing:** 28 slides: 4 transitions (no time), 18 `core` content slides (slide 0
and 17 more) and 6 `optional`. At about 2 to 3 minutes each, 18 content slides
fits 50 minutes only because the quick ones (2, 4, 6, 7, 13, 19) take a minute or
less; the two interactive slides (11, 14) take longer, since the instructor works the
widget live. If time runs short, drop in this
order: 21 and 22, 25 and 26, 3, 18, 27, then 23 and 24.

---

## 0. Today
tag: core
show: none
words: agenda as noun phrases — Credit card classifiers · Confusion matrix · Sensitivity and specificity · Threshold choice · ROC curve · AUC · Student strata
note: distilled from the chapter's four learning objectives; Multiple classes is not on the agenda because it is optional.

## 1. Credit Card Classifiers
tag: core
show: none (transition slide, title only)
words: none

---

# 14.1 Credit card classifiers

## 2. Credit card default data
tag: core
show: table — class-summary-table
words: "ISLR2::Default · Who defaults? Which mistakes? Separate models for students?"
say: the question the chapter asks, in three parts: how well LDA and logistic regression identify the customers who will default, which kinds of mistake they make, and whether separate models for students and non-students do better; the data are the ones from the LDA lecture, so this is the same table; only 333 of 10,000 customers defaulted, which matters for every error rate that follows
note: the words line compresses the chapter's **Question** paragraph (outside any callout) into its three clauses. The table is the same image data as the LDA deck's slide 2.

## 3. Income and balance
tag: optional
show: figure — default-scatter-figure
words: "Defaulters at larger balances; the classes overlap heavily"
say: the chapter's closing sentence of the data subsection; income runs across nearly the whole range for both classes
note: the chapter's heading is "Credit card default data", already used on slide 2; this second slide takes a short title. Optional because the next slide draws the same cloud with the boundaries.

## 4. Fitted classifiers
tag: core
show: figure — fitted-boundary-figure (income against balance with LDA's boundary, solid green, and logistic regression's, dashed pink, both at p̂(x) = 0.5)
words: "LDA (solid) and logistic regression (dashed): boundaries at p̂(x) = 0.5"
say: the LDA lecture fit four classifiers (LDA and logistic regression, each with balance alone and with balance and income); each gives every customer a posterior probability p̂(x), and this lecture evaluates those probabilities as scores; the two boundaries are nearly vertical and close together, logistic regression's slightly to the left; many defaulters lie to the left of both
note: the figure shows only the two-feature classifiers' boundaries.

## 5. Classifier Evaluation
tag: core
show: none (transition slide, title only)
words: none

---

# 14.2 Classifier evaluation

## 6. LDA scores within each class
tag: core
show: figure — score-hist-figure (histograms of the balance and income LDA classifier's log posterior odds of default, one panel per true class, dotted line at 0)
words: "Dotted line: p̂(x) = 0.5 · any threshold in the overlap makes two kinds of mistake"
say: the opening figure of 14.2; the defaulters' scores sit well to the right of the non-defaulters' but the histograms overlap, so defaulters to the left of a threshold are missed and non-defaulters to its right are false alarms; the chapter's own numbers for the share of each class on the wrong side of 0 are inline R in the frozen markdown (quote from there if wanted)
note: the chapter has no subsection heading for this figure (it opens the `## Classifier evaluation` section), so the title is new, taken from the figure's own title.

## 7. Confusion matrix
tag: core
show: table — confusion-template-table, then the threshold rule and the error rate as inline math
words: "Positive: the class of interest · predict positive when $\widehat p(x) > t$" and "Error rate: $(FP + FN)/n$"
reveal: on arrival: the table and the "Positive…" line; click 1: the error rate
say: with two classes call the class of interest positive; a threshold t turns probabilities into classes; TP and FN are the positives on the right and left of the dotted line on the previous slide, FP and TN the negatives; the diagonal is the correct classifications
note: the two math expressions are inline in the chapter ("predict positive when $\hat p(x) > t$" and "the error rate is $(FP + FN)/n$"), not displays; they are set as short display lines.

## 8. Credit card confusion matrix
tag: core
show: table — confusion-lda-table (LDA, balance and income, t = 0.5, training customers)
words: "LDA, balance and income · t = 0.5 · training counts"
reveal: on arrival: the table and the words line; click 1: "Error rate 2.76%, against 3.33% for predicting No for everyone"; click 2: "256 of the 276 errors are missed defaulters"
say: the error rate is small because the 9,667 non-defaulters dominate it, even though most errors are missed defaulters; these are training error rates, optimistic for new customers, as the classification lecture discussed; test error from the training data alone is the resampling unit
note: the numbers in the click lines (2.76%, 3.33%, 256, 276) are inline R in the chapter, quoted from the frozen markdown at build time, never retyped. The chapter has no heading for this table, so the title is new.

## 9. Sensitivity and specificity
tag: core
show: equation — `\text{Sensitivity} = \frac{TP}{TP + FN}, \qquad \text{Specificity} = \frac{TN}{TN + FP}`
words: "Sensitivity: positives caught, the true positive rate" and "Specificity: negatives left alone, the true negative rate" and "Credit card: sensitivity 23.1%, specificity 99.8%"
reveal: on arrival: the equation; click 1: the two labels; click 2: the credit card line
say: dividing each row of the confusion matrix by its total gives two rates that condition on the true class; their complements are the false negative rate and the false positive rate (1 − specificity); for the credit card customers the classifier flags 77 of the 333 who defaulted and correctly leaves alone 9,647 of the 9,667 who did not
note: the percentages are inline R in the chapter ("23.1%", "99.8%"), quoted from the frozen markdown. The chapter's bulleted definitions (recall, true positive rate, the probability each estimates) are said, not shown.

## 10. Classification Threshold
tag: core
show: none (transition slide, title only)
words: none
note: the chapter's subsection is "Classification threshold" (slide 11); the transition takes the capitalized form of the heading, as the other transitions do, so the two titles differ only in case.

---

# 14.2.4 Classification threshold

## 11. Classification threshold
tag: core
show: ojs — threshold-checkboxes and threshold-plot (the chapter's four-checkbox rate plot: overall error rate, sensitivity, specificity and false positive rate against t from 0 to 0.5, dotted lines at t = 0.2 and t = 0.5), with the `threshold_rates` and `threshold_marks` data from the frozen `ojs-define` block (R chunk `threshold-data`)
words: "Lowering $t$: sensitivity rises or stays, specificity falls or stays · no threshold improves both"
say: work the checkboxes live; the four rates against t for the two-feature LDA classifier; the false positive rate starts unchecked because it mirrors specificity; the error rate follows the false positive rate, nearly flat over most of the range and climbing sharply as t approaches 0; lowering t enlarges the set of features classified positive, so every observation predicted positive before still is: TP and FP can only grow, FN and TN only shrink; the figure needs an internet connection; while a checkbox has focus the arrow keys do not change slides, so click an empty part of the slide to go on
note: the "Beyond this course" cost-minimizing threshold callout under this heading is not used. Layout: checkboxes and the words line in a left column, the plot (640 by 400; the notes' is 640 by 340) in the right; the cells are otherwise verbatim from the chapter, plus a font size for the plot. The slide's data block is copied from the frozen output, never retyped.

## 12. Lowering the threshold
tag: core
show: table — compare-table (LDA with balance, LDA with balance and income, logistic regression with balance and income, each at t = 0.5 and t = 0.2: TP, FN, FP, TN, error rate, sensitivity, specificity)
words: "Lower $t$: more defaulters caught, more false alarms"
say: lowering the threshold from 0.5 to 0.2 raises the two-feature LDA classifier's sensitivity from 23.1% to 56.8%, at the cost of specificity falling from 99.8% to 97.5% and the error rate rising from 2.76% to 3.84%; adding income changes LDA very little; at both thresholds logistic regression flags more customers than the two-feature LDA classifier and has the higher sensitivity and the lower specificity; the overall error rate need not be smallest at t = 0.5: LDA's training error rate is lowest near t = 0.427, at 2.61%
note: the chapter's text lives under "Classification threshold" and has no heading for the table, so the title is new. Every number in the say line is inline R in the chapter, quoted from the frozen markdown. The table is nine columns, so the slide sets it small (about 0.6em).

## 13. ROC curve
tag: core
show: equation — `\widehat{p}(x) > t`, then `c = \log\left[\frac{t}{1 - t}\right]`
words: "ROC curve: sensitivity against $1 - \text{specificity}$ at every threshold" and "Only the ordering of the observations matters" and "Predict positive: $t$ is therefore a threshold for a probability"
reveal: on arrival: the first words line; click 1: the ordering line, the rule $\widehat{p}(x) > t$ with its words line, and the cutoff equation
say: at t = 1 nothing is predicted positive, the point (0, 0); at t = 0 everything is, the point (1, 1); any strictly increasing transformation of the score (the log posterior odds or p̂(x) itself) sorts the observations the same way, produces the same confusion matrices and traces the same curve; the rule says predict positive when p̂(x) > t, so t is a threshold for a probability, and predicting positive when p̂(x) > t is predicting positive when the log posterior odds exceed c
note: the rule is the chapter's inline "predict positive when $\hat p(x) > t$" (also on slide 7), set as a display before the cutoff; the cutoff equation is the chapter's inline definition of c, set as a display; the "orders the observations" sentence is the chapter's own, cut to a line. The chapter's definition and ordering paragraphs both fall under "ROC curve". "t is therefore a threshold for a probability" is the words-line gloss on the rule.

## 14. ROC curve, threshold slider
tag: core
show: ojs — roc-slider and roc-slider-plots (the chapter's ROC threshold slider: left panel the within-class histograms of the log posterior odds with a dotted cutoff c and the flagged bars shaded, right panel the LDA ROC curve with a moving point and the dashed diagonal), with `slider_bins`, `slider_outline`, `slider_thresholds`, `slider_roc` and `slider_colors` from the frozen `ojs-define` block (R chunk `roc-slider-define`)
words: "Lower $t$: the cutoff slides left, the point climbs toward $(1, 1)$"
say: drag the slider from t = 0.9 to t = 0.1; the cutoff slides left, the shaded share of the defaulters' histogram (sensitivity) and of the non-defaulters' (false positive rate) both grow, and the point climbs toward (1, 1); the dashed diagonal is a classifier that ignores the features and predicts positive at random; the LDA curve bows far toward the top-left corner; the figure needs an internet connection; click the slider, then use the mouse or the left and right arrow keys; while it has focus reveal.js ignores the arrow keys, so click an empty part of the slide to go on
note: the cells are verbatim from the chapter except sizes: the slider is 640 wide, the density panel 580 by 340 (notes: 360 by 300), the ROC panel 360 by 340 (notes: 300 by 300), with a smaller plot font. The words line compresses the chapter's sentence on moving the slider.

## 15. ROC curves, balance + income
tag: core
show: figure — roc-figure (LDA and logistic regression ROC curves, balance and income, with the points at t = 0.5 filled and t = 0.2 open, a triangle for LDA and a square for logistic regression, dashed diagonal)
words: "Almost on top of one another, far above the diagonal"
say: lowering t from 0.5 to 0.2 moves each model's marked point up and slightly right along its curve; logistic regression's point sits further along its nearly shared curve than LDA's; the crossover discussion (the balances where the two posterior curves cross at the income quartiles, and the order reversing at a low threshold) is in the notes
note: the title is the figure's own. The crossover paragraph is inline R and text only, so it is parked.

## 16. AUC of the fitted classifiers
tag: core
show: table — auc-table (LDA and logistic regression with balance alone and with balance and income, AUC by the trapezoid rule and by pairwise comparison)
words: "Two computations of the AUC agree in every row"
say: with balance alone LDA and logistic regression have identical AUCs, since both posterior probabilities are increasing functions of balance, so they order the customers identically and trace the same ROC curve; with balance and income the orderings differ slightly, and the AUCs 0.94907 and 0.94905 differ by 2.1 × 10⁻⁵; an AUC of 0.949 means that for a random defaulter and non-defaulter, LDA gives the defaulter the higher posterior probability about 95% of the time
note: the title is new (the chapter has no heading for the table). The numbers in the say line are inline R in the chapter, quoted from the frozen markdown.

## 17. Area under the ROC curve
tag: core
show: figure — auc-figure-display-1 (the shaded area under the running example's ROC curve, labeled with its AUC, dashed diagonal)
words: "AUC = 0.94907 for balance and income"
say: the left panel of the chapter's two-panel figure; the area is the AUC (trapezoid rule) in the table on the previous slide
note: the chapter lays the two panels side by side in one chunk, so the freeze holds them as `auc-figure-display-1.png` and `auc-figure-display-2.png`; the deck shows one per slide (17 and 18) rather than two small images side by side. The panel's own title is "Area under the ROC curve". The AUC value is the label inside the figure and inline R in the chapter's table; quote from the frozen markdown.

## 18. ROC curves, same customers
tag: core
show: figure — auc-figure-display-2 (ROC curves of LDA with balance only, with income only, with both, and a classifier that ignores the features, each labeled with its AUC)
words: "AUC ranks classifiers without a threshold"
say: income alone barely separates the classes, its curve staying near the diagonal; the balance-only and two-feature curves nearly coincide and cross, so each has the higher true positive rate over part of the range of false positive rates, and the AUC averages over all of them: the classifier with the larger AUC can still be the worse one over the false positive rates that matter for a given application; the shares of the range and the AUCs are inline R in the chapter
note: the right panel of the two-panel figure. Move to optional if time is short.

## 19. Credit card findings
tag: core
show: none
words: three lines — "LDA and logistic regression order the customers almost identically" · "Income adds little beyond balance: AUC +0.0011" · "At $t = 0.5$ either catches a minority of defaulters: use a lower threshold"
reveal: on arrival: the first line; click 1: the second; click 2: the third
say: LDA's Gaussian assumptions fit these customers imperfectly, yet it orders them almost exactly as logistic regression does and differs mainly in flagging fewer customers at high thresholds; income's logistic regression coefficient is clearly nonzero (z = 4.17) although it adds only 0.0011 to LDA's AUC; a lender who cares about missed defaults would use a lower threshold
note: the section is one paragraph of prose with no figure or table, so the slide is words only: three compressions of the chapter's own sentences, with the two numbers inline R quoted from the frozen markdown. The deck does not draw a new table or figure for it.

## 20. Student Strata
tag: core
show: none (transition slide, title only)
words: none

---

# 14.4 Student strata

## 21. Default rate by student status
tag: optional
show: table — strata-summary-table (customers, defaulters, default rate and median income for non-students and students)
words: "Students default more often and have much lower median income"
say: 4.31% against 2.92%; the median income gap was noted in the LDA lecture; this additional analysis asks whether separate models for students and non-students classify better
note: the chapter's heading is "Student strata", used as the transition (20); the title here is new. The rates are inline R in the chapter, quoted from the frozen markdown if put on the slide.

## 22. Income and balance by student
tag: optional
show: figure — strata-data-figure (income against balance, one panel per student status, each panel over its own incomes)
words: "In both strata the defaulters sit at larger balances"
say: the students' incomes occupy a lower, narrower band, from $772 to $33,003, against $8,018 to $73,554 for non-students (inline R in the chapter; quote from the frozen markdown if put on the slide)
note: new title (the chapter has no heading); the figure's own title is "ISLR2::Default, income against balance by student status".

## 23. Boundaries within each stratum
tag: core
show: figure — strata-figure (the scatterplot by stratum with each stratum's LDA boundary, solid green, and interacted logistic regression boundary, dashed pink)
words: "LDA fit within each stratum (solid), interacted logistic regression (dashed)"
say: LDA with balance and income fit separately to non-students and students, so priors, class means and pooled covariance all differ by stratum; the logistic regression interacts the intercept and both slopes with student status, which gives the same fitted probabilities as two separate logistic regressions; each customer is scored by the model for its own stratum, and because each stratum's priors are its own default rates, the posteriors from the two strata are on one scale
note: the chapter's heading is "Student strata"; this is the section's central figure, and the title is new (the figure's own is "Boundaries fit within each student stratum", too long for one line). This is the figure that left the LDA chapter: it is the same image as `50-lda`'s `strata-figure`.

## 24. Stratified and single fits
tag: core
show: table — strata-table (LDA single fit and by stratum, logistic regression additive and interacted with student: error rate at t = 0.5 and AUC)
words: "Barely changes the classifications" and "Training rates: stratified models estimate twice as many parameters"
reveal: on arrival: the table and the first words line; click 1: the second line
say: the extra flexibility barely changes the classifications: stratifying LDA moves the training error rate from 2.76% to 2.73% and its AUC from 0.9491 to 0.9495, and interacting the logistic regression moves its error rate from 2.63% to 2.68%; the stratified models estimate 16 parameters against 8 for LDA and 6 against 3 for logistic regression, so their training error rates tend to understate test error, and their training AUCs overstate test AUC, by more; whether stratifying helps on new customers is a question for test data
note: the numbers in the say line are inline R in the chapter, quoted from the frozen markdown. The chapter's table has four rows (the QDA deck's Student strata slide has six rows of test rates; this is the training version, as the notes say).

## 25. Multiple classes
tag: optional
show: table — confusion-template-k-table
words: "$n_{kj}$ — true class $k$, predicted class $j$" and "Error rate: $1 - \sum_{k=1}^K n_{kk} / n$"
reveal: on arrival: the table and the $n_{kj}$ label; click 1: the error rate
say: with K classes the confusion matrix is K × K, true classes in the rows and predicted classes in the columns; the diagonal entries are the correct classifications
note: optional ("multiple classes only if time"); placed after the student strata slides, just before the Conclusion. The error rate is the chapter's inline expression. Uses K for the class count, per `CONVENTIONS.md`.

## 26. Multiple classes, one versus rest
tag: optional
show: equation — `\text{Sensitivity}_k = \frac{n_{kk}}{\sum_{j=1}^K n_{kj}}, \qquad \text{Specificity}_k = \frac{\sum_{l \ne k} \sum_{j \ne k} n_{lj}}{\sum_{l \ne k} \sum_{j=1}^K n_{lj}}`
words: "One versus the rest: class $k$ positive, the other $K - 1$ classes together negative"
reveal: on arrival: the equation; click 1: the words line
say: collapsing to two-by-two gives class k's rates; the threshold t = 0.5 generalizes to the class with the largest posterior probability, and the two rules coincide when K = 2; other thresholds, the ROC curve and the AUC are two-class tools
note: the chapter's heading is "Multiple classes", used on slide 25; the title here is shortened to fit one line and names the "one versus the rest" idea the chapter bolds. The ROC/AUC extension to K > 2 is in a `### Beyond this course` callout and is not used.

## 27. Conclusion
tag: optional
show: none
words: the bare concept names from the chapter's `## Conclusion`, no recap sentences — Confusion matrix · Sensitivity and specificity · Threshold · ROC curve · AUC · Stratified models
note: optional; the lecture may end on slide 26 (or 24, when Multiple classes is skipped) with the next lecture's preview said aloud (quadratic discriminant analysis, naive Bayes and KNN, compared on a held-out test set). The chapter's concept list is the confusion matrix, sensitivity and specificity, the threshold, the K × K matrix with one versus rest, the ROC curve, the AUC and fitting within strata with each stratum's own priors; the shorter list drops the two that are optional on the core line.

---

# Not in this deck

Cut from the lecture's core line, with their assets, so they can come back.

- **AUC (the integral chain):** formerly slide 17, titled "AUC" (core). Equation
  `\text{AUC} = \int_0^1 \text{TPR}\; d\,\text{FPR} = \int_{-\infty}^{\infty} P(S_+ > c)\, g_-(c)\, dc = P(S_+ > S_-)`,
  set at about 0.8 of the slide font. Words: "$S_+$, $S_-$ — scores of a random
  positive and a random negative" and "AUC = 0.5: ignores the features · AUC = 1:
  ranks every positive above every negative". Reveal: on arrival the equation;
  click 1 the first label line; click 2 the second line. Say: the area under the
  ROC curve summarizes the curve over all thresholds at once; the final equality
  conditions on S₋ = c and integrates over its density; the AUC is the probability
  that the classifier scores a randomly chosen positive above a randomly chosen
  negative; the derivation (the true positive rate P(S₊ > c) and the false
  positive rate P(S₋ > c) whose derivative is −g₋(c)) is in the notes. Note: the
  chapter's `$g_-$` (the density of $S_-$) is said, not shown. Source: chapter
  subsection "AUC".
- **Estimating the AUC:** formerly slide 18 (optional). Equation
  `\widehat{\text{AUC}} = \frac{1}{n_+ n_-}\sum_{i:\, y_i = \text{positive}}\ \sum_{j:\, y_j = \text{negative}}\left[\mathrm{I}(s_i > s_j) + \tfrac{1}{2}\mathrm{I}(s_i = s_j)\right]`.
  Words: "$n_+$, $n_-$ — numbers of positive and negative observations" and "Tied
  scores count as half a correctly ordered pair". Reveal: on arrival the
  equation; click 1 both labels. Say: with training data the same probability is
  estimated by comparing every positive observation with every negative one; this
  equals the area under the empirical ROC curve by the trapezoid rule, which the
  AUC table of the fitted classifiers confirms. Source: chapter subsection "AUC".
- **One-feature Gaussian AUC:** formerly slide 19 (optional). Equations
  `S_+ - S_- \sim N\left(\mu_2 - \mu_1, 2\sigma^2\right)`, then
  `\text{AUC} = P(S_+ - S_- > 0) = \Phi\left(\frac{\Delta}{\sqrt{2}}\right), \qquad \Delta = \frac{\mu_2 - \mu_1}{\sigma}`;
  words "$\Phi$ — standard normal CDF" and "$\Delta$ — separation of the class means
  in standard deviations". Reveal: on arrival the distribution; click 1 the AUC
  equation; click 2 the two labels. Say: under the one-feature Gaussian model of
  the LDA lecture the score can be taken as x itself, with class 2 positive and
  μ₂ > μ₁; the fitted model for balance has Δ̂ = 2.083, implying an AUC of 0.930,
  below the empirical 0.948, consistent with the defaulters' balances being less
  spread out than the shared σ̂ assumes; with each class's own standard deviation
  the implied AUC is 0.951, close to the empirical value (numbers are inline R in
  the chapter, quoted from the frozen markdown). This is the learning objective
  "compute the AUC implied by a one-feature Gaussian model with a shared
  variance", now covered by the notes only. The bare $\sim$ is the derived
  distribution `CONVENTIONS.md` reserves it for. Source: chapter subsection "AUC".
- **Error-minimizing threshold:** the chapter's paragraph that LDA's training
  error rate is lowest near t = 0.427, at 2.61%, against 2.76% at t = 0.5, and the
  logistic regression's near t = 0.504 (inline R, text only, no figure); slide 12's
  `say:` quotes the LDA value.
- **ROC curve, crossover discussion:** the balances where the LDA and logistic
  regression posterior curves cross at the quartiles of income and the reversal at
  t = 0.1 (inline R, text only); slide 15's `say:` points at it.
- **Student strata, thresholds and priors:** each stratum's balance threshold
  at the median income, the students' larger prior for Yes and the confounding
  explanation (text and inline R only, no figure or table). Slide 24's `say:`
  covers the parameter counts only.
- **Interacted logistic regression equals separate fits:** the sentence that
  the two give the same fitted probabilities to within 9 × 10⁻¹⁵ (inline R,
  text only); slide 23's `say:` states the equivalence without the number.
- **Beyond this course (never used):** ROC and AUC for K > 2, multinomial
  logistic regression, and the cost-minimizing threshold
  c_FP / (c_FP + c_FN).

---

# Reference: assets used by this deck

- **Figures (PNG in `_freeze/04-classification/55-classifier-evaluation/figure-html/`):**
  default-scatter-figure (slide 3, optional), fitted-boundary-figure (4),
  score-hist-figure (6), roc-figure (15), auc-figure-display-1 and
  auc-figure-display-2 (17 and 18; the two panels of one chunk),
  strata-data-figure (22, optional), strata-figure (23).
- **Tables (kable, copied from the frozen markdown):** class-summary-table (2),
  confusion-template-table (7), confusion-lda-table (8),
  compare-table (12), auc-table (16), strata-summary-table (21, optional),
  strata-table (24), confusion-template-k-table (25, optional).
- **Equations:** Sensitivity and specificity (9); the rule p̂(x) > t and the
  cutoff c = log[t/(1 − t)] (13); the K-class sensitivity and specificity (26,
  optional). Parked, not in the deck: AUC as the area, the integral chain; the
  AUC estimate; the one-feature Gaussian AUC, S₊ − S₋ and Φ(Δ/√2) (see
  "Not in this deck"). Refer to them by subsection and a few words, as above.
- **Interactive widgets (OJS):** the `{ojs}` cells threshold-checkboxes and
  threshold-plot (11) and roc-slider and roc-slider-plots (14), copied from
  the chapter source; their data are the two `<script type="ojs-define">` blocks
  (`threshold_rates`, `threshold_marks`; `slider_bins`, `slider_outline`,
  `slider_thresholds`, `slider_roc`, `slider_colors`), copied verbatim from the
  `includes` field of `_freeze/.../execute-results/html.json`. If the chapter's
  R chunks `threshold-data` or `roc-slider-define` change, recopy both blocks.
- **Numbers quoted from inline R in the frozen markdown:** 77 and 333, 9,647
  and 9,667, 2.76%, 3.33%, 256, 276, 23.1%, 99.8% (slides 8 and 9); 56.8%, 97.5%,
  3.84%, 0.427, 2.61% (12); 0.94907, 0.94905, 0.949 (16, 17); 0.0011, z = 4.17
  (19); 4.31%, 2.92% (21); 2.73%, 0.9495, 2.63%, 2.68%, 16 against 8, 6 against 3
  (24). Parked with the one-feature Gaussian AUC: 2.083, 0.930, 0.951.
- **Chunk names to confirm at build time:** the `figure-html/` directory holds
  default-scatter-figure, fitted-boundary-figure, score-hist-figure, roc-figure,
  auc-figure-display-1, auc-figure-display-2, strata-data-figure and
  strata-figure, each with a `-1.png` suffix except the two auc panels.

Not available to slides: anything inside a `### For example,` or
`### Beyond this course` callout (here, the cost-minimizing threshold and the
multi-class ROC and AUC pointer).
