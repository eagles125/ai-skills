# architecture-diagram Skill

## Source

This skill is based on the local `architecture-diagram` Codex skill originally authored by Cocoon AI.

Original metadata from `SKILL.md`:

- Name: `architecture-diagram`
- Version noted in source: `1.1`
- License noted in source: `MIT License`
- Author noted in source: Cocoon AI, `hello@cocoon-ai.com`

This repository keeps the original skill structure and documents the local modifications made for sharing and deployment.

## What It Does

`architecture-diagram` helps Codex create professional dark-themed technical architecture diagrams as self-contained HTML files. Each generated diagram uses inline SVG and embedded CSS, so it can be opened directly in a browser.

Typical use cases:

- System architecture diagrams
- Cloud deployment diagrams
- Service dependency diagrams
- Security or network topology diagrams
- Infrastructure review diagrams

## Deployment

### Option 1: Install All Skills

```powershell
git clone https://github.com/eagles125/ai-skills.git
cd ai-skills
powershell -ExecutionPolicy Bypass -File .\scripts\install.ps1
```

### Option 2: Install Only architecture-diagram

```powershell
git clone https://github.com/eagles125/ai-skills.git
Copy-Item -Recurse -Force .\ai-skills\skills\architecture-diagram "$HOME\.codex\skills\architecture-diagram"
```

Restart Codex after installation.

## Directory Layout

```text
skills/
  architecture-diagram/
    SKILL.md
    resources/
      template.html
docs/
  architecture-diagram.md
scripts/
  install.ps1
```

## Local Modifications

The main modification is export support in the generated diagram toolbar.

Original toolbar behavior:

- Copy high-DPI PNG to clipboard
- Download high-DPI PNG
- Download PDF

Modified toolbar behavior:

- Copy high-DPI PNG to clipboard
- Download high-DPI PNG
- Download direct SVG
- Download PDF

Implementation details:

- Added `downloadSVG()` to `resources/template.html`
- Added a `◇ SVG` button to the toolbar template
- Updated `SKILL.md` to document the new SVG export capability
- SVG export serializes the main `.diagram-container svg` with `XMLSerializer`
- PNG and PDF export continue to use `html2canvas`

## Notes

The SVG export is best for the main diagram content. The exported SVG does not include the surrounding HTML page, summary cards, or toolbar. PNG and PDF export capture the full report container.
