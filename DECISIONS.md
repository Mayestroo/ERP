# DECISIONS (append only)
2026-10-11 ADR001: ERPNext/Frappe as system of record, no duplicated custom accounting. Reason: retain native posted stock/GL and tested business documents.
2026-10-11 ADR002: Custom app `novda_textile`, no core patch. Reason: upgradeable domain extension.
2026-10-11 ADR003: Supplier issued label uses NOVDA-server-issued object ID, incoming actual weight is separate. Reason: cross-party traceability.
2026-10-11 ADR004: Device gateway and durable outbox; scale reading is evidence, not stock mutation. Reason: offline/idempotency.
2026-10-11 ADR005: ERPNext version pinned after install research, no guessed API. Reason: version drift; inward subcontracting may be version-specific.
2026-10-11 ADR006: Agent sandbox-only; no live financial, marking or marketplace outbound action. Reason: real business safety.
2026-10-11 ADR007 (PROVISIONAL): per-roll ERP batch for kg ledger traceability + custom supplier dye lot grouping; verify against native ERPNext Serial and Batch Bundle before fixing schema.
