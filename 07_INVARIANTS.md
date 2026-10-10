# 07 — Tranzaksiya, istisno va holat qoidalari
## Event ≠ business transaction
QR scan `ID_Recognized`, stable weight `WeightObserved`, label printed `LabelPrinted` — **bular stock movement emas**. Command `ReceiveRoll`, `IssueRoll`, `CompleteOperation`, `PackCarton`, `DispatchShipment`, `ApproveRework` auth+validation orqali ERPNext document submit qiladi. Source event + destination ERP doc reference unikal.

## State machines (invalid transition must hard-fail)
- ASN: DRAFT → READY → DISPATCHED → ARRIVED → RECEIVING → ACCEPTED/PARTIAL/DISPUTED → CLOSED; cancel/amend separately.
- Roll: DECLARED → IN_TRANSIT → ARRIVED → WEIGHED → QUARANTINE → RELEASED/REJECTED → STORED → RESERVED → PICKED → CONSUMED/SPLIT/RETURNED.
- Bundle: CREATED → ASSIGNED → IN_PROCESS → QC_PENDING → ACCEPTED/REWORK/SCRAP → FINISHED; stage-specific evidence.
- Contractor task: DRAFT → APPROVED → ISSUED → ACKNOWLEDGED → PARTIAL_RETURN → CLOSED/DISPUTED.
- Shipment: DRAFT → PACKED → HANDOVER → IN_TRANSIT → PARTIAL_ACCEPTED/ACCEPTED/DISPUTED → CLOSED.
- Return: NOTIFIED → ARRIVED → QUARANTINE → QC → RESTOCK/REWORK/SCRAP/RETURN_TO_OWNER.
- Print: PENDING → SENT → ACKED; FAILED may RETRY; any reprint requires reason/operator.

## Posting boundaries
1. Stock receipt: stable scale, tare known, item/lot+PO association, qty≥0, duplicate check, role approval. When differences exceed configurably set threshold, exception review, **do not guess threshold**.
2. Move/consume: validate source location+quality+reservation; ensure UOM, actor, document and same-site/cross-site policy. Atomic ERP posting; response cached by idempotency key.
3. Supervisor-verified operation must not retroactively use current changed rate. Dispute and reversal reference old approved event and create correction.
4. Serialisation only when actual per-unit traceability justified; apparel variants often batched while rolls have custom physical ID. Data model mapping tested.
5. Software/hardware offline: encrypted local outbox sequence and ack. Retry only if server explicitly says idempotent; `conflict` requires review; local clock drift recorded.
6. Inventory count reconciliation from approved Stock Reconciliation; never raw stock-quantity write.
7. For accepted 500/returned 480 subcontract, 20 remains external/WIP/claim. No auto-writeoff.
8. Audit has actor/recorded_at/cause/before-after; financial/legal records not deleted after post, undo via compensating native document.

## Posting matrix
| Physical action | Evidence | Commit boundary | Compensation |
|---|---|---|---|
| Supplier roll register | declar. event | none | amendment |
| NOVDA receipt | QR+stable weigh | ERP Purchase Receipt/Stock | Purchase Return / reversal |
| Roll to cutting | QR+verified qty | Material Transfer/Issue | matched return |
| Sewing op | bundle+worker scan | approved Job Card/operation | evidence void/rework |
| Finishing FG | QC+pack count | Manufacture Stock Entry | authorized reversal |
| Outsource transfer | two party handover | native Stock Entry/Subcontract | return/claim |
| Marketplace dispatch | picking+seal+POD | Delivery Note | return/claim |
| Stock adjustment | count+approval | Stock Reconciliation | correction with audit |
| Payroll export | verified operations | approved payroll interface | adjustment not duplicate payment |
