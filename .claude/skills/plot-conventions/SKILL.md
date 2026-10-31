---
name: plot-conventions
description: The DS3030 figure rules (grid lines, legibility without color, size on slides, palettes, jitter). Use before writing or reviewing any ggplot figure in a chapter, and when proofreading rendered figures.
---

# DS3030 plot conventions

This is the checklist; `CLAUDE.md` points here. The rules in the Code section of `CLAUDE.md` on jitter, legibility without color and code placement still apply.

## Grid lines (set explicitly)

Grid lines sit at round numbers the reader would name, never at arbitrary
values. ggplot2 defaults do not do this (for example majors at 1, 10, 20, 30,
40, 49 and minors at 5.5, 15, 25, 35, 44.5), so always set `breaks` and
`minor_breaks` yourself:

- Regular axis: equal additive steps, `breaks = seq(lo, hi, by = step)`
  starting at a multiple of the step, about 4 to 7 majors, no off-grid values
  (no break at 1 or at n - 1 just because that is the data minimum or
  maximum). `minor_breaks` are the midpoints, within the axis limits. Make sure
  the first and last major lines are visible (`limits`, `expand`) and a value
  the next slide uses (such as d = 46) can be located. Example: the channel
  sweep axis shows majors at 0, 10, ..., 50 and minors at 5, 15, ..., 45.
- Logarithmic axis: majors are either equal multiplicative steps (powers of 10
  or of 2) or the round values the reader would name within a decade (the
  1-2-5 pattern: 0.01, 0.02, 0.05, 0.1; or 2, 3, 4, 5 when the range spans less
  than a factor of three). Minors midway between majors in log space (for
  example 10^(k + 0.5)), or none where the majors are already dense.
- Axis read as a percentage or ratio against a baseline (for example "+25%
  over the best method"): the majors are the round percentages (+5, +10, +25,
  +50, +100%) even though their log-scale gaps are uneven. Minors are at the
  log midpoints (+7.5% between +5% and +10%) or omitted.
- Define the axis once as an object and reuse it across panels or plots.
- Discrete axes are left alone.

## Tabsets

Plots in one `.panel-tabset` are read by clicking between tabs. Settle two
questions in order.

### 1. Should the tabs be aligned?

Align them when the tabs show the same kind of picture of the same quantity,
so the reader is meant to flip between them and compare: the cross-validation
curve of each method against its tuning parameter, a build-up that adds one
layer per tab, the same plot for different models. The reader should see the
curve change, not the frame.

Do not try to align them when each tab shows a different variable or a
different view of the data, so nothing is compared by flipping: sale price on
one tab and size and age on another, a histogram on one and a scatterplot on
another. A tabset like that is still worth having for the page's sake. Design
each plot on its own: its own limits, grid lines, titles and legend placement,
and its own figure size if that suits it.

If unsure, ask whether a reader would want a feature to stay put when they
click from one tab to the next. If so, align.

### 2. Rules for an aligned tabset

All of the following hold for every tab:

- **Same figure size**: identical `fig-width` and `fig-height`.
- **Same titles**: either every plot has a title (and the same text) or none
  does, and the same for subtitles and captions, with captions of the same
  number of lines. The tab name already says which method or variant the tab
  shows, so a subtitle repeating it is dropped from every plot.
- **Same y limits and grid lines** wherever the y variable is the same: define
  the limits and the y scale once and use them in every tab. Choose the limits
  for the content that matters, not for the largest value on any one tab: a
  curve that runs far above the reference line (a null model, least squares)
  is clipped with `coord_cartesian(ylim = ...)`, the upper limit a little above
  the reference line, rather than stretching every tab to include it. An x axis
  that differs by tab (lambda on one, M on another) keeps its own limits and
  grid lines.
- **Legends inside the panel** on every tab that has one, in the corner the
  data leave empty on that tab. A legend below the plot shrinks the panel, and
  a tab with no legend then looks taller. A tab with a single entry has no
  legend.
- **Same theme**: the same text sizes, the same panel border, the same axis
  title wording for a shared axis ("10-fold CV estimate (log scale)").
- **Panels lined up**: labels built from expressions (`expression(lambda)`,
  `scales::label_log()`) are taller than plain text, which moves the panel
  edge on that tab only. After building the plots, pass them through
  `cowplot::align_plots(..., align = "hv")` and draw each result with
  `cowplot::ggdraw()`, and display the drawn plots in the tabs.
- Check the rendered PNGs of all the tabs: the panel border sits at the same
  pixel rows and columns, the same lines in the same places, and no legend
  covers data.

## Legends

Outside the panel (usually below) is the default placement, and a legend with
one entry is dropped. Inside the panel is allowed, and required in an aligned
tabset (above), but only in a corner that no line, point or label occupies;
check the rendered PNG for overlap with the data, the reference line and the
grid labels.

## Legibility

- Distinguishable without color: map `shape` (points) and `linetype` (lines) to
  the same grouping as `color`; where a facet can replace the grouping, prefer
  it. When shape or linetype must encode a different variable, use Okabe-Ito or
  viridis, not ggplot's default hues.
- Plots show the takeaway: no error bars or ribbons on cross-validation curves
  unless uncertainty is the point; say the uncertainty in a sentence with
  numbers from inline R.
- Violins carry quartile lines; a boxplot only when the five-number summary
  itself is the point.
- Labels, captions, axis labels and titles use "estimate", not "coefficient".

## Size on slides

Text on a slide figure is the figure's text size scaled by display height over
figure height in inches. Effective tick size = 8.8/72 x display height px /
figure height in; aim for at least 14 px, so keep figures at most about 4.5 in
tall (wide figures are width-limited). Check it for every figure a new deck
reuses; do not retro-fit old decks unprompted.

## Jitter and randomness

- Jittered points that appear in more than one rendered plot (a
  `.panel-tabset` build-up) are precomputed as a data column
  (`mutate(y_jit = y + runif(n(), -h, h))`) and drawn with `geom_point()`.
  `geom_jitter()` is fine for a figure that never appears with a variant.
- Seed set once near the top of the chapter (its `packages` chunk), equal to the
  date the file was first created (YYYYMMDD).

## Code placement

Extensive plot code lives in a collapsed `### Code` callout with
`#| output: false`, assigning the plot to an object; the object is displayed in
its own named chunk with `#| echo: false`. Every chunk is named; lines at most
80 columns; every function definition uses braces.

## Review

When reviewing a rendered figure, open the PNG and check: grid spacing,
distinguishability in greyscale, tick and label legibility at slide size,
nothing clipped, legends not covering data, and, for an aligned tabset, the
same limits, grid lines and panel position on every tab.
