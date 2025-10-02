-- Airports
CREATE TABLE airports (
                          id   BIGSERIAL PRIMARY KEY,
                          name TEXT,
                          code TEXT
);

-- Terminals (linked to airports)
CREATE TABLE terminals (
                           id                                   BIGSERIAL PRIMARY KEY,
                           airport_id                            BIGINT NOT NULL REFERENCES airports(id),
                           name                                  TEXT,
                           code                                  TEXT,
                           dropoff_longitude                     NUMERIC(9,6),
                           dropoff_latitude                      NUMERIC(9,6),
                           transit_time_from_dropoff_to_gate     INTERVAL
);

-- Members
CREATE TABLE members (
                         id                           BIGSERIAL PRIMARY KEY,
                         fname                        TEXT,
                         lname                        TEXT,
                         taxiCo_customer_id           TEXT,
                         taxiCo_customer_link_status  TEXT,
                         taxiCo_customer_link_time    TIMESTAMPTZ
);

-- Flights (references airports & terminals)
CREATE TABLE flights (
                         id                       BIGSERIAL PRIMARY KEY,
                         code                     TEXT,
                         departure_airport_id     BIGINT REFERENCES airports(id),
                         departure_terminal_id    BIGINT REFERENCES terminals(id),
                         arrival_airport_id       BIGINT REFERENCES airports(id),
                         scheduled_departure      TIMESTAMPTZ,
                         estimated_departure      TIMESTAMPTZ,
                         status                   TEXT
);

-- Bookings (member ↔ flight)
CREATE TABLE bookings (
                          id         BIGSERIAL PRIMARY KEY,
                          member_id  BIGINT NOT NULL REFERENCES members(id),
                          flight_id  BIGINT NOT NULL REFERENCES flights(id)
);

-- Lounges (per terminal)
CREATE TABLE lounges (
                         id                           BIGSERIAL PRIMARY KEY,
                         terminal_id                  BIGINT NOT NULL REFERENCES terminals(id),
                         name                         TEXT,
                         tier                         TEXT,
                         transit_time_from_security   INTERVAL,
                         transit_time_to_gate_min     INTERVAL,
                         transit_time_to_gate_max     INTERVAL
);

-- Config (simple singleton-style table)
CREATE TABLE config (
                        id                    BIGSERIAL PRIMARY KEY,
                        buffer_time_transit   INTERVAL
);
