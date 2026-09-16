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

`HW (syllabus)` is the number printed in the syllabus. `HW (repo)` is the
directory under `DS3030Private/homework/` — fill this in as assignments are
written, since the two numberings currently differ by one (see Open questions).

| Week | Monday | Topic | Reading / Quiz | HW (syllabus) | HW (repo) | Exam |
| ---- | ------ | ----- | -------------- | ------------- | --------- | ---- |
| 1  | Aug 24 | Introduction            | —           | —    | —      | |
| 2  | Aug 31 | Statistical Learning    | Ch 2        | HW00 | hw01   | |
| 3  | Sep 07 | Regression              | Ch 3.1-3.2  | HW01 | hw02   | |
| 4  | Sep 14 |                         | Ch 3.3-3.5  | HW02 | hw03   | |
| 5  | Sep 21 | Logistic Regression     | Ch 4.1-4.3  | HW03 |        | |
| 6  | Sep 28 | Classification          | Ch 4.4-4.6  | HW04 |        | Exam 1 (Oct 02) |
| 7  | Oct 05 | Resampling              | Ch 5        | HW05 |        | |
| 8  | Oct 12 | Regularization          | Ch 6.1-6.2  | HW06 |        | |
| 9  | Oct 19 | Dimension Reduction     | Ch 6.3-6.4  | HW07 |        | |
| 10 | Oct 26 | Splines                 | Ch 7.1-7.4  | HW08 |        | |
| 11 | Nov 02 | GAMs                    | Ch 7.4-7.7  | HW09 |        | Exam 2 (Nov 06) |
| 12 | Nov 09 | Random Forests          | Ch 8        | HW10 |        | |
| 13 | Nov 16 | SVMs                    | Ch 9        | HW11 |        | |
| —  | Nov 23 | *Fall break*            | —           | —    | —      | |
| 14 | Nov 30 | Clustering              | Ch 12       | HW12 |        | |
| 15 | Dec 07 | Review                  | —           | HW13 |        | |
| —  | Dec 14 | *Finals week*           | —           | —    | —      | Final (tentatively Dec 15, 12-2 PM) |

## Chapters not covered

ISLR2 chapters 10 (Deep Learning), 11 (Survival Analysis), and 13 (Multiple
Testing) do not appear in the weekly schedule, though the syllabus lists
multiple testing and neural networks among tentative topics. Resolve before
writing notes for them.

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

These are discrepancies within the syllabus itself, left here rather than
silently resolved:

1. **Exam 1 placement.** The grading table dates Exam 1 as Oct 02, which is the
   Friday of week 6 (Sep 28). The calendar places Exam 1 in the week 7 row
   (Oct 05). The table above follows the Oct 02 date; if the exam is actually in
   week 7, the date should read Oct 09.
2. **Final exam date.** The grading table says "tentatively Dec 15, 12-2 PM";
   the calendar row reads "Dec 13", which is a Sunday in 2026. The table above
   uses Dec 14 as the Monday of finals week and keeps Dec 15 as the exam date.
3. **Homework numbering.** The syllabus runs HW00-HW13 while the repository
   starts at `hw01`. Repository `hw01` is the prerequisite check, `hw02` covers
   Ch 2, and `hw03` covers SLR estimation — an offset of one from the syllabus
   column. Pick one numbering and make the other match.
