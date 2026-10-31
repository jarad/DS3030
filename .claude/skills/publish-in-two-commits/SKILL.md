---
name: publish-in-two-commits
description: Commit and push a DS3030 chapter and its deck as two commits, the second refreshing each deck's derived-from marker to the chapter commit hash. Use when the instructor says "commit and push in two commits", or "commit and push" after a chapter or deck was written or revised.
---

# Publish a chapter in two commits

A deck records which version of its chapter it was built from in a
`<!-- derived-from: <chapter path> @ <hash> -->` comment. The hash is the
commit that last changed the chapter, which cannot be known until the chapter
is committed, so the marker is refreshed in a second commit.

Commit only when the instructor asks ("commit and push", "commit and push in
two commits"). Work on `main`; no branch or pull request unless asked. Never
commit stray render output, and never delete files yourself: give the
instructor the `rm` commands (a deletion is theirs to run).

## Steps

1. `git status --short`. Sort every changed or untracked path into:
   - **content**: chapters, decks (`*_slides.qmd`), outlines
     (`*_slides.outline.md`), the chapter's `_freeze/<path>/` directory,
     `_quarto.yml`, `CANVAS-LINKS.md`, `CONVENTIONS.md`, `LECTURE-LOG.md`,
     `DESCRIPTION`, `tutor/DS3030-tutor.md`;
   - **strays**: `*_slides.html`, `*_slides_files/`, `*.knit.md`, anything under
     `docs/`, scratch files. Do not stage these. If a stray is visible in
     `git status`, give the `rm` command and carry on without it.
   - **unfamiliar** changes (another session's edits, a tutor tag block you did
     not write): include them if they belong to this change, but name them in
     the report; ask if you cannot tell.
2. **Commit 1, content.** Stage the content paths by name (never `git add -A`).
   Message: `<Chapter family>: <what>` in the style of the log, for example
   `Regularization: high dimensions chapter and deck (modeldata::meats)` or
   `Lasso: lasso versus ridge depends on how many features carry the signal
   (chapter, slides, outline, tutor)`. Add a short body when several files
   changed for different reasons. End with the attribution line the harness
   gave you for commits.
3. **Refresh the markers.** For each deck whose chapter is in commit 1:
   `H=$(git log -1 --format=%h -- <chapter.qmd>)`, then set the deck's
   `<!-- derived-from: <chapter.qmd> @ $H -->` to that hash. Also make the
   outline's provenance sentence name `$H` (and delete any "not yet committed"
   sentence). If the chapter did not change, leave the marker alone: a deck-only
   change is one commit.
4. **Commit 2, markers.** Stage only the decks and outlines edited in step 3.
   Message: `<Chapter title> slides: record the chapter commit in derived-from`.
5. `git push`, then `git status --short` and `git log --oneline -3`.
6. Report both hashes, anything left uncommitted and why, and the `rm`
   commands for strays.

## Checks before commit 1

- The chapter's `_freeze/` directory is current: its `html.json` hash equals the
  md5 of the chapter file (a stale freeze means the published site shows old
  results; re-render first, see `sync-chapter-edit`).
- A new chapter is registered (see `new-chapter-checklist`).
- Nothing from `../DS3030Private` (question text, solutions) is in the diff;
  the tutor file holds topic tags only.
