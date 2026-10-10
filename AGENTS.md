# NOVDA Textile agent rules — authoritative
You are implementing NOVDA Textile enterprise operations through genuine ERPNext/Frappe. Read `00_START_HERE_UZ.md`, `01_PROJECT_CHARTER.md`, `02_ARCHITECTURE.md`, `QUALITY_GATES.md`, `TASKS.md` and specific source docs before modifying code.

## Priorities
- Do not create a standalone substitute ERP. Do not use JSON/SQLite as financial or stock system. Frappe/ERPNext core is read-only; custom `novda_textile` app and isolated `novda_device_gateway` only.
- First Gate A: write real process diagrams, ADRs, schema and tests and close or register gaps. Gate B: ERPNext actually starts, native Stock Ledger proven, Frappe site app installed. Gate C onward: build tested vertical slices.
- No questions for routine technology decisions; choose conservative documented option and append reason/impact to `DECISIONS.md`. Unknown **real-world** data must stay UNKNOWN, not guessed. Do not demand owner approval to proceed with non-dangerous development.
- Before every task: read latest `PROGRESS.md`, `NEXT_ACTION.md`, `BLOCKERS.md`, `TASKS.md`; choose highest-priority unblocked task; work only on it, run tests, log evidence, mark `[x]` after verifiable pass.
- After task or session: update `PROGRESS.md`, `NEXT_ACTION.md`, `REPORT.md`, `BLOCKERS.md`; commit only files of successful coherent slice. Use feature-specific commits; never git push unless owner separately authorizes.
- NEVER report "full ERP" after health checks, a login page or a JSON prototype. Refer to `QUALITY_GATES.md`.

## Source & safety
- Use current official upstream docs (URLs in `22_REFERENCE_AND_VERIFICATION.md`). Verify installed versions with real commands. Read ERPNext native model before extending it.
- Work only in isolated repo/workspace and disposable Docker site. NO live bank, payroll payments, tax forms, WB/Uzum stock writes, KIZ issuance, supplier notifications. No real credentials or biometrics in repository.
- Do not run destructive commands over other projects, host paths or production resources. No privilege elevation, internet piped to shell, host system rewrites, or global Docker prune.
- Validate partner isolation server-side and idempotency/reversals. No backdating/stock-adjustment bypass.
- If blocked (hardware/manual/secret), build a simulator and contract tests, label MOCK, record blocker and continue independent tasks.
- Automated coding must retain exact task acceptance evidence; plain "tests passed" without command and references is not evidence.

## Deliverables required for each feature
1. Design flow, ERD/API request/response and native ERP mapping.
2. Server permissions, preconditions/state machine and transactions.
3. Operator/supplier UX incl. offline/error/partial handling.
4. Tests: happy, duplication, stale event, invalid state, auth, concurrency/reversal.
5. Docs and rollback; evidence of actual native ERP posting where financial/stock involved.

## Output language
Operator UX Uzbek (Latin), external partner optional Russian, developer docs English or Uzbek; keep domain names and ID contracts stable.
