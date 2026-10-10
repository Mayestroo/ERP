# 19 — Real ERPNext development setup (Windows/WSL2/Docker)
## Before installation
- Docker Desktop Linux containers + WSL2 backend, VS Code Dev Containers extension, Git, working OpenCode auth. Recommend >=8 GB RAM allocated to Docker when possible, 4 CPU and ample free disk; check actual resource usage.
- `docker info`, `docker compose version`, `wsl --status`, `git --version`, `opencode --version`; env checker provided, but it does **not** install ERPNext.

## Official source / version pinned only after verification
Official docs: https://github.com/frappe/frappe_docker ; https://frappe.github.io/frappe_docker/05-development/01-development.html and current repo README. The development guide can change, **do not blindly use old example scripts**. Agent records verified tag/commit SHA.

## Development bootstrap example (PowerShell first)
```powershell
git clone https://github.com/frappe/frappe_docker.git C:\work\frappe_docker
cd C:\work\frappe_docker
Copy-Item -Recurse devcontainer-example .devcontainer
code .
```
Then VS Code: **Dev Containers: Reopen in Container**. Inside Linux container, use current official dev guide, pinned compatible Frappe/ERPNext versions and site settings, rather than extrapolating from old v14 examples. On successful site:
```bash
cd /workspace/development/frappe-bench
bench --site development.localhost list-apps
bench new-app novda_textile
bench --site development.localhost install-app novda_textile
bench --site development.localhost migrate
```
**`bench new-app` is run only after Frappe bench/site + ERPNext are actually installed.** It may prompt interactively; agent can pass documented flags or configure in dev environment. `pwd.yml` is ephemeral tryout, not persistent custom-app development. Do not re-clone ERPNext core and start editing it.

## Proof of ready installation
Save exact `docker compose ps`, `bench version`, `bench --site development.localhost list-apps`, site HTTP/UI login screenshot or operational evidence, `bench doctor`, successful first Purchase Receipt and inspected Stock Ledger rows. Do not mark Gate B passed without ERPNext app installed and tested.

## Deployment path
Devcontainer → versioned `novda_textile` Git repo → CI+fixture migrations → custom Docker image including pinned app versions → pilot environment → operational DR drill → production change window. Never ship untested devcontainer data to production.
