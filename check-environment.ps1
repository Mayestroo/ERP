$ErrorActionPreference = 'Continue'
Write-Host 'NOVDA ERP — read-only environment check' -ForegroundColor Cyan
$checks = @('git','docker','wsl','opencode')
foreach ($c in $checks) {
  $cmd = Get-Command $c -ErrorAction SilentlyContinue
  if ($null -eq $cmd) { Write-Host ('MISSING: '+$c) -ForegroundColor Red }
  else { Write-Host ('FOUND: '+$c+' at '+$cmd.Source) }
}
Write-Host '---'
try { docker info --format '{{.ServerVersion}}' } catch { Write-Host 'Docker daemon unavailable.' }
try { docker compose version } catch { Write-Host 'Docker Compose unavailable.' }
try { wsl --status } catch { Write-Host 'WSL may be unavailable.' }
try { opencode --version } catch { Write-Host 'OpenCode auth/install check manually.' }
Write-Host 'Check WSL2, Linux containers, >=8GB Docker RAM where possible, and enough storage.'
Write-Host 'This script does NOT install or modify systems.'
