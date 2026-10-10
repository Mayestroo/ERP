# One bounded OpenCode run; no repeat loop. Must be run within isolated project.
param([switch]$ContinueSession)
$ErrorActionPreference = 'Continue'
Set-Location $PSScriptRoot
$oc = Get-Command opencode.cmd -ErrorAction SilentlyContinue
if ($null -eq $oc) { $oc = Get-Command opencode -ErrorAction SilentlyContinue }
if ($null -eq $oc) { throw 'OpenCode not found in PATH.' }
$mutex = New-Object System.Threading.Mutex($false, 'Local\NOVDAERP_AUTOPILOT')
$acquired = $false
try {
  $acquired = $mutex.WaitOne(0)
  if (-not $acquired) { throw 'Another NOVDA OpenCode run is active. Do not run concurrently.' }
  New-Item -ItemType Directory -Path 'agent-logs' -Force | Out-Null
  $log = Join-Path $PSScriptRoot ('agent-logs\phase-'+(Get-Date -Format 'yyyyMMdd-HHmmss')+'.log')
  $p='Read AGENTS.md, MASTER_PROMPT.md, TASKS.md, QUALITY_GATES.md, PROGRESS.md, NEXT_ACTION.md. Execute highest priority safe unfinished task, validate acceptance evidence, update logs and commit. Do not fake ERP or advance unpassed gate.'
  if ($ContinueSession) { & $oc.Source run --auto --continue $p *>> $log }
  else { & $oc.Source run --auto $p *>> $log }
  $status = $LASTEXITCODE
  Write-Host ('OpenCode status: '+$status+'; log: '+$log)
  if ($status -ne 0) { throw ('OpenCode returned exit status '+$status) }
} finally { if ($acquired) { $mutex.ReleaseMutex() }; $mutex.Dispose() }
