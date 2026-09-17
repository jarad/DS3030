#!/usr/bin/env Rscript
# Install any package this course uses (see DESCRIPTION's Imports) that is
# missing from this machine. Never upgrades a package that is already
# installed -- upgrading mid-semester has broken working lecture code before,
# so updates are a deliberate, separate decision, not a side effect of
# installing something new.

if (!requireNamespace("remotes", quietly = TRUE)) {
  install.packages("remotes")
}

remotes::install_deps(dependencies = TRUE, upgrade = "never")
