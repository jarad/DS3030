# DS 3030 - Fall 2026 Course Schedule

Transcribed from the course syllabus. This file is the reference agents and
collaborators use to decide what topic, reading, and assessment a given week
covers. Keep it current; if it disagrees with the syllabus, the syllabus wins.

- **Meetings**: MWF 1:10-2:00 PM, 1030 Morrill Hall
- **Textbook**: James, Witten, Hastie & Tibshirani, *An Introduction to
  Statistical Learning with Applications in R*, 2nd edition (ISLR2)
- **Optional**: Efron & Hastie, *Computer Age Statistical Inference*
- **Readings never include the lab sections.**

## Weekly schedule

Updated 2026-09-19 from a revised syllabus PDF. `HW (syllabus)` is the number
printed in the syllabus; `HW (repo)` is the directory under
`DS3030Private/homework/`. The syllabus renumbered homework to start at HW01
(the old syllabus started at HW00, one behind the repo — see Open questions
for what that means for `hw01`), so as of this revision the two numberings
run in step.

| Week | Monday | Topic | Reading / Quiz | HW (syllabus) | HW (repo) | Exam |
| ---- | ------ | ----- | -------------- | ------------- | --------- | ---- |
| 1  | Aug 24 | Introduction            | —           | —    | —      | |
| 2  | Aug 31 | Statistical Learning    | Ch 2        | HW01 | hw01   | |
| 3  | Sep 07 | Regression              | Ch 3.1-3.2  | HW02 | hw02   | |
| 4  | Sep 14 |                         | Ch 3.3-3.5  | HW03 | hw03   | |
| 5  | Sep 21 | Logistic Regression     | Ch 4.1-4.3  | HW04 | hw04   | |
| 6  | Sep 28 |                         |             | HW05 |        | Exam 1 (Oct 02) |
| 7  | Oct 05 | Classification          | Ch 4.4-4.6  |      |        | |
| 8  | Oct 12 | Resampling              | Ch 5        | HW06 |        | |
| 9  | Oct 19 | Regularization          | Ch 6.1-6.2  | HW07 |        | |
| 10 | Oct 26 | Dimension Reduction     | Ch 6.3-6.4  | HW08 |        | |
| 11 | Nov 02 |                         |             | HW09 |        | Exam 2 (Nov 06) |
| 12 | Nov 09 | Random Forests          | Ch 8        |      |        | |
| 13 | Nov 16 | SVMs                    | Ch 9        | HW10 |        | |
| —  | Nov 23 | *Fall break*            | —           | —    | —      | |
| 14 | Nov 30 | Clustering              | Ch 12       | HW11 |        | |
| 15 | Dec 07 |                         | —           | HW12 |        | |
| —  | Dec 14 | *Finals week*           | —           | —    | —      | Final (tentatively Dec 15, 12-2 PM) |

**Chapter 7 (splines and GAMs) no longer appears anywhere in the calendar** —
the previous syllabus scheduled two weeks for it (Ch 7.1-7.4 and Ch 7.4-7.7)
between Dimension Reduction and Exam 2; this revision removes both and goes
straight from Dimension Reduction (week 10) to Exam 2 (week 11). Treat Ch 7
as dropped from the course unless told otherwise.

**`hw04`'s actual content does not match this table's week-5 topic.** The
table schedules "Logistic Regression, Ch 4.1-4.3" for week 5, but
`LECTURE-LOG.md` shows the class is still on multiple-regression extensions
(feature engineering, flexibility/KNN) as of week 4, and the already-written
`hw04` covers exactly that — polynomials, interactions, diagnostics, and KNN —
not logistic regression. The syllabus's topic column has not caught up to the
actual pace. This needs to be resolved before scheduling week 5 onward with
any confidence; see Open questions.

## Chapters not covered

ISLR2 chapters 7 (Moving Beyond Linearity — splines and GAMs), 10 (Deep
Learning), 11 (Survival Analysis), and 13 (Multiple Testing) do not appear in
the weekly schedule, though the syllabus lists multiple testing and neural
networks among tentative topics. Chapter 7 was in a previous revision of the
syllabus (as "Splines" and "GAMs," weeks 10-11) and has since been removed.
Resolve before writing notes for any of these.

## Assessment structure

| Assessment | Weight | Notes |
| ---------- | ------ | ----- |
| Homework (weekly) | 10% | Quarto PDF, `show-solutions` toggle. Generative AI permitted if disclosed. |
| Quizzes (weekly)  | 10% | Canvas, multiple choice on the assigned ISLR2 reading, **before** lecture. 10 questions drawn at random from a bank, 3 attempts, score is the maximum. Lowest quiz score dropped. |
| Exam 1 | 20% | In class, 50 minutes, closed computer. |
| Exam 2 | 20% | In class, 50 minutes, closed computer. |
| Final Exam | 30% | Cumulative, 2-hour block during finals week. |
| Attendance | 10% | Daily: 3 on time, 1 late, 0 absent. Lowest 3 dropped. |

Grade thresholds: 93 A, 90 A-, 87 B+, 83 B, 80 B-, 77 C+, 73 C, 70 C-, 60 D,
0 F. Thresholds may be lowered at the end of the semester.

## Open questions to resolve

1. **Week 5 topic vs. actual pace (new, unresolved).** The table schedules
   "Logistic Regression, Ch 4.1-4.3" for week 5, but the class is still on
   multiple-regression extensions as of week 4 (see the note under the weekly
   schedule above). Resolve this before treating week 5 onward as settled —
   either the topic column needs updating to reflect the real pace, or a plan
   is needed for catching up.
2. **Homework numbering (mostly resolved, one residual mismatch).** The
   syllabus now runs HW01-HW12, matching the repository's `hw01`-onward
   numbering with no offset — this was previously HW00-HW13 against `hw01`,
   an offset of one, now fixed. One mismatch remains: `hw01`'s actual content
   is a prerequisite check (QR decomposition, SLR calculus derivation), not
   "Statistical Learning" (Ch 2) content, even though the table now pairs it
   with week 2's Ch 2 reading. This is a content/label mismatch, not a
   numbering error, and may be intentional (a prerequisite check assigned in
   week 2 rather than week 1) — worth confirming rather than assuming.

Previously open questions about the Exam 1 date (Oct 02 vs. a week-7 placement)
and the final exam date ("Dec 13" vs. "Dec 15") are resolved as of this
revision: the calendar now places Exam 1 unambiguously in the week 6 row and
the final unambiguously in the Dec 14 week, both consistent with the grading
table.
