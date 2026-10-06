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
and the strata scatterplot (25, 26), the one-feature Gaussian AUC (19), the AUC
estimate (18), Multiple classes (10, 11; the lecture's `$K \times K$` learning
objective is then covered by the notes only), the income and balance scatterplot
(3), ROC curves, same customers (22) and the Conclusion slide (29). If time is
still short, the Student strata section (27, 28) is the part to give up, since it
comes last and nothing after it depends on it. **Cut from the deck entirely and
parked below:** the error-minimizing threshold and the interactions with income
(text only in the chapter), the strata thresholds and prior-shift discussion
(text only), and every `### Beyond this course` pointer.

Two slides use `link:` instead of a figure, because the chapter's checkbox rate
plot and ROC slider are Observable JS widgets with no static export (12, 15).
Three transition slides (1, 5, 24), as in the LDA and QDA decks.

Nothing here is new content. Every `show:` points at something that already
exists in `55-classifier-evaluation.qmd`, so the deck distills the notes and
never invents. If a slide needs something the chapter doesn't have, flag it with
`needs:` and it goes back through `notes-author` and `proof-reader` first. Two
slides carry a `needs:` (12 and 15), both optional upgrades from a link to a
static figure.

**Independence notation.** No slide in this deck states a model for the
observations, so none writes $\stackrel{ind}{\sim}$. Slide 19's derived
distribution $S_+ - S_- \sim N\left(\mu_2 - \mu_1, 2\sigma^2\right)$ uses the bare
$\sim$ that `CONVENTIONS.md` reserves for exactly that case.

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

Equations use the bracket convention (`\log\left[\frac{t}{1 - t}\right]`, never
braces or the same bracket at two levels) and `\widehat` for `\hat`. No equation
writes terms that do not involve $k$; none is needed here.

**Timing:** 30 slides: 3 transitions (no time), 19 `core` content slides (slide 0
and 18 more) and 8 `optional`. At about 2 to 3 minutes each, 19 content slides
fits 50 minutes only because the quick ones (2, 4, 6, 7, 13, 23) take a minute or
less; the two link slides (12, 15) take longer, since the instructor works the
interactive figure live in the notes page. If time runs short, drop in this
order: 25 and 26, 19, 18, 10 and 11, 3, 22, 29, then 27 and 28.

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

## 10. Multiple classes
tag: optional
show: table — confusion-template-k-table
words: "$n_{kj}$ — true class $k$, predicted class $j$" and "Error rate: $1 - \sum_{k=1}^K n_{kk} / n$"
reveal: on arrival: the table and the $n_{kj}$ label; click 1: the error rate
say: with K classes the confusion matrix is K × K, true classes in the rows and predicted classes in the columns; the diagonal entries are the correct classifications
note: optional ("multiple classes only if time"). The error rate is the chapter's inline expression. Uses K for the class count, per `CONVENTIONS.md`.

## 11. Multiple classes, one versus rest
tag: optional
show: equation — `\text{Sensitivity}_k = \frac{n_{kk}}{\sum_{j=1}^K n_{kj}}, \qquad \text{Specificity}_k = \frac{\sum_{l \ne k} \sum_{j \ne k} n_{lj}}{\sum_{l \ne k} \sum_{j=1}^K n_{lj}}`
words: "One versus the rest: class $k$ positive, the other $K - 1$ classes together negative"
reveal: on arrival: the equation; click 1: the words line
say: collapsing to two-by-two gives class k's rates; the threshold t = 0.5 generalizes to the class with the largest posterior probability, and the two rules coincide when K = 2; other thresholds, the ROC curve and the AUC are two-class tools, so the rest of the lecture returns to two classes
note: the chapter's heading is "Multiple classes", used on slide 10; the title here is shortened to fit one line and names the "one versus the rest" idea the chapter bolds. The ROC/AUC extension to K > 2 is in a `### Beyond this course` callout and is not used.

## 12. Classification threshold
tag: core
show: link — the notes page, `55-classifier-evaluation.html#threshold-choice` (the chapter's four-checkbox rate plot: overall error rate, sensitivity, specificity and false positive rate against t from 0 to 0.5, dotted lines at t = 0.2 and t = 0.5)
words: "Interactive figure in the notes" and "Lowering $t$: sensitivity rises or stays, specificity falls or stays · no threshold improves both"
say: open the notes page and work the checkboxes live; the four rates against t for the two-feature LDA classifier; the false positive rate starts unchecked because it mirrors specificity; the error rate follows the false positive rate, nearly flat over most of the range and climbing sharply as t approaches 0; lowering t enlarges the set of features classified positive, so every observation predicted positive before still is: TP and FP can only grow, FN and TN only shrink
needs: optional. The chapter has no static export of this figure (the OJS plot is built from `threshold_rates`, which the chapter passes to the page only). If a figure in the deck is preferred to a link, `notes-author` would add a ggplot of the same four rates with a `fig` chunk name so a PNG lands in `_freeze/`. Until then this slide links.
note: the "Beyond this course" cost-minimizing threshold callout under this heading is not used. The anchor `#threshold-choice` is the chapter's own explicit heading id.

## 13. Lowering the threshold
tag: core
show: table — compare-table (LDA with balance, LDA with balance and income, logistic regression with balance and income, each at t = 0.5 and t = 0.2: TP, FN, FP, TN, error rate, sensitivity, specificity)
words: "Lower $t$: more defaulters caught, more false alarms"
say: lowering the threshold from 0.5 to 0.2 raises the two-feature LDA classifier's sensitivity from 23.1% to 56.8%, at the cost of specificity falling from 99.8% to 97.5% and the error rate rising from 2.76% to 3.84%; adding income changes LDA very little; at both thresholds logistic regression flags more customers than the two-feature LDA classifier and has the higher sensitivity and the lower specificity; the overall error rate need not be smallest at t = 0.5: LDA's training error rate is lowest near t = 0.427, at 2.61%
note: the chapter's text lives under "Classification threshold" and has no heading for the table, so the title is new. Every number in the say line is inline R in the chapter, quoted from the frozen markdown. The table is nine columns, so the slide sets it small (about 0.6em).

## 14. ROC curve
tag: core
show: equation — `c = \log\left[\frac{t}{1 - t}\right]`
words: "ROC curve: sensitivity against $1 - \text{specificity}$ at every threshold" and "Only the ordering of the observations matters"
reveal: on arrival: the first words line; click 1: the ordering line and the equation
say: at t = 1 nothing is predicted positive, the point (0, 0); at t = 0 everything is, the point (1, 1); any strictly increasing transformation of the score (the log posterior odds or p̂(x) itself) sorts the observations the same way, produces the same confusion matrices and traces the same curve; predicting positive when p̂(x) > t is predicting positive when the log posterior odds exceed c
note: the equation is the chapter's inline definition of the cutoff, set as a display; the "orders the observations" sentence is the chapter's own, cut to a line. The chapter's definition and ordering paragraphs both fall under "ROC curve".

## 15. ROC curve, threshold slider
tag: core
show: link — the notes page, `55-classifier-evaluation.html#roc-curve` (the chapter's ROC threshold slider: left panel the within-class histograms of the log posterior odds with a dotted cutoff c and the flagged bars shaded, right panel the LDA ROC curve with a moving point and the dashed diagonal)
words: "Interactive figure in the notes: slide $t$, the point moves along the curve"
say: open the notes page and drag the slider from t = 0.9 to t = 0.1; the cutoff slides left, the shaded share of the defaulters' histogram (sensitivity) and of the non-defaulters' (false positive rate) both grow, and the point climbs toward (1, 1); the dashed diagonal is a classifier that ignores the features and predicts positive at random; the LDA curve bows far toward the top-left corner
needs: optional, as slide 12. The chapter has no static export of the slider; a fixed-setting PNG (for example at t = 0.5) would be added by `notes-author` under a figure chunk name. Until then this slide links.
note: the anchor `#roc-curve` is the id quarto generates from the "### ROC curve" heading; confirm it resolves in the rendered page at build time.

## 16. ROC curves, balance + income
tag: core
show: figure — roc-figure (LDA and logistic regression ROC curves, balance and income, with the points at t = 0.5 filled and t = 0.2 open, a triangle for LDA and a square for logistic regression, dashed diagonal)
words: "Almost on top of one another, far above the diagonal"
say: lowering t from 0.5 to 0.2 moves each model's marked point up and slightly right along its curve; logistic regression's point sits further along its nearly shared curve than LDA's; the crossover discussion (the balances where the two posterior curves cross at the income quartiles, and the order reversing at a low threshold) is in the notes
note: the title is the figure's own. The crossover paragraph is inline R and text only, so it is parked.

## 17. AUC
tag: core
show: equation — `\text{AUC} = \int_0^1 \text{TPR}\; d\,\text{FPR} = \int_{-\infty}^{\infty} P(S_+ > c)\, g_-(c)\, dc = P(S_+ > S_-)`
words: "$S_+$, $S_-$ — scores of a random positive and a random negative" and "AUC = 0.5: ignores the features · AUC = 1: ranks every positive above every negative"
reveal: on arrival: the equation; click 1: the first label line; click 2: the second line
say: the area under the ROC curve summarizes the curve over all thresholds at once; the final equality conditions on S₋ = c and integrates over its density; the AUC is the probability that the classifier scores a randomly chosen positive above a randomly chosen negative; the derivation (the true positive rate P(S₊ > c) and the false positive rate P(S₋ > c) whose derivative is −g₋(c)) is in the notes
note: the display is the chapter's AUC equation, copied whole, set at about 0.8 of the slide font so the chain fits one line; the definition of $g_-$ (the density of $S_-$) is said.

## 18. Estimating the AUC
tag: optional
show: equation — `\widehat{\text{AUC}} = \frac{1}{n_+ n_-}\sum_{i:\, y_i = \text{positive}}\ \sum_{j:\, y_j = \text{negative}}\left[\mathrm{I}(s_i > s_j) + \tfrac{1}{2}\mathrm{I}(s_i = s_j)\right]`
words: "$n_+$, $n_-$ — numbers of positive and negative observations" and "Tied scores count as half a correctly ordered pair"
reveal: on arrival: the equation; click 1: both labels
say: with training data the same probability is estimated by comparing every positive observation with every negative one; this equals the area under the empirical ROC curve by the trapezoid rule, which the next table confirms
note: the chapter's heading is "AUC" (slide 17); this slide's title is new, naming the display. `\widehat{\text{AUC}}` is the chapter's own source form.

## 19. One-feature Gaussian AUC
tag: optional
show: equation — `S_+ - S_- \sim N\left(\mu_2 - \mu_1, 2\sigma^2\right)`, then `\text{AUC} = P(S_+ - S_- > 0) = \Phi\left(\frac{\Delta}{\sqrt{2}}\right), \qquad \Delta = \frac{\mu_2 - \mu_1}{\sigma}`
words: after the second equation, "$\Phi$ — standard normal CDF" and "$\Delta$ — separation of the class means in standard deviations"
reveal: on arrival: the distribution; click 1: the AUC equation; click 2: the two labels
say: under the one-feature Gaussian model of the LDA lecture the score can be taken as x itself, with class 2 positive and μ₂ > μ₁; the fitted model for balance has Δ̂ = 2.083, implying an AUC of 0.930, below the empirical 0.948, consistent with the defaulters' balances being less spread out than the shared σ̂ assumes; with each class's own standard deviation the implied AUC is 0.951, close to the empirical value
note: optional; this is the learning objective "compute the AUC implied by a one-feature Gaussian model with a shared variance". The bare $\sim$ is deliberate (a derived distribution, per `CONVENTIONS.md`). The numbers in the say line are inline R in the chapter, quoted from the frozen markdown, not retyped.

## 20. AUC of the fitted classifiers
tag: core
show: table — auc-table (LDA and logistic regression with balance alone and with balance and income, AUC by the trapezoid rule and by pairwise comparison)
words: "Two computations of the AUC agree in every row"
say: with balance alone LDA and logistic regression have identical AUCs, since both posterior probabilities are increasing functions of balance, so they order the customers identically and trace the same ROC curve; with balance and income the orderings differ slightly, and the AUCs 0.94907 and 0.94905 differ by 2.1 × 10⁻⁵; an AUC of 0.949 means that for a random defaulter and non-defaulter, LDA gives the defaulter the higher posterior probability about 95% of the time
note: the title is new (the chapter has no heading for the table). The numbers in the say line are inline R in the chapter, quoted from the frozen markdown.

## 21. Area under the ROC curve
tag: core
show: figure — auc-figure-display-1 (the shaded area under the running example's ROC curve, labeled with its AUC, dashed diagonal)
words: "AUC = 0.94907 for balance and income"
say: the left panel of the chapter's two-panel figure; the area is the sum the pairwise estimate computes
note: the chapter lays the two panels side by side in one chunk, so the freeze holds them as `auc-figure-display-1.png` and `auc-figure-display-2.png`; the deck shows one per slide (21 and 22) rather than two small images side by side. The panel's own title is "Area under the ROC curve". The AUC value is the label inside the figure and inline R in the chapter's table; quote from the frozen markdown.

## 22. ROC curves, same customers
tag: core
show: figure — auc-figure-display-2 (ROC curves of LDA with balance only, with income only, with both, and a classifier that ignores the features, each labeled with its AUC)
words: "AUC ranks classifiers without a threshold"
say: income alone barely separates the classes, its curve staying near the diagonal; the balance-only and two-feature curves nearly coincide and cross, so each has the higher true positive rate over part of the range of false positive rates, and the AUC averages over all of them: the classifier with the larger AUC can still be the worse one over the false positive rates that matter for a given application; the shares of the range and the AUCs are inline R in the chapter
note: the right panel of the two-panel figure. Move to optional if time is short.

## 23. Credit card findings
tag: core
show: none
words: three lines — "LDA and logistic regression order the customers almost identically" · "Income adds little beyond balance: AUC +0.0011" · "At $t = 0.5$ either catches a minority of defaulters: use a lower threshold"
reveal: on arrival: the first line; click 1: the second; click 2: the third
say: LDA's Gaussian assumptions fit these customers imperfectly, yet it orders them almost exactly as logistic regression does and differs mainly in flagging fewer customers at high thresholds; income's logistic regression coefficient is clearly nonzero (z = 4.17) although it adds only 0.0011 to LDA's AUC; a lender who cares about missed defaults would use a lower threshold
note: the section is one paragraph of prose with no figure or table, so the slide is words only: three compressions of the chapter's own sentences, with the two numbers inline R quoted from the frozen markdown. The deck does not draw a new table or figure for it.

## 24. Student Strata
tag: core
show: none (transition slide, title only)
words: none

---

# 14.4 Student strata

## 25. Default rate by student status
tag: optional
show: table — strata-summary-table (customers, defaulters, default rate and median income for non-students and students)
words: "Students default more often and have much lower median income"
say: 4.31% against 2.92%; the median income gap was noted in the LDA lecture; this additional analysis asks whether separate models for students and non-students classify better
note: the chapter's heading is "Student strata", used as the transition (24); the title here is new. The rates are inline R in the chapter, quoted from the frozen markdown if put on the slide.

## 26. Income and balance by student
tag: optional
show: figure — strata-data-figure (income against balance, one panel per student status, each panel over its own incomes)
words: "In both strata the defaulters sit at larger balances"
say: the students' incomes occupy a lower, narrower band, from $772 to $33,003, against $8,018 to $73,554 for non-students (inline R in the chapter; quote from the frozen markdown if put on the slide)
note: new title (the chapter has no heading); the figure's own title is "ISLR2::Default, income against balance by student status".

## 27. Boundaries within each stratum
tag: core
show: figure — strata-figure (the scatterplot by stratum with each stratum's LDA boundary, solid green, and interacted logistic regression boundary, dashed pink)
words: "LDA fit within each stratum (solid), interacted logistic regression (dashed)"
say: LDA with balance and income fit separately to non-students and students, so priors, class means and pooled covariance all differ by stratum; the logistic regression interacts the intercept and both slopes with student status, which gives the same fitted probabilities as two separate logistic regressions; each customer is scored by the model for its own stratum, and because each stratum's priors are its own default rates, the posteriors from the two strata are on one scale
note: the chapter's heading is "Student strata"; this is the section's central figure, and the title is new (the figure's own is "Boundaries fit within each student stratum", too long for one line). This is the figure that left the LDA chapter: it is the same image as `50-lda`'s `strata-figure`.

## 28. Stratified and single fits
tag: core
show: table — strata-table (LDA single fit and by stratum, logistic regression additive and interacted with student: error rate at t = 0.5 and AUC)
words: "Barely changes the classifications" and "Training rates: stratified models estimate twice as many parameters"
reveal: on arrival: the table and the first words line; click 1: the second line
say: the extra flexibility barely changes the classifications: stratifying LDA moves the training error rate from 2.76% to 2.73% and its AUC from 0.9491 to 0.9495, and interacting the logistic regression moves its error rate from 2.63% to 2.68%; the stratified models estimate 16 parameters against 8 for LDA and 6 against 3 for logistic regression, so their training error rates tend to understate test error, and their training AUCs overstate test AUC, by more; whether stratifying helps on new customers is a question for test data
note: the numbers in the say line are inline R in the chapter, quoted from the frozen markdown. The chapter's table has four rows (the QDA deck's Student strata slide has six rows of test rates; this is the training version, as the notes say).

## 29. Conclusion
tag: optional
show: none
words: the bare concept names from the chapter's `## Conclusion`, no recap sentences — Confusion matrix · Sensitivity and specificity · Threshold · ROC curve · AUC · Stratified models
note: optional; the lecture may end on slide 28 with the next lecture's preview said aloud (quadratic discriminant analysis, naive Bayes and KNN, compared on a held-out test set). The chapter's concept list is the confusion matrix, sensitivity and specificity, the threshold, the K × K matrix with one versus rest, the ROC curve, the AUC and fitting within strata with each stratum's own priors; the shorter list drops the two that are optional on the core line.

---

# Not in this deck

Cut from the lecture's core line, with their assets, so they can come back.

- **Error-minimizing threshold:** the chapter's paragraph that LDA's training
  error rate is lowest near t = 0.427, at 2.61%, against 2.76% at t = 0.5, and the
  logistic regression's near t = 0.504 (inline R, text only, no figure); slide 13's
  `say:` quotes the LDA value.
- **ROC curve, crossover discussion:** the balances where the LDA and logistic
  regression posterior curves cross at the quartiles of income and the reversal at
  t = 0.1 (inline R, text only); slide 16's `say:` points at it.
- **Student strata, thresholds and priors:** each stratum's balance threshold
  at the median income, the students' larger prior for Yes and the confounding
  explanation (text and inline R only, no figure or table). Slide 28's `say:`
  covers the parameter counts only.
- **Interacted logistic regression equals separate fits:** the sentence that
  the two give the same fitted probabilities to within 9 × 10⁻¹⁵ (inline R,
  text only); slide 27's `say:` states the equivalence without the number.
- **Beyond this course (never used):** ROC and AUC for K > 2, multinomial
  logistic regression, and the cost-minimizing threshold
  c_FP / (c_FP + c_FN).

---

# Reference: assets used by this deck

- **Figures (PNG in `_freeze/04-classification/55-classifier-evaluation/figure-html/`):**
  default-scatter-figure (slide 3, optional), fitted-boundary-figure (4),
  score-hist-figure (6), roc-figure (16), auc-figure-display-1 and
  auc-figure-display-2 (21 and 22; the two panels of one chunk),
  strata-data-figure (26, optional), strata-figure (27).
- **Tables (kable, copied from the frozen markdown):** class-summary-table (2),
  confusion-template-table (7), confusion-lda-table (8),
  confusion-template-k-table (10, optional), compare-table (13), auc-table (20),
  strata-summary-table (25, optional), strata-table (28).
- **Equations:** Sensitivity and specificity (9); the K-class sensitivity and
  specificity (11, optional); the cutoff c = log[t/(1 − t)] (14); AUC as the
  area, the integral chain (17); the AUC estimate (18, optional); the one-feature
  Gaussian AUC, S₊ − S₋ and Φ(Δ/√2) (19, optional). Refer to them by subsection
  and a few words, as above.
- **Links to the notes page:** `#threshold-choice` (12, the four-checkbox rate
  plot) and `#roc-curve` (15, the ROC slider). Neither widget has a static
  export in `_freeze/`.
- **Numbers quoted from inline R in the frozen markdown:** 77 and 333, 9,647
  and 9,667, 2.76%, 3.33%, 256, 276, 23.1%, 99.8% (slides 8 and 9); 56.8%, 97.5%,
  3.84%, 0.427, 2.61% (13); 0.94907, 0.94905, 0.949 (20, 21); 2.083, 0.930,
  0.951 (19); 0.0011, z = 4.17 (23); 4.31%, 2.92% (25); 2.73%, 0.9495, 2.63%,
  2.68%, 16 against 8, 6 against 3 (28).
- **Chunk names to confirm at build time:** the `figure-html/` directory holds
  default-scatter-figure, fitted-boundary-figure, score-hist-figure, roc-figure,
  auc-figure-display-1, auc-figure-display-2, strata-data-figure and
  strata-figure, each with a `-1.png` suffix except the two auc panels.

Not available to slides: anything inside a `### For example,` or
`### Beyond this course` callout (here, the cost-minimizing threshold and the
multi-class ROC and AUC pointer).
