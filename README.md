# ai-skills

Personal Codex skills collection.

## Included Skills

- `architecture-diagram`: Create polished dark-themed architecture diagrams as self-contained HTML + SVG files.

## Quick Install

Clone this repository, then install all included skills into your local Codex skills directory:

```powershell
git clone https://github.com/eagles125/ai-skills.git
cd ai-skills
powershell -ExecutionPolicy Bypass -File .\scripts\install.ps1
```

By default, the script installs skills to:

```text
$HOME\.codex\skills
```

You can also install a single skill manually:

```powershell
Copy-Item -Recurse -Force .\skills\architecture-diagram "$HOME\.codex\skills\architecture-diagram"
```

Restart Codex after installation so it can reload the skill list.

## Documentation

- [architecture-diagram notes](./docs/architecture-diagram.md)
- [architecture-diagram skill](./skills/architecture-diagram/SKILL.md)
