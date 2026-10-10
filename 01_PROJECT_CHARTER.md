# 01 — Loyiha mandati va chegaralari
## Missiya
NOVDA Textile uchun multi-party, multi-stage end-to-end platforma: **PLM → demand/MRP → procurement → supplier ASN/QR → gate/scale/QC → fabric warehouse → cutting/WIP → sewing/OTK/rework → finishing/packing → FG/WMS → WB/Uzum/FBO/FBS/B2B → returns → settlement/actual costing → management analytics**. Usluga 2 yo‘nalishda (NOVDA tashqariga beradi va mijoz NOVDA’ga beradi), vaqt/ishbay maosh, texnik xizmat, mehnat xavfsizligi va auditor nazorati kiritiladi.

## Dastlabki fabrika profili (foydalanuvchi bergan kontekst, audit qilish shart)
- Andijon, tikuv/trikotaj; futbolka/longsliv/polo/komplekt, ko‘p rang/razmer; 200+ xodim maqsadiga mos dizayn.
- NOVDA uchun marketplace kanallari: Wildberries va Uzum (Yandex keyin qo‘shiladigan adapter sifatida).
- Supplier ishlab chiqarayotgan matoni o‘zida tortib, NOVDA-issued QR bilan etiketkalaydi; NOVDA kelganda qayta skaner/tortadi.
- Ishbay rassenka va mavjud Hisob dasturi; import/sinxronlash qoidalari alohida aniqlanadi.
- Argox iX4-350 printer haqida oldingi ma’lumot mavjud, ammo interfeys, label media va parametrlar tekshiruvsiz qabul qilinmaydi.

## Scope: majburiy va opsional
### Majburiy
1. Buyurtmalar, ishlab chiqarish, ombor, usluga, partner, ish haqi faktlari, sifat, qadoqlash, yuborish, qaytim va tannarxni hujjatli bog‘lash.
2. QR scanner/tarozi/printer/jarayon offline; audit/reversal; bir martalik posting.
3. Admin, xarid, ombor, bichish, master, OTK, HR/buxgalter, direktor, partner uchun ruxsatli ekranlar.
4. Pinned code/env, migratsiya, tekshirilgan backup/restore, monitoring va sinov ma’lumotlari.
### Defer until validated
- To‘g‘ridan-to‘g‘ri bank pul o‘tkazishi, EHF/e-imzo/soliq avtomatik post qilish, majburiy davlat markirovkasi chiqarish, live marketplace stock write va real xodimga haq to‘lash.
- Kamera orqali identifikatsiya — shaxsiy ma’lumotlar/himoya va mavjud Hisob arxitekturasi tekshirilganidan so‘ng.

## Muvaffaqiyatning ta’rifi
Oddiy UI yoki 4 test emas. Pilotda 3 haftalik reprezentativ operatsiyalar bo‘yicha roll/lot genealogy, aniq qoldiq, approved payroll, usluga ochiq balansi, marketplace settlement, qisman qabul va qaytim hisobi, backup restore test bilan verifikatsiya qilinadi. Bosqichli gate’lar uchun `QUALITY_GATES.md`.

## Asosiy egalik
Sponsor: direktor; process ownerlar: xarid, kirim ombori, laboratoriya, bichish, tikuv, OTK, tayyor ombor, logistika, marketplace, buxgalteriya, HR, IT. Rol vakolatli **odam tomonidan beriladi**, agent haqiqiy biznes limitlarini tasdiqlamaydigan taxmin bo‘yicha production’da qaror chiqarmaydi.
