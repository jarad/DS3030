# Slide outline: Cross-Validation in Practice

Outline for `15-cv-in-practice_slides.qmd` (Fri 2026-10-16, one 50-minute
period, MWF 1:10-2:00). **This file is the spec; the deck is built from it, and
this file describes the deck as it stands.** Edit it freely: reorder, cut,
reword, change `tag:`, add notes. When it says what you want, ask for the deck
to be refreshed and `slides-author` will implement exactly these slides.

Drafted 2026-10-15 against `15-cv-in-practice.qmd`, which is **not yet
committed**, so the deck's `derived-from` comment records `uncommitted` in place
of a hash; replace it with the chapter's short hash (`git log -1 --format=%h --
05-resampling/15-cv-in-practice.qmd`) once the chapter is committed. The frozen
output `_freeze/05-resampling/15-cv-in-practice/execute-results/html.json` is
current: its recorded `hash` (see `execute-results/html.json`; it changes with every re-render) equals the md5
of the chapter file as it stands, which includes the "Slides for this lecture"
link on the line after `# Cross-Validation in Practice`.

**Where this deck sits in the period.** The lecture first finishes the
Classification slides of the cross-validation deck (`10-cross-validation_slides`),
then runs this deck for about 10 minutes, and the rest of the period is a
small-group activity (`15-cv-in-practice_activity.R`). The deck is sized for
that: 14 slides including the title, two transitions and the closing slide, of
which 9 core content slides and 1 optional come to about 10 to 11 minutes.

The chapter's `##` sections are Ames home sales, Candidate models, Selection
optimism, Test data workflow, Activity and Conclusion. It has 12 figures, no
table and no console output, on one running example (`modeldata::ames`, the sale
price of 2,930 homes in Ames, Iowa). **The deck spends slides on a subset of
it.** The core line is: the data and the question (Ames home sales); the
candidate models (KNN regressions that differ in the number of explanatory
variables $q$ and the number of neighbors $K$, 240 in all); the optimism of the
cross-validation minimum, first for one training sample of 200 homes and then
over 300 repeated samples (the violin plot); the four-step workflow that keeps
test data out of every choice, with the training, validation and test roles of
the data; the cross-validation curves on the training homes, the one test
evaluation; the warning about choosing again with the test data; and the
activity. The deck does **not** cover the chapter's `Noisy minimum` subsection
(the equation $\text{CV}_s = \text{MSE}^{\text{test}}_s + e_s$ and the
two-candidate derivation, both of which would be explanation), the
`Candidate cross-validation` subsection's code, the extra tabs, or the
`### Beyond this course` callout; those are parked under "Not in this deck"
below. Mapped onto the chapter's four learning objectives:

1. why the smallest cross-validation estimate is optimistic, and how that
   changes with the number of candidates, noise and correlation: slides 5, 6
   (the dependence on noise and correlation is in slide 6's `say:`; the
   derivation is parked);
2. the workflow that keeps test data out of every choice: slides 8, 9, 10;
3. classify the data at each step as training, validation or test data: slides
   8, 9, 10;
4. why test data used to choose no longer give an honest estimate: slide 10.

Optional: Nested KNN candidates (slide 3) and the Conclusion (12). If time is
still short, drop in this order: Nested KNN candidates (3; say the 240
candidates over the Candidate models tabs), then Choosing (9; say the choice
over Workflow steps), then the extra tabs of Ames home sales (leave it on
Living area). Two transition slides (4, 7), no live widget, no code slide and
no console slide: the chapter prints no console output.

Nothing here is new content. Every `show:` points at something that already
exists in `15-cv-in-practice.qmd`, so the deck distills the notes and never
invents. If a slide needs something the chapter doesn't have, flag it with
`needs:` and it goes back through `notes-author` and `proof-reader` first. No
slide in this outline needs one; two slides lay out the chapter's own sentences
or numbers in a form the chapter does not have (10's three-line list and
11's four-line list); both are marked with a `note:`. Slide 11 uses the
response variable name `Remote`, which appears in the activity script and not in
the chapter's text (flagged).

**Response variable and explanatory variables.** For `modeldata::ames` (slide 1)
the response variable is `Sale_Price`, analyzed as $\log_{10}$ of the price in
dollars; the explanatory variables are, in this order, `Gr_Liv_Area`,
`Year_Built`, `Total_Bsmt_SF`, `Garage_Area`, `Longitude` and `Latitude`: all
in the speaker notes, not on the slide. The deck uses "explanatory variables"
for raw columns and "features" only for the columns that enter the model, per
`CONVENTIONS.md`. For `modeldata::stackoverflow` (slide 11) the response
variable is `Remote`.

**Symbols,** per `CONVENTIONS.md` and the chapter: $q$ is the number of
explanatory variables used (always the first $q$ in the order listed, a
tuning parameter); uppercase $K$ is the number of neighbors; $S = 240$ is the
number of candidate models; $x_0$ is the home being predicted;
$\mathcal{N}_{q,K}(x_0)$ is its set of $K$ nearest training homes; $y_i$ is the
$\log_{10}$ price of training home $i$. Lowercase $k$, the number of folds,
appears only in speaker notes. The one equation is copied from the chapter's
source with `\widehat` for `\hat`.

## How to read an entry

```
## N. Slide title                       <- reuse the chapter's own heading when there is one
tag: core | optional                    <- optional = first to drop if time is short
show: <type> — <asset>                  <- what is on the slide (types below)
words: "a short label, 0-1 lines"       <- the only prose on the slide; omitted on figure and tabset slides
reveal: <what appears on each click>    <- optional; omit when everything shows at once
say: what you plan to say aloud         <- speaker notes, never on the slide
note: build and provenance details      <- not on the slide, not spoken
needs: ...                              <- only if something is missing from the chapter
```

`reveal:` lists the clicks in order, as "on arrival: ...; click 1: ...; click 2: ...".
Each click is one `{.fragment}` block in the deck. Use it on slides that stack
several equations or lines, so the content appears as it is discussed. Figures,
tabsets and code slides carry no fragments.

`show:` types: `equation` (copied from the chapter's source; `\widehat` for
`\hat` in slides), `figure` (the named chunk's PNG from `_freeze/`), `table`
(the named kable chunk, copied from the frozen markdown), `tabset` (several
figures on ONE slide as a `.panel-tabset`, one tab per figure; the tab labels
are the chapter's own tab names), `code` (a chunk's source, shown as a plain
code block), `console` (a chunk's printed R output, verbatim), `link` (a pointer
back to the notes page, for anything that cannot be a static image), `none` (a
words-only slide). A slide may combine two `show:` items, for example an equation
beside a figure. `words:` is the only prose on a slide and never uses a
middle-dot separator: several short claims are an itemized list (one idea per
bullet) or a table. **A figure or tabset slide carries the figure alone, full
width, and no `words:` line; the facts that were bullet lines go to the start of
`say:`.** The exceptions are slides where the list is itself the content (the
algorithm's steps, a symbol legend).

Slides never draw from a `### For example,` or `### Beyond this course`
callout.

Equations use the bracket convention (`E[\cdot]` and `Var[\cdot]` always square,
other nested groupings cycling `()`, `[]`, `{}`) and `\widehat` for `\hat`.

**Timing:** 14 slides including the title slide (slides 0 to 12 plus the title
slide): 2 transitions (no time), 9 `core` content slides and 2 `optional`. At the
estimates below the core slides come to about 10 minutes. The estimates, in
minutes: 0 (0.5), 1 (1), 2 (1), 5 (1.5), 6 (2), 8 (1.5), 9 (1), 10 (1), 11 (1),
and 3 (1, optional); the optional Conclusion adds about 0.5 minute. The slowest
are Repeated samples (6) and One training sample (5). If the lecture is running
behind at the start of this deck, the drop order above frees about 2 minutes.

---

## 0. Today
tag: core
show: none, a nested bulleted list
words: agenda as a nested outline: Candidate models; Selection optimism, with One training sample and Repeated samples nested beneath it; Test data workflow, with Workflow steps, Choosing and Final evaluation nested beneath it; Activity
say: distilled from the chapter's four learning objectives and the slides this deck spends time on: the smallest cross-validation estimate among many candidates is optimistic; a workflow keeps test data out of every choice; the roles of training, validation and test data; test data used to choose lose their honesty; the chapter's Noisy minimum derivation and the Beyond this course callout are in the notes and not in the agenda; one running example, predicting the sale price of homes in Ames, Iowa, and the question is which model should make the predictions; Candidate models covers the data and the models, with no transition slide of its own; the lecture then hands over to the group activity; the timing note in the speaker notes: the Conclusion is optional, and if time is short drop in this order Nested KNN candidates (say the 240 candidates over the Candidate models tabs), Choosing (say the choice over Workflow steps)
note: the notes chapter's learning objectives are the source; the chapter has no "Today" section. The DS3030 title slide carries the chapter title. The chapter's Ames home sales and Candidate models sections are one top-level item, "Candidate models" (the data and the models), so the closing slide has one takeaway for them; neither has a transition slide. Selection optimism and Test data workflow each have one (4, 7). Activity has no transition: its content slide is its own title. Only what the deck spends slides on is listed.

## 1. Ames home sales
tag: core
show: tabset — the chapter's three-tab data figures with its own tab names, full width: "Living area" (ames-living-figure), "Six explanatory variables" (ames-six-figure), "Location" (ames-map-figure)
words: none
say: data: modeldata::ames, 2,930 home sales in Ames, Iowa, from 2006 to 2010; the question is how accurately the sale price of a home can be predicted from its size, age and location, and which model should make the predictions; the response variable is Sale_Price, analyzed as log10 of the price in dollars, because prices are right-skewed and an error on the log10 scale is a relative error, so a $20,000 miss counts more on a $100,000 home than on a $400,000 one; the explanatory variables are, in this order, above-ground living area (Gr_Liv_Area), year built (Year_Built), basement area (Total_Bsmt_SF), garage area (Garage_Area), Longitude and Latitude; the tabs plot the sale price against living area, against each of the six explanatory variables, and on a map; on the log scale price rises roughly linearly with living area, with a few exceptions: 5 homes have more than 4,000 square feet, and some of them sold for far less than the trend; newer homes and homes with larger basements and garages also sell for more; the vertical stripe at zero basement area is the homes without a basement; on the map the most expensive homes are in the north of the city and the least expensive in its center and east, so nearby homes sell for similar prices
note: the chapter's own three-tab set with its tab names (`#### Living area`, `#### Six explanatory variables`, `#### Location`); the tabset alone, no fragments, no bullet list of variables (they are in `say:`). The 2,930, 2006, 2010 and the 5 are inline R in the chapter, quoted from the frozen markdown. The title is the chapter's section title. If time is short, leave the tabset on Living area.

## 2. Candidate models
tag: core
show: tabset — the chapter's four-tab figures with its own tab names, full width: "Training sample" (sample-figure), "+ K = 1" (knn-k1-figure), "+ K = 15" (knn-k15-figure), "+ K = 40" (knn-k40-figure)
words: none
say: a training sample of 200 homes, drawn at random from the 2,930, will be used to choose a model; the first tab shows it (black) against the other 2,730 homes (grey); the other tabs add KNN fits that use living area only, with K = 1, 15 and 40 neighbors; the training homes cover most of the range of living area but miss the largest homes; with K = 1 the fit jumps from one training home's price to the next; with K = 15 and K = 40 it follows the trend more smoothly; all three fits are flat beyond the largest training home, at the geometric mean price (the average on the log10 scale) of its nearest neighbors; the candidates differ in two tuning parameters: how many of the six explanatory variables they use, q, and how many neighbors, K; the features are the q explanatory variables, each standardized with the mean and standard deviation of the training homes, so standardization is part of the fit
note: the chapter's own four-tab set (`#### Training sample`, `#### + K = 1`, `#### + K = 15`, `#### + K = 40`); no fragments. The 200 and 2,730 are inline R in the chapter. The section title is the chapter's.

## 3. Nested KNN candidates
tag: optional
show: equation — `\widehat f_{q,K}(x_0) = \frac{1}{K}\sum_{i \in \mathcal{N}_{q,K}(x_0)} y_i`
words: after the equation, an itemized list of four labels: "y_i — log10 price of training home i", "q — number of explanatory variables used", "N_{q,K}(x_0) — the K training homes closest to x_0", "K — number of neighbors"; then "S = 240 candidate models: q = 1, ..., 6 and K = 1, ..., 40"
reveal: on arrival: the equation; click 1: the four labels; click 2: the 240 line
say: first in the drop order (say the 240 candidates over the Candidate models tabs); for a home with explanatory variables x_0, the KNN regression averages the response of its K nearest training homes; the first q explanatory variables, in the order listed, are used, so q = 1 is living area alone and q = 6 adds year built, basement area, garage area, longitude and latitude; the features are those q explanatory variables, standardized with the training homes' means and standard deviations; with K = 1, ..., 40 and q = 1, ..., 6 there are S = 240 candidate models; the order of the explanatory variables was fixed before looking at the data; ordering them by their correlation with price in the data at hand would be another data-dependent step, and would have to be repeated inside every fold; the ten-fold cross-validation estimate is computed for all 240 candidates at once, with standardization inside the folds; q and K are then chosen by comparing the 240 estimates
note: the display is the chapter's, verbatim, with `\widehat` for `\hat`; the labels are the chapter's bullets, cut. The 240 is inline R in the chapter (`S`); the chapter's "$K = 1, \ldots, 40$ and $q = 1, \ldots, 6$" is inline R. The chapter's second subsection, Candidate cross-validation, is code and a sentence and is not shown (parked).

---

# Selection optimism

## 4. Selection optimism
tag: core
show: none (transition slide, title only)
words: none
say: cross-validation estimates the error of one model with little bias; the question is what happens to the smallest of 240 estimates

## 5. One training sample
tag: core
show: tabset — the chapter's two-tab figures with its own tab names, full width: "Cross-validation" (one-cv-figure), "+ Other homes" (one-both-figure)
words: none
say: the first tab plots the 10-fold cross-validation estimate of every candidate against the flexibility 1/K, one panel per q; the point marks the smallest estimate; the remaining 2,730 homes were never used to fit or to choose, so they are test data for this sample, and the second tab adds each candidate's MSE on them; cross-validation chooses q = 5 and K = 4, with an estimated MSE of 0.00841; fit to the same 200 homes, that model's MSE on the other homes is 0.00854, 1.5% above its cross-validation estimate; the candidate with the smallest MSE on the other homes is q = 4, K = 9, at 0.00780; in every panel the two curves have similar shapes, and many candidates are close to the best: 31 of the 240 are within 5% of the smallest cross-validation estimate; in this sample the cross-validation estimate is above the MSE on the other homes for 97% of the candidates; the minimum falls where the cross-validation curve dips toward the other curve
note: the chapter's own two-tab set (`#### Cross-validation`, `#### + Other homes`), under the chapter's `### One training sample` heading; no fragments. Every number is inline R in the chapter, quoted from the frozen markdown. The chapter's `### Noisy minimum` subsection (the equation and the two-candidate derivation) is parked; the dependence on noise, correlation and the number of near-tied candidates is in slide 6's `say:`.

## 6. Repeated samples
tag: core
show: figure — optimism-figure (the violin plot, with quartile lines, of the gap between the chosen model's cross-validation estimate and its test MSE, as a percentage of the test MSE, for the three procedures over 300 training samples of 200 homes; the figure carries its own legend line), the figure alone
words: none
say: the facts the figure shows: 300 training samples of 200 homes, 10-fold cross-validation in each; three procedures: the rule of thumb, one candidate fixed in advance (all six explanatory variables with K = 15, the smallest odd integer above the square root of 200), so nothing is chosen; the best K, the smallest estimate among the 40 values of K with all six explanatory variables; the best K and q, the smallest estimate among all 240 candidates; each chosen model's cross-validation estimate was compared with its MSE on the other 2,730 homes; a negative gap means the estimate was too optimistic; for the rule of thumb the estimate averages 3.5% above the test MSE (simulation standard error 1.5 percentage points) and falls below it in 53% of samples; the best of 40 values of K averages 2.9% below, and the best of all 240 candidates 7.5% below (standard error 1.4 percentage points), below the test MSE in 70% of samples; the more candidates the minimum is taken over, the more optimistic it is; the choosing also gains something real: the average test MSE of the model chosen from all 240 candidates is 0.00811, against 0.00874 for the rule of thumb; cross-validation chooses good models, its minimum overstates how good the chosen model is; on these data the optimism is modest; by the two-candidate calculation in the notes (Noisy minimum), it grows with the noise in the estimates, which is larger for smaller training samples, and with the number of near-tied candidates, and it shrinks as the estimates become more correlated, vanishing when they are perfectly correlated
note: the figure is the chapter's `optimism-figure`, already a violin plot with quartile lines, the median line and the mean diamond; no boxplot to flag. The numbers are inline R in the chapter, quoted from the frozen markdown. The chapter's `### Repeated samples` bullets defining the three procedures are not on the slide: the figure's x-axis labels name them, and `say:` defines them. The slowest slide of the deck (2 minutes).

---

# Test data workflow

## 7. Test data workflow
tag: core
show: none (transition slide, title only)
words: none
say: in practice there is one data set, not a population to resample from; the remedy for the optimism is to keep some data out of the choosing entirely

## 8. Workflow steps
tag: core
show: figure and list — final-split-figure (the 2,930 homes split at random into 2,344 training homes, blue circles, and 586 test homes, orange triangles; left, 48% width) with the chapter's four steps beside it (right, 52% width)
words: an itemized (numbered) list of four steps beside the figure, compressed: "Split off test data first"; "Choose by cross-validation on the training data" with the nested lines "Standardize inside each fold" and "Held-out folds are validation sets"; "Refit the chosen model to all the training data"; "Evaluate it once on the test data"
say: the figure splits the 2,930 homes at random into 2,344 training homes (blue circles) and 586 test homes (orange triangles), 20% of the total; the two sets overlap over the bulk of the data; of the 5 homes with more than 4,000 square feet, 2 are in the test set; the simulation shows that the data used to choose a model cannot also give an honest estimate of its error; step 1: split off test data first, at random, before any plotting, fitting or choosing; step 2: standardization is part of the fit and is repeated inside each fold using only the training folds (computed inside the KNN function); q and K are then chosen by comparing the cross-validation estimates on the training data only, and the smallest estimate tends to be optimistic; the held-out folds are validation sets; step 3: refit the chosen model to all the training data; step 4: evaluate it once on the test data, and report that test MSE as the estimate of its error on new homes; the three roles of the data: training data fit the model, validation data (the held-out folds) choose among models, test data evaluate the chosen model once
note: the chapter shows the figure in `### Workflow steps`'s section lead-in (`## Test data workflow`) and states the four steps under `### Workflow steps`; the slide merges them (figure beside the steps) to save a slide, as the cross-validation deck does on Validation set algorithm. The list is compressed from the chapter's four numbered steps; the two nested lines are step 2's own sentences (every data-dependent step repeated inside the folds, "The held-out folds are validation sets"), cut. The three-role sentence in `say:` is the chapter's Conclusion, paraphrased; it has no slide of its own. The numbers (2,930, 2,344, 586, 20%, 5, 2) are inline R in the chapter. Static, no fragments.

## 9. Choosing
tag: core
show: figure — final-cv-figure (the 10-fold cross-validation estimate of each of the 240 candidates on the 2,344 training homes, one panel per q, the triangle marking the minimum), full width
words: none
say: the figure plots the 10-fold cross-validation estimate of each of the 240 candidates on the 2,344 training homes; the curves are smoother than for the sample of 200; each curve rises steeply toward K = 1; the smallest estimate in each panel is 0.0152, 0.0080, 0.0064, 0.0063, 0.0058 and 0.0057 for q = 1 through 6: year built gives by far the largest improvement and basement area the next largest, while the last three explanatory variables lower it only slightly; cross-validation chooses q = 6 and K = 9, with an estimated MSE of 0.00567; the held-out folds are validation sets, and no test home was used
note: the figure is the chapter's `final-cv-figure`, alone; the numbers are inline R in the chapter, quoted from the frozen markdown. Second in the drop order (say the choice over Workflow steps). The title is the chapter's `### Choosing`.

## 10. Final evaluation
tag: core
show: none, a short itemized list
words: three lines: "Chosen model: q = 6, K = 9", "Cross-validation estimate: 0.00567", "Test MSE, evaluated once: 0.00641"; then, on a click, "Choose again with the test data and they become validation data"
reveal: on arrival: the three lines; click 1: the closing line
say: refit to all 2,344 training homes and used once on the 586 test homes, the chosen model has a test MSE of 0.00641, against its cross-validation estimate of 0.00567; on the dollar scale the root mean squared error of 0.080 on the log10 scale means a root-mean-squared prediction error of a factor of 10^0.080 = 1.20, too high or too low; the test MSE is 13% above the cross-validation estimate; part of the difference comes from the 2 test homes with more than 4,000 square feet, which sold for $755,000 and $745,000 and were predicted at $446,000 and $446,000, the geometric mean price (the average on the log10 scale) of the nearest training homes; without them the test MSE is 0.00626; the gap is smaller than the standard error of the test MSE (0.00137, 21% of the test MSE), so it is consistent with the variability of an MSE computed from 586 homes, and selection optimism is at most a modest part (about 7.5% at 200 homes in the simulation, smaller at 2,344); the test MSE is the number to report: no choice was made with the test homes, so the selection optimism does not affect it; the test data can be used only once: if the test MSE were used to choose again, for example by going back to try another q after seeing it, the test homes would become one more validation set, and the reported error would be the minimum over the choices tried, with the same optimism as the minimum of the cross-validation curve
note: **not a figure or table the chapter has**: the three lines are the chapter's own inline numbers (the chosen q and K, the cross-validation estimate and the test MSE) laid out as a list, and the closing line is the chapter's last paragraph cut to its claim (a re-layout, not new content). The numbers are inline R in the chapter, quoted from the frozen markdown. The warning is the closing line; the chapter's `### Beyond this course` callout (one-standard-error rule, nested cross-validation) is never used.

## 11. Activity
tag: core
show: none, a short itemized list
words: four lines: "`modeldata::stackoverflow`, 5,594 developers", "Response variable: `Remote`", "Question: Which developers work remotely?", "Script: `15-cv-in-practice_activity.R`"
say: in small groups, work through 15-cv-in-practice_activity.R (the download link is on the notes page) in RStudio; it uses modeldata::stackoverflow, responses from 5,594 developers to Stack Overflow's annual Developer Survey, to ask which developers work remotely; your group computes the error rate of always predicting "Not remote," splits off test data, compares logistic regression, LDA and KNN with several values of K by 10-fold cross-validation on the training data, chooses one, and evaluates it once on the test data; most of the code is provided; the discussion questions at the end of the script are the point of the activity
note: the chapter's `## Activity` paragraph is the source; the 5,594 is inline R in the chapter, quoted from the frozen markdown. The chapter's text does not name the response variable: **`Remote` comes from the activity script (the data dictionary at the top of `15-cv-in-practice_activity.R`) and from the instructor's request, not from the chapter** (flagged). The steps of the activity are `say:` only.

## 12. Conclusion
tag: optional
show: none, a nested bulleted list that mirrors slide 0 item for item, with a takeaway phrase under each item
words: Candidate models, with "Cross-validation estimates a model fixed in advance with little bias"; Selection optimism, with One training sample ("The winning estimate is the one that fell lowest by chance") and Repeated samples ("More near-tied, noisy candidates make the minimum more optimistic") nested beneath it; Test data workflow, with Workflow steps ("Test data first; choose using the training data only"), Choosing ("Choose by cross-validation on training data only") and Final evaluation ("Evaluate once; the test error is what you report") nested beneath it; Activity, with "Apply the whole workflow to new data"
say: optional; the lecture may end on Activity with the group work and then show this slide when the groups report back; the next lecture begins Chapter 6, linear model selection and regularization, with subset selection
note: the structure and order are slide 0's; each takeaway is a short phrase drawn from the chapter's `## Conclusion` paragraphs, with no restated example numbers. The Activity takeaway is drawn from the chapter's Activity paragraph (the group applies the workflow to new data), since the Conclusion has none for it (flagged). The "Selection optimism" and "Test data workflow" items have no takeaway of their own; their nested items carry them.

---

# Not in this deck

Cut from the lecture's core line, with their assets and original content, so
they can come back.

## Parked content

- **Noisy minimum** (the chapter's `### Noisy minimum`): the display
  $\text{CV}_s = \text{MSE}^{\text{test}}_s + e_s$ with its three symbol
  bullets, the selected candidate $\hat s$ and $\text{CV}_{\hat s} = \min_s
  \text{CV}_s$, and the two-candidate calculation $E[\min(e_1, e_2)] =
  -\tau\sqrt{(1 - \rho)/\pi}$. It would come back as an optional equation slide
  between One training sample and Repeated samples. Its conclusion (optimism
  grows with $\tau$ and the number of near-tied candidates, shrinks with the
  correlation $\rho$) is in Repeated samples' `say:`.
- **Candidate cross-validation** (the chapter's `### Candidate cross-validation`
  and its `cv-function` chunk, `predict_candidates()` and `cv_mse()`): code, not
  shown. The point (standardization happens inside the folds; $q$ and $K$ are chosen
  afterward by comparing the estimates) is in Nested KNN candidates' `say:`.
- **Chapter code callouts** (`### Code`): not shown; the deck never shows a
  chunk's source.
- **`### Beyond this course` (never used):** the one-standard-error rule and
  nested cross-validation, the callout at the end of the Test data workflow
  section.

---

# Reference: assets used by this deck

- **Figures (PNG in `_freeze/05-resampling/15-cv-in-practice/figure-html/`, each
  with a `-1.png` suffix):** ames-living-figure, ames-six-figure, ames-map-figure
  (the three tabs of slide 1), sample-figure, knn-k1-figure, knn-k15-figure,
  knn-k40-figure (the four tabs of slide 2), one-cv-figure, one-both-figure (the
  two tabs of slide 5), optimism-figure (6), final-split-figure (8),
  final-cv-figure (9). That is all 12 of the 12 chunk figures in the freeze
  directory.
- **Tables (kable, copied from the frozen markdown):** none; the chapter has no
  kable.
- **Console output (frozen markdown):** none; the chapter prints no console
  output, and the deck has no code slide.
- **Equations on slides:** the KNN regression $\widehat f_{q,K}(x_0)$ (3).
  **Parked:** $\text{CV}_s = \text{MSE}^{\text{test}}_s + e_s$ and the
  $E[\min(e_1, e_2)]$ display. Every equation that mentions `\hat` is written
  with `\widehat` in the deck.
- **Numbers quoted from inline R in the frozen markdown (never retyped or
  recomputed). On slides:** 240 (3); 0.00567 and 0.00641 (10); $q = 6$,
  $K = 9$ (10); 5,594 (11). **In speaker notes only:** 2,930 homes, 2006 to
  2010, 5 homes over 4,000 square feet (1); 200, 2,730 (2); $q = 5$, $K = 4$,
  0.00841, 0.00854, 1.5% above, $q = 4$, $K = 9$, 0.00780, 97% (5); 300 samples,
  $K = 15$, 3.5% above (1.5), 53%, 2.9% below, 7.5% below (1.4), 70%, 0.00811,
  0.00874 (6); 2,344, 586, 20%, 2 of the 5 homes in the test set (8); 0.0152,
  0.0080, 0.0064, 0.0063, 0.0058, 0.0057 (9); 0.080, 1.20, 13%, 2 test homes,
  $755,000 and $745,000, $446,000, 0.00626 (10).
- **Chunk names to confirm at build time:** the freeze directory's `figure-html/`
  holds the 12 PNGs (each with a `-1.png` suffix), all used; the notes' tab names
  are "Living area / Six explanatory variables / Location" (slide 1), "Training
  sample / + K = 1 / + K = 15 / + K = 40" (slide 2) and "Cross-validation /
  + Other homes" (slide 5); `result.markdown` has no table block and no
  `cell-output-stdout` or `cell-output-stderr` blocks.

Not available to slides: anything inside a `### For example,` or
`### Beyond this course` callout (here, the one-standard-error rule and nested
cross-validation callout at the end of the Test data workflow section; the
chapter has no `### For example,` callout).
