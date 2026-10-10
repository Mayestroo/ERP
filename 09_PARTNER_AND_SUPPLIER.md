# 09 — Partner Portal & supplier collaboration
## Tenant/RBAC boundary
Supplier sees only its own PO, ASN, roll declarations, claim, status and settlement; contractor sees only its own outsourced task, WIP manifest and stage updates. NOVDA internals/other parties' prices, payroll and sales inaccessible. Filter **in server SQL/Document permissions and API tests**, not only UI.

## Supplier lifecycle
1. Approved supplier profile, contract/price and procurement authority.
2. NOVDA PO release and Supplier acknowledgement; supplier can propose date/partial qty but not edit PO approved price.
3. Supplier line/lot/roll pre-registration; server-issued immutable Roll ID; suppliers can attach evidence, declared weight, test results and print labels.
4. Supplier ASN manifest, carton/pallet or HU grouping, dispatch evidence, amendments and differences.
5. NOVDA arrival scan, weight QC and discrepancies; supplier can view signed actual vs declared and respond to claim.
6. Accepted qty drives invoices/payables, but invoice/payment remain separate guarded workflows.

## Contractor lifecycle
Approved job/service catalog + rate revision, material transfer and signature, partner receipt, stage-by-stage quantities, second partner routing only if allowed, partial returns, QC dispute, charges/claim settlement.

## Partner with own ERP
API key scoped to vendor; asynchronous import of external Roll ID + internal alias; OAuth/service auth as feasible; no open unauthenticated upload; PO scoped. Retries, signature/hash of manifests where required; reject unknown Roll ID and unexpected PO revision.

## Multi-language
Uzbek operator UI; Russian external trading strings where applicable; tax and contract names legal language as registered. Customer-visible labels no personal wage data.
