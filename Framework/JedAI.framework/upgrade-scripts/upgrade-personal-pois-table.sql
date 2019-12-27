ALTER TABLE PersonalPoi ADD COLUMN Category TEXT;
ALTER TABLE PersonalPoi ADD COLUMN RawType TEXT;

CREATE INDEX IF NOT EXISTS PersonalPoi_Category_IDX ON PersonalPoi (Category);
CREATE INDEX IF NOT EXISTS PersonalPoi_RawType_IDX ON PersonalPoi (RawType);
