# Slide outline: Method Comparison

(drafted 2026-10-28)

Outline for `70-method-comparison_slides.qmd` (Mon 2026-11-02, one 50-minute period, the capstone of the regularization chapter; ISLR2 Chapter 6 as a whole). **This file is the spec; the deck is built from it, and this file describes the deck as it stands.** Edit it freely and ask for the deck to be refreshed.

Drafted against `70-method-comparison.qmd`. The chapter is **not yet committed**, so the deck's `derived-from` comment records the repository HEAD at drafting time (`640b5d1`); replace it with the chapter's short hash (`git log -1 --format=%h -- 06-regularization/70-method-comparison.qmd`) once the chapter is committed. The deck was refreshed after the chapter's proofreading revision (headings renamed, the correlated-features row and claims removed, the cross-validation-versus-test explanation rewritten, the timing prose removed).

**What the deck is.** 18 slides including the title: the agenda, four transitions, 11 content slides and the Conclusion. The chapter is mostly empirical (8 figures reused, 3 kable tables reused, no console output) on one running example, `modeldata::ames` (log sale price, main effects only, $n = 200$ training homes, $p = 122$ candidate features, 2,725 test homes). The deck has no new content: every `show:` is a figure or table the chapter already renders, or a list cut from the chapter's own bullets.

**Timing.** The core slides come to about 26 minutes at the estimates below, with the three optional slides about 4 more; the rest of the period is a buffer for questions and for dwelling on the tabs. If time is short, drop in this order: Candidate features (say that levels with fewer than 5 training homes join the reference), Kept dummies (say that the lasso and forward stepwise selection treat each dummy on its own), Kept features.

**Not in this deck.** The chapter's cleaning figure (`cleaning-figure`, five homes above 4,000 square feet removed), the three feature-building rules as a list, the `cor-figure` under Feature correlations, the lasso convergence check (a display and its legend), the properties paragraph below the Properties table, the `### For example` and `### Beyond this course` callouts. The chosen tuning values appear in the Test evaluation table and as circles on the curves rather than on a slide of their own.

**Response variable and explanatory variables.** The response is `Sale_Price`, in dollars, modeled as its natural logarithm; the explanatory variables are the 33 numeric and 40 categorical columns of `modeldata::ames` (after the chapter's cleaning); the $p = 122$ **features** are the columns the three rules build from them (dummy variables of the common levels and the numeric variables), per `CONVENTIONS.md`.

## How to read an entry

- **tag:** core | optional | transition, with the timing in minutes
- **show:** the type (equation, figure, table, tabset, none) and the asset
- **words:** the only prose on the slide; omitted on figure and tabset slides
- **reveal:** what appears on each click
- **say:** speaker notes, never on the slide
- **note:** build and provenance details, including the chapter sentences or values the slide relies on

---

## 0. Today

- **tag:** core (0.5)
- **show:** none, a nested bulleted list in two columns
- **words:** Ames home sales (Data, Training homes, Candidate features); Training-sample fits (Six fits, Cross-validation curves, Test evaluation, Kept dummies); Repeated training samples (Method ranking, Kept features); Six methods compared (Properties, Expected settings)
- **say:** distilled from the chapter's six learning objectives; the data cleaning, the three feature-building rules, the feature correlations, the lasso convergence check and the Beyond this course callout are in the notes and not in the agenda; the next class is the review for Exam 2, then tree-based methods after the exam
- **note:** relies on the chapter's `## Ames home sales`, `## Training-sample fits`, `## Repeated training samples` and `## Six methods compared` section headings and their `###` children. Feature correlations, Properties' paragraph and the Conclusion are not agenda items.

# Ames home sales

- **tag:** transition (0)
- **show:** none (transition slide, title only)
- **say:** the earlier lectures gave five ways to control the flexibility of least squares; each used its own data; this lecture fits all six methods to one training sample and compares them
- **note:** relies on the chapter's opening paragraph under `# Method Comparison`.

## 1. Data

- **tag:** core (2)
- **show:** none, a words-only data slide (a short itemized list)
- **words:** "Question: which of the six methods predicts the sale price of a home best, and what does each give up?"; "Observation: a home"; "Response variable: `Sale_Price`, in dollars; the models use its logarithm"; "Explanatory variables: 33 numeric and 40 categorical"; then "Training sample: 200 homes, with $p = 122$ candidate features" and "Test homes: 2,725"
- **reveal:** on arrival: the first four lines; click 1: the training sample and test homes lines
- **say:** the data are the Cross-Validation in Practice lecture's, 2,930 sales from 2006 to 2010, all explanatory variables this time; the data's compiler recommends removing homes above 4,000 square feet; BsmtFin_SF_1 is dropped and Frontage_Missing added; the response is the log of the price; the training sample is small on purpose
- **note:** relies on: the chapter's `**Question.**` sentence ("which of the six methods predicts the sale price of a home best, and what does each give up?"); the inline-R counts 33 numeric, 40 categorical, 200 training homes, 2,725 test homes and $p = 122$ (quoted from the frozen markdown); and the sentence that the response is the natural logarithm of the sale price. The "Observation: a home" line is the chapter's "Each observation is a **home**."

## 2. Training homes

- **tag:** core (2)
- **show:** tabset, the chapter's own tabs: "Sale price" (`response-figure`), "Size and age" (`three-figure`)
- **words:** none
- **say:** sale price is right skewed, log price is close to symmetric and rises roughly linearly with living area, year built and basement area; the stripe at zero basement area is the homes without a basement
- **note:** relies on the chapter's `#### Sale price` and `#### Size and age` tab names and its sentences on skewness and linearity (in `say:` only). The tabset uses the new `.mid-tabs` class (`max-height: 520px`) defined in the deck's stylesheet.

## 3. Candidate features

- **tag:** optional (1)
- **show:** figure — `level-figure` (counts of the training homes with each level of each categorical variable), the figure alone
- **words:** none
- **say:** of the 283 levels, 75 occur in no training home and 68 in fewer than 5; the three rules (rare levels join the reference, one dummy per remaining level, redundant columns dropped) leave $p = 122$ for $n = 200$; no sale prices are used and the rules are applied once to the training sample
- **note:** relies on the chapter's sentence "Of the 283 levels, 75 occur in no training home and 68 in fewer than 5" and its three numbered rules (in `say:` only). First in the drop order.

# Training-sample fits

- **tag:** transition (0)
- **show:** none (transition slide, title only)
- **say:** all six methods fit to the one training sample of 200 homes; each tuning parameter chosen by 10-fold cross-validation; the chosen fits evaluated once on the 2,725 test homes
- **note:** relies on the chapter's statement of the cross-validation procedure and the test evaluation.

## 4. Six fits

- **tag:** core (3)
- **show:** a list of six methods, two with the chapter's penalized criteria
- **words:** "Least squares: all $p$ features, no tuning parameter"; "Forward stepwise selection: size $d = 0, 1, \ldots, p$"; "Ridge regression: minimize $RSS + \lambda\sum_{j=1}^p\beta_j^2$"; "The lasso: minimize $RSS + \lambda\sum_{j=1}^p\left|\beta_j\right|$"; "PCR: first $M$ principal components of the standardized features"; "PLS: first $M$ PLS directions"; then "$d$, $\lambda$ or $M$ chosen by 10-fold cross-validation" and "Standardization, forward stepwise path, components and directions recomputed in each fold"
- **reveal:** on arrival: the six lines; click 1: the two cross-validation lines
- **say:** each method is fit by a function that returns estimates for every value of its tuning parameter; features are standardized for ridge, the lasso, PCR and PLS; forward stepwise selection is tuned by cross-validation rather than BIC because sigma squared would rest on only 77 residual degrees of freedom
- **note:** the chapter's `### Six fits` bullet list compressed to one line each (a re-layout, not new content); the two criteria are the chapter's, with the same notation. Relies on the chapter's sentences that each tuning parameter is chosen by 10-fold cross-validation with the standardization, forward stepwise path, principal components and PLS directions recomputed from the training folds in each fold. The set of chosen values is on slides 5 and 6.

## 5. Cross-validation curves

- **tag:** core (4)
- **show:** tabset, the chapter's own tabs: "Forward stepwise" (`forward-cv-figure`), "Ridge and lasso" (`penalty-cv-figure`), "PCR and PLS" (`direction-cv-figure`)
- **words:** none
- **say:** each method's 10-fold cross-validation estimate against its tuning parameter, least squares dashed and each chosen value circled; every curve falls well below least squares; forward stepwise selection chooses d = 18 with a flat curve (within 5% at 11 sizes between 13 and 24); ridge chooses lambda = 100.0 and the lasso 2.51, on different scales; PLS chooses M = 3 and PCR M = 62 with a flat curve (within 5% at 12 values of M between 46 and 66)
- **note:** relies on the chapter's three tab names and the bullets under it (values in `say:` only, quoted from the frozen markdown). The tabset uses `.mid-tabs`; at the earlier `.tall-tabs` (560 px) the figures' captions collided with the footer.

## 6. Test evaluation

- **tag:** core (3)
- **show:** table — the chapter's `test_table` (tuning, number of nonzero estimates, 10-fold CV estimate and test MSE of the six methods), copied from the frozen markdown
- **words:** none
- **say:** on this training sample the lasso has the smallest test MSE, then ridge, PLS, PCR, forward stepwise selection and least squares; a test MSE of 0.0228 is about a 16% error in price; the cross-validation estimates of the tuned methods are 0.70 to 0.86 of the test MSE and least squares' is 1.09: refit to 180 homes least squares' test MSE rises from 0.0462 to 0.0590 (residual degrees of freedom 77 to 57) while the tuned methods' rises only 1.0% to 8.5%, so the tuned estimates are low from selecting the smallest and from one sample's noise
- **note:** the table is copied verbatim from `result.markdown`; the tuning column is where the chosen $d$, $\lambda$ and $M$ are shown. Relies on the chapter's ordering sentence ("the lasso has the smallest test MSE ... followed in order by ridge regression, PLS, PCR, forward stepwise selection, and least squares") and the 16% sentence (both in `say:` only).

## 7. Kept dummies

- **tag:** optional (1.5)
- **show:** none, a short list
- **words:** "Lasso keeps 57 of the 122 features, forward stepwise selection 18"; "Neighborhood dummies: 15; the lasso keeps 8, forward stepwise selection 3"; "Some but not all dummies of a variable kept: lasso 15 variables, forward stepwise selection 4"; "Ridge regression, PCR and PLS: every dummy nonzero"; then "A dropped dummy merges its level into the reference, `North_Ames` for `Neighborhood`"
- **reveal:** on arrival: the first four lines; click 1: the last line
- **say:** neither method treats the dummies of one categorical variable as a group; a dropped dummy merges its level into the reference, as in the Subset Selection lecture; a group lasso that keeps or drops all dummies together is in the notes' Beyond this course callout and is not taught
- **note:** the chapter's `### Kept dummies` paragraph cut to lines. Relies on the chapter's inline-R values 57, 122, 18, 15, 8, 3, 15, 4 and `North_Ames` (quoted from the frozen markdown) and on its last sentence "Ridge regression, PCR, and PLS give every dummy a nonzero estimate." Second in the drop order.

# Repeated training samples

- **tag:** transition (0)
- **show:** none (transition slide, title only)
- **say:** the ranking belongs to one training sample; 200 training samples of 200 homes are drawn from the remaining 1,725 test homes, features rebuilt, every method tuned by 10-fold cross-validation, and each chosen fit predicts the 1,000 prediction homes
- **note:** relies on the chapter's description of the repeated-samples design under `## Repeated training samples`.

## 8. Method ranking

- **tag:** core (4)
- **show:** tabset: "Relative to the best" (`rep-figure`, test MSE of each method other than least squares relative to the best of the six, violins) and "Summary" (the chapter's `rep_table`, copied from the frozen markdown)
- **words:** none
- **say:** PLS, the lasso, ridge and PCR win 108, 52, 39 and 1 of the 200 samples; ridge and the lasso stay within about 2% of PLS and beat it in about a third of the samples; every other method beats least squares in 99.5% to 100.0% of the samples, and forward stepwise selection has a larger test MSE than ridge, the lasso and PLS in 98.0% to 99.5% of them and than PCR in 87%; the single training sample ranked the lasso first and PLS third, so one sample cannot rank methods whose test MSEs are this close, but the large differences appear in nearly every sample
- **note:** the figure is the chapter's violin plot; the table is copied verbatim. **The tab names are not chapter headings** ("Relative to the best" is the figure's axis label, "Summary" is the chapter's word for the table, "The table summarizes the 200 samples"). Relies on the chapter's sentences giving the win counts, the 2.3% and 1.6% figures, 99.5% to 100.0% and 98.0% to 99.5% and 87%, and "The single training sample above ranked the lasso first and PLS third" (all in `say:` only). The Test MSE slide of One training sample (slide 6) is the one to flip back to.

## 9. Kept features

- **tag:** optional (1.5)
- **show:** figure — `kept-figure` (violins of the number of candidate features, the number kept by forward stepwise selection and the number of nonzero lasso estimates), the figure alone
- **words:** none
- **say:** the rules give 122 to 143 candidate features per sample; forward stepwise selection keeps a median of 13 and the lasso 49.5; the lasso keeps more in 99.5% of the samples; both numbers vary widely from sample to sample
- **note:** relies on the chapter's `### Kept features` paragraph (values in `say:` only, quoted from the frozen markdown). Third in the drop order.

# Six methods compared

- **tag:** transition (0)
- **show:** none (transition slide, title only)
- **say:** the table collects what the earlier lectures showed; the expected settings are reasoning from those lectures, not results
- **note:** relies on the chapter's sentence "The table collects what the earlier lectures showed about each method."

## 10. Properties

- **tag:** core (3)
- **show:** table — the chapter's `properties_table` (seven properties by six methods), copied from the frozen markdown and set at 0.55em
- **words:** none
- **say:** the methods differ most in what they do to the estimates: forward stepwise selection a hard threshold, the lasso a soft threshold, ridge shrinks every estimate and drops none, PCR and PLS select directions and not features
- **note:** the table is copied verbatim from `result.markdown`; the 0.55em wrapper (`::: {style="font-size: 0.55em"}`) is needed to fit seven columns. The chapter's paragraph below the table is in `say:` only.

## 11. Expected settings

- **tag:** core (3)
- **show:** none, the chapter's five bullets compressed to one line each
- **words:** "**Least squares**: $n$ large relative to $p$"; "**Forward stepwise selection and the lasso**: a few features carry the signal, the rest are noise"; "**Ridge regression**: many features with small effects of similar size"; "**PCR**: response related to the directions in which the features vary most"; "**PLS**: response related to directions that are not the leading principal components"; then "Expectations from reasoning, not results: one dataset does not establish them"
- **reveal:** on arrival: the five lines; click 1: the last line
- **say:** the reason for each, from the earlier lectures (sigma squared (p + 1)/n small when n is large; dropping a noise feature removes variance and adds no bias; ridge is the lasso lecture's contrasting expectation; PCR, like ridge, favors the directions of most variance; PLS reaches non-leading directions with fewer directions at a cost in variance); that PLS won most often here, by a few percent, is a finding about these homes and this training sample size, not evidence for or against the expectation for PLS
- **note:** the chapter's `### Expected settings` bullets compressed, and its sentence "These are expectations from reasoning, not results" shortened to the last line. The last line is the chapter's lesson and is in the Conclusion. Relies on all five bullets and that sentence.

## 12. Conclusion

- **tag:** core (1)
- **show:** none, a flat list of six takeaways
- **words:** "The methods differ in what they do to the estimates"; "Only forward stepwise selection and the lasso select features"; "Cross-validate $d$, $\lambda$ or $M$, recomputing the fit's data-dependent steps in each fold"; "A cross-validation estimate can miss the test MSE in either direction"; "One training sample ranks the methods for that sample only"; "One dataset cannot establish the expected settings"
- **say:** the chapter's Conclusion; the next class is the review for Exam 2, and Exam 2 follows it; after the exam the course moves to tree-based methods and random forests (ISLR2 Chapter 8)
- **note:** distilled from the chapter's `## Conclusion` (one line per paragraph's main result); no example numbers. Relies on the Conclusion's sentences on what each method does to the estimates, "Only subset selection and the lasso select features", the cross-validation recomputation sentence, the sentence that a cross-validation estimate can miss its test error in either direction, "The test MSEs of one training sample rank the methods for that sample only" and "One dataset cannot establish these expectations." The deck says "forward stepwise selection" where the chapter's Conclusion says "subset selection".
