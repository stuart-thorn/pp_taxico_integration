# Priority Pass × Taxico – Airport Journey Integration

**Goal:** Help members get to the airport on time by showing **time-to-destination** and a **recommended departure (pickup) time** based on flight details, terminal drop-off, and configurable buffers. Deliver a clear architecture, prototype-ready APIs, and a safe data model.

---

## Architecture Overview

### Design decisions

| Area                                  | Decision                                                                      | Rationale                                                                                            | Implications (Now)                                                  | Implications (Later)                                                                  |
|---------------------------------------|-------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------|---------------------------------------------------------------------------------------|
| **Mongo vs Postgres**                 | **Postgres** (optionally PostGIS later)                                       | Strong relational model (members ↔ flights ↔ terminals), FK integrity, time math with `INTERVAL`     | Reliable joins and constraints; straightforward analytics           | Add PostGIS for geo queries; materialized views for “next flight”                     |
| **Integration model (sync vs async)** | Synchronous REST only (webhooks/events later if needed)                       | Simple, predictable request/response; fastest to implement ; easy auth                               | PP depends on Taxico latency/uptime; may need polling for ride state; no push updates | Add webhooks for ride/ETA updates; event-driven cache invalidation; lower latency & load |
| **API orchestration**                 | **BFF orchestrates** all partner calls                                        | Centralizes buffer policy, member/terminal lookups, error handling                                        | Simpler mobile app; BFF manages timeouts/retries; consistent errors | Introduce lightweight workflow/state or sagas if flows grow (multi-step compensation) |
| **Caching**                           | **In-BFF, short-TTL** (30–60s for compute; 5–15m for config/metadata)         | Cut P99 latency; shield brief hiccups without dangerous staleness                                    | Memory cache or simple Redis; minute-bucketed keys (coords+time)    | Move to Redis cluster; add SWR and explicit invalidation when events/webhooks arrive  |
| **Authentication**                    | App→BFF: **OAuth2 Bearer JWT**; BFF→Taxico: **API key or client-credentials** | Standard patterns; easy rotation                                                                     | Clear scope boundaries; simple secret mgmt                          | Add **mTLS** and signed requests for higher assurance                                 |
| **Deployment**                        | Containers on managed compute + RDS                                           | Balanced cost/simplicity; portable                                                                   | Quick infra spin-up, predictable scaling                            | Serverless or k8s; multi-region failover if SLAs demand                               |


### Assumptions
| Assumption                            | Details                                                                                                      |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------|
| **Journey time calculation**          | Taxico provides accurate ETAs and recommended pickup times based on live traffic and routing.                |
| **Member to Taxico customer linking** | Assumption that Taxico members have been linked to PP members already (partner customer_id in member table). |

### C4 diagrams
#### System Context
![System Context](docs/diagrams/system_context.png)
#### Container
![Container Diagram](docs/diagrams/container.png)
#### Component
![Component Diagram](docs/diagrams/component.png)

### Data model
![Data Model](docs/diagrams/data_model.png)

- **airports(id, name, code)**
- **terminals(id, airport_id → airports.id, name, code, dropoff_lat/long, transit_time_from_dropoff_to_gate)**
- **members(id, fname, lname, taxiCo_customer_id, taxiCo_customer_link_status, taxiCo_customer_link_time)**
- **flights(id, code, departure_airport → airports.id, departure_terminal → terminals.id, arrival_airport → airports.id, scheduled_departure, estimated_departure, status)**
- **bookings(id, member_id → members.id, flight_id → flights.id)**
- **lounges(id, terminal_id → terminals.id, …)**
- **config(id, buffer_time_transit)**

> Highly relational lookups (member → next flight → terminal → drop-off coords → buffer math). 
> Postgres gives FK integrity, INTERVAL arithmetic, and optional PostGIS later.



### Domains & APIs

- **PP BFF (Backend-for-Frontend)**
    - Public surface consumed by the PP app.
    - Endpoints:
        - `GET /recommendedDepartureTime` → calls PP Member API for member/terminal context, calls Taxico `/recommendedDepartureTime`, **adds PP buffer**, returns `departureTime`.
        - `GET /timeToDestination` → proxies to Taxico `/timeToDestination` (echoes buffer-inclusive or input time per client choice).
        - `GET /flightBookings` → **proxy** to PP Member API `/flightBookings/member`.
        - `GET /rideBookings` → **proxy** to Taxico `/rideBookings`.
        - `POST /bookRide` → **proxy** to Taxico `/bookRide`.
- **PP Member API**
    - Member-scoped data (no business logic leakage).
    - Endpoints:
        - `GET /flightBookings/member?memberId=...`
        - `GET /flightBookings/taxiCoClient?taxiCoCustomerId=...` (partner pull, row-level guarded).
- **Taxico API** (partner)
    - Journey math & ride ops owned by the taxi provider.
        - `GET /recommendedDepartureTime` (compute pickup to **arrive by** `arrivalTime`)
        - `GET /timeToDestination` (compute seconds for given `departureTime`)
        - `POST /bookRide`
        - `GET /rideBookings`

### Request Flow (happy path)

1. **PP App** calls **PP BFF** `/recommendedDepartureTime` with `memberId`, `terminalId`, and start/destination coords + `arrivalTime`.
2. **PP BFF** reads **buffer** and validates `terminalId` (PP Member API or DB).
3. **PP BFF** calls **Taxico** `/recommendedDepartureTime` to get **raw pickup**.
4. **PP BFF** **applies PP buffer** (business-configurable) and returns **buffer-inclusive `departureTime`**.
5. Bookings and ride checks are proxied through the BFF to keep a single front door.

### Security & AuthN/Z

- **PP BFF**: OAuth2 **Bearer JWT** from the PP app; scopes like `journey:read`, `ride:book`.
- **PP Member API**: OAuth2 (service-to-service from BFF), row-level authorization by `memberId`.
- **Taxico API**: API key (or OAuth client-credentials). BFF is the sole client.
- **Partner correlation**: `members.taxiCo_customer_id` (or better, a PP-issued `partner_user_ref`) set only after **consentful linking**.

### Observability

- Correlated **`X-Request-Id`** across BFF ↔ Member API ↔ Taxico.
- Metrics: request latency, success/error rates, recommendation lead time, buffer deltas.
- Structured logs with key fields: `memberId`, `terminalId`, `arrivalTime`, `departureTime`.

---

## PCI Compliance (brief)

- **Out of scope for PAN**: All **payments are executed in Taxico** (deep link or hosted page). The PP platform **never handles card numbers**.
- **Data minimization**: PP shares only itinerary fields required for journey timing (no unnecessary PII).
- **Controls**: TLS 1.2+, strong auth, least-privilege tokens, audit logs, secrets in a managed vault.
- **If PP later takes payment**: use **tokenization/hosted fields** from a PCI-compliant PSP; keep PAN out of PP systems; align with SAQ-A/SAQ-A-EP depending on embed.

---

## Omissions & Trade-offs

- **In-app ride booking UX**:
    - *Skipped*: Full embedded checkout and driver tracking.
    - *Why*: Keeps PCI scope out; reduces integration risk in MVP.
    - *Later*: Deep link return + webhook-based status cards.
- **Rule-based timing vs ML**:
    - *Skipped*: Predictive models for security queues and traffic.
    - *Why*: 2–3 hour constraint; ML needs data.
    - *Later*: Learn per airport/terminal; confidence scores; weather/events features.
- **Single taxi partner**:
    - *Skipped*: Multi-partner routing/aggregation.
    - *Why*: Ship one integration (Taxico) first.
    - *Later*: Abstract partner client behind interface; add provider routing.
- **Partial offline support**:
    - *Skipped*: Robust offline cache.
    - *Why*: Journey timing relies on live data.
    - *Later*: Cache last known ETAs and conservative fallbacks.
- **Strict DB constraints beyond PK/FK**:
    - *Skipped*: Uniqueness (e.g., `(airport_id, code)`), check constraints, generated columns.
    - *Why*: Keep DDL thin for assessment.
    - *Later*: Add uniqueness, partial indexes, and materialized views for “next flight”.

---

## Shortcuts & How We’d Address Them

- **Buffers applied in BFF**
    - *Shortcut*: BFF adds a single `config.buffer_time_transit`.
    - *Fix*: Per-airport/terminal buffers; member-level preference; A/B testing.
- **Direct latitude/longitude usage**
    - *Shortcut*: Store drop-off as numeric lat/lon.
    - *Fix*: Enable **PostGIS** and index on `GEOGRAPHY(Point)`; add proximity and geofencing.
- **Simplified auth for partner pull**
    - *Shortcut*: API key example for Taxico.
    - *Fix*: OAuth2 client-credentials + mTLS, partner-scoped claims, fine-grained scopes (`bookings:read`).
- **No webhook inbox**
    - *Shortcut*: Poll Taxico for ride bookings.
    - *Fix*: Signed webhooks (`BookingUpdated`, `ETAChanged`), idempotency, dead-letter queue.
- **No rate limiting/backoff policy in spec**
    - *Shortcut*: Omitted for brevity.
    - *Fix*: Per-route rate limits; 429 handling with `Retry-After`; exponential backoff.
- **Basic error model**
    - *Shortcut*: Minimal `400/401/403/404/422/500`.
    - *Fix*: Typed errors with codes; client guidance; SLO-driven retries.

---

### TL;DR

- **BFF as the single front door**: encapsulates buffers, proxies specialized domains.
- **Postgres for integrity & time math**; optional PostGIS later.
- **PCI-safe MVP**: payments live in the taxi partner domain.
- **Clear path to scale**: partner abstraction, events/webhooks, smarter recommendations.