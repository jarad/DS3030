# Slide outline: Subset Selection

(revised 2026-10-17; Likelihood criteria added as slide 18)

Outline for `10-subset-selection_slides.qmd` (Mon 2026-10-19, one 50-minute
period, MWF 1:10-2:00; the first lecture of ISLR2 Chapter 6). **This file is the
spec; the deck is built from it, and this file describes the deck as it stands.**
Edit it freely: reorder, cut, reword, change `tag:`, add notes. When it says what
you want, ask for the deck to be refreshed and `slides-author` will implement
exactly these slides.

Drafted 2026-10-17 and revised 2026-10-17 against `10-subset-selection.qmd`, which is **not yet
committed**, so the deck's `derived-from` comment records `uncommitted` in place
of a hash; replace it with the chapter's short hash (`git log -1 --format=%h --
06-regularization/10-subset-selection.qmd`) once the chapter is committed. The
frozen output `_freeze/06-regularization/10-subset-selection/execute-results/html.json`
is current: its recorded `hash` (it changes with every re-render) equals the md5
of the chapter file as it stands (re-rendered after the revision that added the
Training MSE figure, the noise simulation and the objective-driven wording), which
includes the "Slides for this lecture" link on the line after `# Subset Selection`.

**Where this deck sits in the period.** The whole 50-minute period is this deck.
It is sized for that: 27 slides including the title, four transitions and the
closing slide, of which 18 core slides (the agenda and 17 content slides) come to
about 41.5 minutes at the estimates below, and 4 optional slides come to about 6.5
more, leaving the rest of the period as a buffer for questions and for the tabs
the instructor wants to dwell on. The Training MSE slide (15) was added in the
2026-10-17 revision as optional, since adding it as core would take the core line
past 40 minutes. The Likelihood criteria slide (18) was added afterward as core, at
the instructor's request, and does take the core line past the 40-minute budget
(see the timing paragraph below).

The chapter's `##` sections are Used car prices, Best subset selection, Stepwise
selection, Model size, Selected model and Conclusion. It is about 1,000 lines,
most of it collapsed code, with 18 figures, 2 kable tables and no console output
(the two chunks that call `regsubsets()` print nothing), on one running example
(`modeldata::car_prices`, 804 used General Motors cars from 2005). **The deck
spends slides on a subset of it.** The core line is: the data, the log price scale
and the 14 candidate features (Used car prices); the best subset algorithm, its
fits for sizes 1 to 4 and the features in each best model, the training RSS that
falls at every size, and the cost of $2^p$ fits (Best subset selection); forward
and backward stepwise selection and the table where a stepwise path misses the
best pair (Stepwise selection); the three penalized criteria, the likelihood forms of the AIC and BIC,
the within-fold cross-validation of the model size and the figure that compares the sizes they
choose (Model size; the training MSE figure that opens the section is an optional
slide); and the coefficient table, the dropped-dummy reference make and the
noise-simulation figure for optimistic inference (Selected model). The deck does **not** cover the
chapter's `Selection motives` variance display, the `Training error optimism`
derivation (only its result is an optional slide), the adjusted $R^2$
$F > 1$ aside, the log price versus mileage figure, the correlation heat map,
the `### Beyond this course` callout; those are parked
under "Not in this deck" below. Mapped onto the chapter's five learning
objectives:

1. define best subset, forward and backward stepwise, compare their cost, explain
   why stepwise paths need not contain the best model of each size: slides 6, 9,
   11, 12, 13;
2. why the training RSS and $R^2$ cannot choose the size $d$: slides 8 (the
   figure and the monotone RSS are its `say:`) and 15 (optional: the training MSE
   falls below $\widehat\sigma^2$);
3. the $2(d+1)\sigma^2$ optimism of the training RSS (the derivation is parked;
   slide 16 shows only its result, optional), why $C_p$ estimates the error on new
   responses at the observed feature values (in slide 17's `say:`), the $C_p$,
   BIC and adjusted $R^2$ penalties, and the likelihood forms of the AIC and BIC
   (which make AIC and $C_p$ choose the same size for Gaussian least squares, in
   slide 18's `say:`): slides 16, 17, 18;
4. cross-validation of the model size with the selection inside each fold, and
   how its choice compares with the criteria's, which estimate a different error
   (in slide 20's `say:`): slides 19, 20;
5. interpreting the coefficients of the selected model, the dropped dummy
   variable's effect on the reference level, and why the standard errors and
   $p$-values are optimistic: slides 22, 23, 24.

Optional: Selection motives (slide 4), Training MSE (15), Training error optimism
(16) and the Conclusion (25); Computational cost (9) is core but fourth in the drop
order. If time is short, drop in this order: Training MSE (15; say over Model size
that the training MSE falls below $\widehat\sigma^2$ and so cannot choose the
size), Training error optimism (16; say that the training RSS underestimates the
new-response error by $2(d+1)\sigma^2$ over Penalized criteria), Selection motives
(4; open the lecture with the question aloud), Computational cost (9; say the
$2^p$ over Algorithm and compare it with 106 on Forward stepwise), then the extra
tabs of Used car prices (leave it on Mileage) and of Fitting (stop at 3 features).
Four transition slides (5, 10, 14, 21), no live widget, no code slide and no console slide: the chapter
prints no console output.

Nothing here is new content. Every `show:` points at something that already
exists in `10-subset-selection.qmd`, so the deck distills the notes and never
invents. If a slide needs something the chapter doesn't have, flag it with
`needs:` and it goes back through `notes-author` and `proof-reader` first. No
slide in this outline needs one. Two slides lay out the chapter's own words in a
form the chapter does not have (3's three lines and 19's three lines); each is
marked with a `note:`. The chapter shows its Candidate features
subsection before Price scale; slide 3 follows Price scale instead, so that the
response variable it names is already $\log(\texttt{Price})$ (flagged in its
`note:`).

**Response variable and explanatory variables.** For `modeldata::car_prices`
(slide 3, a words-only slide that follows the data figures) the response variable
is $\log(\texttt{Price})$ (`Price` in dollars, analyzed on the natural-log scale);
the explanatory variables are `Mileage`, `Cylinder`, `Doors`, `Cruise`, `Sound`,
`Leather`, make and body style. The 14 candidate **features** are `Mileage`,
`Cylinder`, `Cruise`, `Sound`, `Leather`, the make indicators `Buick`,
`Cadillac`, `Chevy`, `Pontiac`, `Saab`, and the body style indicators
`convertible`, `coupe`, `hatchback`, `sedan`; `Doors` is dropped because it is an
exact linear combination of the body style indicators, and `Saturn` and `wagon`
are the reference levels. The deck uses "explanatory variables" for the raw
columns and "features" for the columns that enter the model, per
`CONVENTIONS.md`.

**Symbols,** per `CONVENTIONS.md` and the chapter: $p = 14$ is the number of
candidate features; $d$ the number of features in a model, its size; $n = 804$;
$\mathcal{M}_d$ the best model of size $d$; $RSS$, $TSS$; $\widehat\sigma^2$ the
error variance estimate from the model with all $p$ features. The equations are
copied from the chapter's source with `\widehat` for `\hat`; the chapter's
three-criteria display is split into three one-line displays.

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

**Timing:** 27 slides including the title slide (slides 0 to 25 plus the title
slide): 4 transitions (no time), 18 `core` slides (the agenda and 17 content
slides) and 4 `optional`. At the estimates below the core slides come to about
41.5 minutes. The estimates, in minutes: 0 (0.5), 1 (2.5), 2 (2), 3 (1.5), 6 (2),
7 (4), 8 (2.5), 9 (1.5), 11 (2), 12 (1.5), 13 (3), 17 (4), 18 (1.5), 19 (3),
20 (4), 22 (3), 23 (2), 24 (1); the optional slides add 4 (1.5), 15 (1.5), 16 (3)
and 25 (0.5), about 6.5 minutes. **Likelihood criteria (18) adds about 1.5 minutes
of core time, taking the core line from about 40 minutes to about 41.5, which is
1.5 minutes past the 40-minute budget.** The whole deck still fits the 50-minute
period (about 48 minutes with every optional slide), but with about 2 minutes of
buffer instead of 3.5. To bring the core line back to 40 minutes, make
Computational cost (9, 1.5 minutes) optional: it is the first core slide in the
drop order (fourth overall, after the three optional slides), and its point (the
count doubles with each feature) can be said over Algorithm. The tag stays `core`
until the instructor decides. The slowest are Fitting (7, the five tabs), Penalized
criteria (17, three equations and their penalties) and Chosen sizes (20, where the
four choices are compared). If the lecture is running behind, the drop order above
frees about 9 minutes.

---

## 0. Today
tag: core
show: none, a nested bulleted list
words: agenda as a nested outline: Used car prices; Best subset selection, with Algorithm, Fitting, Training RSS and Computational cost nested beneath it; Stepwise selection, with Forward stepwise, Backward stepwise and Path comparison nested beneath it; Model size, with Penalized criteria, Likelihood criteria, Within-fold cross-validation and Chosen sizes nested beneath it; Selected model, with Coefficients and Optimistic inference nested beneath it
say: distilled from the chapter's five learning objectives and the slides this deck spends time on: best subset and stepwise selection and their cost; why the training RSS and R^2 cannot choose the size d; Cp, BIC and adjusted R^2, the likelihood forms of AIC and BIC, and the cross-validation of the model size with the selection inside each fold; interpreting the selected model and why its standard errors and p-values are optimistic; the Training MSE figure, the Training error optimism derivation, the Selection motives, the correlation figure and the Beyond this course callout are in the notes and not in the agenda; one running example, the price of used General Motors cars, and the question is which of the recorded explanatory variables a model of price should use; Used car prices covers the data and the 14 candidate features, with no transition slide of its own; the other four parts each have one; the timing note in the speaker notes: the Conclusion is optional, and if time is short drop in this order Training MSE, Training error optimism, Selection motives, Computational cost
note: the notes chapter's learning objectives are the source; the chapter has no "Today" section. The DS3030 title slide carries the chapter title. Used car prices (the data, the price scale and the candidate features) is one top-level item, so the closing slide has one takeaway for it; it has no transition slide. Best subset selection, Stepwise selection, Model size and Selected model each have one (5, 10, 14, 21). The optional slides (Selection motives, Training MSE, Training error optimism) are not listed. Only what the deck spends slides on is listed. Reference make (23) belongs to Coefficients. Layout: the list is set in two columns (Used car prices through Stepwise selection on the left, Model size and Selected model on the right), since 18 lines do not fit one column at the deck's font size.

## 1. Used car prices
tag: core
show: tabset — the chapter's three-tab data figures with its own tab names, full width: "Mileage" (mileage-figure), "Make and body style" (group-figure), "Engine and options" (option-figure)
words: none
say: data: modeldata::car_prices, 804 used General Motors cars for sale in 2005; the question is which of the recorded explanatory variables a model of a used car's price should use; the response is the price in dollars and the explanatory variables are the mileage, the number of cylinders, the number of doors, indicators of cruise control, an upgraded sound system and leather seats, the make and the body style (the next slides put the variables in the form the models use); the tabs plot price against mileage, one panel per make, against make and body style, and against each of the other explanatory variables; within every make price falls with mileage; make matters more: every Cadillac costs more than every Saturn, and Saab prices sit well above those of Chevrolets and Pontiacs; convertibles cost the most of the body styles; cars with more cylinders or with cruise control tend to cost more; doors and leather seats make little difference to the median price on their own: $17,631 with two doors against $18,073 with four, and $17,895 without leather against $18,126 with it; cars with an upgraded sound system have a lower median price than cars without one, $17,161 against $20,648; Chevrolets, the most common make and one of the cheapest, have one 82.8% of the time; prices spread more widely where they are higher: the Cadillac panel spans a far wider range of dollars than the Saturn panel; the violins carry quartile lines and the median
note: the chapter's own three-tab set (`#### Mileage`, `#### Make and body style`, `#### Engine and options`), under the chapter's `### Data` heading; the slide title is the chapter's `## Used car prices`, since the three tabs together are the data. The 804, the median prices (two and four doors, without and with leather, with and without the upgraded sound system) and the 82.8% are inline R in the chapter, quoted from the frozen markdown, and are in `say:` only. The two group figures are already violin plots with quartile lines; no boxplot to flag. If time is short, leave the tabset on Mileage.

## 2. Price scale
tag: core
show: tabset — the chapter's two-tab residual figures with its own tab names, full width: "Dollars" (residual-dollars-figure), "Log scale" (residual-log-figure)
words: none
say: the tabs plot the residuals against the fitted values of the largest model, fit by least squares once with price in dollars as the response and once with its natural logarithm; in dollars the residuals fan out as the fitted price rises: the correlation between the absolute residual and the fitted value is 0.56; on the log scale it is 0.11, close to the constant variance the model assumes; errors of similar size on the log scale are errors of similar percentage in price, which matches prices that vary by a few thousand dollars for a Saturn and by many thousands for a Cadillac; from here on the response is the logarithm of price; the largest model explains 92.9% of the variability in log price, with an error standard deviation estimate of 0.1103
note: the chapter's own two-tab set (`#### Dollars`, `#### Log scale`) under `### Price scale`. The 0.56, 0.11, 92.9% and 0.1103 are inline R in the chapter, quoted from the frozen markdown. Neither figure is a boxplot.

## 3. Candidate features
tag: core
show: none, a words-only data slide (a short itemized list)
words: "Response variable: $\log(\texttt{Price})$"; "Explanatory variables: `Mileage`, `Cylinder`, `Doors`, `Cruise`, `Sound`, `Leather`, make, body style"; then "Features, $p = 14$: `Mileage`, `Cylinder`, `Cruise`, `Sound`, `Leather`, `Buick`, `Cadillac`, `Chevy`, `Pontiac`, `Saab`, `convertible`, `coupe`, `hatchback`, `sedan`"; then "Reference levels: `Saturn`, `wagon`"
reveal: on arrival: the response variable and the explanatory variables; click 1: the features line; click 2: the reference levels line
say: the response variable is the natural logarithm of the price, as the previous slide decided; the explanatory variables are the raw columns the data record: mileage, cylinders, doors, cruise control, sound system, leather seats, the make and the body style; the features are the columns that enter the model: the first five explanatory variables enter as recorded, with Cylinder treated as a number (4, 6 or 8); make and body style are categorical explanatory variables whose indicator columns are complete sets (every car has exactly one make and one body style, so the six make indicators sum to the intercept column), so each needs a reference level whose indicator is left out: Saturn for make and wagon for body style; Doors is dropped because every convertible and coupe has two doors and every other car four, so with the body style indicators in the model Doors would be an exact linear combination of other columns; that leaves p = 14 candidate features, and the largest model is y_i = beta_0 + beta_1 x_i1 + ... + beta_p x_ip + epsilon_i with epsilon_i independent N(0, sigma^2), where y_i is the log price of car i, i = 1, ..., n with n = 804, x_ij is the value of feature j for car i and the beta_j are the coefficients; a subset of the features is a smaller model of the same form with the coefficients of the other features set to zero
note: the chapter's `### Candidate features` subsection and the response from `### Price scale`, laid out as a list (a re-layout, not new content). **The chapter shows Candidate features before Price scale; the deck puts this slide after it so the response variable it names is already $\log(\texttt{Price})$** (flagged). The chapter's model equation and its symbol bullets are in `say:` and parked below (the algorithm and the criteria slides need only $p$, $d$ and $n$). The 14 and the 804 are inline R in the chapter, quoted from the frozen markdown; the feature order is the chapter's (`and_list(features)`). Words-only, so the variables may be listed on the slide.

## 4. Selection motives
tag: optional
show: none, a short itemized list of three labels
words: "Interpretability"; "Variance"; "Search: $2^p$ candidate models"
say: the largest model fits well (R^2 of 92.9% for log price), so why use fewer features? interpretability: a model with fewer features is easier to explain, and each coefficient that is truly zero but estimated anyway adds noise to the story the model tells; variance: least squares fitted values are y-hat = H y with H = X (X^T X)^{-1} X^T, so Var[y-hat] = sigma^2 H, and its trace is sigma^2 (d + 1) for a model with d features and an intercept, so the average variance of the fitted values is sigma^2 (d + 1) / n; every feature added raises it by sigma^2 / n whether or not its true coefficient is zero, and lowers the bias only if its coefficient is not zero; with n = 804 and p = 14 the cost is small here, and it grows as p approaches n; search: each feature is either in or out, so there are 2^p candidate models, 2^14 = 16,384 for these cars
note: the chapter's `### Selection motives` bullet headings (bold terms) laid out as three labels; the variance display and its trace argument are in `say:` only and parked below. The 16,384 is in `say:` and inline R in the chapter, quoted from the frozen markdown. Optional: third in the drop order (open with the question aloud).

---

# Best subset selection

## 5. Best subset selection
tag: core
show: none (transition slide, title only)
words: none
say: the first of the three algorithms for choosing which features to keep: fit every subset

## 6. Algorithm
tag: core
show: none, a numbered list of the chapter's three steps, compressed
words: three numbered steps: "$\mathcal{M}_0$: the null model, no features"; "For $d = 1, \ldots, p$: fit all $\binom{p}{d}$ models with $d$ features; $\mathcal{M}_d$ is the one with the smallest RSS"; "Choose among $\mathcal{M}_0, \ldots, \mathcal{M}_p$ by $C_p$, BIC, adjusted $R^2$, or cross-validation"
say: best subset selection fits every subset; step 1: the null model predicts the mean of the response for every car; step 2: for each size d, all binomial(p, d) models with exactly d features are fit by least squares, and M_d, the best model of size d, is the one with the smallest RSS, equivalently the largest R^2; step 2 compares models of the same size, and for them the training RSS is a fair comparison, since each has the same number of coefficients to fit with; step 3 compares models of different sizes, which is where training error fails, so it uses an estimate of the error on new data: Cp, BIC, adjusted R^2 or cross-validation; RSS_d is the residual sum of squares of M_d; the number of models fit is the sum over d of binomial(p, d), which is 2^p
note: the chapter's `### Algorithm` list, compressed to fragments; no fragments (a three-step algorithm shown at once, as the cross-validation deck does).

## 7. Fitting
tag: core
show: tabset — the chapter's four-tab fit figures with its own tab names, then one more tab, full width: "1 feature" (fitted1-figure), "2 features" (fitted2-figure), "3 features" (fitted3-figure), "4 features" (fitted4-figure), "Features by size" (best-which-figure)
words: none
say: leaps::regsubsets() carries out step 2; its argument nvmax is the largest size to search; the plot is log price (on a dollar axis) against mileage, one panel per make, with the fitted values (crosses) of the best model of each size added; within a make the cars form bands at different price levels, cars that differ in engine size and in other unrecorded ways, and within a band price falls with mileage; the best single feature is Cylinder, which gives one fitted level per engine size and leaves Saabs, all four-cylinder cars, far below their prices; the best pair adds Saab, which lifts every Saab; the best triple adds Cadillac; and only at size 4 does Mileage enter, tilting each band downward; the last tab shows the features in the best model of every size (rows are features in order of entry, columns the model size d); on these data the best models are nested: each contains the best model one size smaller; nothing in the algorithm requires that, since each size is searched separately
note: the chapter's own four-tab set (`#### 1 feature` to `#### 4 features`) under `### Fitting`, plus the chapter's `best-which-figure` as a fifth tab named "Features by size" (the chapter shows it just after the tabs, without its own heading; the tab name is the only wording the deck adds). No fragments. The chapter's `log-base-figure` (log price against mileage, the background of every tab) is not a slide of its own. Slowest slide of the deck (4 minutes). If time is short, stop at the 3 features tab.

## 8. Training RSS
tag: core
show: figure — rss-figure (the training RSS of all 16,384 subsets against their size, the best of each size joined by a black line, with $R^2$ on the right axis), the figure alone
words: none
say: the figure plots the training RSS of all 16,384 subsets against their size, with the best of each size, RSS_d, joined by the black line; R^2 = 1 - RSS/TSS is a decreasing function of RSS, so the right axis reads off the same points as R^2; RSS_d falls at every step, from RSS_0 = TSS = 135.06 to 89.11 at d = 1 and 9.60 at d = 14; it cannot do otherwise: adding any feature to M_d gives a model of size d + 1 whose least squares fit can match M_d by setting the new coefficient to zero, so RSS_{d+1} is at most RSS_d; the training RSS and R^2 therefore always choose d = p; this is the argument the cross-validation lecture made for polynomial degree: training error rewards every addition, whether or not it will help predict new cars
note: the chapter's `rss-figure` under `### Training RSS`, alone. The 16,384, 135.06, 89.11 and 9.60 are inline R in the chapter, quoted from the frozen markdown.

## 9. Computational cost
tag: core
show: none, a short itemized list
words: "$2^p$ least squares fits"; "$2^{14} = 16{,}384$ for these cars"; "$2^{20}$ is about a million"; "$2^{30}$ about a billion"; "$2^{40}$ about a trillion"
say: the 16,384 least squares fits above take a few seconds; the count doubles with each candidate feature; the size of the search has a statistical cost too: the previous lecture showed that the smallest of many noisy estimates tends to be optimistic, and the more subsets searched, the more likely one of them fits the noise in these particular cars well; this motivates the cheaper searches that follow
note: the chapter's `### Computational cost` paragraph, its numbers laid out as a list (a re-layout, not new content). The 16,384 is inline R in the chapter, quoted from the frozen markdown; the million, billion and trillion are the chapter's own words. Fourth in the drop order (say the 2^p over Algorithm; the comparison with 106 is repeated on Forward stepwise, 11).

---

# Stepwise selection

## 10. Stepwise selection
tag: core
show: none (transition slide, title only)
words: none
say: two cheaper searches that build one nested path of models by adding or removing a single feature at a time

## 11. Forward stepwise
tag: core
show: list and equation — the chapter's three steps, compressed, then the display of the number of models fit
words: three numbered steps: "$\mathcal{M}_0$: the null model"; "For $d = 0, \ldots, p - 1$: add the one feature to $\mathcal{M}_d$ with the smallest RSS to get $\mathcal{M}_{d+1}$"; "Choose among $\mathcal{M}_0, \ldots, \mathcal{M}_p$ as in best subset selection"; then the display $1 + \sum_{d=0}^{p-1}(p - d) = 1 + \frac{p(p+1)}{2}$ with the line "106 models for $p = 14$, against 16,384 for best subset selection"
reveal: on arrival: the three steps; click 1: the display and the 106 line
say: forward stepwise selection grows one model; at each step it fits the p - d models that add one feature to M_d and keeps the one with the smallest RSS; the number of models fit is 1 + p(p + 1)/2, which is 106 for p = 14, against 16,384 for best subset selection; forward stepwise needs only d < n for each model it fits, so it can be used when p is at least n, stopping at size n - 1
note: the chapter's `### Forward stepwise` list and display, verbatim with the steps compressed; the 106 and 16,384 are inline R in the chapter, quoted from the frozen markdown.

## 12. Backward stepwise
tag: core
show: list — the chapter's three steps, compressed, then the definition of greedy
words: three numbered steps: "$\mathcal{M}_p$: the model with all $p$ features"; "For $d = p, \ldots, 1$: remove the one feature from $\mathcal{M}_d$ that leaves the smallest RSS to get $\mathcal{M}_{d-1}$"; "Choose among $\mathcal{M}_0, \ldots, \mathcal{M}_p$ as before"; then "Greedy: forward never removes a feature it has added, backward never restores one it has removed"
reveal: on arrival: the three steps; click 1: the greedy line
say: backward stepwise selection shrinks one model; it fits the same 1 + p(p + 1)/2 models, but it starts from the full least squares fit, so it needs n > p; both methods are greedy: forward never removes a feature it has added, and backward never restores one it has removed, so their models are nested by construction; the best model of size d need not contain the best model of size d - 1, and when it does not, a stepwise path misses it
note: the chapter's `### Backward stepwise` list and the closing paragraph of that subsection (the definition of greedy), compressed. No equation.

## 13. Path comparison
tag: core
show: table — example-table-display (kable: the first three models of best subset, forward and backward selection in one half of the cars where they differ, with each model's training RSS; copied from the frozen markdown), the table alone
words: none
say: on all 804 cars the three methods give identical models at every size, because the best models happen to be nested; that is a property of these data, not of the methods; to see how often the paths differ, the three methods were run on 200 random halves of the cars; forward stepwise differs from best subset at one or more sizes in 72.5% of the halves, and backward stepwise in 72.5%; the table shows the first three models of each method in one half where they differ, with each model's training RSS on that half; in this half Cadillac alone has a slightly smaller RSS than any other single feature, so forward stepwise keeps it, and its best pair, Cadillac + Saab, has RSS 27.51, against 14.51 for the best pair, Cylinder + Saab, which does not contain the best single feature; backward stepwise reaches the best pair from above and then keeps Cylinder at size 1; on all the cars the single-feature models are close too: Cylinder alone has RSS 89.11 and Cadillac alone 89.62; forward stepwise misses the best pair in 45.5% of the halves
note: the table is the chapter's `example-table-display` (the kable in `half-samples`), copied verbatim from the frozen markdown; no caption on the chapter's table, none added. The 200, 72.5%, 72.5%, 27.51, 14.51, 89.11, 89.62 and 45.5% are inline R in the chapter, quoted from the frozen markdown; the table's RSS values are the chunk's own output. The correlation heat map that the chapter shows at the head of Stepwise selection is parked.

---

# Model size

## 14. Model size
tag: core
show: none (transition slide, title only)
words: none
say: all three methods leave the same decision: which of M_0, ..., M_p to use; all 804 cars are training data, none held out, as they are in the test data workflow of the Cross-Validation in Practice lecture, so every estimate of error below comes from the same cars that choose the model; there are two ways to estimate the error on new data: adjust the training error for the size of the model, or estimate the error directly by cross-validation

## 15. Training MSE
tag: optional
show: figure — train-mse-figure (the training MSE, $RSS_d/n$, of the best model of each size for $d = 6$ to $14$, with a dashed line at $\widehat\sigma^2$), the figure alone
words: none
say: the figure plots the training MSE, RSS_d/n, of the best model of each size from d = 6 to 14, with a dashed line at the estimate of the error variance sigma^2 from the largest model, sigma-hat^2 = RSS_p/(n - p - 1) = 0.01216; the training MSE is below sigma-hat^2 from d = 10 on, and equals 0.01193 at d = 14; a new car's log price varies about its mean with variance sigma^2, so no model's average squared error on new responses can be below sigma^2; the training MSE of the larger models is below an estimate of it; the training error cannot choose the size; optional: first in the drop order (the Training RSS slide already makes the point that training error cannot choose the size)
note: the chapter's `train-mse-figure` that opens `## Model size`, alone. **Added in the 2026-10-17 revision.** The 0.01216, 10 and 0.01193 are inline R in the chapter, quoted from the frozen markdown, and are in `say:` only; the 0.01216 and the d = 6 to 14 range are also visible in the figure. Optional because adding it as core would have brought the core line past 40 minutes (about 41.5 at the time; with Likelihood criteria (18) added as core, the core line is already about 41.5, so Training MSE as core would make it about 43). The chapter's lift of the training MSE for the largest model (0.00045, from 0.01193 to 0.01239) is in slide 16's `say:`.

## 16. Training error optimism
tag: optional
show: equation — the chapter's last display of the subsection, with a three-line symbol legend
words: after the display, an itemized list of three labels: "$y_i^0$ — new response at $x_i$", "$\mathbf{H}$ — hat matrix", "$d$ — number of features"
reveal: on arrival: the display; click 1: the three labels
say: second in the drop order; fix a least squares model with d features, and imagine new responses y_i^0 at the same feature values x_i, independent of y with the same distribution; the training residual is smaller than the error on a new response because y-hat_i was fit to y_i: the covariance of y_i and y-hat_i is h_ii sigma^2 (the derivation is in the notes), and summing over i gives the display; the training RSS underestimates the error on new responses at the same x_i by 2(d + 1) sigma^2 on average, an amount that grows with the size of the model; for the largest model of the Training MSE figure, 2(p + 1) sigma-hat^2 / n = 0.00045 lifts the training MSE of 0.01193 to 0.01239, above sigma-hat^2
note: the display is the chapter's final display of `### Training error optimism`, verbatim with `\widehat` for `\hat`; the three labels are the chapter's `where` clause, cut. The derivation (the two earlier displays and the covariance step) is parked and in `say:` by reference only. Optional, so the closing slide and the agenda do not list it. The objective's wording is "derive the $2(d+1)\sigma^2$ optimism of the training RSS"; the derivation is parked and this slide shows its result. The 0.00045 and 0.01239 are inline R in the chapter and are in `say:` only.

## 17. Penalized criteria
tag: core
show: equation — the chapter's three criteria, one display each, with a symbol legend
words: after the three displays, an itemized list of four labels and the rule: "$RSS$ — training residual sum of squares", "$d$ — number of features", "$\widehat\sigma^2$ — error variance estimate from the model with all $p$ features", "$TSS$ — total sum of squares"; "Choose the smallest $C_p$ or BIC, the largest adjusted $R^2$"
reveal: on arrival: the $C_p$ display; click 1: the BIC display; click 2: the adjusted $R^2$ display; click 3: the four labels and the rule
say: adding the optimism back gives Cp, BIC and adjusted R^2; sigma-hat^2 comes from the model with all p features, the same for every size, which keeps the larger models from estimating their own (smaller) error variance; the subscript p in Cp is Mallows' historical name, not the number of features; Cp is RSS/n plus the optimism divided by n, with 2d in place of 2(d + 1), and the difference, 2 sigma-hat^2 / n, is the same at every size and does not change which size wins; if sigma-hat^2 is unbiased for sigma^2, then for a model fixed in advance E[Cp] + 2 sigma^2/n = E[(1/n) sum_i (y_i^0 - y-hat_i)^2]: up to the constant 2 sigma^2/n, Cp estimates the average error on new responses at the observed feature values x_1, ..., x_n; going from M_d to M_{d+1} lowers Cp if the drop in RSS divided by sigma-hat^2 exceeds 2 and lowers the BIC if it exceeds log(n) = 6.69; so the BIC penalizes each feature more than Cp and tends to choose smaller models; adjusted R^2, with the error variance of the larger model in the denominator, penalizes least; on the cars, with sigma-hat^2 = 0.01216, Cp chooses d = 12, the BIC d = 10 and adjusted R^2 d = 14; the derivation holds for a model fixed in advance, but M_d was chosen as the best of binomial(p, d) fits, so all three criteria share some of the selection optimism of the previous lecture
note: the three criteria are the chapter's single display, verbatim with `\widehat` for `\hat`, split into three one-line displays so each fits and each can be revealed alone (a re-layout of one display); the up-to-a-constant statement of what $C_p$ estimates is in `say:` only, with no label on the slide. The legend is the chapter's `where` bullets, cut. The AIC and BIC likelihood paragraph is slide 18; the adjusted $R^2$ $F > 1$ aside is parked. The 6.69, 0.01216, 12, 10 and 14 are inline R in the chapter, quoted from the frozen markdown (the chosen sizes are on slide 20's figure).

## 18. Likelihood criteria
tag: core
show: equation — the chapter's maximized log-likelihood and its AIC and BIC display, with a two-line symbol legend
words: the display $\log L = -\frac{n}{2}\log\left(2\pi\widehat\sigma^2\right) - \frac{RSS}{2\widehat\sigma^2}$, then the display $\text{AIC} = -2\log L + 2(d + 1), \qquad \text{BIC} = -2\log L + \log(n)(d + 1)$, then an itemized list of two labels: "$L$ — maximized likelihood under $\epsilon_i \stackrel{ind}{\sim} N\left(0, \sigma^2\right)$ with $\sigma^2$ fixed at $\widehat\sigma^2$", "$d + 1$ — coefficients, including the intercept"
reveal: on arrival: the $\log L$ display; click 1: the AIC and BIC display; click 2: the two labels
say: multiplying by sigma-hat^2/n and dropping the terms that do not depend on d, among them the intercept's share of each penalty (2 sigma-hat^2/n in the AIC), leaves Cp and the BIC of the previous slide, so for least squares with Gaussian errors AIC and Cp choose the same size; the likelihood forms apply to any model fit by maximum likelihood, for example the logistic and Poisson regressions of the earlier lectures, where there is no RSS
note: **Added after the 2026-10-17 revision, at the instructor's request** (the instructor has told students about the likelihood forms). The two displays and the two labels are from the chapter's paragraph beginning "The **AIC** and **BIC** come from the likelihood" under `### Penalized criteria`, with `\widehat` for `\hat`; the chapter writes the second term as `RSS/\left(2\hat\sigma^2\right)` inline, and the slide sets it as `\frac{RSS}{2\widehat\sigma^2}` in display style (the same quantity, as the instructor specified), and the chapter's inline log-likelihood is promoted to its own display. The sentence that begins "Multiplying by" is in `say:` only, as is the statement about maximum likelihood models (the logistic and Poisson regressions are the earlier lectures' models, named in `say:` only). Both displays are set at 0.75em and the legend at 0.6em, as on slide 17. No numbers quoted from inline R. Listed in the agenda and the closing slide ("For Gaussian least squares, AIC and $C_p$ choose the same size", the chapter's own Conclusion phrase "$C_p$ (equivalent to AIC for Gaussian least squares)").

## 19. Within-fold cross-validation
tag: core
show: none, a short itemized list
words: three lines: "Best subset search inside each fold, from the training folds only"; "Predict the held-out fold with the best model of each size"; "$\text{CV}_{(k)}(d)$ estimates the test MSE of the procedure 'fit the best model of size $d$'"
say: cross-validation estimates the test error of each size directly; the cross-validation lecture's rule applies: every data-dependent step of the fit is repeated inside each fold, using only the training folds; here step 2 of best subset selection is a data-dependent step; within fold l, the best model of each size is found from the training folds and then used to predict the validation fold, the held-out fold l; cross-validation estimates the error of each size on new cars directly; running best subset selection once on all 804 cars and cross-validating only the coefficients would let the held-out cars help choose the features that predict them; CV_(k)(d), the k-fold estimate with k = 10, estimates the test MSE of the procedure "fit the best model of size d", not of one fixed set of features: the best model of a size can differ from fold to fold; in these folds the best model of a size differs from the one found on all the cars in 7.1% of the fold-and-size combinations, at sizes 1, 4 and 7; cross-validation chooses d = 13, with CV_(10) = 0.01233
note: **not a figure or table the chapter has**: the three lines are the chapter's own sentences of `### Within-fold cross-validation` laid out as a list and cut (a re-layout, not new content); the code (`predict_subset()`, `cv_by_size()`) is not shown. The 804, 10, 7.1%, sizes 1, 4 and 7, 13 and 0.01233 are inline R in the chapter, quoted from the frozen markdown, and are in `say:` only.

## 20. Chosen sizes
tag: core
show: tabset — the chapter's three-tab figures with its own tab names, full width: "All sizes" (mse-all-figure), "Sizes 6 to 14" (mse-zoom-figure), "Adjusted $R^2$" (adj-figure)
words: none
say: the first tab plots Cp, the BIC and the 10-fold cross-validation estimate against size, the second zooms in on sizes 6 to 14, and the third plots adjusted R^2; a large symbol marks the size each criterion chooses; all four curves fall steeply over the first few sizes and then flatten: from d = 10 on, the cross-validation estimate is within 1% of its minimum; they disagree about where in the flat stretch to stop: the BIC chooses d = 10, Cp d = 12, adjusted R^2 d = 14 and cross-validation d = 13; as the penalties predict, the BIC chooses the smallest model and adjusted R^2 the largest; Cp and the cross-validation estimate are within 1% of each other at every size from d = 8 on, while the BIC, with its larger penalty, lies above both and rises after its minimum; Cp and cross-validation estimate different errors, although the figure plots both on one axis: Cp estimates the error on new responses at the same feature values x_i as these cars, cross-validation predicts held-out cars whose feature values the fit has not seen, which is the error on new cars; below d = 8 the cross-validation estimate is the larger at every size, 0.1174 against 0.1109 for Cp at d = 1, a gap that reflects this difference; the differences in the flat stretch are small: the cross-validation estimate at the BIC's size is only 0.8% above its minimum; over 20 further random partitions into folds, cross-validation chooses d = 10 once, d = 11 6 times, d = 12 5 times and d = 14 8 times, so the size it chooses depends on the partition; cross-validation needs no sigma-hat^2 and does not rely on normal, constant-variance errors, at the price of 10 best subset searches instead of one
note: the chapter's own three-tab set (`#### All sizes`, `#### Sizes 6 to 14`, `#### Adjusted $R^2$`) under `### Chosen sizes`; no fragments. The sizes, the 10, 8, 0.1174, 0.1109, 0.8% and the 20-partition counts are inline R in the chapter, quoted from the frozen markdown, and are in `say:` only (the slide carries no label). The tab label with math is the chapter's own (`#### Adjusted $R^2$`); it renders in the deck's tab bar.

---

# Selected model

## 21. Selected model
tag: core
show: none (transition slide, title only)
words: none
say: the criteria leave sizes 10 through 14 nearly tied, so the smallest of them, the BIC's M_10, is interpreted here: it is easiest to explain and its cross-validation estimate is within 0.8% of the smallest

## 22. Coefficients
tag: core
show: table — coef-table-display (kable: the estimates $\widehat\beta_j$ of the BIC's model with the percent change in median price per unit of each feature; copied from the frozen markdown, with `\widehat` for `\hat` in the header and its caption kept, since the units of the last column are only in it)
words: none
say: the model drops Cruise, Sound, Chevy and Pontiac; with a normal error on the log scale, exp(x_i beta) is the median price, so exp(beta-hat_j) multiplies the median price per unit of feature j, a change of 100(exp(beta-hat_j) - 1)%; interpret the intercept first: exp(beta-hat_0) = $8,225 is the estimated median price when every feature is zero: no miles, no leather, a wagon, a reference make and zero cylinders; no car has zero cylinders, so beta-hat_0 only sets the level; the same car with four cylinders has estimated median price $17,341; mileage: each additional 10,000 miles multiplies the median price by 0.921, holding the other features fixed; other features: each additional pair of cylinders multiplies the median price by 1.452, and the body style coefficients compare each style with a wagon
note: the table is the chapter's `coef-table-display` (the kable in `selected-model`), copied verbatim from the frozen markdown with `\widehat` for the header's `\hat` and the chapter's caption kept. The $8,225, $17,341, 0.921 and 1.452 are inline R in the chapter, quoted from the frozen markdown, and are in `say:` only. The chapter's `### Coefficients` bullets (intercept, mileage, other features) are `say:` only. The table has 11 rows plus a header and a caption; the table font is set to 0.65em on this slide only so that all 11 rows and the caption fit.

## 23. Reference make
tag: core
show: none, a short itemized list
words: three lines: "Dropped: `Cruise`, `Sound`, `Chevy`, `Pontiac`"; "Reference make: `Chevy`, `Pontiac` and `Saturn` together"; "Dropping a dummy variable merges its level into the reference"
say: because Chevy and Pontiac were dropped, their cars share the intercept with Saturn: the reference make is now Chevy, Pontiac and Saturn together, and each retained make coefficient (Buick, Cadillac and Saab) compares that make with those three; dropping a dummy variable merges its level into the reference; the dropped Cruise and Sound are features that are simply left out
note: the chapter's `**Reference make.**` bullet and the sentence "The model drops Cruise, Sound, Chevy, and Pontiac" laid out as three lines and cut (a re-layout, not new content). The title is the chapter's own bold bullet label, since the subsection heading is `### Coefficients` (slide 22's). The dropped features are inline R in the chapter (`and_list(dropped)`), quoted from the frozen markdown.

## 24. Optimistic inference
tag: core
show: figure — noise-pvalue-figure (the histogram of the $p$-values of the noise features kept by $C_p$ in 500 noise data sets, with a dashed line at the uniform density of a feature chosen in advance), the figure alone, full width
words: none
say: summary(selected) reports standard errors and p-values as though these 10 features had been chosen before seeing the data; they were chosen because they fit these cars well, which makes both optimistic for two reasons; error variance: the standard errors are proportional to the selected model's sigma-hat, which comes from RSS_d, the smallest of 1,001 residual sums of squares of size d = 10; the smallest of many RSS values tends to be lower than the RSS of a model fixed in advance, so sigma-hat tends to be too small; on the cars the selected model has sigma-hat = 0.1108 against 0.1103 for the largest model, so the data alone do not show it: with 804 cars the search lowers sigma-hat only a little, and dropping Cruise, Sound, Chevy and Pontiac raises it by more; large |t|: a feature enters because its estimated coefficient is large relative to its standard error in these data, so its |t| statistic is large and its p-value small, whatever its true coefficient; the simulation keeps the features of the 804 cars but replaces log price with independent normal noise with standard deviation 0.1103, so every true coefficient is zero; each noise data set goes through best subset selection with the size chosen by Cp, and the selected model is refit with lm(); the histogram shows the p-values that summary() reports for every noise feature kept; Cp keeps at least one noise feature in 89.8% of the 500 data sets; the p-value of a feature chosen in advance is uniformly distributed, below 0.05 in 5% of data sets; 46.7% of the kept noise features have p < 0.05; the selected models' sigma-hat^2 averages 1.0% below sigma^2, the first reason at work, and small here because n is large relative to p
note: **Rebuilt in the 2026-10-17 revision:** the chapter's `noise-pvalue-figure` under `### Optimistic inference`, alone, replacing the earlier two-line list (a re-layout of the chapter's paragraph, now gone). The chapter gives two reasons (error variance and large $|t|$) and the noise simulation; both reasons and every number are in `say:` only. The 10, 1,001, 0.1108, 0.1103, 804, 500, 89.8%, 46.7% and 1.0% are inline R in the chapter, quoted from the frozen markdown; the figure's own title (the count of noise features kept) and caption are part of the PNG. The `summary(selected)` output is not printed in the chapter and is not shown.

## 25. Conclusion
tag: optional
show: none, a nested bulleted list that mirrors slide 0 item for item, with a takeaway phrase under each item
words: Used car prices, with "Subset selection chooses which of $p$ features a model uses"; Best subset selection, with Algorithm ("Best model of each size, then choose among sizes"), Fitting ("Within one size, the training RSS compares fairly"), Training RSS ("RSS and $R^2$ always choose the largest model") and Computational cost ("The number of fits doubles with every feature"); Stepwise selection, with Forward stepwise ("Add one feature at a time"), Backward stepwise ("Remove one feature at a time; needs $n > p$") and Path comparison ("Greedy paths need not contain the best model of each size"); Model size, with Penalized criteria ("The BIC favors smaller models; adjusted $R^2$ charges least"), Likelihood criteria ("For Gaussian least squares, AIC and $C_p$ choose the same size"), Within-fold cross-validation ("Repeat the best subset search inside every fold") and Chosen sizes ("Criteria and cross-validation disagree where estimated error is flat"); Selected model, with Coefficients ("Dropping a dummy variable merges its level into the reference") and Optimistic inference ("Standard errors and $p$-values ignore the selection: $\widehat\sigma$ too small, features kept for large $|t|$")
say: optional; the lecture may end here if time allows; the next lecture, ridge regression, keeps all p features and instead shrinks their coefficients toward zero by penalizing their size, with the amount of shrinkage chosen by cross-validation
note: the structure and order are slide 0's; each takeaway is a short phrase drawn from the chapter's `## Conclusion` paragraphs, with no restated example numbers. The Optimistic inference takeaway names both of the Conclusion's reasons (the error variance estimate from the smallest of many RSS values, and features kept because their $|t|$ statistics were large); the Chosen sizes takeaway uses the Conclusion's "where the estimated error is flat". Layout: two columns at 0.5em with tightened list spacing (Used car prices through Stepwise selection on the left, Model size and Selected model on the right), since 32 lines do not fit one column. The Conclusion has no sentence for Fitting alone or for Computational cost alone; their takeaways come from its sentences "Within one size, the training RSS is a fair way to compare models" and "Best subset selection fits every subset, $2^p$ models" (flagged: the Computational cost takeaway is the chapter's cost line cut to its claim, "the count doubles with each candidate feature" being from the Computational cost subsection).

---

# Not in this deck

Cut from the lecture's core line, with their assets and original content, so
they can come back.

## Parked content

- **Model equation** (the chapter's `### Candidate features` display
  $y_i = \beta_0 + \beta_1 x_{i1} + \cdots + \beta_p x_{ip} + \epsilon_i$ and its
  four symbol bullets): it would come back as an optional equation slide after
  Candidate features. Its content is in slide 3's `say:`.
- **Selection motives, variance display** (the chapter's `### Selection motives`
  Variance bullet, $Var[\widehat y] = \sigma^2\mathbf{H}$ and
  $\frac{1}{n}\sum_i Var[\widehat y_i] = \sigma^2(d+1)/n$): it would come back
  as an optional equation slide after Selection motives (4). Its content is in
  slide 4's `say:`.
- **Log price against mileage** (`log-base-figure`, the opening figure of Best
  subset selection): not a slide of its own; it is the background of every Fitting
  tab.
- **Training error optimism derivation** (the first two displays of
  `### Training error optimism`: $E[(y_i^0 - \widehat y_i)^2]$ and
  $E[(y_i - \widehat y_i)^2]$, and the step $Cov[y_i, \widehat y_i] = h_{ii}\sigma^2$): the
  `derive` objective's content; only its final display is on the optional slide 16.
- **Adjusted $R^2$ $F > 1$** (the $F$-statistic display at the end of
  `### Penalized criteria`): its conclusion (adjusted $R^2$ penalizes least) is in
  slide 17's `say:`.
- **Correlation heat map** (`correlation-figure`, the figure that opens Stepwise
  selection): it would come back as an optional figure slide after the Stepwise
  selection transition (10); it is the tall figure of the chapter (8 by 6.5
  inches). The text beside it (Cylinder and Cadillac correlated at 0.53, Saab
  negatively with Cylinder) is parked with it.
- **20-partition check code** (`cv-details`, in the chapter's `### Code` callout
  under `### Within-fold cross-validation`): not shown; the counts the chapter
  quotes are in slide 20's `say:`.
- **Chapter code callouts** (`### Code`) and the visible code chunks (`best-fit`,
  `cv-function`, `criteria`, `features`): not shown; the deck never shows a chunk's
  source.
- **`### Beyond this course` (never used):** branch and bound, hybrid and
  floating searches, mixed-integer optimization and other models, the callout at the
  end of the Stepwise selection section.

---

# Reference: assets used by this deck

- **Figures (PNG in `_freeze/06-regularization/10-subset-selection/figure-html/`,
  each with a `-1.png` suffix):** mileage-figure, group-figure, option-figure
  (the three tabs of slide 1), residual-dollars-figure, residual-log-figure (the two
  tabs of slide 2), fitted1-figure, fitted2-figure, fitted3-figure, fitted4-figure,
  best-which-figure (the five tabs of slide 7), rss-figure (8), train-mse-figure
  (15, optional), mse-all-figure, mse-zoom-figure, adj-figure (the three tabs of
  slide 20), noise-pvalue-figure (24). That is 16 of the 18 chunk figures in the
  freeze directory; log-base-figure and correlation-figure are parked.
- **Tables (kable, copied from the frozen markdown):** `example-table-display`
  (slide 13, the `half-samples` kable) and `coef-table-display` (slide 22, the
  `selected-model` kable, with `\hat` written `\widehat` in its header).
- **Console output (frozen markdown):** none; the chapter prints no console
  output (the `regsubsets()` chunks `best-fit` and `stepwise-fits` print
  nothing), and the deck has no code slide.
- **Equations on slides:** the number of forward stepwise models
  $1 + \sum_{d=0}^{p-1}(p - d) = 1 + p(p+1)/2$ (11); the training error optimism
  result $E[\sum_i(y_i^0 - \widehat y_i)^2] = E[RSS] + 2\sigma^2\,\text{tr}(\mathbf{H}) = E[RSS] + 2(d+1)\sigma^2$
  (16); the three criteria $C_p$, BIC and adjusted $R^2$ (17); the log-likelihood, AIC and BIC
  (18); and the algorithm
  lines' $\mathcal{M}_d$, $\binom{p}{d}$ and $2^p$ (6, 9). **Parked:** the model
  display, the variance display, the first two optimism displays and the adjusted
  $R^2$ $F$ display. Every equation that
  mentions `\hat` is written with `\widehat` in the deck.
- **Numbers quoted from inline R in the frozen markdown (never retyped or
  recomputed). On slides:** $p = 14$ (3); $2^{14} = 16{,}384$ (9, 11); 106 (11).
  **In speaker notes only:** 804, 0.56, 0.11, 92.9%, 0.1103 (1, 2); the median
  prices $17,631, $18,073, $17,895, $18,126, $17,161, $20,648 and 82.8% (1);
  135.06, 89.11, 9.60 (8); 200 halves, 72.5%, 72.5%, 27.51, 14.51, 89.62, 45.5%
  (13); $\widehat\sigma^2 = 0.01216$, 0.01193, d = 10 (15); 0.00045, 0.01239 (16);
  $\log(n) = 6.69$, $C_p$ 12, BIC 10, adjusted $R^2$ 14 (17); $k = 10$, 7.1%, sizes
  1, 4 and 7, cross-validation 13, 0.01233 (19); the 1% flat stretch from d = 10,
  d = 8, 0.1174, 0.1109, 0.8% and the 20-partition counts (20, 21); $8,225,
  $17,341, 0.921, 1.452 (22); 1,001, 0.1108, 89.8%, 46.7%, 1.0% (24). Slide 18 quotes
  no number from inline R.
- **Chunk names to confirm at build time:** the freeze directory's `figure-html/`
  holds the 18 PNGs (each with a `-1.png` suffix), 16 used; the notes' tab names
  are "Mileage / Make and body style / Engine and options" (slide 1), "Dollars / Log
  scale" (2), "1 feature / 2 features / 3 features / 4 features" (7) and "All sizes
  / Sizes 6 to 14 / Adjusted $R^2$" (20); `result.markdown` has two table blocks
  and no `cell-output-stdout` or `cell-output-stderr` blocks.

Not available to slides: anything inside a `### For example,` or
`### Beyond this course` callout (here, the branch-and-bound, hybrid search,
mixed-integer and other-model callout at the end of the Stepwise selection
section; the chapter has no `### For example,` callout).
