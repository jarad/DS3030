# DS 3030 - Notation and Naming Conventions

Specific symbol- and word-level decisions for this course's notes, settled
once here so they don't have to be re-decided (or silently redecided
differently) chapter by chapter. `CLAUDE.md` covers the broader authoring
rules these decisions sit inside; this file is the reference for "which
symbol wins" and "which of two near-synonyms to use."

When a decision below turns out to be wrong for a specific case, fix the case
and this file together — don't quietly drift away from a documented
convention.

## Notation

- **The model matrix is $\mathbf{X}$ (bold).** Bare $X$ is reserved for a
  scalar explanatory variable or a generic random variable, and students
  taking this course are simultaneously seeing both uses of $X$ in their
  first statistical theory course, so the collision is worth resolving with
  typography rather than context alone. A row of the matrix, $X_i$ or
  $X_{ij}$, does not need bolding — its subscript already marks it as
  something other than the whole matrix or a bare scalar.
- **Nested delimiters cycle `()`, then `[]`, then `{}`, then back to `()`**
  for a fourth level, innermost first. A single, non-nested delimiter
  defaults to `()`. Two levels are `[(\cdot)]`; three are `{[(\cdot)]}`.
  Never repeat the same bracket at two nested levels, and never use a level's
  bracket out of cycle order. Example: $E[(Y - \hat f(X))^2]$, not
  $E\{[Y-\hat f(X)]^2\}$ and not $E(Y-\hat f(X))^2$. This governs $E[\cdot]$,
  $Var[\cdot]$, $Bias[\cdot]$ and any other nested mathematical expression —
  it is a general typesetting rule, not one specific to expectation notation.
- **The indicator function is $\mathrm{I}(\cdot)$**, upright, never plain
  italic $I(\cdot)$ — it names a function, not a variable.
- **"Reference," not "baseline,"** for the category or bin a set of dummy
  variables or step-function indicators is measured against — one word for
  both the categorical-factor case and the binned-quantitative-feature case.
- **"Explanatory variable" and "feature" are not interchangeable.** An
  explanatory variable is a raw column recorded in the data. A feature is the
  value of a basis function $h_j$ applied to one or more explanatory
  variables — the column that actually enters the model as $h_j(X)$. They
  coincide only when $h_j$ is the identity on a single explanatory variable,
  which is every model before `03-regression/30-feature-engineering.qmd`
  introduces basis functions: a polynomial term $h_j(X) = X_1^2$ is a feature
  built from one explanatory variable, and an interaction term
  $h_j(X) = X_1 X_2$ is a feature built from two. Use "explanatory variable"
  for the raw recorded quantity and "feature" for whatever actually enters
  the model, rather than treating either as a general-purpose synonym for
  the other.
- **The $p$ collision (feature count vs. fitted probability) is open —
  no decision yet.** `$p$` is used throughout for the number of features in a
  model, and Classification chapters also use $p(X)$ for the fitted
  probability of the event, bare $p$ for a probability in odds expressions
  like $p/(1-p)$, and (in the problems-in-logistic-regression chapter) $p$
  for a p-value as well. Do not silently pick a fix — flag instances but
  leave the resolution pending until the instructor decides.

## Naming

- **Collapsed callouts use exactly one of three fixed headings** — never a
  variant or a bespoke alternative:
  - `### For example,` — a short illustrative aside inside a theory
    subsection.
  - `### Code` — extensive setup code (simulating data, fitting several
    models, building a table or figure), always this exact heading and never
    "Code for the figure/table/plots below" or any other description of what
    the code produces.
  - `### Beyond this course` — a pointer to related material that is
    mentioned but not taught or tested. Always `.callout-note`, never
    `.callout-important` or another callout class — the point is that it
    reads as calmly out-of-scope, not urgent.
- **No heading uses an `Example:` prefix, or the bare word "Example," ever.**
  A heading that names a worked example is named after what the example
  actually is (`## Credit card default probability`, not
  `## Example: credit card default`) — see `CLAUDE.md`'s heading rules for
  the full statement of this convention.
