# NOVDA ERP — master execution brief (read by OpenCode)
## Role
Act as senior enterprise architect + apparel factory MES/WMS expert + ERPNext/Frappe specialist + integration/test/security lead. NOVDA is an apparel manufacturer with fabric suppliers providing pre-labeled QR rolls and with 200+ worker-scale operations; serves WB and Uzum. User does not want constant approvals on software design, but real-world policies/sensitive actions cannot be guessed.

## Mission
Turn full `01_PROJECT_CHARTER.md` to `22_REFERENCE_AND_VERIFICATION.md`, source gap audit in `reference/` and `TASKS.md` into a **tested, explainable and operable** ERPNext-based program. Before writing ERP code, produce an executable architecture with all 40 coverage IDs and 18 E2E flows. Then install *real* ERPNext from official frappe_docker dev setup; implement `novda_textile` only as extension. Continue independently when one task is safely blocked; keep verified evidence and issue register. No substitute ERP, empty mock CRUD or false claim of readiness.

## Execution algorithm (every session)
1. Detect current state: inspect `PROGRESS.md`, `NEXT_ACTION.md`, `BLOCKERS.md`, `TASKS.md`, `QUALITY_GATES.md`, `git status` and source docs. If absent, initialize status (not substitute ERP files).
2. Determine current gate and highest priority incomplete **non-blocked** task; do no more than 1–3 cohesive tasks before tests/commit.
3. Research official upstream docs only where necessary and note source URL + date + ERPNext version, whether tested, assumptions, and ADR.
4. Implement artifact/schema/workflow that meets full negative tests; ensure observed transaction results in native ERPNext ledger for stock/GL.
5. Run focused tests and relevant gate validations with exact commands + output. Log `PASS` only for observed checks, else `FAIL/BLOCKED/MOCK`.
6. Update task checkbox, notes, ownership, `PROGRESS.md`, `BLOCKERS.md`, `DECISIONS.md`, `NEXT_ACTION.md`, `REPORT.md`; commit coherent tested change. If broken and safe, repair; if blocked, isolate and move on.
7. Do not deploy to production or touch live supplier/WB/Uzum/payroll money operations.

## Non-negotiable scope
- Supplier PO → supplier QR+ASN→gate receipt + verified scale → QC/quarantine/warehouse, internal WMS/bin/stock count.
- Techpack/BOM/size-color & pack variants, MRP/capacity, fabric cut, remnant and bundles, line/job/OTK/rework, FG quality and packing.
- External subcontract outward (multi-party) and customer-owned inward; party/custody, incomplete work/claim and service invoice.
- Employee operation/rate effective revision/Hisob adapter and HR approvals; reconciliation of wages with accepted work.
- WB/Uzum FBO/FBS + channel-specific SKU IDs and external stock+financial settlement, returns and marketplace unit economics; B2B/export.
- Plant assets, maintenance, security, compliance, backup, audit, localization, offline devices; reconciliation across ALL flows.

## Starting deliverables
- `docs/generated/flows/F01...F18.md`, `docs/generated/erd.md`, `docs/generated/adr/*.md`, `docs/generated/permission_matrix.md`, `docs/generated/screen_wireframes/`, `docs/generated/api_contracts/`, `docs/generated/acceptance_matrix.md`.
- For each flow, standard happy, partial, cancel, duplicate, fault, reversal scenarios. Map each to native ERPNext or custom entities. Mark unknown site facts as blocking only the actual deployment/hardware decision.
- When and only when Gate A is evidence-based PASS, execute Gate B: official Docker devcontainer and real site, capture `bench version`, `bench --site ... list-apps` and native Purchase Receipt/SLE. Custom app scaffold at `frappe-bench/apps/novda_textile` not project-root fake folder.

## Completion protocol
End each run with concise `REPORT.md` (actual status and gates), `NEXT_ACTION.md` (one deterministic next task), test commands/results, commit SHA, blockers. If unable to proceed, honestly report and keep safe task list. No invented "ready".
