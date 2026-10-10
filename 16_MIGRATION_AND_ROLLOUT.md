# 16 — Migration, operator rollout, measurements
## Current data sources (candidate; access not assumed)
- Rassenka Excel workbooks (operation prices and effective dates), existing Hisob employee/attendance/payroll, warehouse balances, vendor manifests, item-color-size mapping, GTIN/KIZ where used, fulfillment and WB/Uzum stock reports.
- Do not infer exact contents of earlier files without re-access; request/import via controlled templates.

## Sequenced migration
1. Extract to raw immutable staging files (hash+date+owner).
2. Build mapping: company, partner, employee identity, item SKU/color/size/UOM, lot, warehouse, rate revision, open PO/WO/shipments.
3. De-duplicate and quarantine conflicts; create reconciliation report before posting.
4. Dry-run into **empty test site**, compare opening values+quantities with accounting/physical audit; no double opening stock.
5. Pilot a single product and warehouse station, then expand by shift/site/partner; freeze legacy write point and prepare rollback.
6. Sign off per module on live results; remaining modules continue parallel manual workflow while not proven.

## Training/operational readiness
Uzbek/Russian station cheat-sheets; scanner/scale zeroing training; mislabeled roll procedure; out-of-paper printer procedure; offline mode policy; inventory count SOP; supplier onboarding contract; monthly close checklist; named support owner/incident escalation.

## Pilot exit criteria
At least: supplier ASN→quarantine/accepted stock→cut/remnant→sew+piecework→QC/FG→pack/FBO→external acceptance/return→settlement/GL and contractor partial return; tested with representative data, human process owner signed. No hardcoded pass % until actual targets approved.
