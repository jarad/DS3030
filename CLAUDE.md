# DS3030 - public course material

Public course notes for **DS 3030 - Concepts and Applications of Machine
Learning** at Iowa State University (Dr. Jarad Niemi). This repository is a
Quarto book that renders to `docs/` and publishes to GitHub Pages via
`.github/workflows/publish.yml`.

## This repository is public

Everything here is visible to students and to the world. Homework questions,
quiz questions, exam questions, and solutions live in the separate **private**
`DS3030Private` repository and must never appear here — not in a file, not in a
comment, not in a commit message.

## Course context

- **Textbook**: ISLR2 — James, Witten, Hastie & Tibshirani, *An Introduction to
  Statistical Learning with Applications in R*, 2nd edition. Notes follow its
  chapter sequence, notation, and vocabulary.
- **Audience**: junior and senior data science majors. Prerequisites are
  DS 2010, DS 2020, MATH 2070 (matrix algebra), MATH 2650 (calculus 3), and
  STAT 3201/3010; most are concurrently taking STAT 3447 (probability theory)
  and have already seen multiple regression. Derive results, use matrix notation
  freely, and write likelihoods where they illuminate the method.
- **Schedule**: see `SCHEDULE.md` for the week-by-week topic, reading, and
  assessment calendar.
- **Language**: R.

## File layout

Chapters live in topic folders, named `NN-M-slug.qmd` where `NN` is the ISLR2
chapter number and `M` is the section index within it:

```
learning/02-1-overview.qmd      regression/03-1-slr.qmd
learning/02-2-regression.qmd    regression/03-2-mlr.qmd
learning/02-3-classification.qmd
```

A new chapter must be registered in the `chapters:` list in `_quarto.yml` under
the right `part:`, in order, or it will not appear on the site.

`DESCRIPTION` makes this repository an R package whose only job is to let
students install every package the course uses in one step. A chapter that
introduces a new package should add it to `Imports:`.

## Authoring conventions

- Open each chapter with a Bloom-aligned learning objectives block — a short
  "After this chapter you should be able to..." list, three to six items, using
  verbs that name the cognitive level honestly (*define*, *derive*,
  *interpret*, *compare*, *evaluate*). These objectives anchor homework and exam
  coverage, so make them specific enough to assess against.
- Math: `$...$` inline, `$$...$$` display. (The quiz files in the private
  repository require `\(...\)` for Canvas — that convention does not apply here.)
- Define every symbol the first time it appears, as a bulleted list immediately
  after the equation introducing it.
- Use collapsible callouts for examples and asides:
  `::: {.callout-note collapse="true"}` with a `### For example,` heading.
- Short paragraphs, frequent `##` headings. These pages are read on the web and
  used live in class.

## Code

`{r}` chunks inside a `.qmd` are fine. The in-class emphasis is on **what the
code produces** — the plot, the table, the resulting inference — rather than on
the code itself, so favor chunks whose output carries the teaching point.

**Name every chunk**: ```` ```{r galileo-models} ````, never a bare
```` ```{r} ````. Illustrative code that only demonstrates `lm()` formula syntax
is still a named chunk carrying `#| eval: false`, not a plain ```` ```r ````
block. Named chunks produce stable figure filenames and identifiable freeze
entries, which matters because `_freeze/` is committed to the repository.

**Plots must be legible without color.** When `shape` and `linetype` are not
needed for some other variable, map them to the same grouping as `color`, so the
distinction survives in greyscale and for color-blind viewers:

```r
ggplot(d, aes(x = Intensity, y = Flowers,
              color = Time, shape = Time, linetype = Time)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, formula = y ~ x)
```

Lines alone need `color` + `linetype`; points alone need `color` + `shape`.
Where a facet can replace the grouping entirely, prefer that. When `shape` or
`linetype` genuinely must encode a *different* variable, the redundancy is
unavailable, so use a color-blind-friendly palette — Okabe-Ito or viridis —
rather than ggplot2's default hue scale.

**Put extensive R code in a collapsed callout**, rather than hiding it with
`#| echo: false`. When a chunk carries a lot of setup — simulating data, fitting
several models, assembling a prediction grid — wrap it in
`::: {.callout-note collapse="true"}`, suppress its output with `#| output:
false`, assign the plot to an object, and display that object from a short
visible chunk after the callout. The code stays reachable for students reading
later without occupying the page or class time.

**Do not create a standalone `.R` script unless specifically asked.** In this
course a standalone script is an in-class demonstration document: a script
typically gets a full class day plus an accompanying student activity. Creating
one unprompted invents curriculum that was not requested.

## Building and deploying

Deployment is: **render locally, commit the resulting `_freeze/` output, then
push.** Because `execute: freeze: auto` makes the GitHub Action reuse that
frozen output instead of re-executing the R, the workflow needs no R package
installation step.

This means local rendering is part of the normal workflow. After changing a
chapter's R code, re-render and commit the updated `_freeze/` content, or the
published site will show stale results.

## Agents

Project agents for this course live in `../.claude/agents/` (the `DS3030class`
parent folder) and are available when Claude Code is launched from there:
`notes-author`, `homework-author`, `quiz-reviewer`, `exam-author`, and
`proof-reader`.

`proof-reader` works on any course file and reports — without editing — typos,
notation collisions, stale cross-references, convention violations, and
statements that are incorrect. It verifies numbers quoted in prose by actually
running the chunks, which is worth doing after any change to a chapter's code.
