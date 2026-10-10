# NOVDA ERP — Ishni boshlash to‘plami v1.0
Sana: 2026-10-11. Maqom: **architecture baseline + delivery contract**; ishlab bo‘lgan ERP emas.

## Vaqtingizni tejaydigan to‘g‘ri tartib
1. `01_PROJECT_CHARTER.md` va `02_ARCHITECTURE.md` — yagona maqsad va chegaralar.
2. `03_PROCESS_CATALOG.csv` + `04_END_TO_END_FLOWS.md` — **barcha yo‘nalishlar** va bog‘langan biznes oqimlari.
3. `05_DOMAIN_DATA_MODEL.md`, `06_ERPNext_MAPPING.csv`, `07_INVARIANTS.md` — ishlab chiqarish/baza/hisob qoidalari.
4. `08_DEVICE_QR_SCALE_PRINT.md` — tarozi, skaner, printer, offline, qayta o‘lchash.
5. `09`—`16` fayllari — supplier/partner, tikuv, WMS, marketplace, moliya, ish haqi, role va integratsiyalar.
6. `17_UX_SCREEN_CATALOG.csv` va `18_TEST_SCENARIOS.csv` — ekranlar va qabul testlari.
7. `19_DEPLOYMENT_AND_RUNBOOK.md`, `20_MIGRATION_ROLLOUT.md`, `21_OPEN_QUESTIONS_AND_EVIDENCE.md` — infratuzilma, joriy etish, fakt tekshiruvi.
8. `AGENTS.md`, `MASTER_PROMPT.md`, `TASKS.md`, `QUALITY_GATES.md` — OpenCode avtonom ishlashi.

## To‘g‘ri boshlash (Windows + Docker Desktop + VS Code + OpenCode)
1. Paketni eski `textile-erp` papkasiga emas, alohida `C:\work\novda-erp-program` ga oching. Eski demo kodni ko‘chirmang.
2. PowerShell: `docker info`, `git --version`, `opencode --version`, `wsl --status`. Docker Desktop **Linux containers** rejimida va WSL2 ishga tushgan bo‘lsin.
3. Ushbu papkada: `powershell -ExecutionPolicy Bypass -File .\check-environment.ps1`. U faqat tekshiradi, hech narsa o‘rnatmaydi.
4. OpenCode’da shu papkani oching va `MASTER_PROMPT.md` dagi kirish promptidan foydalaning. Tez buyruq: `powershell -ExecutionPolicy Bypass -File .\start-phase.ps1`.
5. **Avval Gate A (design)**: process, schema, screen, supplier protocol, risks, qabul mezonlari `docs/generated` ostida tekshirilsin. So‘ng Gate B (ERPNext running), Gate C (vertical slice), Gate D (integratsiyalar) va Gate E (pilot).
6. Agent natijasi — `REPORT.md`, `PROGRESS.md`, `BLOCKERS.md`, `DECISIONS.md`, test loglari va **haqiqiy ERPNext** misollari.

## Nimalar hozirdanoq hal qilingan?
- Core platforma: ERPNext / Frappe **stable, mutually compatible pinned branch** + MariaDB + Redis.
- Modullash: `novda_textile` custom app; Frappe/ERPNext core’ni patch qilmang.
- ERPNext Stock Ledger va General Ledger yagona hisob manbalari. Fizik evidence bu ikkitasiga alternativ emas.
- Qurilmalar: lokal device gateway; QR yorliq server-issued ID; printer job outbox; ro‘l/rulon, pachka, quti, partiya — alohida.
- Yetkazib beruvchilar: Supplier Portal + ASN. Boshqa xizmat hamkorlari uchun Partner Portal.
- Marketplace: API import, rezerv, qoldiqni solishtirish; hech qachon API’dan kelgan buyurtma avtomatik ravishda pul tushganini bildirmaydi.

## Nimalar hali tekshirilishi kerak?
- Tarozining modeli/interfeysi/protokoli, serial/TCP parametrlari va kalibrovkasi.
- Har bir sexning ish amaliyoti, mas’ullar, hisobga olish birliklari, sifat limitlari.
- Mahalliy huquqiy, soliq va Rossiya markirovka talablarining mahsulot/kod kesimidagi amal qilishi.
- ERPNext versiyasi va rasmiy devcontainer’ning **ushbu kompyuterda** ishlashi.
- WB/Uzum API kalitlari keyinchalik xavfsiz tarzda beriladi; hozir bermang.

**«Hech narsa qolmasin» degan talabga yondashuv:** domen va risklar inventari to‘liq boshlang‘ich ro‘yxat sifatida beriladi, lekin real sex ko‘rilmasdan barcha mahalliy istisnolarni kafolatlash mumkin emas. Ular `21_OPEN_QUESTIONS_AND_EVIDENCE.md` orqali majburiy evidence gate ga bog‘langan.

## Avtonom rejim bo‘yicha xavfsizlik ogohlantirishi
`start-night.ps1` `opencode run --auto` ishlatadi. Bu dasturchi agentga terminal buyruqlarini bajarish imkonini beradi. **Asosiy ish kompyuteringizda muhim fayllar, browser loginlar, SSH kalitlar yoki production tokenlar mavjud bo‘lsa, unattended ishga tushirmang.** Eng xavfsiz yo‘l — disposable VM yoki alohida maxsus OS foydalanuvchisi va faqat loyihaga tegishli fayllar; production secrets, personal documents, Docker host socket access va tarmoq ruxsatlarini minimallashtiring. OpenCode permission qoidalari shell komandalarining barcha bilvosita oqibatlarini ishonchli sandbox qila olmaydi. Birinchi sinovda `start-phase.ps1` dan boshlash ma’qul.
