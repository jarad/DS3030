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

Chapters live in topic folders, named `NN-MM-slug.qmd`. `NN` is the ISLR2
chapter number (loosely — it just matches the folder). `MM` is the order the
material is actually covered in class, **not** the ISLR2 section number —
those don't map cleanly onto lecture days, since one section can span several
class days and several sections can be covered in one. `MM` is spaced by tens
(`10`, `20`, `30`, ...) so a lecture discovered later to belong between two
existing ones can take an unused number (e.g. `15`) without renumbering every
file after it — and without touching the Canvas links that point at the
already-published ones.

```
regression/03-10-slr.qmd
regression/03-20-mlr.qmd
regression/03-30-feature-engineering.qmd
regression/03-40-flexibility.qmd
```

`learning/` still uses the old `02-1`, `02-2`, `02-3` numbering pending
migration to this scheme — don't take it as a model for new chapters.

The actual calendar date each file was used in class is **not** encoded in the
filename — it lives in `LECTURE-LOG.md` instead, since this book is reused
across semesters and the calendar shifts every year. Update that log whenever
a file is presented in class.

A new chapter must be registered in the `chapters:` list in `_quarto.yml` under
the right `part:`, in order, or it will not appear on the site.

Renaming a published chapter breaks any Canvas link that points at its
rendered page directly. Every rename or new chapter must get a row in
`CANVAS-LINKS.md` so the instructor can update Canvas.

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
- Worked examples follow **motivation → exploratory data analysis → model →
  inference → conclusion**. Show the data before fitting anything to it: a plot
  of the raw data comes before any model, so students see what a method is
  responding to rather than taking the fit on faith.

## Code

`{r}` chunks inside a `.qmd` are fine. The in-class emphasis is on **what the
code produces** — the plot, the table, the resulting inference — rather than on
the code itself, so favor chunks whose output carries the teaching point.

**Never hard-code a value in prose that a chunk already computed.** When text
discusses a number that came from a model or a table — an F-statistic, a
degrees-of-freedom count, a coefficient, an $R^2$ — pull it with inline R
(`` `r round(model_object$F[2], 2)` ``) from the object the chunk produced,
rather than typing the number by hand. A hand-typed number silently drifts out
of sync when the upstream code changes, which is exactly the failure mode
`proof-reader`'s numbers-in-prose check exists to catch; inline R prevents the
drift instead of relying on catching it after the fact. This also applies to
values that look self-evident, like a sample size or a count of estimated
parameters — compute them (`nrow(data)`, `length(coef(model))`) rather than
counting by hand.
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

Project agents for this repository live in `.claude/agents/`: `notes-author`,
`proof-reader`, and `semester-refresh`. `homework-author`, `exam-author`, and
`quiz-reviewer` live in the sibling private repository, `../DS3030Private/`,
and are only available when Claude Code is launched from there.

`proof-reader` works on any course file — here or in `DS3030Private` — and
reports, without editing, typos, notation collisions, stale cross-references,
convention violations, and statements that are incorrect. It verifies numbers
quoted in prose by actually running the chunks, which is worth doing after any
change to a chapter's code. Because it works on both repositories, this copy is
canonical; `DS3030Private/.claude/agents/proof-reader.md` is a symlink to it.

`semester-refresh` checks whether the course still works before it is taught
again: it runs `install-packages.R` to install anything `DESCRIPTION` lists
that is missing (never upgrading what's already there — mid-semester upgrades
have broken lecture code before), then renders every chapter and reports which
ones fail and why, without editing anything. Run it at the start of a new
semester or after a long gap, since packages, datasets, and external services
like Yahoo Finance can drift out from under the notes between offerings.
