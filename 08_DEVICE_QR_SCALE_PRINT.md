# 08 — Qurilmalar va label engineering specification
## Physical stations
- Supplier: browser/Android portal + label printer (supplier printer might be different), optional scale adapter; server-issued Roll ID before label print.
- NOVDA receiving: integrated electronic scale (RS232/USB-serial/TCP depending device), kiosk, 2D scanner, label printer and LAN edge gateway.
- Storage/picking/cutting: Android PWA or rugged handheld 2D reader; warehouse bin QR, roll QR, bundle QR.
- QC/sewing: worker login/tag + bundle scan; optional station code; tablet/PC.
- Packing: SKU EAN/market barcode scanner + carton QR/aggregation with verification; labels separate.
- Repair/equipment: machine QR + maintenance ticket.

## QR code contract
`https://erp.novda.../id/R-...` in QR **only after domain/security is operational**; otherwise compact versioned payload `NV1:R:<opaque-id>:<checksum>`; stable object ref, no weights/personal names/passwords. Scanner handles unicode, scan speed, special chars, 2D quality and offline local lookup securely. Never execute URL/code from QR.
Namespaces: internal NOVDA roll/bundle/carton/HU/station; partner's legacy QR alias; supplier Lot; ERP stock Batch/Serial; marketplace barcode; GS1 GTIN; government DataMatrix/KIZ. They must not be conflated.

## Scale capture
`protocol_id`, model/firmware, connection (serial/TCP/USB HID), baud/parity/stop/handshake, command framing, unit, decimal, stable flag, calibration/certificate, gross/tare/zero, timeout. Register `raw_bytes_hash`, stable sample interval, captured_at, operator, station, dedup key, net = gross - tare. Tolerance and calibration policy approved on actual device. Do not assume Argox is a scale.

## Label printer
Argox iX4-350 is **printer mention, not verified interface**. Use OS driver/print queue or vendor protocol documented for the installed unit; sample print and scanner verify before shipping. Label templates and resolution/media sizes are **configurable**, not hardcoded. Verification: print/scan/resolve, low contrast, paper-out, duplicate job/reprint, printer offline, edge reboot. QR print only after ID issued; stock receipt only once regardless of number of labels printed.

## Gateway architecture
Drivers → normalized DeviceEvent → local durable outbox (encrypted, size limit) → authenticated Frappe command API → ack with ERP doc id → print job queue. Device IDs allowlist; gateways never hold admin API tokens. Every outbox event includes `idempotency_key`, `source_seq`, `correlation_id`, `station_id`, `device_id`, `event_time`, `schema_version`. Monitor clock skew, duplicate replay, stale measurement, queue backlog, retry exhaustion.

## Protocol example
`examples/device_event.json` and `examples/label_payload.json`. These are **schemas/examples**, not active integration.

## Hardware site survey (mandatory before device driver)
For EACH device record maker/model, photo of nameplate, ports, protocol manual, driver, test command/reply, print dimensions/dpi, physical station layout, LAN/WiFi, UPS, environmental concerns and responsible operator. If unavailable, simulator adapter can be built but live support marked BLOCKED.
