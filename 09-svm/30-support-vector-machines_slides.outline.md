# Slide outline: Support Vector Machines

(drafted 2026-11-14, revised after the proofread and the chapter's second round of fixes)

Outline for `30-support-vector-machines_slides.qmd` (Fri 2026-11-20, the last of three lectures on support vector machines; ISLR2 Sections 9.3 to 9.5). **This file is the spec; the deck is built from it, and this file describes the deck as it stands.** Edit it freely and ask for the deck to be refreshed.

Drafted against `30-support-vector-machines.qmd`, the deck's `derived-from` comment records the chapter's commit (`ac7908e`). The frozen output `_freeze/09-svm/30-support-vector-machines/execute-results/html.json` is current: its recorded `hash` (`9a52594bd9b85b7bda38258ce564f2df`) equals the md5 of the chapter file as it stands, which already carries the "Slides for this lecture" link (`30-support-vector-machines_slides.html`) on the line after `# Support Vector Machines`.

**What the deck is.** 32 slides including the title: the agenda, six transitions, 24 content slides (the last is the Conclusion). The chapter's `## Sacramento homes`, `## Enlarged feature space`, `## Kernels`, `## Tuning`, `## More than two classes` and `## Hinge and logistic loss` are the six parts (each a transition slide). It reuses 13 of the 16 PNGs in the chapter's freeze directory (see "Not in this deck"), shows no kable table (the chapter has none), and has four code slides: the visible chunks `quad-fit`, `svm-fit`, `cv-fit` and `logistic-fit`, each with its console output; the console printouts of `test-confusion` and `three-confusion` (which are `table(...)`, not model fits, so their code is not shown) are on slides of their own. The deck has no new content: every `show:` is a figure, equation, code chunk or console printout the chapter already has, or a list cut from the chapter's own sentences. The chapter has one running example, `modeldata::Sacramento` (932 home sales; the class is the city, `Sacramento` or `Other`; the explanatory variables are `longitude` and `latitude` in degrees, $p = 2$), split at random into 621 training homes and 311 test homes; the three-class part adds `Elk Grove`.

**Timing.** One full 50-minute period on Fri 2026-11-20. **The core slides come to 45.0 minutes** at the estimates below (0.5 + 1 + 1 + 2.5 + 2 + 2.5 + 1.5 + 2 + 4 + 2 + 4 + 1.5 + 2 + 4 + 2 + 2 + 1 + 1.5 + 1.5 + 2.5 + 2.5 + 1.5 = 45.0, in the order of the lecture: the agenda, entries 1 to 4, 7 to 22 and 24). **The optional slides add 4.5 minutes** (Polynomial features: fit 1.5, Feature count 1, Comparison 2), 49.5 for the whole deck. Revisions from the first draft: More than two classes is now core (learning objective 5 is assessed) as three slides (the figure, the two approaches, the pairwise voting and the 3 by 3 confusion matrix, 4 minutes); the Polynomial kernel derivation (assessed) is 4 minutes and Grid: CV estimates 4; Sacramento homes: plot, Kernel functions, Fitting and Radial kernel are re-estimated at 1, 1.5, 1.5 and 2.

**Drop order, the first to drop first**, with what to say in place of each dropped slide (the words are in the speaker notes of the slide named, so the instructor has them in the room):

1. Comparison (entry 23, 2): the `glm` comparison is the chapter's last subsection and nothing later needs it. **If dropped, say on Logistic loss** (the closing sentences of its notes, "If Comparison is dropped, say"): the logistic regression's test error rate on these homes, 22.2%, is about the same as the linear support vector classifier's, 22.5%, and the two classify 99.0% of the test homes the same way; they differ here in both the loss and the penalty, so the comparison does not isolate the loss; the logistic regression gives each test home a probability, which the support vector classifier does not. The Conclusion's last item does not depend on it. **Skip the "Comparison" agenda line.**
2. Feature count (entry 6, 1): the numbers of features for larger $p$ and $d$. **If dropped, say on Polynomial features** (the notes of that slide, "If Feature count is dropped, add"): $q$ grows fast with $p$; with $p = 10$ explanatory variables degree 3 already gives $q = 285$ features and degree 5 gives $q = 3{,}002$; each must be computed for every observation and enter every inner product the solver computes, and the boundary is still limited to polynomials of the chosen degree. The formula $q = \binom{p+d}{d} - 1$ and $q = 5$ for $p = 2$ and $d = 2$ are already in the notes of Polynomial features, so the Polynomial kernel's notes ("whatever the number of features $q$") and the Conclusion's first item ("but they are too many") keep their antecedent. **Skip the "Feature count" agenda line, and the clause "and Feature count, which is optional, says what it costs" in the notes of the Enlarged feature space transition.**
3. Polynomial features: fit (entry 5, 1.5): the code slide for `quad-fit` only repeats the degree-2 tab's training error rate (6.6%) in code; nothing refers to it (it has no agenda line, and the notes that define `z1`, `z2` and `train` are its own).

The More than two classes part, now core, has nothing optional in it. **The deck is built so that the core stands without any optional slide.**

**Order of the last two parts, chosen.** The proofreader suggested moving Loss plus penalty and Logistic loss ahead of Test error because late slides get cut. I kept the chapter's order: the part opens "the classifier is the linear support vector classifier of the Test error section", so it depends on Test error; its optional Comparison slide uses the linear classifier's test error rate and `svc_best`; and the deck's slides trace to the chapter in order. Both of the last two core parts (More than two classes, 4 minutes; Hinge and logistic loss, 5) are assessed, so if time runs short the instructor cuts the optional slides first (4.5 minutes) and then shortens the notes, not the slides. If the instructor wants the pair earlier anyway, it is a plain reorder of entries 21 and 22 to before entry 16, with the transition and the agenda moved with it and the sentence "the linear support vector classifier of the Test error section" changed to "the linear support vector classifier of the previous lecture".

**Choices to flag.** (a) The chapter's first tab of each tabset, the training homes alone, is not repeated (it is `home-figure`, already entry 2); the Enlarged feature space tabs are Degree 1, 2 and 3. (b) The `test-confusion` printout (a list of two tables) is one slide with two numbers of the chapter's paragraph. (c) There is no `three-fit` code slide: the 3 pairs' call is in the notes of Pairwise voting (`svm(three ~ longitude + latitude, data = train, kernel = "radial", cost = 10, gamma = 100)`), with the vote count; a code slide (5 lines of source, about 12 of output, 2.5 minutes) did not fit in the 45-minute core and can be added as a fourth optional slide on request. (d) The chapter's display of $\text{CV}_{(10)}(\texttt{cost}, \gamma)$ is not on a slide (it is the previous lecture's). (e) **The chapter's Conclusion still says "`cost` and $\gamma$ (or `cost` and the degree)"** although the body's sentence about tuning a polynomial kernel was cut; the deck's notes for the Conclusion omit "(or `cost` and the degree)", so the chapter and the notes differ by those words until the chapter's Conclusion is edited.

**Chapter changes quoted by the deck (second round of fixes).** Grid: the cost sentence is now "at every $\gamma$, `cost` = 1000 has a smaller estimate than `cost` = 0.1", not monotone in between, so the heat-map slide has **no caption** and the sentence, the 31.6% to 1.4%, 47.4% to 11.8% and 23.3% to 7.7% figures are in the notes only; the sentence about tuning a polynomial kernel is cut from the notes of Grid. Test error: the new tuning sentence for the linear classifier (`tune()` over `cost` 0.01 to 100, two values per factor of 10; 20.3% ties at every `cost` from 0.32 to 100 up to rounding; `tune()` reports the first exact minimum, `cost` = 1) is in the notes of Test error. Polynomial features: the display uses $\widehat w_j$; the count is $q = \binom{p+d}{d} - 1$ with $q = 5$ here and $p$ the number of explanatory variables only (in the notes of Polynomial features, and the display on Feature count, whose lines now write $q$); Inner products: $x_i$ is the $p$ standardized explanatory variables, and on enlarged features the sum runs over the $q$ features (in the notes); Radial kernel: the sum runs over $i \in \mathcal{S}$ (on the slide); Polynomial kernel: "one inner product over the $p$ explanatory variables", $q$ and $\widehat w_0$ (in the notes); the gamma tabs: all four are fit with the `cost` that cross-validation chooses, and $\gamma = 100$ with `cost` = 10 is the pair it chooses (in the notes); Comparison: 331 homes with zero hinge loss, 290 with positive hinge loss, and those 290 plus the 2 homes exactly on the margin are the 292 support vectors (in the notes); the three-class text (Elk Grove squares, Sacramento triangles, Other circles) is in the notes of the figure slide. No computed number changed.

**Code slides.** Entries 5 (`quad-fit`), 13 (`svm-fit`), 14 (`cv-fit`) and 23 (`logistic-fit`) show the chunk's source copied verbatim from the chapter (without the `#|` lines) in a ` ```r ` block, which is not executed, followed by the chunk's console output copied verbatim from the frozen markdown (with its trailing spaces and the blank first line of the `svm()` printout) in a plain ` ``` ` block. Nothing is trimmed, including the comments. The code uses `z1`, `z2` and `train`, which the chapter defines in collapsed Code callouts or earlier chunks; as in the chapter they are not on the slide, and the notes of Polynomial features: fit say that `z1` and `z2` are $X_1$ and $X_2$, the standardized longitude and latitude, and `train` the 621 training homes. The tallest, `svm-fit` (4 lines of source, 13 of output), ends at 558 px of 720. Entries 17 and 20 show the printouts of `test-confusion` and `three-confusion` as plain blocks. Every console block was checked to be a substring of the re-rendered frozen markdown, and every `r` block of the chapter's source. **Code, printout and figure slides have no fragments** (Test error: confusion matrices, Pairwise voting and Comparison show their statements at once).

**Not in this deck.** Every collapsed `### Code` callout (`home-plot`, `enlarged-plot`, `gamma-plot`, `kernel-check`, `cv-plot`, `test-plot`, `three-plot`, `three-check`, `loss-plot`); the chapter's `### Beyond this course` callout, used nowhere in the deck and not cited in the notes (the chapter's own sentence in Inner products that the weights can also be computed from the inner products alone, "not derived here", is in the notes of Inner products without the pointer to the callout); the visible chunks `homes` and `split` (the 932, 621, 327, 294 and 311 are quoted on Sacramento homes); `quad-check` and `logistic-compare` (hidden); the chunk `three-fit` (see Choices (c)); the figure `enlarged-data-figure` (a repeat of `home-figure`). The freeze directory also holds two PNGs of an earlier draft (`kernel-data-figure`, `loss-data-figure`); no chunk produces them now and the deck does not use them.

**Display punctuation and symbols.** Every display keeps the chapter's trailing comma or period (the bullets that follow play the part of the chapter's "where"); `\hat` is written `\widehat` throughout. The chapter's inline $\hat f(x^*) = \hat w_0 + \sum_{i \in \mathcal{S}}\hat\alpha_i K(x^*, x_i)$ (Radial kernel), its inline inner-product definition (a symbol line of Inner products) and the logistic-loss display are set as displays or symbol lines; the one-versus-all $\widehat f_k$ is written `\widehat{f}_k` (MathJax 2 leaves a small gap before the subscript, cosmetic). Symbols are defined on the slide that uses them: Loss plus penalty has a legend for $f(x_i)$, $w$, $y_i$, $n$ and $p$ after the whole display; Radial kernel defines $x^*$ and $x_i$; Feature count defines $q$; Inner products defines $\mathcal{S}$, $\widehat\alpha_i$, $\widehat w_0$ and the inner product; the three kernels' $x_{ij}$ and $p$, and the symbols of Kernel functions (the previous slide's without hats), are in the notes.

**Response variable and explanatory variables.** The class is `place` (the chapter's city, `Sacramento` or `Other`); the explanatory variables are `longitude` and `latitude`, $p = 2$, and each feature is an explanatory variable (the polynomial features are features, not explanatory variables). The data slide follows the instructor's layout: the class and the explanatory variables with a sub-bullet each, vertical white space, then the training and test counts, with the data's unit word, homes.

**Figure legibility.** Effective tick size is 8.8/72 times the display height in px over the figure height in inches (14 px or more is the target). The Sacramento figures (`home-figure`, `three-figure`, `enlarged-1-figure` to `enlarged-3-figure`, `gamma-1-figure` to `gamma-4-figure`, `test-svc-figure`, `test-svm-figure`) are 1152 by 883 px at 192 dpi (6 by 4.6 in); `cv-figure` and `loss-figure` are 1344 by 768 px (7 by 4 in). Display heights were measured in the rendered deck (layout px at 16:9, before reveal's scaling). Tabset figures need at least 527 px for 14 px ticks; `.tall-tabs` (560) overflows the slide (the slide ends at 735 px), so the deck adds a `.fig-tabs` class at 530 px (ends at 705 px; the $\gamma$ slide, whose title carries a symbol, ends at 710). Every reused figure is at 14.1 px or more. The grid lines of the figures are even (the heat map has none). **The `coord_fixed` equal-SD figures are not too wide for a slide:** the figure is wider than a map (the chapter says so: about 87 km per degree of longitude against 111 km per degree of latitude, so the panel is about 25% wider than a true map), but at 560 px high it is 731 px wide, and at 530 px 691 px wide, about 55% of the 1280 px slide, so it is height-limited, not width-limited.

| Figure | Height (in) | Display height (px) | Tick (px) |
|:--|--:|--:|--:|
| `home-figure`, `three-figure` (`height=560`) | 4.6 | 560 | 14.9 |
| `enlarged-1-figure` to `enlarged-3-figure`, `gamma-1-figure` to `gamma-4-figure`, `test-svc-figure`, `test-svm-figure` (tabs, `.fig-tabs`) | 4.6 | 530 | 14.1 |
| `cv-figure` (`height=480`, alone on the slide) | 4.0 | 480 | 14.7 |
| `loss-figure` (`height=480`, equation in a right column) | 4.0 | 480 | 14.7 |

## How to read an entry

Entries are numbered by content slide; the title and the transitions are not numbered, and the agenda is entry 0, so the deck's footer numbers (which count every slide) run higher than the entry numbers.

- **tag:** core | optional | transition, with the timing in minutes
- **show:** the type (equation, figure, table, tabset, code, none) and the asset
- **words:** the only prose on the slide; omitted on figure and tabset slides
- **reveal:** what appears on each click
- **say:** speaker notes, never on the slide
- **note:** build and provenance details, including the chapter sentences or values the slide relies on

---

## 0. Today

- **tag:** core (0.5)
- **show:** none, a nested bulleted list in three columns
- **words:** Sacramento homes; Enlarged feature space (Polynomial features, Feature count); Kernels (Inner products, Kernel functions, Polynomial kernel, Radial kernel, Fitting); Tuning (Grid, Test error); More than two classes (One versus one and one versus all, Pairwise voting); Hinge and logistic loss (Loss plus penalty, Logistic loss, Comparison)
- **say:** distilled from the chapter's six learning objectives (polynomial features and their count; the classifier through inner products, the support vector machine and the three kernels; the degree-2 polynomial kernel as an inner product of features, and the radial kernel's locality and $\gamma$; `tune()` over a grid, test error and confusion matrix; one versus one and one versus all; hinge loss plus penalty against logistic loss); the chapter's introduction (the last of three lectures on support vector machines; ISLR2 Sections 9.3 to 9.5); **if Feature count is dropped, skip that agenda line, and if Comparison is dropped, skip that line**; the timing and the drop order are in the notes
- **note:** the list names every part and every `###` the deck spends slides on, including the optional ones (as in the previous deck's agenda), in the order of the deck; the figure slides without a chapter heading (Sacramento homes: plot, Kernel functions: three kernels, Grid: CV estimates, Test error: confusion matrices, Polynomial features: fit) are not listed separately. Three columns, 4, 9 and 7 lines, aligned at the top (widths 32%, 28%, 40% so that "One versus one and one versus all" does not wrap); the lowest line ends at 512 px of 720.

# Sacramento homes

- **tag:** transition (0)
- **show:** none (transition slide, title only)
- **say:** the chapter's Question: within the Sacramento metropolitan area, can a home's location alone tell whether it is in the city of Sacramento or in one of the cities around it?
- **note:** relies on the chapter's `**Question.**` paragraph under `## Sacramento homes`.

## 1. Sacramento homes

- **tag:** core (1)
- **show:** none, a words-only data slide: two blocks of bullets with white space between them
- **words:** "Class: `place`, the city (`Sacramento`: $y = 1$, `Other`: $y = -1$)" and "Explanatory variables ($p = 2$):" with the sub-bullets "`longitude` (degrees)" and "`latitude` (degrees)"; then, after a gap, "Training homes: 621 (327 `Other`, 294 `Sacramento`)" and "Test homes: 311"
- **say:** `modeldata::Sacramento` records 932 home sales reported in the Sacramento area over five days in May 2008, with each home's city and its location as longitude and latitude in degrees; the observations are homes; the class is the city, coded $y_i = 1$ for `Sacramento`, the second level of the factor, and $y_i = -1$ for `Other`, any of the 36 other cities; the two explanatory variables are longitude and latitude; two thirds of the homes, chosen at random, are the training homes, 621 (327 `Other` and 294 `Sacramento`), and the rest, 311, are the test homes, used only to evaluate the chosen classifiers
- **note:** the chapter's `**Data.**` paragraph and its `homes` and `split` chunk outputs as a data layout, at 0.7em, the second block set off by a 1em top margin. The coding of the class is on the first line because $y_i$ is used from Inner products on. 621, 327, 294 and 311 (932 minus 621; also the sum of the test confusion matrix) are inline R or console output, quoted from the frozen markdown (the 932 and the 36 are in the notes). The class is named `place` because that is the factor in the model formulas on the code slides; the chapter's prose calls it the city. The title is the chapter's `## Sacramento homes`, the same as its transition.

## 2. Sacramento homes: plot

- **tag:** core (1)
- **show:** figure — `home-figure` (the training homes by longitude and latitude, color and shape by class, axes drawn so that one standard deviation of each coordinate has the same length), the figure alone
- **words:** none
- **say:** the training homes in the city of Sacramento form a block in the west of the area; homes in other cities lie north, east and south of that block, and a few lie west of it; no straight line puts the Sacramento homes on one side and the others on the other, since any line through the block leaves other cities on both sides; the axes are drawn so that one standard deviation of each coordinate, $s_{\texttt{longitude}} = 0.1367$ and $s_{\texttt{latitude}} = 0.1375$ degrees, has the same length, since `svm()` standardizes both; a degree of longitude here is about 87 km and a degree of latitude about 111 km, so the figure is wider than a map
- **note:** the chapter's `home-figure`, 6 by 4.6 inches, at `height=560`; the values are inline R, quoted from the frozen markdown. **The title is not a chapter heading** (the figure sits under `## Sacramento homes`); it follows the "plot" suffix of the earlier decks.

# Enlarged feature space

- **tag:** transition (0)
- **show:** none (transition slide, title only)
- **say:** the tabs fit support vector classifiers to polynomial features of the two coordinates, of degree 1 (the coordinates themselves), 2 and 3; the next slide says what such a fit is, and Feature count, which is optional, says what it costs (**if Feature count is dropped, skip that clause**)
- **note:** the chapter's sentence introducing the tabs.

## 3. Enlarged feature space

- **tag:** core (2.5)
- **show:** tabset — `enlarged-1-figure`, `enlarged-2-figure`, `enlarged-3-figure` (Degree 1, 2, 3: the Sacramento region shaded and the boundary $\widehat f(x) = 0$ drawn), `.fig-tabs`
- **words:** none (the tab titles are the degrees)
- **say:** the tabs show support vector classifiers fit to polynomial features of the two coordinates, of degree 1, 2 and 3 (the chapter's first tab, the training homes alone, is not repeated), each shading the region classified `Sacramento` and drawing the boundary; the degree-1 boundary is a line; the degree-2 boundary is an ellipse around the city's block; degree 3 adds the four cubic features and the boundary becomes a cubic curve, which also gives `Sacramento` two regions at the edge of the plot, far from any home; this is the feature engineering of the regression lectures, with a hyperplane in place of least squares; the training error rates of the three fits, all with `cost` = 1, are 20.1%, 6.6% and 6.3%
- **note:** the chapter's `## Enlarged feature space` tabs and the paragraph after `quad-fit`; 6 by 4.6 inches at 530 px (see the legibility table). The tab titles are the chapter's. This is the deck's picture of a curved boundary.

## 4. Polynomial features

- **tag:** core (2)
- **show:** equation — the chapter's degree-2 hyperplane display (with $\widehat w_j$), whole before its symbol list
- **words:** "Support vector classifier on the degree-2 features:" above the display; then "$X_1, X_2$ — standardized longitude and latitude", "$\widehat w_j$ — rescaled estimates, one per feature", "A hyperplane in five dimensions, a conic section in $X_1$ and $X_2$"
- **reveal:** the lead line and the display on arrival, then one bullet per click (3 clicks, `.incremental`)
- **say:** the support vector classifier draws a hyperplane in whatever features it is given; given the standardized longitude and latitude $X_1$ and $X_2$ alone, it draws a line (degree 1); given the degree-2 features $X_1, X_2, X_1^2, X_1X_2, X_2^2$, it draws the hyperplane in the display, in five dimensions, where the $\widehat w_j$ are the rescaled estimates of the previous lecture's penalty form, one per feature; **in general, all the monomials of degree at most $d$ in $p$ explanatory variables, without the constant, are $q = \binom{p+d}{d} - 1$ features, and $q = 5$ here ($p$ is the number of explanatory variables only, not of features)**; **if Feature count is dropped, add:** $q$ grows fast with $p$, with $p = 10$ degree 3 already gives $q = 285$ and degree 5 gives $q = 3{,}002$, each must be computed for every observation and enter every inner product the solver computes, and the boundary is still limited to polynomials of the chosen degree; read as an equation in $X_1$ and $X_2$ the hyperplane is a conic section, an ellipse, a parabola or a hyperbola, and the degree-2 fit's boundary is an ellipse around the city's block
- **note:** the chapter's `### Polynomial features`; the display is verbatim (hats as $\widehat w$, no trailing punctuation, on two lines) and the formula for $q$ is now in the chapter's Polynomial features, so it is in this slide's notes (the formula is on the Feature count slide only).

## 5. Polynomial features: fit

- **tag:** optional (1.5), the third to drop
- **show:** code — chunk `quad-fit` and its console output (`[1] 0.06602254`)
- **words:** none
- **say:** `z1` and `z2` are the standardized longitude and latitude, $X_1$ and $X_2$ (standardized with the training homes' means and standard deviations; the chapter defines them in a collapsed Code callout), and `train` is the 621 training homes; `poly()` with `raw = TRUE` builds the five degree-2 features from `z1` and `z2`, and `svm()` with a linear kernel fits the hyperplane; `svm()` standardizes each of the five features again, so the $\widehat w_j$ are per standard deviation of each feature; the training error rate, 0.066, is the degree-2 fit's 6.6% in the tab
- **note:** the chapter's `quad-fit` chunk (4 lines of source plus a comment and a blank line), verbatim, with its printout; ends at 301 px. Nothing on a core slide refers to this slide.

## 6. Feature count

- **tag:** optional (1), the second to drop
- **show:** equation — the chapter's count display, $q = \binom{p + d}{d} - 1$, then three lines
- **words:** "Monomials of degree at most $d$ in $p$ explanatory variables, without the constant:" above the display; then "$q$ — number of features", "$p = 2$: $q = 5$ for $d = 2$, $q = 9$ for $d = 3$" and "$p = 10$: $q = 285$ for $d = 3$, $q = 3{,}002$ for $d = 5$"
- **reveal:** the lead line and the display on arrival, then one bullet per click (3 clicks, `.incremental`)
- **say:** the number of features $q = \binom{p+d}{d} - 1$ ($p$ is the number of explanatory variables only) is 5 for $p = 2$ and $d = 2$ and 9 for $d = 3$; it grows fast with $p$: with $p = 10$ explanatory variables, degree 3 already gives $q = 285$ features and degree 5 gives $q = 3{,}002$; each must be computed for every observation and enter every inner product the solver computes, and the boundary is still limited to polynomials of the chosen degree
- **note:** the chapter's `### Feature count`; the numbers are inline R, quoted from the frozen markdown. The display is the chapter's display in Polynomial features (the same formula); the slide sets it as a display here as the first slide of the pair that carries the count.

# Kernels

- **tag:** transition (0)
- **show:** none (transition slide, title only)
- **say:** the data are the training homes of the first figure; the question is how to get a curved boundary like those in the tabs without listing the enlarged features
- **note:** the chapter's two sentences under `## Kernels`.

## 7. Inner products

- **tag:** core (2.5)
- **show:** equation — the chapter's classification display, $\widehat f(x) = \widehat w_0 + \sum_{i \in \mathcal{S}} \widehat\alpha_i\langle x, x_i\rangle,$ whole, then the symbol list
- **words:** "$\mathcal{S}$ — set of support vectors"; "$\widehat\alpha_i$ — weight of support vector $i$, positive for $y_i = 1$, negative for $y_i = -1$"; "$\widehat w_0$ — rescaled intercept"; "$\langle x_i, x_{i'}\rangle = \sum_{j=1}^p x_{ij}x_{i'j}$ — inner product of two observations"
- **reveal:** the display on arrival, then one bullet per click (4 clicks, `.incremental`)
- **say:** the inner product of two observations is the last item, with $x_i$ the $p$ standardized explanatory variables `svm()` uses (on enlarged features the sum runs over the $q$ features instead; here and in the kernels below it runs over the $p$ explanatory variables); the classifier's fitted normal vector is a weighted sum of the support vectors, $\widehat w = \sum_{i \in \mathcal{S}}\widehat\alpha_i x_i$ (the form `svm()` stores, `coefs` times `SV`, in the previous lectures), so a new observation $x$ is classified by the display; $\widehat\alpha_i$ is `svm()`'s `coefs` in its sign, zero for every other observation; $\widehat w_0$ is the rescaled intercept (ISLR2 writes $\beta_0$, here the unit-norm intercept); so classifying a new observation needs only its inner products with the support vectors; the weights can also be computed from the inner products of the training observations alone, which is not derived here and is not assessed
- **note:** the chapter's `### Inner products`; the display is verbatim with its trailing comma, on one line. Classifying only: fitting through inner products is not on the slide, and the notes carry only the chapter's own sentence that it is "not derived here", without the pointer to the callout.

## 8. Kernel functions

- **tag:** core (1.5)
- **show:** equation — the chapter's support vector machine display, $f(x) = w_0 + \sum_{i \in \mathcal{S}} \alpha_i K(x, x_i).$, whole, then one symbol line
- **words:** "Support vector machine: the support vector classifier with a kernel" above the display; then "$K(x_i, x_{i'})$ — kernel: a function of two observations that replaces the inner product"
- **reveal:** the lead line and the display on arrival; click 1: the symbol line
- **say:** a kernel $K(x_i, x_{i'})$ is a function of two observations that replaces the inner product; the support vector machine is the support vector classifier with a kernel, the display, with the symbols of the previous slide, without hats; the next slide gives three kernels
- **note:** the chapter's `### Kernel functions`, first paragraph and display (no hats, as in the chapter).

## 9. Kernel functions: three kernels

- **tag:** core (2)
- **show:** equation — the chapter's three kernels: linear, polynomial of degree $d$, radial, each as a display under a label
- **words:** "Linear (the inner product):", "Polynomial of degree $d$, a positive integer:", "Radial, with $\gamma > 0$:"
- **reveal:** the linear kernel on arrival; click 1: the polynomial kernel; click 2: the radial kernel
- **say:** three kernels, where $x_{ij}$ is the value of explanatory variable $j$ of observation $i$ (standardized) and $p$ is the number of explanatory variables; the linear kernel is the inner product, which gives back the support vector classifier; the polynomial kernel of degree $d$, a positive integer, adds 1 to the inner product and raises the sum to the power $d$; the radial kernel, with $\gamma > 0$, is the exponential of minus $\gamma$ times the squared distance between the two observations; the next two slides take the polynomial and the radial kernels in turn
- **note:** the chapter's three-item list; the chapter's inline linear kernel is set as a display like the other two (no trailing punctuation); labels at 0.7em, displays at 0.8em; the slide ends at 695 px of 720 with all three shown. **The title is not a chapter heading** (the chapter's `### Kernel functions` is the previous slide's), with the usual colon suffix.

## 10. Polynomial kernel

- **tag:** core (4)
- **show:** equation — the chapter's expansion of the degree-2 kernel for $p = 2$ (two aligned lines) and its $h(x_i)$ display
- **words:** "$p = 2$ and $d = 2$, expanding the square:" above the first display; then "where", the $h(x_i)$ display and "$h(x_i)$ — degree-2 features of observation $i$, up to constant multiples"
- **reveal:** the lead line and the expansion on arrival; click 1: "where", the $h(x_i)$ display and its label (one fragment)
- **say:** the polynomial kernel is an inner product of enlarged features, computed without listing them; with $p = 2$ and $d = 2$, expanding the square gives the first line, which is the inner product of $h(x_i)$ and $h(x_{i'})$, where $h(x_i)$ is the vector of degree-2 features of observation $i$, up to constant multiples; its constant 1 adds the same amount to every inner product and is absorbed by $\widehat w_0$; a support vector machine with this kernel is the support vector classifier on those features, with a boundary that is a conic section; computing the kernel takes one inner product over the $p$ explanatory variables and one power, whatever the number of features $q = \binom{p+d}{d} - 1$; **this derivation is an assessed result** (learning objective 3 says derive)
- **note:** the chapter's `### Polynomial kernel`, both displays verbatim and whole (the first has its trailing comma, the second none); the slide ends at 491 px. One slide. The chapter's closing sentence about tuning a polynomial kernel is cut in the chapter and is not in the deck.

## 11. Radial kernel

- **tag:** core (2)
- **show:** equation — the chapter's inline $\widehat f(x^*) = \widehat w_0 + \sum_{i \in \mathcal{S}}\widehat\alpha_i K(x^*, x_i)$ set as a display, then a symbol line and three statements
- **words:** "$x^*$ — new observation; $x_i$ — support vector $i$"; "Radial kernel: 1 when $x = x_i$, falling toward 0 as $x$ moves away: local"; "$K = 0.01$ at distance $\sqrt{\log(100)/\gamma}$ standard deviations"; "Large $\gamma$: small influence; small $\gamma$: wide influence"
- **reveal:** the display on arrival, then one bullet per click (4 clicks, `.incremental`)
- **say:** the radial kernel is 1 when $x = x_i$ and falls toward 0 as $x$ moves away from $x_i$; in the display, a support vector far from a new observation $x^*$ contributes almost nothing, so $x^*$ is classified by the support vectors near it: the radial kernel is local; $\gamma$ sets how near; $K$ falls to 0.01 at distance $\sqrt{\log(100)/\gamma}$ standard deviations, so a large $\gamma$ makes each support vector's influence small in extent and a small $\gamma$ makes it wide; the radial kernel is also an inner product of enlarged features, but of infinitely many, so no explicit enlargement could reproduce it
- **note:** the chapter's first paragraph of `### Radial kernel`, cut to fragments; the 0.01 and the $\sqrt{\log(100)/\gamma}$ are the chapter's. The slide ends at 425 px.

## 12. Radial kernel: gamma

- **tag:** core (4)
- **show:** tabset — `gamma-1-figure` to `gamma-4-figure` ($\gamma$ = 0.1, 1, 100, 1000, all with `cost` = 10), `.fig-tabs`
- **words:** none (the tab titles are the values of $\gamma$; the slide title carries `cost` = 10)
- **say:** the tabs show four support vector machines with the radial kernel, all with the `cost` that cross-validation chooses below, `cost` = 10, at four values of $\gamma$; at $\gamma$ = 0.1 each support vector's influence reaches 6.8 standard deviations, about the width of the whole area, and the boundary is a smooth oval: low variance, more bias; as $\gamma$ grows the boundary follows the city's block more closely and the training error rate falls from 6.3% to 0.0%; at $\gamma$ = 1000 the influence reaches only 0.07 standard deviations: the region classified `Sacramento` breaks into small islands around the training homes, 581 of the 621 training homes are support vectors, and a new home between the islands is too far from every support vector for any to count, so $\widehat f$ there is $\widehat w_0$ and the home gets `Other`: low bias, high variance; **$\gamma$ = 100 with `cost` = 10 is the pair cross-validation chooses below: its training error rate is already 0.0%, with 350 support vectors, so it sits at the edge of that overfitting regime**
- **note:** the chapter's `## Radial kernel` tabs (chunk `gamma-plot`) and the paragraph after them; 6 by 4.6 inches at 530 px. **The title is not a chapter heading**; it adds `cost` = 10, which the figure needs and the tabs do not show (the chapter's paragraph says it). The chapter ties $\gamma$ = 100 and `cost` = 10 to the cross-validation result by a check. The tab titles use $\gamma$, which MathJax typesets (checked). The values are inline R, quoted from the frozen markdown. The chapter's training error rate for $\gamma$ = 1 is not quoted in the frozen text, so the notes do not give it.

## 13. Fitting

- **tag:** core (1.5)
- **show:** code — chunk `svm-fit` (`svm(place ~ longitude + latitude, ..., kernel = "radial", cost = 1, gamma = 1)` and `svm_fit`) and its console printout
- **words:** none
- **say:** `svm()` with `kernel = "radial"` fits the support vector machine with the radial kernel, and `gamma` is $\gamma$ (in `e1071`, as in `libsvm`); as in the previous lecture `svm()` standardizes the features by default, so the kernel's distances are in standard deviations; the fitted object holds the support vectors `SV` (standardized), their weights $\widehat\alpha_i$ as `coefs` and $-\widehat w_0$ as `rho`, in `svm()`'s sign, positive for `Sacramento`, the class of the first training home; summing `coefs` times the radial kernel over the 147 support vectors, minus `rho`, reproduces `svm()`'s decision values for the test homes (the chapter checks it in a collapsed Code callout)
- **note:** the chapter's `svm-fit` chunk (4 lines of source), verbatim, and its printout verbatim (13 lines with the blank first line; 147 support vectors); ends at 558 px of 720.

# Tuning

- **tag:** transition (0)
- **show:** none (transition slide, title only)
- **say:** the radial kernel has two tuning parameters, `cost` and $\gamma$, chosen together by 10-fold cross-validation over a grid of pairs from the training homes alone; the chosen support vector machine is then evaluated on the test homes, which played no part in fitting or in choosing the pair
- **note:** the chapter's `### Grid` first paragraph and `### Test error` first paragraph, in one sentence.

## 14. Grid

- **tag:** core (2)
- **show:** code — chunk `cv-fit` (`tune(svm, place ~ longitude + latitude, ..., ranges = list(cost = 10^(-1:3), gamma = 10^(-2:3)))`, then `cv_svm$best.parameters`) and its console output
- **words:** none
- **say:** the radial kernel has two tuning parameters, `cost` and $\gamma$, chosen together by 10-fold cross-validation over a grid of pairs; the estimate for each pair is $\text{CV}_{(10)}(\texttt{cost}, \gamma)$, the equal-weight mean of the fold error rates as in the previous lecture; `tune()` takes a list of values for each and fits every pair, here 5 values of `cost` and 6 of $\gamma$, one per factor of 10; `best.parameters` is the pair with the smallest estimate, `cost` = 10 and $\gamma$ = 100
- **note:** the chapter's `### Grid` chunk `cv-fit` (5 lines of source with the comment), verbatim, with its printout (the row number 23 is `tune()`'s). Ends at 301 px. The 5 and 6 are the lengths of the two ranges in the call. The CV display is not on a slide. The chapter's sentence about tuning a polynomial kernel is cut and is not in the notes.

## 15. Grid: CV estimates

- **tag:** core (4)
- **show:** figure — `cv-figure` (the 10-fold estimate for each pair as a heat map, the chosen pair outlined), the figure alone
- **words:** none (no caption: the chapter's cost claim is in the notes)
- **say:** the figure shows the 10-fold estimate for each pair with the chosen pair outlined; the smallest estimate, 1.4%, is at `cost` = 10 and $\gamma$ = 100 (3 pairs share it, and `tune()` takes the first, the smallest `cost` among them); small $\gamma$ (left): each support vector's influence is wide and the boundary nearly linear, too rigid for the city's block, and at the smallest `cost` and $\gamma$ the estimate is 23.3%, within a few percentage points of the linear support vector classifier's smallest estimate, 20.3%; large $\gamma$ (right): each training home makes its own island, the fit overfits, and the estimate rises to at least 11.8% at $\gamma$ = 1000, whatever `cost`, and with the smallest `cost` as well, 47.4%, it is close to the error rate of classifying every home `Other`, 47.3%; **at every $\gamma$, `cost` = 1000 has a smaller estimate than `cost` = 0.1 (the estimate is not monotone in `cost` in between)**: a larger `cost` lets the fit bend further at the price of a narrower margin; the gain is largest where `cost` = 0.1 fails badly, from 31.6% to 1.4% at $\gamma$ = 100 and from 47.4% to 11.8% at $\gamma$ = 1000, against 23.3% to 7.7% at $\gamma$ = 0.01; the fold error rates at the chosen pair have standard deviation 1.6%, so neighboring cells within a percentage point or so of the smallest are not distinguishable
- **note:** the chapter's `cv-figure`, 7 by 4 inches at `height=480`, and its two paragraphs; the values are inline R, quoted from the frozen markdown. **The first draft's one-line caption ("A larger `cost` lowers the estimate at every $\gamma$") is removed**: the chapter now says only that `cost` = 1000 beats `cost` = 0.1 at every $\gamma$, and a figure slide carries no interpreting caption. The slide ends at 595 px. **The title is not a chapter heading** (the figure sits under `### Grid`).

## 16. Test error

- **tag:** core (2)
- **show:** tabset — `test-svc-figure` (Linear) and `test-svm-figure` (Radial): the test homes with each fit's regions and boundary, the misclassified homes crossed, `.fig-tabs`
- **words:** none (the tab titles are the two classifiers)
- **say:** the linear support vector classifier is tuned as in the previous lecture, with `tune()` over `cost` from 0.01 to 100, two values per factor of 10; its estimate, 20.3%, ties at every `cost` from 0.32 to 100, up to floating-point rounding, and `tune()` reports the first exact minimum, `cost` = 1; the tabs show the test homes with the boundaries of that linear support vector classifier and of the support vector machine chosen above, each refit to all the training homes; crosses mark the test homes each misclassifies; the linear boundary is nearly a north-south line: it misclassifies the homes of other cities west of it, north and south of the city's block, and the Sacramento homes east of it; the radial boundary encloses the block, and its few errors lie at the city's edge
- **note:** the chapter's `### Test error` opening paragraph (the new tuning sentence, in the notes) and tabs; 6 by 4.6 inches at 530 px. The title is the chapter's `### Test error`.

## 17. Test error: confusion matrices

- **tag:** core (2)
- **show:** console printout — chunk `test-confusion` (a list of two tables, `$radial` then `$linear`, truth in the rows), then two numbers of the chapter's paragraph
- **words:** "Test error rate: radial 2.3%, linear 22.5%"; "Classifying every test home `Other`: 46.3%"
- **reveal:** none (the printout and the two lines are shown at once)
- **say:** with `Sacramento` as the positive class, the confusion matrices of the test homes are the printouts, with the truth in the rows and the predictions in the columns; the support vector machine misclassifies 2.3% of the 311 test homes and the linear support vector classifier 22.5%, against 46.3% for classifying every test home `Other`
- **note:** the chapter's printout verbatim from the frozen markdown (the chunk's code is not shown: it is `table(...)`, not a model fit); the numbers are inline R. **The title is not a chapter heading** (the matrices sit under `### Test error`), with the usual colon suffix. The first draft revealed the two lines on a click; a printout slide has no fragments, so they are static. The slide ends at 544 px.

# More than two classes

- **tag:** transition (0)
- **show:** none (transition slide, title only)
- **say:** the figure shows the training homes in three classes: the city of Sacramento, the city of Elk Grove, and every other city
- **note:** the chapter's first sentence under `## More than two classes`.

## 18. More than two classes

- **tag:** core (1)
- **show:** figure — `three-figure` (the training homes in three classes: Elk Grove squares, Sacramento triangles, Other circles), the figure alone
- **words:** none
- **say:** all three classes appear: Elk Grove's homes (squares) form a cluster south of Sacramento's (triangles), inside the region the two-class fits gave to `Other` (circles)
- **note:** the chapter's `three-figure` and the sentence after it, 6 by 4.6 inches at `height=560` (14.9 px ticks), 675 px bottom. **New in this revision:** the first draft had no slide for it. The title repeats the part's, as the first slide of a part does.

## 19. One versus one and one versus all

- **tag:** core (1.5)
- **show:** the chapter's two approaches as two short bullets
- **words:** "$K$ classes, $K > 2$:" above the list; then "One versus one: a classifier for each of the $\binom{K}{2}$ pairs of classes; the most votes wins" and "One versus all: $K$ classifiers, class $k$ against all the others; the class with the largest $\widehat{f}_k\left(x^*\right)$"
- **reveal:** the lead line on arrival; one bullet per click (2 clicks, `.incremental`)
- **say:** with $K$ classes, $K > 2$ ($K$ without arguments is the number of classes, as in the classification lectures; the kernel always carries its two arguments); one versus one fits a two-class support vector machine to each of the $\binom{K}{2}$ pairs of classes, using only the training observations of those two classes, a new observation gets one vote from each pair's classifier, for the class on whose side it falls, and is assigned to the class with the most votes; one versus all fits $K$ two-class support vector machines, class $k$ coded 1 against all the others coded $-1$, and assigns a new observation to the class $k$ whose $\widehat f_k(x^*)$ is largest; learning objective 5 is assessed: describe both, and explain how `svm()` votes (the next slide)
- **note:** the chapter's `### One versus one and one versus all`, the two bullets cut to fragments. The slide ends at 252 px.

## 20. Pairwise voting

- **tag:** core (1.5)
- **show:** two statements and console printout — chunk `three-confusion` (3 by 3, truth in the rows), then one number
- **words:** "`svm()`: one versus one whenever the class has more than two levels"; "Confusion matrix of the test homes, three classes: `Elk Grove`, `Other`, `Sacramento`"; then, under the printout, "Test error rate: 2.3%"
- **reveal:** none (the slide is shown at once)
- **say:** `svm()` uses one versus one whenever the class factor has more than two levels, and nothing in the call changes; the fit uses the `cost` and $\gamma$ chosen for two classes, `svm(three ~ longitude + latitude, data = train, kernel = "radial", cost = 10, gamma = 100)`, which fits the 3 pairs (the chapter shows this call and its decision values; there is no slide for it); each column of decision values is one pair's classifier, named `first/second`, a positive value a vote for the first class and a negative one for the second; the third test home gets 2 votes for `Other`, 1 for `Sacramento` and 0 for `Elk Grove`, so it is classified `Other`; counting the votes for each test home gives `predict()`'s class for all 311 of them, with no ties; the printout is the confusion matrix of the test homes in the three classes, truth in the rows; the three-class fit misclassifies 2.3% of the test homes
- **note:** the chapter's `### Pairwise voting` first sentence, the `three-confusion` printout verbatim from the frozen markdown and the closing sentence; the three classes are named on the slide as the instructor asked. The `three-fit` code and the vote count are in the notes only (see Choices (c)); the slide ends at 480 px.

# Hinge and logistic loss

- **tag:** transition (0)
- **show:** none (transition slide, title only)
- **say:** the data are the training homes of the first figure, in two classes, and the classifier is the linear support vector classifier of the Test error section
- **note:** the chapter's sentence under `## Hinge and logistic loss`.

## 21. Loss plus penalty

- **tag:** core (2.5)
- **show:** equation — the chapter's hinge-loss-plus-penalty display, whole before its symbol list
- **words:** "Support vector classifier, without slack variables:" above the display; then "$f(x_i) = w_0 + w^\top x_i$ — fit, with $w = (w_1, \ldots, w_p)^\top$", "$y_i = \pm 1$ — class of observation $i$; $n$ observations, $p$ explanatory variables", "$\max\left[0, 1 - y_if(x_i)\right]$ — hinge loss of observation $i$" and "$\lambda \ge 0$ — ridge penalty's tuning parameter"
- **reveal:** the lead line and the display on arrival, then one bullet per click (4 clicks, `.incremental`)
- **say:** the support vector classifier can be written without slack variables; in the previous lecture's penalty form, minimizing $\tfrac12\|w\|^2 + \texttt{cost}\sum_i\epsilon_i$ subject to $y_i f(x_i) \ge 1 - \epsilon_i$ and $\epsilon_i \ge 0$, with $f(x) = w_0 + w^\top x$, each slack at the solution is the smallest its two constraints allow, $\epsilon_i = \max[0, 1 - y_if(x_i)]$; substituting and dividing by `cost` gives the display; this is ISLR2's form, with its $\beta$ in place of $w$; it is a loss plus a penalty, like ridge regression, and a large `cost` is a small $\lambda$; **this derivation is an assessed result** (learning objective 6 says derive), kept in the notes, not on the slide
- **note:** the chapter's `### Loss plus penalty`; the display is verbatim with its trailing comma, including $\lambda = 1/(2\,\texttt{cost})$. **New in this revision:** the legend defines $f(x_i)$, $w$, $y_i$, $n$ and $p$ (the symbols the first draft left undefined). The slide ends at 493 px. The derivation sentence is in the notes only.

## 22. Logistic loss

- **tag:** core (2.5)
- **show:** figure and equation — `loss-figure` (the hinge loss and the logistic loss against $y_if(x_i)$) with the chapter's negative-log-likelihood display in a right column
- **words:** "Logistic regression, negative log-likelihood:" above the display, in the right column, at 0.8em like the other displays
- **say:** logistic regression with $f(x) = \log[\Pr(Y = 1 \mid x)/\Pr(Y = -1 \mid x)]$ gives $\Pr(Y = 1 \mid x) = 1/(1 + e^{-f(x)})$, so with the $\pm1$ coding the probability of the observed class is $1/(1 + e^{-y_if(x_i)})$ and the negative log-likelihood is the display; adding $\lambda\sum_j w_j^2$ gives ridge-penalized logistic regression; the two classifiers differ only in the loss, a function of $y_if(x_i)$, and the figure plots the two; the two losses have the same shape, large and nearly linear for a misclassified observation, $y_if(x_i) < 0$, and small for one well on its own side; the hinge loss is exactly 0 from $y_if(x_i) = 1$ on, so an observation on or outside the margin contributes nothing and the fit depends only on the support vectors; the logistic loss is positive for every observation, so every observation contributes, the far ones a little; then the chapter's three differences: logistic regression estimates a probability $\Pr(Y = 1 \mid x)$ and the support vector classifier gives only a side and a distance, $\widehat f(x)$, with no probability; when the classes are well separated the support vector classifier's boundary is set by the observations near it only, while logistic regression's estimates are pulled by all of them (and with perfect separation and no penalty do not exist); kernels apply to logistic regression too, but there every training observation gets a nonzero weight, while the support vector machine's sum runs over the support vectors only; **if Comparison is dropped, say** the closing sentences of these notes (the test error rates, 22.2% against 22.5%, the 99.0% agreement, the loss and the penalty both differ, and the probability sentence)
- **note:** the chapter's `### Logistic loss` display (verbatim, trailing period) and `loss-figure` (7 by 4 inches at `height=480`, so 14.7 px ticks). The display sits in a right column (30% of the width, the figure 70% so it keeps its 840 px width) because the figure and the display above it in one column end at 791 px, over the slide; the display is at 0.8em like the other displays, and the column holds it (the slide ends at 619 px). **The title is the chapter's `### Logistic loss`**; the figure is its second half. The chapter's three differences and the Comparison substitute are in the notes only.

## 23. Comparison

- **tag:** optional (2), the first to drop
- **show:** code — chunk `logistic-fit` (`glm()`, its test predictions classified at 0.5, and the test error rate) and its console output (`[1] 0.221865`), then three statements
- **words:** "Logistic regression test error rate: 22.2%; linear support vector classifier: 22.5%"; "The two classify 99.0% of the test homes the same way"; "Logistic regression gives each test home a probability; the support vector classifier does not"
- **reveal:** none (a code slide has no fragments; the three statements are shown at once)
- **say:** logistic regression on the two coordinates, without a penalty, and the linear support vector classifier chosen above, on the same training homes; the logistic regression's test error rate, 22.2%, is about the same as the linear support vector classifier's with `cost` = 1, 22.5%, and the two classify 99.0% of the test homes the same way; they differ here in both the loss and the penalty, so the comparison does not isolate the loss; the 331 training homes on or outside the support vector classifier's margin have zero hinge loss and the other 290 positive hinge loss; those 290 and the 2 homes exactly on the margin are its 292 support vectors, which set its fit; the logistic regression gives each test home a probability, which the support vector classifier does not
- **note:** the chapter's `### Comparison`, chunk `logistic-fit` (6 lines of source with the comment) verbatim; 22.2%, 22.5%, 99.0%, 331, 290, 2 and 292 are inline R, quoted from the frozen markdown (the last four in the notes only). The slide ends at 491 px.

## 24. Conclusion

- **tag:** core (1.5)
- **show:** a flat list of six takeaways, in the order of the lecture, no nesting, no example numbers
- **words:** "Polynomial features curve the boundary, but they are too many"; "A new observation is classified through inner products with the support vectors"; "A kernel replaces the inner product: linear, polynomial, radial"; "The radial kernel is local; $\gamma$ trades bias against variance"; "`cost` and $\gamma$ by cross-validation; judged by the test error rate"; "Hinge loss is zero outside the margin; logistic loss never is"
- **say:** the chapter's `## Conclusion`: the support vector classifier fit to polynomial features draws a hyperplane in the enlarged feature space, a curved boundary in the explanatory variables, but the number of features grows quickly with the number of explanatory variables and the degree; the fitted classifier classifies through its inner products with the support vectors alone; the support vector machine replaces the inner product with a kernel, the linear kernel giving back the support vector classifier, the polynomial kernel of degree $d$ an inner product of polynomial features computed without listing them, and the radial kernel local, classifying a new observation by the support vectors near it; $\gamma$ trades bias against variance, a small $\gamma$ a nearly linear boundary and a large one a boundary that wraps each training observation and overfits; `cost` and $\gamma$ are chosen together by cross-validation over a grid with `tune()`, and the chosen fit is evaluated by its test error rate and confusion matrix against the linear support vector classifier; with more than two classes `svm()` fits one classifier per pair of classes and classifies by vote (one versus one), and one versus all fits one per class against the rest; the support vector classifier minimizes the hinge loss plus a ridge penalty, $\lambda = 1/(2\,\texttt{cost})$, the hinge loss is zero on or outside the margin so only the support vectors matter, and logistic regression's loss is positive for every observation and yields probabilities, which the support vector machine does not; the next lecture begins unsupervised learning with clustering (ISLR2 Chapter 12)
- **note:** the six items are the chapter's `## Conclusion` paragraphs compressed in its order (enlarged features, inner products, kernels, $\gamma$, tuning, the two losses). More than two classes, now core, has no item of its own (the chapter's conclusion has it in one sentence, in the notes; six is the limit), so the list stays within six; the first item's "they" has its antecedent in the notes of Polynomial features whether or not Feature count is shown. The notes omit the chapter's "(or `cost` and the degree)" (see Choices (e)). They do not repeat the agenda item for item and restate no example numbers; the next lecture is in the notes only.
