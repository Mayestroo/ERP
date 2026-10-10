# 11 — Marketplace / B2B / returns
## Channel identity
NOVDA SKU/size-color-pack variant ↔ channel account ↔ external item ID/barcode ↔ price/currency/tax/warehouse. WB FBO/FBS and Uzum FBO/FBS must not share a generic single stock field. Yandex option is future separate connector, not mandatory MVP.

## Inventory truths
- NOVDA available stock based on ERP posted physical stock and reservations.
- WB/UZ warehouse stock is an **external snapshot**, reconciled and timestamped. Do not treat a marketplace platform quantity as NOVDA warehouse on-hand.
- Reserve on order acceptance, release on cancel per lifecycle, not on every import event.
- FBO 400 shipped and 393 accepted => 7 discrepancy, no automatic 400 sold. FBS handover proof and delivered/sold statuses separated.

## Channel API
Verify official API docs, rights, rate limits, effective dates **at implementation time**; create dry-run/mock before real credentials. Build typed inbox/outbox, pagination/time windows, idempotency, retry/backoff, batch limits and reconciliation. Write actions feature flag OFF by default.

## Marketplace unit economics
seller_revenue minus platform fee+storage/logistics+ads+penalty+returns/discount funded by NOVDA+COGS+applicable tax. Settlement lines tied to statement and bank deposit; ads and promotional expenses allocated with policy. For promotions (SPP) distinguish consumer price and seller realized net revenue.

## B2B, wholesale, export
Quotation/Sales Order, customer contract, credit limit, local/foreign currency, stock allocation, delivery note/POD, invoice, partial return, customs/broker docs (legal approval), AR collection.

## Compliance
Internal NOVDA QR ≠ GS1 GTIN ≠ WB/Uzum barcode ≠ regulated Russian marking DataMatrix/KIZ. Applicable customs/tax/marking mapping by **model + TN VED/other classifications + date** requires current authority sign-off. Do not generate counterfeit/regulatory codes.
