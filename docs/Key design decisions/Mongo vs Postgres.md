# Postgres vs Mongo — decision matrix

| Criterion | Postgres (with JSONB + PostGIS) | MongoDB |
| --- | --- | --- |
| **Relational joins** | Native, fast, simple SQL. | Requires manual references/aggregations; more app logic. |
| **Referential integrity** | FK constraints, cascades, uniqueness (e.g., `(airport_id, code)`), enums. | No FKs; integrity enforced in application code. |
| **Transactions** | ACID, multi-row, multi-table. | ACID at document level; multi-document transactions exist but add complexity/cost. |
| **Time arithmetic** | `INTERVAL`, generated columns, materialized views. | Must compute in app or with pipelines; less ergonomic. |
| **Geo** | PostGIS: points, distance, indexes. | Good 2dsphere indexes; strong geo too. |
| **Query patterns** | Fits your joins/filters perfectly. | Doable but more boilerplate and risk of inconsistency. |
| **Schema evolution** | Migrations are explicit, safe; JSONB for semi-structured addons. | Flexible, but versioning contracts live in code; easy to drift. |
| **Ops & cost** | Managed (RDS/Aurora); straightforward. | Managed (Atlas); fine, but you’ll hand-roll integrity. |
| **Analytics/BI** | SQL-first, easy to plug into tools. | Possible, but SQL tooling often expects relational. |

# Recommendation

**Choose Postgres (with PostGIS + JSONB)** as your **system of record** for this MVP and beyond.

Why:

- Your core entities are **relational** and benefit from **FKs + unique constraints** (airports/terminals/lounges).
- You need **atomicity** across bookings, flights, and member link state.
- You’ll do **time math** and **geo lookups**; Postgres handles both cleanly (intervals + PostGIS).
- Keeps PP ↔ Taxico correlation tight and auditable; avoids integrity bugs.

# Where Mongo *could* fit (optional)

- **Event/webhook inbox** from Taxico or flight providers (append-only, schemaless).
- **Telemetry** or **prototype features** with rapidly changing shapes.

But you can also keep this in Postgres via **JSONB** tables (e.g., `partner_events(id, partner, payload jsonb, received_at)`), indexed on keys you care about.