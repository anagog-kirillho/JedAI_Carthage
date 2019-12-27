ALTER TABLE VisitedPois ADD COLUMN Category TEXT;
ALTER TABLE VisitedPois ADD COLUMN RawType TEXT;

CREATE INDEX IF NOT EXISTS VisitedPois_Category_IDX ON VisitedPois (Category);
CREATE INDEX IF NOT EXISTS VisitedPois_RawType_IDX ON VisitedPois (RawType);
