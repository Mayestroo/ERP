# 15 — Environments, deployment, monitoring, backup/restore
## Environments
`dev`: fake data + mock supplier/market. `ci-test`: isolated DB, reproducible fixtures. `pilot`: controlled real data entered with process-owner checks, manual reconciliation. `production`: separate infra only with written cutover and backup validation.

## Stack
Official Frappe Docker devcontainer for development. Compatible pinned Frappe/ERPNext branches, custom `novda_textile` app and optionally `novda_device_gateway` separate service. MariaDB + Redis. Linux production runtime; staging deploy from Git commit SHA + custom image. No direct edit of core or prod container filesystem.

## CI quality pipeline
Static lint/format/type checks, DocType migrations test, role/permissions regression, Frappe native integration tests, scan/scale simulator faults, native SLE and GL reconciliation, load test, backup restore. A green JS-only HTTP health test does NOT satisfy integration.

## Observability
Health of ERP web/worker/db/redis, queue backlog, unposted measurement count, difference cases, API lag, print spool age, gateway heartbeat, DB size, backups, expired calibration, invalid QR, unauthorized access attempts. Alerts assigned to an actual job title and response runbook.

## Recovery
State RPO/RTO only after validated capacity. Encrypted daily database+file backups, offsite retention, routine restore to isolated environment; screenshots of successful sample roll/WO/SLE/GL reconciliation. Crash mid-command recovered by idempotency and outbox. Schedule/retention policy must be reviewed by IT.

## Security boundaries
Agent may use disposable dev environment with no secret mounts; not allowed to execute external payments, live marketplace stock sync, production schema resets or compliance marking. Production root/SSH/payment credentials never shared.
