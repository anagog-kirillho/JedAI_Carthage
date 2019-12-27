ALTER TABLE VisitedPois ADD COLUMN BrandId TEXT;
ALTER TABLE VisitedPois ADD COLUMN BrandName TEXT;

CREATE INDEX IF NOT EXISTS VisitedPois_BrandId_IDX ON VisitedPois (BrandId);
CREATE INDEX IF NOT EXISTS VisitedPois_BrandName_IDX ON VisitedPois (BrandName);

ALTER TABLE PersonalPoi ADD COLUMN BrandId TEXT;
ALTER TABLE PersonalPoi ADD COLUMN BrandName TEXT;

CREATE INDEX IF NOT EXISTS PersonalPoi_BrandId_IDX ON PersonalPoi (BrandId);
CREATE INDEX IF NOT EXISTS PersonalPoi_BrandName_IDX ON PersonalPoi (BrandName);

DROP VIEW V_Visit;

CREATE VIEW V_Visit AS
SELECT v._id AS Id,
    datetime((v.EnterTimestamp)/1000,'unixepoch') AS EnterDate,
    datetime((v.ExitTimestamp)/1000,'unixepoch') AS ExitDate,
    datetime((v.EnterTimestampLocal)/1000,'unixepoch') AS EnterDateLocal,
    datetime((v.ExitTimestampLocal)/1000,'unixepoch') AS ExitDateLocal,
    v.Latitude,
    v.Longitude,
    vp.Name,
    vp.Type,
    vp.BrandId,
    vp.BrandName,
    v.Accuracy,
    v.PoiId,
    v.Altitude,
    v.NetCountry,
    v.SimCountry,
    v.Geohash
    FROM Visit AS v LEFT JOIN VisitedPois as vp ON v.PoiId == vp._id
    ORDER BY Id;
