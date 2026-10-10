# 14 — Integration contracts, idempotency, version control
## Boundary endpoints (design contract, **not implemented APIs**)
- `POST /api/novda/v1/supplier/asns`: scoped create draft ASN, requires `po_id`, revision, manifests, idempotency key; no direct stock posting.
- `POST /api/novda/v1/receiving/measurements`: gateway signed measurement evidence only. Device/source validated; must not create ledger directly.
- `POST /api/novda/v1/receiving/commit`: roll + verified weigh event + authorized operator → native Purchase Receipt and audit reference; idempotent.
- `POST /api/novda/v1/cutting/complete`: WO+cut ticket, measured materials and outputs; enforced balance and subsequent native stock transitions.
- `POST /api/novda/v1/operations/verify`: supervisor verification of operation evidence; no payment.
- `POST /api/novda/v1/packing/seal`: create immutable carton manifest after checked scans.
- `POST /api/novda/v1/partner/handover`: controlled custody transfer + native stock posting.
- `POST /api/novda/v1/integration/reconcile`: privileged dry-run diff report; writes separate feature-flag gated.

## Standard envelope
`schema_version, event_id UUID, correlation_id, idempotency_key, company_id, site_id, actor_id, station_id, source_timestamp, command, payload, expected_revision`. Success returns `business_doc_type/name`, effective status, acknowledged version, conflict hint. 4xx validation ≠ retry; 429/503 with bounded backoff; 409 conflict to queue. Avoid raw SQL endpoints.

## Integrations register
1. Wildberries: official developer docs; product IDs/SKUs, FBS orders, seller warehouses, warehouse inventory, FBO inbound, sales/returns, finance statements. Different endpoints and permissions; verify current spec & pagination at coding time.
2. Uzum seller: official seller agreement/API docs (access may be gated); first determine approved connection method and data-sharing rights. No invented undocumented endpoints.
3. Hisob: audit existing GitHub project schema/contracts before writing adapter; stable employee ID mapping, attendance vs payroll precedence, acknowledgement/retry + import reconciliation.
4. Legal/e-document: Uzbekistan EHF/MXIK and export/marking provider to be selected after authority docs and partner credentials confirmed.
5. Supplier's own software: signed manifest/webhook or CSV import mapping with stable external alias and conflict handling.

## Webhook/API failure policy
Timeout does not mean a request failed; query by idempotency token before replay. Every partner response mapped into append-only inbox, subject to reconciliation. Never delete source payload after success; redact secrets. User-visible sync: `last_successful_sync`, lag, errors, unresolved count.
