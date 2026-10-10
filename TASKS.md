# TASKS — stage-gated execution backlog

Rule: `[x]` only when task acceptance evidence exists in `PROGRESS.md`. Blocked items logged in `BLOCKERS.md`. No gate skip.

## A — discovery and architecture

- [x] T001 — Audit prior v0.1–v0.4 without assuming completeness. **Evidence:** `reference/v0.1-v0.4-audit.md` source-by-source matrix, discrepancies, disposition; acceptance recorded in `PROGRESS.md`.
- [ ] T002 — Create all 40 business process owner/input/output mapping. **Evidence:** 40/40 G coverage with owner.
- [ ] T003 — Create F01–F06 detailed actor swimlanes. **Evidence:** flow files + exceptions.
- [ ] T004 — Create F07–F12 detailed actor swimlanes. **Evidence:** flow files + exceptions.
- [ ] T005 — Create F13–F18 detailed actor swimlanes. **Evidence:** flow files + exceptions.
- [ ] T006 — Draw ERP+MES+WMS+partner/device C4 architecture. **Evidence:** diagram boundary and security.
- [ ] T007 — Finalize IDs UOM stock/GL ownership and genealogy. **Evidence:** ERD tables and invariants.
- [ ] T008 — Define supplier ASN and roll label life cycle. **Evidence:** state and negative tests.
- [ ] T009 — Define scale/print/scan gateway contract and fault policy. **Evidence:** protocol interfaces mock+unknowns.
- [ ] T010 — Define cutting-to-sewing operation and piecework contract. **Evidence:** routing/rate revision checks.
- [ ] T011 — Define multi-leg outsource outward and inward customer materials. **Evidence:** owner/custody+native mapping.
- [ ] T012 — Define WB/Uzum FBO/FBS/returns/settlement domain flow. **Evidence:** channels states, financial reconciliation.
- [ ] T013 — Define finance/payroll/period-close control matrix. **Evidence:** owner signoffs required.
- [ ] T014 — Complete role matrix, UX screen wireframe specs and 30 test traceability. **Evidence:** role negative tests and 26 screens.
- [ ] T015 — Close design audit and publish Gate A evidence. **Evidence:** 40 G + 18 F + exceptions complete; unknown flagged.

## B — native ERPNext foundation

- [ ] T016 — Verify Docker/WSL/OpenCode and capacity in isolated development workspace. **Evidence:** env report.
- [ ] T017 — Research and pin compatible maintained Frappe/ERPNext versions. **Evidence:** versions+official evidence.
- [ ] T018 — Bootstrap official Frappe Docker development container. **Evidence:** compose healthy.
- [ ] T019 — Create MariaDB-backed bench and dev site, install ERPNext. **Evidence:** bench list-apps version.
- [ ] T020 — Create novda_textile app in real bench/apps directory. **Evidence:** bench --site install-app.
- [ ] T021 — Set baseline company/site/chart/warehouses/test Item and UOM. **Evidence:** native docs exist.
- [ ] T022 — Test native Purchase Receipt and Stock Ledger not simulated. **Evidence:** receipt+stock ledger evidence.
- [ ] T023 — Set migrations/versioning and seed data strategy. **Evidence:** repeatable test fixture.
- [ ] T024 — Create CI smoke and native DocType integration test harness. **Evidence:** tests inside bench.
- [ ] T025 — Publish Gate B evidence and next task. **Evidence:** observed ERPNext running.

## C — supplier, WMS, device and cutting

- [ ] T026 — Model supplier tenant scoped app and permissions. **Evidence:** partner isolation tests.
- [ ] T027 — Implement supplier PO view and ASN create/edit amendment. **Evidence:** PO scope negative.
- [ ] T028 — Implement roll ID issuance and external code alias. **Evidence:** duplicate/cross-party tests.
- [ ] T029 — Implement QR label templates and print outbox. **Evidence:** print retry/reprint audit.
- [ ] T030 — Implement scale simulator + stable capture + tare calibration rules. **Evidence:** fault simulator tests.
- [ ] T031 — Implement receiving transaction service in native ERPNext. **Evidence:** ERP Purchase Receipt SLE proof.
- [ ] T032 — Implement quarantine QC and discrepancy/claim workflow. **Evidence:** unverified blocked.
- [ ] T033 — Implement WMS bin labeling and putaway/pick. **Evidence:** stock transfer proof.
- [ ] T034 — Implement roll split/remnant genealogy. **Evidence:** mass balance property tests.
- [ ] T035 — Implement work order, cut lay/marker tracking and bundle IDs. **Evidence:** real WO and physical proof.
- [ ] T036 — Add offline queue and idempotent replay fault injection. **Evidence:** AT05 AT06.
- [ ] T037 — Complete F03/F05/F06 read-to-end UAT. **Evidence:** AT01-AT08 and 28.
- [ ] T038 — Pilot supplier portal with fake partner only. **Evidence:** no live messages.
- [ ] T039 — Audit security/transaction concurrency for inbound. **Evidence:** negative tests.
- [ ] T040 — Publish Gate C evidence. **Evidence:** ERP posting proofs.

## D — factory MES and outsource

- [ ] T041 — Version techpacks/BOM/size-color variants/routing. **Evidence:** change-controlled WO.
- [ ] T042 — Create MES line/station/bundle operations. **Evidence:** transition tests.
- [ ] T043 — Verified worker operation and rate revision/piecework. **Evidence:** no double credit.
- [ ] T044 — Sewing QC/rework and defect root cause. **Evidence:** quality hold tests.
- [ ] T045 — Finishing/packaging and 2-pack BOM. **Evidence:** exact component mapping.
- [ ] T046 — Post real FG manufacture/Stock Entry. **Evidence:** SLE/valuation proof.
- [ ] T047 — Outward subcontract native order and transfers. **Evidence:** open WIP proof.
- [ ] T048 — Partner portal progress partial/claim/multi-leg chain. **Evidence:** partner boundary test.
- [ ] T049 — Inward/customer-owned subcontract mapping to installed ERP version. **Evidence:** owner separation.
- [ ] T050 — Hisob worker and payroll dry-run mapping. **Evidence:** read-only adapter.
- [ ] T051 — Inventory counts/reversals approved flows. **Evidence:** no raw edits.
- [ ] T052 — Carton/handling unit manifest and printer. **Evidence:** invalid SKU block.
- [ ] T053 — Complete UAT AT09-AT14 AT20 AT24. **Evidence:** evidence links.
- [ ] T054 — Measure 200-worker concurrent operations baseline. **Evidence:** latency/conflict.
- [ ] T055 — Publish Gate D evidence. **Evidence:** native WIP/FG proofs.

## E — marketplaces, finance and controlled pilot

- [ ] T056 — Implement WB connector read-only with throttling and current APIs. **Evidence:** mock+documented status.
- [ ] T057 — Implement Uzum connector only from verified official contract. **Evidence:** no invented endpoint.
- [ ] T058 — Channel SKU/stock mapping and reservation. **Evidence:** FBO/FBS separated.
- [ ] T059 — FBS order to delivery/cancel and returns. **Evidence:** state replays.
- [ ] T060 — FBO carton shipment and acceptance discrepancy. **Evidence:** 400/393 proof.
- [ ] T061 — Import settlement fees/ads/logistics/returns into reconciler. **Evidence:** statement by reference.
- [ ] T062 — B2B/export quotation-sale-delivery test. **Evidence:** native docs.
- [ ] T063 — Production and channel contribution margin from GL. **Evidence:** cost/drilldown.
- [ ] T064 — Payroll approved export integration dry-run and claim review. **Evidence:** no money actions.
- [ ] T065 — Asset maintenance and downtime tracking. **Evidence:** spare parts issue.
- [ ] T066 — Period close, tax/legal applicability register. **Evidence:** no live statutory filing.
- [ ] T067 — Backup restoration and negative RBAC audit. **Evidence:** restore checksum.
- [ ] T068 — Data migration dry-run from templates, reconcile opening figures. **Evidence:** no live overwrite.
- [ ] T069 — Run all 30 UAT cases with pass/fail/block reasons. **Evidence:** AT01-AT30 matrix.
- [ ] T070 — Publish Gate E pilot handover report, training and rollback. **Evidence:** signoff checklist.
