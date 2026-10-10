# 13 — Security model, approvals, audit
## Roles
Director: dashboards+approved reports, not raw secrets. Buyer: PO/RFQ. Supplier: own POs/ASN/roll manifests. Gate: arrival only. Receiver: receipt requests/scale events. QC: lab and disposition. Storekeeper: loc/bin, issue/putaway. Planner: BOM release/WO. Cutter/sewer/master: stage-limited evidence/approve. Contractor: assigned tasks only. Packer: packing. Marketplace: channel mapping/fulfillment. HR: workers/payroll facts. Accountant: GL and approved settlements. IT: infrastructure but least access business bank details. Auditor: read audit trail. Superadmin separate emergency.

## Server side policies
- Partner row level `supplier_id/contractor_id` from authenticated session; reject unscoped API queries even if user changes JSON `party_id` or URL.
- All sensitive commands require role+site+document state checks and record event. Two person review for salary export changes, supplier bank, inventory adjustments, QC bypass, retrospective financial posting.
- Expiring per-user tokens, credentials in private vault/env not Git, rotation/revocation; login audits/MFA where supported.
- Device identity separate from person; scanner evidence alone cannot impersonate supervisor.
- Concurrency optimistic revision checks plus atomic business transaction and outbox.
- Data retention/legal audit/privacy with signed retention policy; restrict worker face images if attendance integrated.
- Logs exclude tokens, private payroll, secrets and full raw customer PII; correlation IDs available.

## Threat scenarios
Supplier A enumerates Supplier B records; forged roll QR; stale scale reading; fake manual tare; employee double scanning; outbox replay; printer reprint fraud; API token leak; contractor silently changes rates; FBS external negative API response; loss of server connectivity; ransomware/restore. Each becomes a negative acceptance test.
