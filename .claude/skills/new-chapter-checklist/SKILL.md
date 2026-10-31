---
name: new-chapter-checklist
description: Register a new DS3030 chapter, or rename or move one, so the book, Canvas tracking, tutor, lecture log and install package all stay consistent. Use when a new `NN-topic/MM-slug.qmd` file is created, or a chapter file is renamed.
---

# New chapter (or rename) checklist

File layout: chapters live in `NN-topic/` where `NN` is the ISLR2 chapter number
(gaps are fine), and files are `MM-slug.qmd` with `MM` the order covered in
class, spaced by tens (take an unused number such as 15 for a lecture that falls
between two). The class date is never in the filename; it lives in
`LECTURE-LOG.md`.

## New chapter

1. **`_quarto.yml`**: add the file to `chapters:` under the right `part:`, in
   order, or it will not appear on the site.
2. **`CANVAS-LINKS.md`**: add a row `| <today> | New | | <path> | |` under
   "Fall 2026" (note a split source in the Change column if relevant).
3. **`DESCRIPTION`**: if the chapter uses a package not in `Imports:`, add it.
4. **Link under the title**: line 3 of the chapter is
   `[Slides for this lecture](<chapter>_slides.html)`, after the `# Title` line.
   Add it even before the deck exists, if a deck is planned.
5. **`tutor/DS3030-tutor.md`**: add the next numbered "Course content" entry with
   title, exam tag (Exam 1, Exam 2, or optional reading), URL
   `https://jarad.github.io/DS3030/<path>.html`, and a digest of the learning
   objectives. If inserted between existing chapters, renumber the entries after
   it and fix "chapters 1-12"-style ranges in "Exam coverage". Topic-only.
6. **`LECTURE-LOG.md`**: make the planned row for the class date name the
   chapter and match its contents; it moves to the log table only after class
   (see `log-class`).
7. **`CONVENTIONS.md`**: record any new symbol or word decision.
8. **Seed**: set once, near the top, to the date the file was first created
   (`git log --diff-filter=A --follow --format=%ad --date=format:%Y%m%d -- <file>`,
   or today's date for a new file as YYYYMMDD).
9. Render the chapter, then run `proof-reader` on it (see `sync-chapter-edit`).
   A deck comes from `slides-author`.

## Rename or move

1. `git mv` the `.qmd` (and its deck and outline, whose `derived-from` path and
   first lines name the chapter); update `_quarto.yml`, cross-references in other
   chapters (`[text](path.qmd)`), tutor URLs and the slides link line.
2. **`CANVAS-LINKS.md`**: add a `Rename` row with the old and new path. Renaming
   breaks any Canvas link to the rendered page.
3. **Stale freeze**: a rename does not change chunk source, so frozen output
   keeps figure paths built from the old basename and the published page shows
   broken images with no error. The `_freeze/<old path>/` directory must be
   deleted (give the user the `rm -r` command; they run deletions) and the
   chapter re-rendered under the new name, then view the figures. Same for the
   deck's referenced figure paths.
4. Log the rename in `LECTURE-LOG.md` only if it changes which file was covered
   on a date.
