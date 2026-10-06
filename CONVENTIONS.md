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

- **The model matrix is $\mathbf{X}$ (bold). A row of the matrix is lowercase
  $x_i$ or $x_{ij}$, unbolded** — e.g. $x_i = (1, x_{i1}, \ldots, x_{ip})$.
  Bare capital $X$ (or $X_1, \ldots, X_p$, subscripted by *feature* rather
  than observation) is reserved for a scalar explanatory variable or a
  generic random variable, and students taking this course are
  simultaneously seeing that use of $X$ in their first statistical theory
  course. Lowercase for the row is deliberate, not arbitrary: a row of
  $\mathbf{X}$ is conditioned on throughout — every assumption and every
  derivation in this book treats $x_i$ as a known, fixed value, never as a
  random variable — and lowercase is the standard way to write a fixed value
  of a random variable. (This reverses an earlier version of this
  convention, which documented capital $X_i$/$X_{ij}$ for the row; that
  version was never applied consistently, and lowercase is the better
  choice for the reason above, not merely the more common one in practice.)
  The generative-classifier chapters are the one exception, where the
  features are random; see the independence bullet below.
- **Nested delimiters cycle `()`, then `[]`, then `{}`, then back to `()`**
  for a fourth level, innermost first. A single, non-nested delimiter
  defaults to `()`. Two levels are `[(\cdot)]`; three are `{[(\cdot)]}`.
  Never repeat the same bracket at two nested levels, and never use a level's
  bracket out of cycle order. Example: $E[(Y - \hat f(X))^2]$, not
  $E\{[Y-\hat f(X)]^2\}$ and not $E(Y-\hat f(X))^2$. This governs any nested
  mathematical expression, including a function's argument such as
  $\exp\left[-\tfrac{1}{2}\left(x-\mu\right)^2/\sigma^2\right]$.
  **The one exception is the expectation-type operators $E[\cdot]$,
  $Var[\cdot]$, $Cov[\cdot]$, and $Bias[\cdot]$: their own brackets are
  always square, at any depth, so $Var[E[Y \mid X]]$ is correct as written.**
  Groupings inside one of these brackets still follow the cycle from $()$
  (so $E[(Y - \hat f(X))^2]$), and a grouping that contains one, which must
  sit outside the $[\cdot]$ it holds, takes $\{\cdot\}$:
  $\left\{E[Y_i \mid x_i]\right\}^2$.
- **Every model statement writes its independence assumptions in the
  notation**, not only in words. Observations are indexed $i = 1, \ldots, n$
  and independence over them is shown with $\stackrel{ind}{\sim}$, e.g.
  $Y_i \mid x_i \stackrel{ind}{\sim} \text{Bernoulli}\left[p(x_i)\right]$, or
  for a generative classifier
  $Y_i \stackrel{ind}{\sim} \text{Categorical}\left(\pi_1, \ldots, \pi_K\right)$,
  $X_i \mid Y_i = k \stackrel{ind}{\sim} N_p\left(\mu_k, \Sigma\right)$. Where
  features are also assumed independent, the index runs over them too: naive
  Bayes writes $X_{ij} \mid Y_i = k \stackrel{ind}{\sim} f_{kj}$ over $i$ and
  $j$, and the prose after the display says which index carries which
  assumption. The book uses $\stackrel{ind}{\sim}$ only, never
  $\stackrel{iid}{\sim}$; identical distribution is visible from parameters
  that do not depend on $i$. A bare $\sim$ is for a distribution that is not
  a model for the observations, such as a derived one
  ($S_+ - S_- \sim N\left(\mu_2 - \mu_1, 2\sigma^2\right)$, in
  `04-classification/55-classifier-evaluation.qmd`). In the
  generative-classifier chapters (`04-classification/50-lda.qmd` and
  `60-qda-naive-bayes.qmd`) the features of observation $i$ are random and
  written capital, $X_i$ or $X_{ij}$, with observed values $x_i$ and
  $x_{ij}$: the lowercase-for-fixed-values reasoning of the model-matrix
  convention above, applied to a model that does not condition on the
  features. There $x_i = (x_{i1}, \ldots, x_{ip})^\top$ is the observed
  $p$-vector of features, a column without the leading $1$ (it is the
  argument of a multivariate density), not a row of $\mathbf{X}$.
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
- **$K$ is the number of classes**, with classes indexed $k = 1, \ldots, K$,
  matching ISLR2. This applies from `04-classification/50-lda.qmd` onward,
  including `55-classifier-evaluation.qmd` and `60-qda-naive-bayes.qmd`.
  $C$ is not used for class count going forward:
  `55-classifier-evaluation.qmd` (split out of `50-lda.qmd`) uses $c$ for an
  ROC cutoff and $c_{FN}$/$c_{FP}$ for misclassification costs, so $C$ would
  collide. The earlier chapters `02-learning/30-classification.qmd`
  and `04-classification/10-logistic-regression.qmd` write $C$ (and index
  classes by $c$); that predates this decision and is not being retroactively
  renamed, and `50-lda.qmd` says so in a bridging sentence where $K$ is
  introduced.
- **$K$ is also the number of neighbors in KNN**, again matching ISLR2
  (`03-regression/40-flexibility.qmd` onward). The two meanings are
  contextual. A passage that uses KNN alongside a class count (e.g. KNN
  classification compared with the generative classifiers) must make clear
  which $K$ is meant rather than introduce a new symbol for either.
- **$D$ is an indicator (dummy) variable**, e.g.
  $D = \mathrm{I}(\texttt{student} = \texttt{Yes})$ in the `Default`
  examples. A diagonal covariance matrix (Gaussian naive Bayes, in
  `04-classification/60-qda-naive-bayes.qmd`) is therefore written
  $\Lambda_k = \text{diag}(\sigma_{k1}^2, \ldots, \sigma_{kp}^2)$, not $D_k$.
  $D$ is also, contextually, the **residual deviance** of a fitted model
  (`04-classification/20-multiple-logistic-regression.qmd`, where
  $G^2 = D_r - D_f$, and `04-classification/70-generalized-linear-models.qmd`).
  The two meanings do not appear in the same passage; a chapter that uses $D$
  for the deviance says so in one sentence where it first appears.
- **Generalized linear models write $\mu_i = E[Y_i \mid x_i]$ for the mean,
  $\eta_i = x_i\beta$ for the linear predictor, and $g$ for the link**, with
  $g(\mu_i) = \eta_i$ (`04-classification/70-generalized-linear-models.qmd`
  onward). This departs from ISLR2 in two places, each noted in a bridging
  sentence in that chapter: ISLR2 writes $\eta$ for the link function itself,
  but these notes already used $\eta$ for the linear predictor in the
  logistic regression chapters; and ISLR2 writes $\lambda$ for the Poisson
  mean, where these notes use the general GLM symbol $\mu_i$. The variance is
  written $Var[Y_i \mid x_i] = \phi\, V(\mu_i)$, with $V$ the variance
  function and $\phi$ the dispersion parameter. The observation-indexed mean
  $\mu_i$ is distinct from the class mean $\mu_k$ of the discriminant
  analysis chapters; the GLM chapter says so where $\mu_i$ is defined. In
  the GLM chapter the logistic-regression probability is written $\mu_i$
  (identified once with the earlier $p(x_i)$), which avoids a new bare-$p$
  probability.
- **"Rate ratio"** names $e^{\beta_j}$ in Poisson regression: the factor by
  which the mean count is multiplied per one-unit increase in feature $j$,
  the analogue of the odds ratio.
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
  the full statement of this convention. The one exception is a `##` section
  that exists purely to group several worked examples together and is named
  for that grouping function rather than mislabeling any one example — e.g.
  `04-classification/30-flexible-logistic-regression.qmd`'s `## Examples`,
  whose own `###` children are still named for their content, not "Example:
  ...". This exception is for a container heading only, never for a heading
  that names a single example.
