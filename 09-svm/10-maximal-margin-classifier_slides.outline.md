# Slide outline: Maximal Margin Classifier

(drafted 2026-11-14)

Outline for `10-maximal-margin-classifier_slides.qmd` (Mon 2026-11-16, the first of three lectures on support vector machines; ISLR2 Section 9.1). **This file is the spec; the deck is built from it, and this file describes the deck as it stands.** Edit it freely and ask for the deck to be refreshed.

Drafted against `10-maximal-margin-classifier.qmd`, the deck's `derived-from` comment records the chapter's commit (`ac7908e`). The frozen output `_freeze/09-svm/10-maximal-margin-classifier/execute-results/html.json` is current: its recorded `hash` (`7f81ec3931c57a4995d0c89e67045203`) equals the md5 of the chapter file as it stands, which includes the "Slides for this lecture" link (`10-maximal-margin-classifier_slides.html`) on the line after `# Maximal Margin Classifier`.

**What the deck is.** 34 slides including the title: the agenda, seven transitions, 25 content slides (the last is the Conclusion). The chapter's `## Flea beetles`, `## Hyperplanes`, `## Separating hyperplanes`, `## Maximal margin`, `## Support vectors`, `## Classification` and `## Limitations` are the seven parts (each a transition slide). It reuses 12 of the 16 figures the chapter renders (see "Not in this deck"), the one kable table that is displayed (`refit_table`), and three code slides: the visible chunks `mmc-fit`, `mmc-estimates` and `support-vectors`, each with its console output. The deck has no new content: every `show:` is a figure, table, equation, code chunk or console printout the chapter already has, or a list cut from the chapter's own sentences. The chapter has one running example, `Sleuth3::ex1613` (36 flea beetles, 18 of each species; the class is `Species`, `conc` or `heik`; the explanatory variables are the two joint measurements `Jnt1` and `Jnt2` in micrometers, $p = 2$, with no training and test split).

**Timing.** The instructor has about 25 of the 50 minutes on Mon 2026-11-16, after a variable importance review. **The core slides come to 28.5 minutes** at honest estimates (0.5 + 0.5 + 1 + 1.5 + 1 + 1 + 3 + 0.5 + 1 + 1.5 + 1.5 + 3 + 2 + 2.5 + 1 + 1.5 + 1.5 + 3 + 1 = 28.5, in the order of the lecture: the agenda, entries 1 to 11, 14 to 18, 24 and the Conclusion, entry 25), which is 3.5 minutes over the 25 available; Signed distance (derivation is an objective), Optimization problem and Sensitivity are 3 minutes each, Estimates 2.5 and Estimates in R 1 (4 together with the optional half minute below). To reach 25 the plan is, in the room, to state the Signed distance result without deriving it (3 to 1.5), to run Class coding and Separation condition together, and to hold Sensitivity to 2; none of this changes the slides. **The optional slides and parts add 9 minutes** (Best offset 1.5, the Classification part 3, Best direction 1, Refits 1.5, the interpretation of the estimates on Estimates in R 0.5, Non-separable classes 1.5), 37.5 for the whole deck; the chapter itself is about 45 to 50 minutes as written. **Drop order, the first to drop first:** (1) Best offset (entry 12), (2) the Classification part (entries 20 to 22: New beetles, Sign rule, Confidence), (3) Best direction (entry 13), (4) Refits (entry 19), (5) the interpretation of the three estimates on Estimates in R (0.5; the slide stays), (6) Non-separable classes (entry 23). **Each substitute sentence is in the speaker notes** of the slide named, marked "if X is dropped, say": Best offset on Optimization problem (the best offset is midway, the margin half the gap), Best direction on Fitting (a quadratic program finds the maximal margin hyperplane; the angle search is a picture of it), the Classification part on Estimates in R (classify by the sign of $\widehat f$, the distance is the confidence), Refits on Identification (the two sentences on deleting an ordinary observation and a support vector), and Non-separable classes at the start of Sensitivity (the overlap sentence: `Jnt1` alone, 17 beetles overlap from 184 to 201 micrometers, `Jnt2` alone from 115 to 131), which is also the evidence for the Conclusion's line on overlapping classes. The agenda lines to skip, in drop order, are in the agenda's notes. The Best direction notes begin with a one-line recall of the gap and of the midway hyperplane, so that the slide stands when only Best offset is dropped; the Fitting notes say what `beetles`, `beta_hat` and `M_hat` are for the code slides. **Hand-off to the next lecture:** the Limitations part (non-separable classes, sensitivity) motivates the support vector classifier. The Sensitivity slide, the last core content slide before the Conclusion, keeps the chapter's three tabs and says, in its `say:`, that the next lecture continues from them; the Conclusion's last line names the next lecture.

**Code slides.** The three code slides are entries 14 (`mmc-fit`), 16 (`mmc-estimates`) and 18 (`support-vectors`). Each shows the chunk's source copied verbatim from the chapter (without the `#|` lines) in a ` ```r ` block, which is not executed, followed by the chunk's console output copied verbatim from the frozen markdown (with its trailing spaces and the blank first line of the `svm()` printout) in a plain ` ``` ` block. Nothing is trimmed, including the comments. All three are at the deck's normal code size; the tallest, `support-vectors` (10 lines of source, 4 of output, with two lines above), ends at 623 px of 720, and `mmc-fit` (5 lines of source, 13 of output) at 587 px. The chapter's chunk `new-predict` (`predict(mmc_fit, new_beetles)`) is not shown (see "Not in this deck").

**Not in this deck.** Every collapsed `### Code` callout (all plot code, `mmc-checks`, `support-check`, `refit-table`, `new-plot`, `sensitivity-plot`, `strip-plot`); the chapter's `### For example,` callout (the distance of beetle 1 from the example line) and its `### Beyond this course` callout (the hard-margin SVM); the visible chunk `beetles` (the 18 and 18 are on the Flea beetles slide); the visible chunk `new-predict` (it predicts the classes of the two new beetles, in the speaker notes of Sign rule; it is not a model fit and is in an optional part); the first tab of each of the chapter's tabsets that only repeats the beetle plot (`hyperplane-data-figure`, `separating-data-figure`), the chapter's `one-line-figure` (the middle separating line, the first tab of the Maximal margin tabs) and `support-figure` (the chapter's repeat of `mmc-figure` under `## Support vectors`, which the Fitted hyperplane slide already shows).

**Display punctuation.** Every display keeps the chapter's trailing comma or period (the bullets that follow play the part of the chapter's "where"); `\hat` is written `\widehat` throughout, including in the Refits table's header. The one display that is not the chapter's wording is the Class coding cases ("in one class", "in the other class", for the chapter's "in the first class", "in the second class"), changed at the instructor's request; the chapter's wording is unchanged.

**Response variable and explanatory variables.** The class is `Species`; the explanatory variables are `Jnt1` and `Jnt2`, $p = 2$, and each feature is an explanatory variable.

**Figure legibility.** Effective tick size is 8.8/72 times the display height in px over the figure height in inches (14 px or more is the target); every reused figure is at 14.5 px or more. The figure PNGs are those rendered with the current chapter (1536 px wide at 192 dpi, so 8 inches wide and 4.4 inches tall for all but three: `direction-figure` is 7 by 3.6, `mmc-zoom-figure` 7 by 4.4 and `strip-figure` 8 by 2.4); the display heights were measured in the rendered deck (layout px at 16:9, before reveal's scaling). The grid lines of the figures are even.

| Figure | Height (in) | Display height (px) | Tick (px) |
|:--|--:|--:|--:|
| `beetle-figure`, `new-figure` (`height=560`) | 4.4 | 560 | 15.6 |
| `hyperplane-figure`, `separating-figure`, `margin-one-figure` (`height=520`, a line below each) | 4.4 | 520 | 14.5 |
| `mmc-figure`, `mmc-zoom-figure` (tabs, `.mid-tabs`) | 4.4 | 520 | 14.5 |
| `sensitivity-all-figure`, `sensitivity-without-figure`, `sensitivity-added-figure` (tabs, `.mid-tabs`) | 4.4 | 520 | 14.5 |
| `direction-figure` (`height=440`) | 3.6 | 440 | 14.9 |
| `strip-figure` (`height=290`) | 2.4 | 290 | 14.8 |

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
- **words:** Flea beetles; Hyperplanes (Equation, Sides, Signed distance); Separating hyperplanes (Class coding, Separation condition, Non-uniqueness); Maximal margin (Margin, Optimization problem, Best offset, Best direction, Fitting, Estimates); Support vectors (Identification, Refits); Classification (Sign rule, Confidence); Limitations (Non-separable classes, Sensitivity)
- **say:** distilled from the chapter's five learning objectives (hyperplane, normal vector, sides, signed distance; class coding, separating condition, non-uniqueness; margin, maximal margin hyperplane, the optimization problem, the best offset; the `svm()` fit, estimates, support vectors; classifying and confidence, and the two limitations); the callouts are not in the agenda; the chapter's introduction (the maximal margin classifier cuts the space of the explanatory variables in two with a flat boundary, a hyperplane, as far as possible from the observations of both classes; ISLR2 Section 9.1; the first of three lectures on support vector machines); the timing and the drop order of this outline are in the notes; the notes also list the agenda lines to skip when optional slides are dropped, in drop order (Best offset; Classification with Sign rule and Confidence; Best direction; Refits; Non-separable classes)
- **note:** the list names every part and every `###` the deck spends slides on, including the optional ones (they are in the deck); the figure slides without a chapter heading (Flea beetles: plot, Sides: beetles, Fitted hyperplane, Classification: new beetles) and Estimates in R are not listed, as in the Boosting deck. Three columns, 9, 7 and 9 lines, aligned at the top (the stylesheet's `.reveal .columns { align-items: flex-start; }`, differing from the Boosting deck's `center`, so a short column does not float); the lowest line ends at 523 px of 720.

# Flea beetles

- **tag:** transition (0)
- **show:** none (transition slide, title only)
- **say:** the chapter's Question: two species of flea beetle are very similar; can two measurements of a beetle's joints separate the species with a straight line, and if so, which line?
- **note:** relies on the chapter's `**Question.**` paragraph under `## Flea beetles`.

## 1. Flea beetles

- **tag:** core (0.5)
- **show:** none, a words-only data slide: two blocks of bullets with white space between them
- **words:** "Class: `Species` (`conc`, `heik`)" and "Explanatory variables ($p = 2$):" with the sub-bullets "`Jnt1`: first joint" and "`Jnt2`: second joint"; then, after a gap, "Beetles: 36 (18 `conc`, 18 `heik`)"
- **say:** `Sleuth3::ex1613` records two measurements, in micrometers, of each of 36 beetles from two very similar species (`conc` and `heik`); the data come from a 1962 study of discriminant functions in taxonomy by Lubischew; the observations are beetles, each species is a class and the two explanatory variables are the features; the class is coded $y = 1$ for `heik` and $y = -1$ for `conc` (defined on the Class coding slide); the count of 18 of each species is the chapter's `count(beetles, Species)`
- **note:** the chapter's `**Data.**` paragraph and its `beetles` chunk output as a data layout, at 0.7em, the second block set off by a 1em top margin; there is no test set, so the last block is the number of beetles. $p = 2$ is stated on the "Explanatory variables" line because $p$ is used on later slides. 36, 18 and 18 are inline R or console output, quoted from the frozen markdown. The title is the chapter's `## Flea beetles`, the same as its transition.

## 2. Flea beetles: plot

- **tag:** core (1)
- **show:** figure — `beetle-figure` (the beetles by `Jnt1` and `Jnt2`, color and shape by species), the figure alone
- **words:** none
- **say:** the `conc` beetles sit up and to the left, with shorter first joints and longer second joints, and the `heik` beetles down and to the right; neither measurement alone separates the species (`Jnt1` runs from 160 to 201 micrometers in `conc` and from 184 to 242 in `heik`); together they do, with a narrow gap between the two clouds running from lower left to upper right; the measurements are whole micrometers and 2 pairs of beetles of the same species share both measurements, so 34 distinct points are visible
- **note:** the chapter's `beetle-figure`, 8 by 4.4 inches, at `height=560`; the values are inline R, quoted from the frozen markdown. **The title is not a chapter heading** (the figure sits under `## Flea beetles`, which is the title of the data slide); it follows the "plot" suffix of the instructor's earlier decks.

# Hyperplanes

- **tag:** transition (0)
- **show:** none (transition slide, title only)
- **say:** this part defines a hyperplane, says which side of it a point is on, and gives the distance from a point to it
- **note:** a one-sentence preview of `## Hyperplanes` (`### Equation`, `### Sides`, `### Signed distance`); the chapter has no sentence for it, and the same preview is given in the other transitions' `say:`.

## 3. Equation

- **tag:** core (1.5)
- **show:** equation — the chapter's hyperplane display, with a symbol legend and the dimension line
- **words:** the lead "Hyperplane in $p$ dimensions: the points $X = (X_1, \ldots, X_p)^\top$ with"; "$X_j$ — value of feature $j$, $j = 1, \ldots, p$"; "$\beta_0$ — intercept"; "$\beta = (\beta_1, \ldots, \beta_p)^\top$, not all zero — normal vector"; then, after a gap, "Dimension $p - 1$: a line when $p = 2$, a plane when $p = 3$"
- **reveal:** on arrival: the lead and the display; click 1: the legend; click 2: the dimension line
- **say:** the hyperplane is the set of points $X$ that satisfy the equation, where $X_j$ is the value of feature $j$, $\beta_0$ the intercept and $\beta$, not all zero, the normal vector; it is a flat affine subspace of dimension $p - 1$: a point when $p = 1$, a line when $p = 2$, a plane when $p = 3$; with the beetles $p = 2$, $X_1$ is `Jnt1` and $X_2$ is `Jnt2`; the normal vector is perpendicular to the hyperplane: if $x$ and $x'$ both lie on it, subtracting their equations gives $\beta^\top(x - x') = 0$; the next slides draw one line through the beetles, with $\beta_0 = -70$, $\beta_1 = 1$ and $\beta_2 = -1$
- **note:** the display is the chapter's, at 0.8em, with its trailing comma; the lead is the chapter's "A hyperplane in $p$ dimensions is the set of points ... that satisfy" cut; the legend is the chapter's three-bullet symbol list cut to labels, and the dimension line is the chapter's "flat affine subspace of dimension $p - 1$" sentence cut. The title is the chapter's `### Equation`. The perpendicularity derivation is in `say:` only.

## 4. Sides

- **tag:** core (1)
- **show:** equation — the chapter's display of $f(x)$, with three lines
- **words:** the lead "For any point $x = (x_1, \ldots, x_p)^\top$, write"; "$f(x) = 0$: the hyperplane"; "$f(x) > 0$: the side $\beta$ points toward"; "$f(x) < 0$: the other side"
- **reveal:** on arrival: the lead and the display; click 1: the three lines
- **say:** for any point $x$, write $f(x) = \beta_0 + \beta^\top x$, where $x_j$ is the $j$th coordinate of $x$; training observation $i$, from the next section on, is $x_i$ with $j$th coordinate $x_{ij}$: a single subscript $j$ on a generic point $x$ names a coordinate and a single subscript $i$ names an observation; the hyperplane is the set where $f(x) = 0$, and it divides the space in two, $f(x) > 0$ on the side $\beta$ points toward and $f(x) < 0$ on the other
- **note:** the display is the chapter's, at 0.8em, with its trailing comma; the three lines are the chapter's "The hyperplane is the set where $f(x) = 0$ ..." sentence cut. The title is the chapter's `### Sides`.

## 5. Sides: beetles

- **tag:** core (1)
- **show:** figure — `hyperplane-figure` (the beetles, the line $-70 + \texttt{Jnt1} - \texttt{Jnt2} = 0$ with the region where $f > 0$ shaded and the regions labeled $f(x) < 0$ and $f(x) > 0$), with one line of values below it
- **words:** one line below the figure: "$\beta_0 = -70$, $\beta_1 = 1$, $\beta_2 = -1$"
- **say:** the chapter's second Hyperplanes tab: the beetles and one line drawn through them, with one side shaded; the line has $\beta_0 = -70$, $\beta_1 = 1$ and $\beta_2 = -1$; $f$ is positive in the shaded region below the line, where `Jnt1` exceeds `Jnt2` by more than 70 micrometers, and negative above it; beetles of both species lie on both sides of this line
- **note:** the chapter's `hyperplane-figure` (the second tab of its first tabset), 8 by 4.4 inches, at `height=520` so that the line of values fits below it (the slide ends at 688 px of 720); the line is the chapter's "the line in the second tab has $\beta_0 = -70$, $\beta_1 = 1$, and $\beta_2 = -1$" cut to the values (a caption the figure cannot show). **The title is not a chapter heading** (the figure is the chapter's tabset before its `### Equation`); the first tab (`hyperplane-data-figure`, the beetles again) is not used. The figure follows the Sides slide, so its $f(x) < 0$ and $f(x) > 0$ labels are already defined.

## 6. Signed distance

- **tag:** core (3)
- **show:** equation — the chapter's display of the signed distance $t$, with two lines
- **words:** "$t$ — signed distance from $x$ to the hyperplane; its sign gives the side"; then, after a gap, "Unit normal vector, $\|\beta\|^2 = \sum_{j=1}^p \beta_j^2 = 1$: $t = f(x)$"
- **reveal:** on arrival: the display; click 1: the first line; click 2: the unit-normal line
- **say:** let $x_0$ be the point of the hyperplane closest to $x$; then $x - x_0$ is perpendicular to the hyperplane, so $x - x_0 = t\,\beta/\|\beta\|$ for some number $t$, where $|t|$ is the distance from $x$ to the hyperplane; because $f(x_0) = 0$, $f(x) = f(x) - f(x_0) = \beta^\top(x - x_0) = t\,\beta^\top\beta/\|\beta\| = t\,\|\beta\|$, so $t = f(x)/\|\beta\|$; multiplying $\beta_0$ and $\beta$ by the same nonzero number leaves the hyperplane unchanged, so they can always be scaled to $\|\beta\|^2 = 1$; with this unit normal vector $t = f(x)$: $f(x)$ itself is the signed distance (the derivation is an objective, so 3 minutes; stating the result and skipping the derivation takes about 1.5)
- **note:** the display is the chapter's second display of `### Signed distance` (the first, $f(x) = \ldots = t\,\|\beta\|$, is the derivation and is in `say:` only), at 0.8em, with its trailing comma; the legend is the chapter's "where $t$, whose sign gives the side, is the signed distance" cut; the last line is the chapter's "With this unit normal vector, $t = f(x)$". The chapter's `### For example,` callout (beetle 1 against the line) is not used. The title is the chapter's `### Signed distance`.

# Separating hyperplanes

- **tag:** transition (0)
- **show:** none (transition slide, title only)
- **say:** the chapter's tabs show the beetles and then three lines drawn through them, each named in the legend by the angle of its normal vector; this part says what it means for a hyperplane to separate the classes, and shows that when it can, it can in many ways
- **note:** relies on the chapter's tab description under `## Separating hyperplanes` and a one-sentence preview of `### Class coding`, `### Separation condition`, `### Non-uniqueness`.

## 7. Class coding

- **tag:** core (0.5)
- **show:** equation — the chapter's cases display of $y_i$ (the wording "in the first class" and "in the second class" is changed to "in one class" and "in the other class", so that no class is called first or second; the chapter's own wording is unchanged), with two lines
- **words:** "$i = 1, \ldots, n$ — training observation, with features $x_i = (x_{i1}, \ldots, x_{ip})^\top$"; "Beetles: $y_i = 1$ for `heik`, $y_i = -1$ for `conc`; $n = 36$, $p = 2$"
- **reveal:** on arrival: the display; click 1: the two lines
- **say:** for two classes, code the class of observation $i$ as in the display, 1 for one class and $-1$ for the other, where $i = 1, \ldots, n$ indexes the $n$ training observations with features $x_i$; the coding is for the geometry, not a response for regression: the sign of $y_i$ says which side of the hyperplane observation $i$ belongs on; which class gets 1 is arbitrary; for the beetles $y_i = 1$ for `heik` and $y_i = -1$ for `conc` (the column `y`), $n = 36$ and $p = 2$
- **note:** the display is the chapter's, at 0.8em, with its trailing comma; the lines are the chapter's "where $i = 1, \ldots, n$ ..." and "For the beetles ..." cut. $n = 36$ is inline R, quoted from the frozen markdown. The title is the chapter's `### Class coding`.

## 8. Separation condition

- **tag:** core (1)
- **show:** equation — the chapter's combined separating condition, with two lines
- **words:** "$y_i = 1$ needs $f(x_i) > 0$; $y_i = -1$ needs $f(x_i) < 0$"; "Separable: some hyperplane satisfies this"
- **reveal:** on arrival: the display; click 1: the two lines
- **say:** a hyperplane separates the classes when every observation with $y_i = 1$ has $f(x_i) > 0$ and every observation with $y_i = -1$ has $f(x_i) < 0$; with the $\pm 1$ coding the two conditions are one, the display; the classes are separable when some hyperplane satisfies this; a separating hyperplane gives a classifier: assign a point $x$ to the class of the sign of $f(x)$
- **note:** the display is the chapter's, at 0.8em, with its trailing period; the two lines are the chapter's first sentence of `### Separation condition` and "The classes are **separable** when some hyperplane satisfies this", cut. The title is the chapter's `### Separation condition`.

## 9. Non-uniqueness

- **tag:** core (1.5)
- **show:** figure — `separating-figure` (the beetles with three separating lines, named in the legend by the angle of the normal vector, $-70^\circ$, $-66^\circ$, $-64^\circ$), with one line below it
- **words:** one line below the figure: "Legend: direction of $\beta = (\cos\theta, \sin\theta)^\top$, by its angle $\theta$ from the `Jnt1` axis"
- **say:** the figure is the chapter's second Separating hyperplanes tab; each of the three lines has every `heik` beetle on one side and every `conc` beetle on the other; when the classes are separable a separating hyperplane can be shifted a little, or rotated a little, and still separate them, because each strict inequality $y_i f(x_i) > 0$ still holds after a small enough change in $\beta_0, \ldots, \beta_p$; so there are infinitely many separating hyperplanes; the legend names the direction of the normal vector $\beta$ of each line by its angle $\theta$ from the `Jnt1` axis, $\beta = (\cos\theta, \sin\theta)^\top$, in degrees; the three lines have normal vectors at angles $-70$, $-66$ and $-64$ degrees from the `Jnt1` axis, and every angle between $-71.6$ and $-63.4$ degrees gives some separating line through the gap; a classifier needs a rule for picking one
- **note:** the chapter's `separating-figure` (the second tab of its second tabset), 8 by 4.4 inches, at `height=520` so that the line fits below it (the slide ends at 684 px; the tick is 14.5 px); the values are inline R, quoted from the frozen markdown; the first tab (`separating-data-figure`) is not used. The title is the chapter's `### Non-uniqueness`. The legend names the angle of the normal vector, which the chapter defines (with $\beta = (\cos\theta, \sin\theta)^\top$ for $p = 2$) under `## Maximal margin`, Best direction; the `say:` of this slide gives the definition, so the later angles ($-66^\circ$ on Margin, $-68.2^\circ$ on Estimates in R) make sense without the optional Best direction slide.

# Maximal margin

- **tag:** transition (0)
- **show:** none (transition slide, title only)
- **say:** this part defines the margin, writes the optimization problem that picks the separating hyperplane with the largest margin, fits it with `e1071::svm()` and reads off its estimates
- **note:** a one-sentence preview of `## Maximal margin`.

## 10. Margin

- **tag:** core (1.5)
- **show:** figure — `margin-one-figure` (the middle separating line, at $-66^\circ$, with dashed lines parallel to it through the closest beetles, circled), with one line below it
- **words:** one line below the figure: "Margin $= \min_i y_i f(x_i)$, with a unit normal vector"
- **say:** the chapter's second Maximal margin tab: the middle line of the three, at $-66$ degrees from the `Jnt1` axis (the angle of the Non-uniqueness legend), with dashed lines parallel to it through the beetles closest to it; the margin of a separating hyperplane is the smallest distance from it to any training observation; with a unit normal vector $y_i f(x_i)$ is the distance from $x_i$ to the hyperplane (positive, since the hyperplane separates), so the margin is $\min_i y_i f(x_i)$; the line has a margin of 0.35 micrometers, set by the circled beetles (13 and 35), and no beetle lies between the dashed lines; the maximal margin hyperplane is the separating hyperplane with the largest margin, and the maximal margin classifier classifies by the side of it a point is on; it is the separating hyperplane farthest from the training observations of both classes, so it has the most room for a new observation to fall near the training observations of its class and still be classified correctly
- **note:** the chapter's `margin-one-figure` (the second tab of its Maximal margin tabset), 8 by 4.4 inches, at `height=520` so that the line fits below it (the slide ends at 688 px); the line is the chapter's "so the margin is $\min_i y_i f(x_i)$" cut; the first tab (`one-line-figure`) is not used. The values (0.35, 13 and 35) are inline R, quoted from the frozen markdown. The title is the chapter's `### Margin`. The definition of the maximal margin hyperplane is the lead line of the next slide.

## 11. Optimization problem

- **tag:** core (3)
- **show:** equation — the chapter's optimization problem (aligned, three lines), with a lead line and three lines of legend
- **words:** the lead "Maximal margin hyperplane: the separating hyperplane with the largest margin"; "$M$ — margin"; "$\sum_j \beta_j^2 = 1$: $\beta_0 + \beta^\top x_i$ is the signed distance from $x_i$ to the hyperplane"; "$y_i\left(\beta_0 + \beta^\top x_i\right) \ge M$: observation $i$ on its own class's side, at distance at least $M$"
- **reveal:** on arrival: the lead and the display; clicks 1 to 3: the three legend lines (the list is `.incremental`, checked in the rendered deck: three fragments in this order)
- **say:** the maximal margin hyperplane solves the problem in the display, where $M$ is the margin; the constraint $\sum_j \beta_j^2 = 1$ makes $\beta$ a unit vector, so $\beta_0 + \beta^\top x_i$ is the signed distance from $x_i$ to the hyperplane, and without it multiplying $\beta_0$ and every $\beta_j$ by 2 would double the left side of the second constraint without moving the hyperplane, and $M$ could be made as large as desired; the constraint $y_i(\beta_0 + \beta^\top x_i) \ge M$ then says that observation $i$ is on its own class's side, at distance at least $M$; maximizing $M$ pushes that smallest distance, the margin, as high as it can go; when the classes are separable the solution has $M > 0$ and every observation is on the correct side; **if Best offset is dropped, say:** for a fixed normal vector $\beta$, the best $\beta_0$ puts the hyperplane midway between the two classes, and the margin is then half the gap between them
- **note:** the display is the chapter's, at 0.8em, with its trailing comma; the lead is the chapter's "The **maximal margin hyperplane** is the separating hyperplane with the largest margin"; the legend is the chapter's three-bullet list (the third bullet, "Maximizing $M$ ...", is in `say:` only) cut to labels, the first, "where $M$ is the margin", added from the sentence after the display; the legend uses a colon after an inequality or equation so that a dash is not read as a minus. The slide ends at 573 px. It is 3 minutes: the three constraints are explained one click at a time. The title is the chapter's `### Optimization problem`.

## 12. Best offset

- **tag:** optional (1.5)
- **show:** equation — the chapter's two displays of `### Best offset` (the bound $2M \le \Delta(\beta)$ and the midway $\beta_0$), with a legend line and a closing line
- **words:** the lead "Fixed unit normal vector $\beta$:"; "$\Delta(\beta)$ — gap between the classes along $\beta$"; "Best hyperplane: midway between the classes, margin $\Delta(\beta)/2$"
- **reveal:** on arrival: the lead and the first display; click 1: the legend line; click 2: the second display and the closing line
- **say:** fix the unit normal vector $\beta$ and ask which $\beta_0$ is best; the constraints split by class, $\beta_0 + \beta^\top x_i \ge M$ when $y_i = 1$ and $-\beta_0 - \beta^\top x_i \ge M$ when $y_i = -1$, and both hold for all $i$ exactly when $M \le \beta_0 + \min_{i: y_i = 1}\beta^\top x_i$ and $M \le -\beta_0 - \max_{i: y_i = -1}\beta^\top x_i$; adding the two inequalities removes $\beta_0$, giving the first display, where $\Delta(\beta)$ is the gap between the classes along $\beta$, the distance, measured along $\beta$, between the closest observations of the two classes; equality holds when the two bounds are equal, at the second display; so for a given normal vector the best hyperplane sits midway between the classes and its margin is $\Delta(\beta)/2$; the classes are separable along $\beta$ exactly when $\Delta(\beta) > 0$; the three lines of the Non-uniqueness figure were placed this way
- **note:** the two displays are the chapter's, at 0.8em; the first keeps its trailing comma and the second its period; the chapter's first display (the constraints split by class) is in `say:` only. The legend and the closing line are the chapter's "where $\Delta(\beta)$ is the **gap** ..." and "So for a given normal vector, the best hyperplane sits midway ..." cut. The title is the chapter's `### Best offset`. First in the drop order (a derivation); its substitute sentence is in the `say:` of Optimization problem.

## 13. Best direction

- **tag:** optional (1)
- **show:** figure — `direction-figure` (the margin of the midway hyperplane against the angle $\theta$ of the normal vector, with the three lines of the Non-uniqueness figure labeled and the peak circled), the figure alone
- **words:** none
- **say:** what remains is to choose the direction of $\beta$ to make the gap largest; with $p = 2$ a unit normal vector is $\beta = (\cos\theta, \sin\theta)^\top$ for an angle $\theta$, so the search is over one number; the figure plots the margin $\Delta(\beta)/2$ of the midway hyperplane against $\theta$, for every angle at which the beetles are separable; the margin rises to a single peak, circled, at $\theta = -68.2$ degrees, with margin 0.65 micrometers, and the three labeled points are the three lines of the Non-uniqueness figure, at $-70$, $-66$ and $-64$ degrees; with more features the direction cannot be searched on a grid, and the problem is solved as a quadratic program, which `e1071::svm()` does; the notes begin with a one-line recall of the gap $\Delta(\beta)$ (the distance, measured along $\beta$, between the closest observations of the two classes, the distance between their closest points projected on the direction $\beta$) and of the midway hyperplane (halfway between them, margin $\Delta(\beta)/2$), so that the slide stands when Best offset is dropped
- **note:** the chapter's `direction-figure`, 7 by 3.6 inches, at `height=440`; the values are inline R, quoted from the frozen markdown. The title is the chapter's `### Best direction`. Third in the drop order; its substitute sentence is in the `say:` of Fitting. The Estimates in R `say:` names its peak (the $-68.2$ degrees and 0.65 micrometers of the estimates), and is simply read without that sentence when this slide is dropped.

## 14. Fitting

- **tag:** core (2)
- **show:** code — the chapter's `mmc-fit` chunk (`svm()` with a linear kernel and `cost = 1e5`) and its printout
- **words:** none
- **say:** `e1071::svm()` with `kernel = "linear"` fits a hyperplane in the features; `cost` is a penalty on observations that fall inside the margin or on the wrong side of the hyperplane, and a very large `cost` forbids them, so on separable data the fit is the maximal margin hyperplane; the next lecture explains `cost`; `scale = FALSE` keeps both features in micrometers, so the margin is a distance in micrometers, whereas `svm()` by default standardizes each feature, which changes the distances and so changes which hyperplane has the largest margin; `tolerance` tightens the solver's stopping rule (its default is `1e-3`) so that the estimates are accurate to more digits than are printed; the printout gives the settings and the number of support vectors, 3, defined below; the objects the code slides use: `beetles` is the data frame of the 36 beetles, with the species coded in the column `y` (heik = 1, conc = -1) and `Specimen` the row number, and `beta_hat` and `M_hat` are computed on the Estimates in R slide (core), before Identification uses them; **if Best direction is dropped, say:** with a few more features the direction of $\beta$ cannot be searched on a grid, and the problem is solved as a quadratic program, which `e1071::svm()` does; with $p = 2$ the margin plotted against the angle of $\beta$ has a single peak, which is what the quadratic program finds
- **note:** the chunk (5 lines with a comment) and its 13-line output (including the blank first line and the trailing spaces) are copied verbatim, at the normal code size; the slide ends at 587 px. The title is the chapter's `### Fitting`.

## 15. Estimates

- **tag:** core (2.5)
- **show:** equation — the chapter's display that undoes the rescaling, with two lines
- **words:** "$w_0 = \beta_0/M$, $w = \beta/M$: rescaled, so $\|w\| = 1/M$ and $y_i\left(w_0 + w^\top x_i\right) \ge 1$"; "$\widehat w_0$ is `rho`; $-\widehat w$ is the weighted sum of the support vectors (rows of `SV`, weights `coefs`)"
- **reveal:** on arrival: the display; click 1: the two lines
- **say:** `svm()` does not report $\widehat\beta_0, \ldots, \widehat\beta_p$ directly; it solves the same problem in a rescaled form; dividing the unit-norm $\beta_0$ and $\beta$ by $M$, write $w_0 = \beta_0/M$ and $w = \beta/M$, then $\|w\| = 1/M$ and the constraints become $y_i(w_0 + w^\top x_i) \ge 1$; maximizing $M$ is the same as minimizing $\|w\|$ subject to these constraints, the form `svm()` solves; undoing the rescaling gives the display; $\widehat w_0$ and $\widehat w$ are the versions with `heik`, coded $y = 1$, on the positive side; `svm()` works in its own sign, in which its decision values are positive for the class of the first training observation, here `conc`, so the code checks the sign: it stores the weighted sum of the support vectors, which is $-\widehat w$, and `rho`, which is $\widehat w_0$; the next slide computes the estimates this way
- **note:** the display is the chapter's, at 0.8em, `\hat` written `\widehat`, with its trailing commas and period; the two lines are the chapter's rescaling sentences and its sign sentence cut to labels. The title is the chapter's `### Estimates`, the same as the next slide's prefix.

## 16. Estimates in R

- **tag:** core (1, plus 0.5 optional for the interpretation of the estimates)
- **show:** code — the chapter's `mmc-estimates` chunk (with its two-line comment, "# w and w0 with heik on the positive side (svm() makes the class of the" and "# first beetle, conc, positive).") ($w$, $w_0$, the unit-norm estimates and the margin) and its output `beta0 45.4025`, `Jnt1 0.3714`, `Jnt2 -0.9285`, `M 0.6499`
- **words:** none
- **say:** the chunk recovers the unit-norm estimates and the margin from the fit; **interpretation of the estimates (optional, about half a minute; skip it if short of time):** $\widehat\beta_0$ is in micrometers, and $\widehat\beta_1$ and $\widehat\beta_2$ are micrometers of distance per micrometer of a feature; $\widehat\beta_0 = 45.40$ is $\widehat f$ at the origin, a beetle with both joints of length 0: the origin lies 45.40 micrometers from the hyperplane on the `heik` side, far outside the data; $\widehat\beta_1 = 0.37$: one more micrometer of first joint increases the beetle's signed distance $\widehat f$ by 0.37 micrometers; $\widehat\beta_2 = -0.93$: one more micrometer of second joint decreases it by 0.93 micrometers; the squares of the two sum to 1, and the normal vector's angle from the `Jnt1` axis, $-68.2$ degrees ($\widehat\beta = (\cos\theta, \sin\theta)^\top$ with $\theta = -68.2$), and the margin $\widehat M = 0.65$ micrometers are those of the peak of the chapter's grid search over angles (the Best direction slide, if taught); refitting with a `cost` 100 times larger gives the same estimates to six decimal places; **if the Classification part is dropped, say:** a new beetle is classified by the sign of $\widehat f$ at its measurements, to `heik` if positive and to `conc` if negative, and $|\widehat f|$ is its distance from the hyperplane in micrometers, so the larger it is the more confident the classification; it ranks confidence but is not a probability
- **note:** the chunk (10 lines with comments and blanks, the longest 71 characters) and its 3-line output are copied verbatim, at the normal code size, with the output's trailing spaces; the slide ends at 415 px. The interpretation of the estimates is in `say:` only. The title is the chapter's `### Estimates` with the "in R" suffix of the Boosting deck. The `say:` sentence about the peak refers to the optional Best direction slide (see Timing).

## 17. Fitted hyperplane

- **tag:** core (1.5)
- **show:** tabset, the chapter's own tabs: "Maximal margin hyperplane" (`mmc-figure`) and "Gap" (`mmc-zoom-figure`)
- **words:** none
- **say:** the fitted values $\widehat f(x_i)$ are the signed distances of the beetles from the hyperplane; the first tab shows the maximal margin hyperplane (solid), the margins at $\widehat f(x) = \pm\widehat M$ (dashed) and the beetles on the margins circled, and the second tab zooms in on the gap; the margin is 0.65 micrometers, less than the 1-micrometer resolution of the measurements, so the species are separable but only just; the next part is about the circled beetles
- **note:** the chapter's `### Estimates` tabs, an 8 by 4.4 inch and a 7 by 4.4 inch figure, shown with `.mid-tabs` (`max-height: 520px`); the values are inline R, quoted from the frozen markdown. **The title is not a chapter heading** (the tabs sit under `### Estimates`, whose title the previous two slides use); the tab names are the chapter's. The slide ends at 695 px of 720, the lowest in the deck, as in the Boosting deck's tabs at 520 px.

# Support vectors

- **tag:** transition (0)
- **show:** none (transition slide, title only)
- **say:** the circled beetles of the previous figure are the support vectors; this part identifies them and says what the fitted hyperplane depends on
- **note:** relies on the opening sentence of the chapter's `## Support vectors` ("this section is about the circled beetles"); the chapter repeats `mmc-figure` as `support-figure` there, which the deck does not repeat.

## 18. Identification

- **tag:** core (1.5)
- **show:** code — the chapter's `support-vectors` chunk (signed distance of each beetle, and the beetles on the margin) and its printout (beetles 5, 13, 35), with two lines above it
- **words:** two lines above the code: "Support vectors: observations on the margin, $y_i \widehat f(x_i) = \widehat M$" and "The fitted hyperplane depends on the training data only through them"
- **say:** the support vectors are the training observations on the margin, those with $y_i \widehat f(x_i) = \widehat M$; they are vectors in $p$-dimensional space and they support the hyperplane in the sense that if any of them moved, the hyperplane would move; for the beetles they are 3 beetles, 5 (`conc`), 13 (`conc`) and 35 (`heik`); the two `conc` support vectors lie on the dashed line on the `conc` side and the `heik` one on the other, so the margin cannot grow without one of them crossing it; the fitted hyperplane depends on the training data only through the support vectors: the constraint of any other observation holds with room to spare at the solution, so deleting it, or moving it anywhere that keeps it outside the margin, leaves the solution unchanged, while deleting a support vector removes a constraint that was holding the margin down and the solution changes; the Refits slide, optional, shows both, and if Refits is dropped the two sentences before this one are the whole substitute
- **note:** the chunk (10 lines with comments and a blank) and its 4-line output are copied verbatim, at the normal code size; the slide ends at 623 px. The two lines are the chapter's definition of the support vectors and the first sentence of `### Refits` ("The fitted hyperplane depends on the training data only through the support vectors"), which the instructor chose to keep in the core; the claim is evidenced on the optional Refits slide. The title is the chapter's `### Identification`. The `say:` sentence "the Refits slide ... shows both" is skipped when Refits is dropped.

## 19. Refits

- **tag:** optional (1.5)
- **show:** table — the chapter's `refit_table` (four fits: all beetles, without beetle 11, the support vectors only, and without beetle 13, with $n$, the three estimates, $\widehat M$ and the support vectors), copied from the frozen markdown
- **words:** none
- **say:** the table refits the maximal margin classifier to four sets of beetles; deleting beetle 11, the beetle farthest from the hyperplane, or deleting all 33 beetles that are not support vectors, gives the same estimates and margin to the four decimal places shown, and to six; deleting beetle 13, a support vector, changes the normal vector's angle from $-68.2$ to $-57.0$ degrees and the margin from 0.65 to 2.26 micrometers
- **note:** the table is copied verbatim from `result.markdown`, with `\hat` written `\widehat` in its header cells, and wrapped in `.auto-table`, which sets the column widths from the content; it ends at 361 px. The values in `say:` are inline R, quoted from the frozen markdown. The title is the chapter's `### Refits`. Fourth in the drop order.

# Classification

- **tag:** transition (0)
- **show:** none (transition slide, title only; optional, with the three slides after it)
- **say:** this part classifies two beetles that are not in the data, A and B, with the fitted hyperplane, and reads a distance from it as confidence
- **note:** a one-sentence preview of `## Classification`. The transition and its three slides (entries 20 to 22) are optional and second in the drop order; when they are dropped the transition goes with them.

## 20. Classification: new beetles

- **tag:** optional (0.5)
- **show:** figure — `new-figure` (the maximal margin hyperplane with the margin lines, the training beetles and two new beetles, A and B, marked by crosses), the figure alone
- **words:** none
- **say:** the figure adds two beetles that are not in the data, A and B, marked by crosses, to the maximal margin hyperplane of the training beetles; A has `Jnt1` = 190 and `Jnt2` = 125, in the gap between the species, and B has `Jnt1` = 230 and `Jnt2` = 120, among the `heik` beetles
- **note:** the chapter's `new-figure`, 8 by 4.4 inches, at `height=560`; the values are inline R, quoted from the frozen markdown. **The title is not a chapter heading** (the figure sits under `## Classification`, whose title is the transition's).

## 21. Sign rule

- **tag:** optional (1.5)
- **show:** equation — the chapter's display of $\widehat f(x^*)$, with two lines of rule and two lines for the new beetles
- **words:** the lead "New beetle $x^* = (x^*_1, \ldots, x^*_p)^\top$, classified by the sign of"; "$\widehat f(x^*) > 0$: the class coded $y = 1$"; "$\widehat f(x^*) < 0$: the class coded $y = -1$"; then "A: $\widehat f(x^*) = 45.4025 + 0.3714 \times 190 - 0.9285 \times 125 = -0.09$, so `conc`"; "B: $\widehat f(x^*) = 19.41$, so `heik`"
- **reveal:** on arrival: the lead and the display; click 1: the two rule lines; click 2: the two lines for A and B
- **say:** a new observation $x^*$ is classified by the sign of $\widehat f(x^*)$, to the class coded $y = 1$ if $\widehat f(x^*) > 0$ and to the class coded $y = -1$ if $\widehat f(x^*) < 0$; for the beetles A is classified `conc` and B `heik`; the chapter's `predict(mmc_fit, new_beetles)` returns the same classes, `conc` and `heik`
- **note:** the display is the chapter's, at 0.8em, `\hat` written `\widehat`, with its trailing comma; the four lines are the chapter's sentence after the display and its two bullets for A and B. The values are inline R, quoted from the frozen markdown (the chapter's `fmt_math()` puts a minus sign in A's value, which MathJax sets as a minus). The chunk `new-predict` is not shown (see "Not in this deck"). The title is the chapter's `### Sign rule`.

## 22. Confidence

- **tag:** optional (1)
- **show:** none, a four-line list cut from the chapter's paragraph
- **words:** "$\left|\widehat f(x^*)\right|$ — distance from the new beetle $x^*$ to the hyperplane, in micrometers"; "Larger distance, more confident classification"; "B: 19.41 micrometers; A: 0.09, less than $\widehat M = 0.65$"; "A distance ranks confidence; it is not a probability"
- **say:** because $\widehat\beta$ has unit length, $|\widehat f(x^*)|$ is the distance from $x^*$ to the hyperplane in micrometers; the training observations of each class lie on its side, at least $\widehat M$ from the hyperplane; a new observation far from it keeps its class under any small tilt or shift of the hyperplane, and one near it does not, so the larger $|\widehat f(x^*)|$ the more confident the classification; B lies 19.41 micrometers from the hyperplane, well into the `heik` side, and A lies 0.09 micrometers from it, less than the margin of 0.65, inside the gap where no training beetle lies, so a slight tilt or shift of the hyperplane would change its class; the distance ranks confidence but is not a probability
- **note:** the chapter's `### Confidence` paragraph cut to four lines; the values are inline R, quoted from the frozen markdown, at 0.7em. The title is the chapter's `### Confidence`.

# Limitations

- **tag:** transition (0)
- **show:** none (transition slide, title only)
- **say:** the maximal margin classifier has two limitations: it has no solution when the classes are not separable, and it is sensitive to a single observation
- **note:** relies on the learning objective on the two limitations; the part motivates the next lecture's support vector classifier.

## 23. Non-separable classes

- **tag:** optional (1.5)
- **show:** figure — `strip-figure` (each beetle's first joint alone, by species, with the range of first joints shared by the two species shaded), the figure alone
- **words:** none
- **say:** the figure shows each beetle's first joint alone, by species, with the range of first joints shared by the two species shaded, and the points jittered vertically; with $p = 1$ a hyperplane is a single point, a cut point on the `Jnt1` axis, and it separates the species only if every `conc` beetle lies below it and every `heik` beetle above it, or the reverse; the largest `conc` first joint, 201, exceeds the smallest `heik` one, 184, and 17 beetles lie in the shaded range between them; no cut point separates the species, so the constraints cannot all hold with $M > 0$ and no maximal margin hyperplane exists; the same is true of `Jnt2` alone, whose ranges overlap from 115 to 131 micrometers; the beetles are separable with both measurements, but in many classification problems the classes overlap whatever features are used, and there the maximal margin classifier has no solution
- **note:** the chapter's `strip-figure`, 8 by 2.4 inches, at `height=290` (968 px wide); the values are inline R, quoted from the frozen markdown. The title is the chapter's `### Non-separable classes`. Last in the drop order, because it motivates the next lecture; its text is the first paragraph of the `say:` of Sensitivity, marked there as the substitute.

## 24. Sensitivity

- **tag:** core (3)
- **show:** tabset, the chapter's own tabs: "All beetles" (`sensitivity-all-figure`), "Without beetle 13" (`sensitivity-without-figure`) and "One added beetle" (`sensitivity-added-figure`)
- **words:** none
- **say:** **if Non-separable classes is dropped, say first:** with one feature a hyperplane is a cut point, and it separates the species only if every `conc` beetle lies below it and every `heik` beetle above it, or the reverse; `Jnt1` alone: the largest `conc` first joint, 201, exceeds the smallest `heik` one, 184, and 17 beetles lie between them, so no cut point separates the species; `Jnt2` alone: the ranges overlap from 115 to 131 micrometers; so the constraints cannot all hold with $M > 0$ and no maximal margin hyperplane exists for either measurement alone, and in many classification problems the classes overlap whatever features are used, where the maximal margin classifier has no solution (this is the evidence for the Conclusion's "No solution for overlapping classes"); then: the tabs show the fit to all beetles, the fit without support vector 13 (its position marked by a cross) and the fit with one added `conc` beetle that is not in the data (boxed); without beetle 13 the hyperplane tilts to an angle of $-57.0$ degrees, the margin grows from 0.65 to 2.26 micrometers, and beetle 13 itself, a `conc` beetle, has fitted value 4.02, so the refit puts it on the `heik` side; the added `conc` beetle, at `Jnt1` = 184 and `Jnt2` = 122 (boxed), lies in the gap, 0.46 micrometers on the `heik` side of the original hyperplane; the beetles are still separable with it, and refitting tilts the hyperplane to $-64.8$ degrees, puts the added beetle on the margin and shrinks the margin to 0.19 micrometers; the maximal margin hyperplane is set by a few observations, the support vectors, so a change in one observation near the boundary can move it far; a classifier that moves this much with one observation has high variance, and fitting the training observations perfectly can overfit them; **the next lecture, the support vector classifier, continues from these tabs**: it allows some observations to fall inside the margin or on the wrong side of the hyperplane, so that it exists for overlapping classes and depends less on any single observation
- **note:** the chapter's `### Sensitivity` tabs, three 8 by 4.4 inch figures, shown with `.mid-tabs`; the values are inline R, quoted from the frozen markdown. The slide ends at 695 px. It is 3 minutes, the bridge to the next lecture. The title is the chapter's `### Sensitivity`. The last core content slide before the Conclusion, and the bridge to the next lecture; the chapter's `## Limitations` content is the motivation for it, as asked.

## 25. Conclusion

- **tag:** core (1)
- **show:** none, a flat list of six takeaways
- **words:** "$f(x)$: the side by its sign, the signed distance if $\|\beta\| = 1$"; "Separable classes have infinitely many separating hyperplanes"; "The maximal margin hyperplane has the largest margin"; "The fit depends only on the support vectors"; "No solution for overlapping classes; sensitive to single observations"; "Next lecture: the support vector classifier"
- **say:** the chapter's Conclusion: a hyperplane in $p$ dimensions is the set where $f(x) = \beta_0 + \beta^\top x = 0$; the normal vector $\beta$ is perpendicular to it, the sign of $f(x)$ says which side $x$ is on, and when $\sum_j \beta_j^2 = 1$, $f(x)$ is the signed distance; coding two classes as $y_i = \pm 1$ makes $y_i f(x_i) > 0$ the condition for a hyperplane to separate them; separable classes have infinitely many separating hyperplanes; the maximal margin hyperplane is the one with the largest margin, the smallest distance to a training observation, and solves the problem of maximizing $M$ subject to $\sum_j \beta_j^2 = 1$ and $y_i(\beta_0 + \beta^\top x_i) \ge M$; for a fixed normal vector the best hyperplane is midway between the classes, with margin half the gap; `svm()` with a linear kernel, `scale = FALSE` and a very large `cost` fits it, and the estimates and margin are recovered from `coefs`, `SV` and `rho`; the support vectors are the observations on the margin and the fitted hyperplane depends only on them; a new observation is classified by the sign of $\widehat f(x^*)$ and $|\widehat f(x^*)|$ measures confidence as a distance; the two limitations are that no separating hyperplane exists when the classes overlap, and that moving, deleting or adding one observation near the boundary can move the hyperplane far; the next lecture covers the support vector classifier, which allows some observations to fall inside the margin or on the wrong side of the hyperplane, so that it exists for overlapping classes and depends less on any single observation
- **note:** distilled from the chapter's `## Conclusion` (one line per main result, in the order of the lecture); no example numbers. The chapter's Conclusion is three paragraphs and is too long for a slide, so the slide is the list of six, the last line naming the next lecture (the chapter's last paragraph; the file `20-support-vector-classifier.qmd` exists in the folder). The classification takeaway (the sign of $\widehat f$ and the distance as confidence) is not on the slide because the Classification part is optional and second in the drop order; it is in `say:`.
