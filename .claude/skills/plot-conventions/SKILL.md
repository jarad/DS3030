---
name: plot-conventions
description: The DS3030 figure rules (grid lines, legibility without color, size on slides, palettes, jitter). Use before writing or reviewing any ggplot figure in a chapter, and when proofreading rendered figures.
---

# DS3030 plot conventions

Source of truth is `CLAUDE.md` (Code section); this is the checklist.

## Grid lines (set explicitly)

Major grid lines at consistent distances: additive on a regular axis,
multiplicative on a logarithmic one. Minor lines midway between majors. ggplot2
defaults produce uneven spacing (for example majors at 1, 10, 20, 30, 40, 49
and minors at 5.5, 15, 25, 35, 44.5), so always set `breaks` and
`minor_breaks` yourself:

- Regular axis: `breaks = seq(lo, hi, by = step)` starting at a multiple of the
  step, about 4 to 7 majors, no special off-grid values (no break at 1 or at
  n - 1 just because that is the data minimum or maximum);
  `minor_breaks` the midpoints, within the axis limits. Make sure the first and
  last major lines are visible (`limits`, `expand`) and a value the next slide
  uses (such as d = 46) can be located. Example: the channel sweep axis shows
  majors at 0, 10, ..., 50 and minors at 5, 15, ..., 45.
- Logarithmic axis: majors at equal multiplicative steps (powers of 10), minors
  midway in log space (10^(k + 0.5)).
- Define the axis once as an object and reuse it across panels or plots.
- Discrete axes are left alone.

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
nothing clipped, legends not covering data.
