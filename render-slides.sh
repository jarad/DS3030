#!/usr/bin/env bash
# Renders every DS3030 slide deck (*_slides.qmd) and places the output where
# the published site expects it: alongside its notes chapter under docs/,
# with the _freeze figures it reuses copied to a matching docs/_freeze/ path
# (docs/ only ever holds what's served by GitHub Pages, so a deck's
# ../_freeze/... image references need that mirror to keep resolving once
# the deck moves there). CI calls this same script, so there is one
# implementation of this logic, not one in bash-in-YAML and a second
# reimplemented locally.
#
# Run after `quarto render` (which renders the book chapters into docs/) to
# preview the full site, including chapter-to-slides links, locally:
#
#   quarto render
#   ./render-slides.sh
#   cd docs && python3 -m http.server 8000
#
# `quarto preview` will NOT show working slides links: slide decks are
# deliberately excluded from the book project (see CLAUDE.md), so quarto's
# live-reloading preview never touches them.
set -euo pipefail
cd "$(dirname "$0")"

find . -name '*_slides.qmd' -not -path './docs/*' | while read -r f; do
  quarto render "$f"
  dir=$(dirname "$f")
  base=$(basename "$f" .qmd)
  mkdir -p "docs/$dir"
  cp "$dir/$base.html" "docs/$dir/$base.html"
  rm -f "$dir/$base.html"
  if [ -d "$dir/${base}_files" ]; then
    mkdir -p "docs/$dir/${base}_files"
    cp -R "$dir/${base}_files/." "docs/$dir/${base}_files/"
    rm -rf "$dir/${base}_files"
  fi
  chapter=${base%_slides}
  freeze_dir="_freeze/$dir/$chapter/figure-html"
  if [ -d "$freeze_dir" ]; then
    mkdir -p "docs/_freeze/$dir/$chapter/figure-html"
    cp -R "$freeze_dir/." "docs/_freeze/$dir/$chapter/figure-html/"
  fi
done
