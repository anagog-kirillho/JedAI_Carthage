ALTER TABLE Trip ADD COLUMN StartCountry TEXT;
ALTER TABLE Trip ADD COLUMN StopCountry TEXT;

DROP VIEW IF EXISTS V_Trip;

CREATE VIEW IF NOT EXISTS V_Trip AS
SELECT t._id AS Id,
    datetime((t.StartTimestamp)/1000,'unixepoch') AS StartDate,
    datetime((t.StopTimestamp)/1000,'unixepoch') AS EndDate,
    datetime((t.StartTimestampLocal)/1000,'unixepoch') AS StartDateLocal,
    datetime((t.StopTimestampLocal)/1000,'unixepoch') AS EndDateLocal,
    t.StartLatitude,
    t.StartLongitude,
    t.StartGeohash,
    t.StartCountry,
    t.StopLatitude,
    t.StopLongitude,
    t.StopGeohash,
    t.StopCountry,
    datetime((t.StartLocationTimestamp)/1000,'unixepoch') AS StartLocationDate,
    datetime((t.StopLocationTimestamp)/1000,'unixepoch') AS EndLocationDate,
    datetime((t.StartLocationTimestampLocal)/1000,'unixepoch') AS StartLocationDateLocal,
    datetime((t.StopLocationTimestampLocal)/1000,'unixepoch') AS EndLocationDateLocal,
    t.DrivingTime,
    t.DrivingDistance,
    t.AvgSpeed,
    t.VehicleType
    FROM Trip AS t
    ORDER BY Id;
