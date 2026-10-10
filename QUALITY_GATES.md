# QUALITY GATES — STOP/GO contract
## Gate A: design coverage (no ERP code as substitute)
- 40/40 G01–G40 process ownership, entry/exit/doc/exception, screen and acceptance tests mapped (UNKNOWN allowed with blocker).
- 18/18 F01–F18 generated flow detail docs and controls, maps physical to business state, partial/cancel/rework/replay.
- ERD/IDs/UOM/ownership/rates/transaction invariants reviewed against available data and marked facts vs assumptions.
- Partner isolation, scanner/scale/print protocol, offline plan, legal marking namespaces, native ERP doc mapping tested conceptually.
- Deliver `docs/generated/GATE_A_EVIDENCE.md` with source references; **do not claim fact checked when unknown**.

## Gate B: authentic ERPNext environment
- Upgraded pinned compatible Frappe and ERPNext running from official Frappe Docker development environment (not pwd demo).
- bench site and `novda_textile` app installed; migrations run on disposable DB; actual native stock Purchase Receipt and Stock Ledger inspected; negative stock denied.
- Logs show versions, commands, ERPNext installed app list; no JSON stand-in; repeatable boot instructions and verified repo commit.

## Gate C: true receiving-through-cutting vertical slice
- Supplier scoped PO/ASN + duplicate-safe Roll QR + print after committed receipt + scale simulator + quarantine/QC + putaway; native Purchase Receipt, Stock Entry / Stock Ledger validate.
- Roll-to-cut issue + mass balance/remnant/bundle genealogy + stage QC; can handle partial/mismatch/retry/reversal.
- Permissions negative tests and crash recovery pass; `AT01-AT08`, `AT28` evidence.

## Gate D: complete shop floor, partner and packing pilot
- Work Order→bundle→verified operation/piece-rate→QC/rework→FG→carton manifest and outsourced transfer and return; native valuation, no double pay.
- End-to-end UAT `AT09-AT14`, `AT20`, `AT24`; separate client-owned material trace and Hisob dry-run report.

## Gate E: channels, finance and operational readiness
- WB/Uzum mock/read-only connectors reconcile orders, reserves, external stocks, FBO/FBS, returns and settlement. Live API update disabled until approved.
- B2B, production costing, GL and month-end, role isolation, backup restore, load baseline; `AT15-AT30` evidence.
- Pilot UAT with real hardware tests and authorized owner signatures before production.

## Failure / communication rules
1. Gate FAIL = remain on phase or skip unrelated tasks; NEVER advance by writing mock dashboard or pretending test passed.
2. Open issues listed in `BLOCKERS.md` with severity, attempted path, docs and owner. Continue other safe work; do not silently assume.
3. Night rounds are bounded. Every round produces `REPORT.md` and `NEXT_ACTION.md` and a commit if tests pass; do not repeat round forever.
4. All results label `DESIGN / MOCK / LOCAL_VERIFIED / PILOT_VERIFIED / PROD_VERIFIED`. Only evidence can upgrade status.
