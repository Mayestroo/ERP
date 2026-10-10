# 12 — Finance, costing, payroll, compliance
## Cost policy
Actual material (lot/batch valuation) + consumed accessories/packaging + verified labor accrual + subcontract service + allocating overhead + attributable scrap/rework/transport. Direct labor is approved labor, not raw scan. ERPNext stock valuation + GL are the source; analytical margin derived from reconciled postings.

## Money flows
PO/advance/payable/purchase invoice/payment; SO/invoice/receivable/return/credit; currency/FX; cash/bank statement; month close, WIP valuation, period lock/reopen policy. Every financial report links to native GL and source statements.

## Payroll and Hisob
Choose **one payment system of record** in pilot (existing Hisob or ERP payroll after audited migration); do not disburse from both. Operator piecework: submitted → verified by supervisor → rate revision locked → payroll batch export → acknowledged by Hisob → payment controlled externally. Kunbay/ishbay/oylik, attendance, overtime, advances and disputes must be modeled. Sensitive employee data: minimal access and retention.

## Human approval controls
Finance closing, payroll disbursement, supplier bank detail changes, inventory large adjustments, rejected-material release, off-marketplace refund and backdated postings require owner-authorized approval. Agent may create tested UI/workflow but **must not issue real approvals**.

## Legal validation matrix
Jurisdiction (Uzbekistan / Russia, shipments), entity type, taxes/VAT, EHF/MXIK, customs, labeling, personal data, retention and fiscal doc generation — must have legal/accounting review with links to dated official rules before production use. No universal hardcoded VAT/commission percentages.
