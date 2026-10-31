---
name: sync-chapter-edit
description: After editing a DS3030 chapter, carry the change through to its re-render, slide deck, slide outline, tutor entry and CONVENTIONS.md. Use whenever a chapter's prose, numbers, tables, figures, headings or learning objectives changed, including fixes from a proof-reader report.
---

# Sync a chapter edit

A chapter edit leaves five derived things stale. Work through them in order.
Run `proof-reader` on the chapter after a substantive edit (added or reordered
material, changed math, data or code) before calling it done; a typo or one-line
notation fix does not need it.

## 1. Re-render the chapter

- Freeze hashes the whole `.qmd` (md5), so even a prose edit makes
  `_freeze/<path>/execute-results/html.json` stale. Run
  `quarto render <chapter.qmd>` from the repo root; rerun on the intermittent
  "cannot open the connection" error.
- Only `html.json` changes when the code is unchanged; figures change when plot
  code changed. Confirm exit 0 and that the frozen markdown has no R warnings,
  messages or stderr blocks.
- Never hand-edit frozen output. After a `.qmd` rename or move, the stale
  `_freeze/<path>/` must be removed before rendering (the user runs the `rm`;
  give the command), then view the rendered figures.

## 2. Deck and outline

- Decks (`<chapter>_slides.qmd`) reuse the chapter's figures by path
  (`../_freeze/<chapter path>/figure-html/<chunk>-1.png`) and copy tables
  verbatim from the frozen markdown (`html.json`, key `result.markdown`).
  Re-copy any table whose chunk output changed; do not retype numbers.
- The outline's `note:` fields list the chapter sentences and values each slide
  relies on. Use them to find every slide whose text or speaker notes quote
  changed wording (headings, quoted sentences, numbers, the agenda slide). Edit
  slide text and notes to match, and update the outline entry (`words`, `say`,
  `note`) so it still describes the deck as it stands.
- Renamed headings change slide titles that mirror them; the agenda slide lists
  them.
- Check effective tick size of any new or changed figure (tick px =
  8.8/72 x display height px / figure height in; aim for at least 14 px, so
  figures at most about 4.5 in tall). Do not retro-fit older decks unprompted.
- Render the deck alone (`quarto render <deck>`) to confirm it builds. That
  leaves `<deck>.html` and `<deck>_files/` next to the deck; do not stage them,
  and give the `rm` commands.

## 3. Tutor entry

`tutor/DS3030-tutor.md`, "Course content": the numbered entry for the chapter
must match its current title, URL, learning objectives and a short digest. Keep
it topic-only, with no seed-specific results or example numbers. Only the
"What has already been assessed" section holds homework and quiz tags; do not
edit it here (see `tutor-sync` in the private repository).

## 4. CONVENTIONS.md

Add or change a bullet when the edit settled a symbol, word choice or notation
(unit names, "estimate" versus "coefficient", n and p definitions). Check
`CONVENTIONS.md` before introducing a new symbol.

## 5. Report

List what changed in each place, any slide whose wording you could not keep in
sync, numbers that moved, and the stray-file `rm` commands. Do not commit unless
asked (`publish-in-two-commits`).
