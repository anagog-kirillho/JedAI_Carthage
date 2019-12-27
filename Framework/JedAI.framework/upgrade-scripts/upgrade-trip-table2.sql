ALTER TABLE Trip ADD COLUMN StartLocationTimestamp INTEGER;
ALTER TABLE Trip ADD COLUMN StopLocationTimestamp INTEGER;
ALTER TABLE Trip ADD COLUMN StartLocationTimestampLocal INTEGER;
ALTER TABLE Trip ADD COLUMN StopLocationTimestampLocal INTEGER;

UPDATE Trip SET StartLocationTimestamp = StartTimestamp, StopLocationTimestamp = StopTimestamp, StartLocationTimestampLocal = StartTimestampLocal, StopLocationTimestampLocal = StopTimestampLocal;

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
    t.StopLatitude,
    t.StopLongitude,
    t.StopGeohash,
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

