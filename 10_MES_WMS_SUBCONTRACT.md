# 10 — MES / WMS / cutting / sewing / subcontract detail
## Planning and engineering
Model→approved techpack→pattern revision→spec per size and color→BOM (material/accessories/pack)→operation routing→versioned piece-rate→capacity plan. Actual WO references frozen versions.

## WMS
Bin hierarchy Site→Warehouse→Zone→Rack→Bin. Receipt/putaway/relocation/reserve/pick/issue/remnant-return/count/scrap. Scan both unit and location; quarantine and missing-bin exception. Distinguish physical counted stock from posted ledger. Reservation and ready-to-ship account for frozen goods and external locations.

## Cutting
- Enforce shade/lot policy, measured roll input, fabric inspection status, lay/marker plan, number of layers, expected output size mix.
- Log used net kg, recoverable remnants, documented waste and sample/testing loss; mass-balance formula with UOM and approved tolerance. No automatic mass-to-piece conversion.
- Unique bundle QR for cut components + genealogical links to roll(s). Bundle count by size/color and composition (sleeve/body/collar) if required; recut and defect evidence.

## Sewing, operation sequencing
Operation route can branch/merge; not every sew op posts material stock. Operator scan starts/completes operation, partial quantity, supervised verification, defect/rework. A worker may split work across bundle with credited qty not exceeding verified unique output. A completed job must not be credited twice. `Job Card` mapping tested and expanded only where inadequate.

## QC / finishing
Input QC, in-process QC, final AQL when selected; configurable defect severity, accept/rework/scrap, blame uncertain until approved. Dazmol, logo/printing/embroidery, 2-pack assembly and packaging materials consumption.

## Subcontract
Owner vs custodian vs physical location separately. Subcontracting native flow for service order, material transfer, receipt and payable, with custom outbound scan/manifest and partner progress. Multi-leg if approved by NOVDA; partial return, defect, missing, rework, claim and settlement; customer-owned inward tracked separately.

## Key formulas
WIP opening + received - sent - approved loss = WIP closing, **for each compatible SKU/UOM/owner**. Labor credit = approved unique good operation qty × effective approved piece-rate plus validated policy adjustments. Cutting mass: input used = accepted outputs/remnants/scrap/process loss, subject to measured UOM evidence; no fictitious precision.
