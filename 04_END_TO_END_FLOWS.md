# 04 — 18 End-to-end Flow kontraktlari
Har bir flow uchun **trigger → rollar → physical evidence → ERP native document → exception → reconciler → KPI → acceptance test** majburiy. Quyidagi baseline jarayonlar real sex bilan yakuniy validatsiya qilinadi. Hujjat lifecycle'ini `07_INVARIANTS.md` bo‘yicha yuriting.

| Flow | Trigger va asosiy ketma-ketlik | Posted hujjat / checkpoint | Istisno holatlar | KPI |
|---|---|---|---|---|
| F01 PLM | Model → sample → fit → size grading → techpack → BOM revision | Approved BOM/Item version | sample reject; ECO in open work | First pass sample approval |
| F02 Demand→MRP | WB/UZ forecast/B2B SO → size-color net demand → material/capacity → WO/PO | Material Request, WO/PO | shortage, split WO, overdue | Plan adherence |
| F03 Procure-to-pay | RFQ → PO → supplier ASN → QR/roll → receipt/QC → PI → payment | PO, Purchase Receipt, PI/Payment Entry | PO revision, partial, reject, claim | Supplier OTIF |
| F04 Supplier production | supplier own yarn/dyeing/finish → roll/weigh/mark → dispatch; NOVDA-owned materials tracked separately | Partner ASN + owner/custodian | stage loss/shrinkage, re-dye, ownership | Supplier yield |
| F05 Receiving/putaway | arrival → HU/roll scan → weigh → mismatch check → quarantine → QC → putaway/bin | Receipt/Stock Entry + QC records | duplicate, unstable, short, rejected | Receipt accuracy |
| F06 Cut-to-WIP | WO+approved BOM → pick roll → lay/marker → consumed kg → bundle IDs → remnants/scrap | Stock Entry/WIP + bundle evidence | shade mix, recut, negative, offcut | Cut yield |
| F07 Sew-to-FG | bundle allocation → job operation scan → verification → QC/rework → finishing → FG make | Job Card / Manufacture Stock Entry | worker duplicate, missing operation, rework | First pass yield |
| F08 Outward outsource | operation task → transfer materials/WIP → contractor scan → partial return/QC → invoice | Subcontracting Order, Stock Entry, Receipt, PI | multi-leg, loss, price revision, reject | External WIP aging |
| F09 Inward contract | customer-owned material receipt → NOVDA processing → finish/QC → customer return/service invoice | Customer ownership record + native inward subcontract where version supports | extra own materials, claim, ownership | Client yield |
| F10 Packing/FBO | FG release → barcode/marking → unit packaging → carton manifest → dispatch → marketplace accepted | Delivery Note + channel shipment mapping | KIZ duplicate, mixed carton, shortage | Channel accept ratio |
| F11 FBS | channel order → reserve → pick → label → handoff → delivered/return/cancel | Sales/Delivery mapping by channel | cancel before/after pickup, oversell | Fulfillment SLA |
| F12 B2B/export | quote → SO → credit approval → pick → export docs → POD → invoice/payment | SO/DN/SI/payment | partial, customs, FX, claim | DSO, OTIF |
| F13 Reverse/claim | supplier/marketplace/customer return → scan → quarantine → QC → restock/rework/scrap/credit | Return documents and QA case | unknown SKU, unverified KIZ, fraud | Return loss |
| F14 Worker-to-pay | verified ops + shift/attendance + rate revision → payroll batch → Hisob sync | Approved payroll export (no duplicate disbursement) | partial, dispute, advance, reversal | Wage reconciliation |
| F15 Cost-to-cash | material+labor+subcontract+overhead → FG cost → marketplace fees → settlement → GL | Stock valuation, GL, channel settlement | returns, bank diff, FX, penalty | Margin by SKU |
| F16 Exception/recovery | offline devices → durable queue → replay/duplicate/conflict → supervised correction | Inbox/outbox, reversal references | network/power, print failure, stale revision | Replay integrity |
| F17 Month close | cycle count → WIP → inventory valuation → AP/AR → payroll accrual → close/reopen policy | GL+Stock Ledger reconciliation | late invoice, backdating, FX rate | Close difference |
| F18 Equipment | maintenance plan → work order → spares → downtime → release | Asset/Maintenance & stock issue | repeated faults, absent spares | OEE/downtime |

## F05 — Supplier ASN, kirim va QR (batafsil)
1. NOVDA PO saqlaydi va partnerga scope bilan ko‘rsatadi; supplier faqat o‘z PO satrini ko‘radi.
2. Supplier tayyor bo‘lgan har rulon uchun `supplier_roll_ref`, lot, color, width/GSM, gross, tare, declared_net, UOM, quantity source, date kiritadi. Server NOVDA Roll ID + QR issue qiladi; reprint auditlanadi. Supplier turli ishlab chiqarish fazasini ham qayd etishi mumkin.
3. Supplier jo‘natma (ASN) uchun roll manifest yaratadi, barcha Roll ID lar unikalligini tekshiradi va transportga topshiradi. ASN sealed statusga o‘tadi, keyingi tahrir amendment orqali.
4. NOVDA gate HU/ASN ni o‘qiydi; roll scanned. YO‘Q roll, noto‘g‘ri supplier/PO/shade, duplicate, oldin qabul qilingan roll — karantin/discrepancy queue.
5. Tarozi raw stream → stable reading → tare/units/checkcal → measurement event. Declared va measured farqlari separately; allowable tolerance konfiguratsiya bilan (aniq foiz hozircha UNKNOWN).
6. Mos bo‘lsa vakolatli transaction service bir marta ERPNext Purchase Receipt qiladi; status **quarantine**; OTK accept/return/reject bo‘yicha keyingi ERPNext stock transfer/return posting ishlaydi.
7. Birinchi stock posting committed bo‘lgach print job; printer failure retry, stock movement qayta qilinmaydi. Qo‘yish `bin` skaner bilan. ASN uchun supplier declared/received/accepted/invoiced har doim alohida reconciliation ko‘rsatiladi.

## F06 — Roll split / cutting / remnant (batafsil)
1. WO bilan material rejalashtiriladi; reserv boshqa WO’ga ketmaydi. Roll ID + location QR orqali pick.
2. Lay plan: model/revision, marker, layer count, shade restriction, roll IDs, start/end net, expected pieces.
3. Bichishda consumed kg, recoverable remnant, scrap, process loss ***o‘z birliklarida*** o‘lchanadi; mass-balance invalid bo‘lsa operation close bloklanadi.
4. Bundle IDs size/color/lot/cut batch genealogiyasi bilan yaratiladi. Faqat tasdiqlangan material movement ERP stockni o‘zgartiradi.
5. Qoldiq rulon: parent roll lineage va yangi `remnant` ID; xom ashyo omboriga qaytganda faqat authorized return+scan.
6. Agar OTK bichim nuqson topsa, recut ticket va related material issue orqali qayta hisob.

## F08 — Outsource (batafsil)
1. NOVDA work task + contractor SLA + price revision belgilaydi; bundle/roll/size mix material manifest, ownership NOVDA.
2. Tasdiqlangan handover + scanner bilan external WIP location/custody o‘zgaradi; service liability alohida.
3. Har partiya uchun contractor raw/wip receipt yoki objection, work stage proof, partial completion, reject/rework.
4. Partner1→Partner2 transferi faqat NOVDA approval va ikkita handover evidence bilan; ownership o‘zgarmaydi.
5. NOVDA qaytgan WIP'ni scan+QC bilan qabul qiladi; 500 berilib 480 qaytsa 20 ochiq qoladi, avtomatik scrap emas.
6. Service invoice = tasdiqlangan xizmat miqdori × versiyalangan tarif (+ adjustment/claim); 2 tomondagi qarzdorlik reconciliation.

## F10/F11 — Channel flow (batafsil)
- Har size-color-pack SKU uchun ERPNext Item/variant, channel-specific external ID, GTIN/KIZ applicability mapping. Units are piece vs set (2-pack), package vs carton.
- Inventory availability = ERP physical sellable - allocations/holds - pending shipments; FBO stock tashqi snapshot, uni NOVDA'ning o‘z omboriga xato qo‘shmang.
- FBO: exact carton manifest → dispatch qty → platform confirmed received qty → difference/claims; FBS: order lifecycle/state and reservation → pick/handover → delivery/refund, no early sales recognition by API order only.
- Reklama/komissiya/logistika/saqlash/penalti/chegirma/return/FX by platform statement ID and period, payment reconciliation.

## Qolgan oqimlar uchun deliverable
Har bir F01–F18 uchun `docs/generated/flows/Fxx.md` yaratish: swimlane (actor-lane), event/form schema, accepted states, rollback, latency/offline, auth matrix, normal + 3 negative tests, owners. Buni Gate A’da OpenCode to‘ldiradi; taxminlar `BLOCKERS.md`da qoladi.
