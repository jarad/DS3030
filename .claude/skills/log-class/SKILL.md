---
name: log-class
description: Record a DS3030 class in LECTURE-LOG.md. Use when the instructor says what they covered on a date ("I covered all the slides on 10-26", "we only got through X", "class was cancelled"), or reports a problem noticed while teaching.
---

# Log a class

`LECTURE-LOG.md` is the authoritative record of *when* material was taught;
filenames only encode order. The log table is a record, the "Planned" table is a
guess that moves into the log as days happen.

## Steps

1. Read `LECTURE-LOG.md`. Identify the date and day. Take what was covered from
   the instructor's words, nothing more: "covered all of the slides in
   `<chapter>_slides.qmd`", or exactly what was skipped or held over. Do not
   claim anything was covered that the instructor did not say. When unsure of a
   date, ask.
2. Move the matching row out of "Planned (Fall 2026)" and add a row to the end
   of the log table, in date order, in the existing style:
   `| 2026-10-30 | Fri | \`06-regularization/60-high-dimensions.qmd\` | Covered all of the slides in \`60-high-dimensions_slides.qmd\`. |`.
   Paths are repo-relative and in backticks; a day spanning several files lists
   them all. A planned day that did not happen as a lecture (review, exam,
   cancelled class) becomes a log row with a plain note ("Exam 1 held on this
   date.", "Class cancelled").
3. If the instructor reports a problem, put the specific observation in that
   row's notes, and add a bullet under "Notes for the next offering" when the
   fix belongs after this semester (a revision to a published chapter or deck).
   Say whether the instructor asked for the fix now; do not start a fix they did
   not ask for. If the observation is a standing preference (a figure or plot
   convention), also save a feedback memory.
4. Re-read the remaining planned rows against the chapters they name and revise
   them if the pace shifted or a chapter changed (a planned row should still
   match its chapter's contents). Dates in the plan follow `SCHEDULE.md`.
5. Do not commit unless asked; if asked, use `publish-in-two-commits` only when
   chapters changed, otherwise a single commit
   (`Lecture log: record the <topic> class of <date>`).
