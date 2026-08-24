# DS3030

Public course material for **DS 3030 - Concepts and Applications of Machine Learning** at Iowa State University.

## Repository structure

- `/index.qmd` - homepage for the public course site
- `/lectures` - Quarto source files for lecture slides
- `/_quarto.yml` - shared Quarto project configuration
- `/.github/workflows/publish.yml` - GitHub Actions workflow that renders and deploys the site to GitHub Pages

## Authoring lecture slides

1. Add a new numbered Quarto file in `/lectures`, such as `02-linear-models.qmd`.
2. Use Quarto slide content with R code chunks like `{r}` for examples.
3. Preview locally with `quarto preview` when Quarto and R are installed.
4. Merge changes into `main` to publish the updated HTML site through GitHub Actions.

## Publishing

The site is configured to deploy to GitHub Pages from the `main` branch using GitHub Actions.
Enable GitHub Pages in the repository settings and select **GitHub Actions** as the source if it is not already enabled.
