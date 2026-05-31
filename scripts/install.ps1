param(
  [string]$Destination = "$HOME\.codex\skills"
)

$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$skillsRoot = Join-Path $repoRoot "skills"

if (-not (Test-Path -LiteralPath $skillsRoot)) {
  throw "Skills directory not found: $skillsRoot"
}

New-Item -ItemType Directory -Force -Path $Destination | Out-Null

Get-ChildItem -LiteralPath $skillsRoot -Directory | ForEach-Object {
  $target = Join-Path $Destination $_.Name
  Copy-Item -LiteralPath $_.FullName -Destination $target -Recurse -Force
  Write-Host "Installed skill: $($_.Name) -> $target"
}

Write-Host "Done. Restart Codex to reload installed skills."
