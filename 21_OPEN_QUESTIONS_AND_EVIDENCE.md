# 21 — Faktlar, taxminlar va tekshirish katalogi
Bu savollar **foydalanuvchini hozir to‘xtatish uchun emas**: OpenCode defaultni konservativ belgilab, `BLOCKERS.md`ga yozadi, xavfsiz dizayn ishini davom ettiradi. Tekshirilmaguncha tegishli live integratsiya BLОCKED.

| ID | Unknown / kerakli dalil | Xavfsiz vaqtinchalik qaror | Ta’sir/gate |
|---|---|---|---|
| U01 | Yetkazib beruvchi va NOVDA tarozi modeli, interface, kalibr | simulator+protocol adapter interface | Device live gate |
| U02 | Har supplierda printer, QR format/size va media | browser-print mock, printable template | Supplier onboarding |
| U03 | Rulon net/kg/length/width/GSM real hisob usuli | kg as stock UOM, length separate observed | Mass/cost audit |
| U04 | Qabul vazni tolerantlari, tare list, vaqtincha qaytish | hard hold on mismatch; configurable no guessed threshold | Receiving UAT |
| U05 | Material quality: shrinkage, shade, roll 4-point test | quarantine + optional inspection fields | QC |
| U06 | Bichish: lekalo/marker/lay, sarf, chiqindi | typed cut ticket with flexible stage | Cutting UAT |
| U07 | Tikuv operatsiya marshruti, bir pachkada nechta ishchi | allow multi-worker verified split with max qty invariant | Labor |
| U08 | Rassenka Excel: effective dates, rubrics, currencies | no retroactivity, import staging | Payroll |
| U09 | Hisob system API, current source of employee/payroll | interface adapter read-only first | Payroll cutover |
| U10 | Usluga material kimniki, joylashuv, davr, billing | owner/custodian split, partials preserved | Partner UAT |
| U11 | WB/Uzum stock, catalog, order, settlement API rights | mock/read-only adapter | Marketplace |
| U12 | Real GTIN/KIZ applicability per product and export | codes separate; legal production blocked | Compliance |
| U13 | VAT, tax, MXIK/EHF, legal org/account plan | finance draft only; accountant signoff | Finance |
| U14 | Terminal LAN/WiFi/UPS coverage and offline SLA | encrypted outbox and safe queue limits | IT |
| U15 | Start balances/open PO, WIP/FG lots | dry-run staging and signed count | Migration |
| U16 | Approval thresholds, owners, shift schedule | configurable, blocking unsafe posting | Governance |
| U17 | Real scan terminal languages, staff skill/accessibility | Uzbek-first simple PWA layouts | UX |
| U18 | Cross-site and 3rd party inventory legal ownership | explicit owner/custodian, no intercompany guess | GL |
| U19 | E2E performance targets for 200+ workers | measure under representative load, set SLO after benchmark | Performance |
| U20 | Server/hosting, retention, disaster recovery targets | no prod; tested isolated restore | Ops |

## Evidence collection templates
`templates/HARDWARE_SURVEY.csv`, `templates/MASTER_DATA_TEMPLATE.csv`, `templates/PROCESS_INTERVIEW.csv`, `templates/APPROVALS_AND_ROLES.csv` are skeletons. Do not put real bank tokens/employee biometric data in repo. If unavailable, mark `UNKNOWN` rather than inventing.
