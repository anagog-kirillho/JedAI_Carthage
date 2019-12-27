DELETE FROM Stats;
ALTER TABLE Stats ADD COLUMN TimeRange TEXT;
ALTER TABLE Stats ADD COLUMN TimeRangeFrom INTEGER;
ALTER TABLE Stats ADD COLUMN TimeRangeTo INTEGER;

CREATE INDEX Stats_TimeRange_IDX ON Stats (TimeRange);

DROP VIEW IF EXISTS V_Stats;

CREATE VIEW V_Stats AS
SELECT s.Name,
    datetime((s.Timestamp)/1000,'unixepoch') AS Date,
    datetime((s.TimestampLocal)/1000,'unixepoch') AS DateLocal,
    s.Index1,
    s.Index2,
    s.TimeRange,
    s.TimeRangeFrom,
    s.TimeRangeTo,
    s.StringValue,
    s.DecimalValue,
    s.IntegerValue
    FROM Stats AS s
    ORDER BY Name;
