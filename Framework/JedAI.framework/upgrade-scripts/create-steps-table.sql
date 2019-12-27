CREATE TABLE IF NOT EXISTS Steps (
    _id INTEGER PRIMARY KEY,
    StartTimestamp INTEGER,
    StartTimestampLocal INTEGER,
    StopTimestamp INTEGER,
    StopTimestampLocal INTEGER,
    NumberOfSteps INTEGER,
    Distance REAL,
    FloorsAscended INTEGER,
    FloorsDescended INTEGER
);

CREATE INDEX IF NOT EXISTS Steps_StartTimestamp_IDX ON Steps (StartTimestamp);
CREATE INDEX IF NOT EXISTS Steps_StartTimestampLocal_IDX ON Steps (StartTimestampLocal);
CREATE INDEX IF NOT EXISTS Steps_StopTimestamp_IDX ON Steps (StopTimestamp);
CREATE INDEX IF NOT EXISTS Steps_StopTimestampLocal_IDX ON Steps (StopTimestampLocal);

CREATE VIEW V_Steps AS
SELECT
    datetime((s.StartTimestamp)/1000,'unixepoch') AS StartDate,
    datetime((s.StartTimestampLocal)/1000,'unixepoch') AS StartDateLocal,
    datetime((s.StopTimestamp)/1000,'unixepoch') AS EndDate,
    datetime((s.StopTimestampLocal)/1000,'unixepoch') AS EndDateLocal,
    s.NumberOfSteps,
    s.Distance,
    s.FloorsAscended,
    s.FloorsDescended
    FROM Steps AS s
    ORDER BY StartDate;
