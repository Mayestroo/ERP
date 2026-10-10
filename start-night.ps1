# Bounded unattended build: default 4 rounds, one OpenCode process at a time.
# This cannot guarantee ERP completion or override rate limits.
param([ValidateRange(1,12)][int]$Rounds = 4)
$ErrorActionPreference = 'Continue'
Set-Location $PSScriptRoot
$oc = Get-Command opencode.cmd -ErrorAction SilentlyContinue
if ($null -eq $oc) { $oc = Get-Command opencode -ErrorAction SilentlyContinue }
if ($null -eq $oc) { throw 'OpenCode not found.' }
$mutex = New-Object System.Threading.Mutex($false, 'Local\NOVDAERP_AUTOPILOT')
$acquired=$false
try {
 $acquired=$mutex.WaitOne(0)
 if (-not $acquired) { throw 'OpenCode already running for NOVDA. Close older process first.' }
 New-Item -ItemType Directory -Path 'agent-logs' -Force | Out-Null
 for ($i=1;$i -le $Rounds;$i++) {
   $log=Join-Path $PSScriptRoot ('agent-logs\round-'+$i+'-'+(Get-Date -Format 'yyyyMMdd-HHmmss')+'.log')
   $p='NOVDA: Read AGENTS.md/QUALITY_GATES.md/TASKS.md/PROGRESS.md/NEXT_ACTION.md. Complete highest priority nonblocked task(s) with proof. Update reports and one next action. Never make fake ERP or bypass gates. Do not ask for routine approvals. End when coherent task verified or blocked.'
   Write-Host ('Starting bounded round '+$i+' of '+$Rounds+'. Log: '+$log)
   if ($i -eq 1) { & $oc.Source run --auto $p *>> $log }
   else { & $oc.Source run --auto --continue $p *>> $log }
   $exit=$LASTEXITCODE
   if ($exit -ne 0) { Write-Host ('Stop on OpenCode exit code '+$exit+'. See '+$log); break }
   if (-not (Test-Path 'NEXT_ACTION.md')) { Write-Host 'NEXT_ACTION missing; stopping'; break }
   if ((Get-Content NEXT_ACTION.md -Raw) -match '(?i)STOP_AUTOPILOT|PRODUCTION_APPROVAL_REQUIRED') { Write-Host 'Safe stop marker found'; break }
 }
 Write-Host 'Rounds ended. Review REPORT.md, PROGRESS.md, BLOCKERS.md and logs.'
} finally { if ($acquired) { $mutex.ReleaseMutex() }; $mutex.Dispose() }
