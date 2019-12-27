ALTER TABLE AggregationDaily ADD COLUMN Week INTEGER;

UPDATE AggregationDaily SET Week = CAST((STRFTIME("%s", DATE(PRINTF("%d-%02d-%02d", Year, Month, Day))) - 1514678400) / (7*60*60*24) AS INTEGER);

CREATE INDEX AggregationDaily_Week_IDX ON AggregationDaily (Week);
