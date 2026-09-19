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

Chapters live in topic folders named `NN-topicname/`, where `NN` is the ISLR2
chapter number the folder covers — this makes folders sort in ISLR2/teaching
order in a plain directory listing, rather than alphabetically by topic name.
A chapter not covered this semester (7, 10, 11, 13) simply has no folder;
gaps in the numbering are expected and fine.

Files inside a chapter folder are named `MM-slug.qmd`. `MM` is the order the
material is actually covered in class, **not** the ISLR2 section number —
those don't map cleanly onto lecture days, since one section can span several
class days and several sections can be covered in one. `MM` is spaced by tens
(`10`, `20`, `30`, ...) so a lecture discovered later to belong between two
existing ones can take an unused number (e.g. `15`) without renumbering every
file after it — and without touching the Canvas links that point at the
already-published ones. The chapter number is not repeated in the filename;
the folder already carries it.

```
03-regression/10-slr.qmd
03-regression/15-capm.qmd
03-regression/20-mlr.qmd
03-regression/30-feature-engineering.qmd
03-regression/40-flexibility.qmd
```

Both `02-learning/` and `03-regression/` were migrated to this scheme
2026-09-19 (from a bare `learning/`/`regression/` folder with the chapter
number repeated in every filename); every renamed file is logged in
`CANVAS-LINKS.md`.

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
  "After this lecture you should be able to..." list (all eight existing
  chapters use "lecture," not "chapter" — match them), three to six items,
  using verbs that name the cognitive level honestly (*define*, *derive*,
  *interpret*, *compare*, *evaluate*). These objectives anchor homework and exam
  coverage, so make them specific enough to assess against.
- Math: `$...$` inline, `$$...$$` display. (The quiz files in the private
  repository require `\(...\)` for Canvas — that convention does not apply here.)
- Define every symbol the first time it appears, as a bulleted list immediately
  after the equation introducing it.
- Use collapsible callouts for worked examples of taught material:
  `::: {.callout-note collapse="true"}` with a `### For example,` heading.
- Use a collapsible callout headed `### Beyond this course` for a pointer to
  related material that is mentioned but not taught or tested — e.g. noting
  that contrasts exist without teaching how to construct one. Content under
  this heading must never be echoed in the chapter's learning objectives,
  however developed the callout becomes: the heading itself is what marks it
  out of scope for assessment, not its length or polish.
- Short paragraphs, frequent `##` headings. These pages are read on the web and
  used live in class.
- Worked examples follow **motivation → exploratory data analysis → model →
  inference → conclusion**, strictly in that order on the page. State the
  question and the data before showing any plot, show the plot before
  interpreting it, and show a model's output before discussing what it means —
  never mix interpretation into the sentence that introduces a figure or a
  fit. A plot of the raw data comes before any model, so students see what a
  method is responding to rather than taking the fit on faith.
- **Never cite ISLR2 as the evidence for a claim** — e.g. "ISLR2 shows KNN
  losing to linear regression at $p=20$." These notes must be self-contained:
  if a point needs evidence, generate it here (a derivation, a simulation, a
  fitted example) rather than asserting that the textbook demonstrates it
  elsewhere. A bare pointer to a chapter or section for *further reading*
  (`ISLR2 Chapter 8`) is fine; an unverifiable claim about what the textbook
  contains is not.
- **Prefer a real dataset over simulated data, ideally from a package already
  in `DESCRIPTION`** (ISLR2, Sleuth3, ...). Simulated data is fine when the
  point is about a data-generating process itself (e.g. demonstrating that a
  method recovers a known truth), but a worked example illustrating a method
  on realistic data teaches the method better with data students could
  actually encounter. `ISLR2::Wage` (age vs. wage) and `ISLR2::Boston`
  (housing) are already in use for exactly this reason.
- **Cut extemporaneous asides — phrasing that reinforces a point verbally but
  adds no information in writing.** "$\beta_j$ is a difference, not a bin's
  mean by itself" says the same thing twice; the second half is something an
  instructor says out loud for emphasis while lecturing, not something a
  reader needs once the first half is on the page. State each fact once,
  precisely, and let it stand. This is a real risk specifically because these
  notes are also delivered live in class — habits of speech creep into the
  prose. A rhetorical question, a "notice that," or a reminder clause is fine
  when it points at something the reader could otherwise miss; it is
  extemporaneous when it only restates what the preceding clause already
  said.

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

**Put extensive R code in a collapsed callout.** When a chunk carries a lot of
setup — simulating data, fitting several models, assembling a prediction grid,
building a table — wrap it in `::: {.callout-note collapse="true"}`, suppress
its output with `#| output: false`, and assign the result (a plot, a table) to
an object. The code stays reachable for students reading later without
occupying the page or class time.

Display that object afterward in its own named chunk with `#| echo: false` —
the reader sees the plot or table, not the one-line `object_name` that
produced it; the line is trivial and expanding the callout above it already
shows how the object was built. This means a chapter's rendered page shows
extensive setup code only when a reader deliberately expands a callout for
it, and shows the polished result everywhere else.

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

## Course tutor

`tutor/DS3030-tutor.md` is a system-prompt file students upload to an AI
chatbot of their choice to get a tutor for this course. It is built entirely
from public content — chapter titles, URLs, and learning objectives from this
repository, plus topic-only tags (no question text, no answers) for what has
already been assessed in `../DS3030Private/`. It must never contain homework,
quiz, or exam question text or solutions, only thematic tags of what a past
item covered.

**This file goes stale and must be kept in sync**, on both sides:

- Whenever a chapter's learning objectives change, or a new chapter is added
  or removed, update `tutor/DS3030-tutor.md`'s "Course content" section to
  match (title, URL, and a short digest of what the chapter now covers).
  `notes-author` does this as part of writing or revising a chapter, not as a
  separate afterthought.
- Whenever homework or a quiz is added or substantively changed in
  `../DS3030Private/`, update this file's "What has already been assessed"
  section with new or revised topic tags — thematic only, never the question
  text or the answer key. `homework-author` does this for homework, as part of
  writing or revising an assignment. Quizzes are authored by the teaching
  assistant rather than an agent, so `quiz-reviewer` instead flags a missing or
  stale tag as a finding in its report — its own instructions cover the exact
  check. `../DS3030Private/AGENTS.md`'s "Keeping the course tutor file in
  sync" section has the full rule, including which agents hold edit access to
  this one file from that repository.

If you are proofreading or otherwise reviewing this repository after either
kind of change and notice the tutor file was not updated, treat that as a
convention violation worth reporting.

## Agents

Project agents for this repository live in `.claude/agents/`: `notes-author`,
`proof-reader`, and `semester-refresh`. `homework-author`, `exam-author`, and
`quiz-reviewer` live in the sibling private repository, `../DS3030Private/`,
and are only available when Claude Code is launched from there.

`proof-reader` works on any course file — here or in `DS3030Private` — and
reports, without editing, typos, notation collisions, stale cross-references,
convention violations, and statements that are incorrect. It verifies numbers
quoted in prose by actually running the chunks. Because it works on both
repositories, this copy is canonical;
`DS3030Private/.claude/agents/proof-reader.md` is a symlink to it.

**Run `proof-reader` on a chapter after any substantive edit to it, before
treating the change as finished** — not only when asked to proofread. A
direct content edit (added or reordered material, changed math, changed data
or code) gets this pass unprompted; a small mechanical fix (a typo, a
one-line notation correction, a rename) does not need it every time. This
applies whether the edit came from a human, from `notes-author`, or from
Claude editing a chapter directly in conversation — the point is that new or
changed content gets checked before it is presented as done, not that any
particular agent must be the one to run the check.

`semester-refresh` checks whether the course still works before it is taught
again: it runs `install-packages.R` to install anything `DESCRIPTION` lists
that is missing (never upgrading what's already there — mid-semester upgrades
have broken lecture code before), then renders every chapter and reports which
ones fail and why, without editing anything. Run it at the start of a new
semester or after a long gap, since packages, datasets, and external services
like Yahoo Finance can drift out from under the notes between offerings.
