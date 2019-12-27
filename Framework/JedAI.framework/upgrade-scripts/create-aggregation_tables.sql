-- Aggregation

DROP TABLE IF EXISTS Aggregation;
DROP TABLE IF EXISTS AggregationMetric;
DROP TABLE IF EXISTS AggregationValue;
DROP TABLE IF EXISTS AggregationSlot;

CREATE TABLE AggregationMonthly (
    Metric TEXT,
    CalculationGroup TEXT,
    StartDate INTEGER,
    EndDate INTEGER,
    Year INTEGER,
    Month INTEGER,
    StringValue TEXT,
    DecimalValue REAL,
    IntegerValue INTEGER,
    Status INTEGER          -- 1 - None, 2 - Completed, 3 - Partial
);

CREATE INDEX AggregationMonthly_Metric_IDX ON AggregationMonthly (Metric);
CREATE INDEX AggregationMonthly_CalculationGroup_IDX ON AggregationMonthly (CalculationGroup);
CREATE INDEX AggregationMonthly_Year_Month_IDX ON AggregationMonthly (Year, Month);
CREATE INDEX AggregationMonthly_StartDate_IDX ON AggregationMonthly (StartDate);
CREATE INDEX AggregationMonthly_EndDate_IDX ON AggregationMonthly (EndDate);
CREATE INDEX AggregationMonthly_IntegerValue_IDX ON AggregationMonthly (IntegerValue);
CREATE INDEX AggregationMonthly_DecimalValue_IDX ON AggregationMonthly (DecimalValue);

CREATE TABLE AggregationWeekly (
    Metric TEXT,
    CalculationGroup TEXT,
    StartDate INTEGER,
    EndDate INTEGER,
    Year INTEGER,
    Week INTEGER,
    StringValue TEXT,
    DecimalValue REAL,
    IntegerValue INTEGER,
    Status INTEGER          -- 1 - None, 2 - Completed, 3 - Partial
);

CREATE INDEX AggregationWeekly_Metric_IDX ON AggregationWeekly (Metric);
CREATE INDEX AggregationWeekly_CalculationGroup_IDX ON AggregationWeekly (CalculationGroup);
CREATE INDEX AggregationWeekly_Year_Week_IDX ON AggregationWeekly (Year, Week);
CREATE INDEX AggregationWeekly_StartDate_IDX ON AggregationWeekly (StartDate);
CREATE INDEX AggregationWeekly_EndDate_IDX ON AggregationWeekly (EndDate);
CREATE INDEX AggregationWeekly_IntegerValue_IDX ON AggregationWeekly (IntegerValue);
CREATE INDEX AggregationWeekly_DecimalValue_IDX ON AggregationWeekly (DecimalValue);

CREATE TABLE AggregationDaily (
    Metric TEXT,
    CalculationGroup TEXT,
    StartDate INTEGER,
    EndDate INTEGER,
    Year INTEGER,
    Month INTEGER,
    Day INTEGER,
    WeekDay INTEGER,
    StringValue TEXT,
    DecimalValue REAL,
    IntegerValue INTEGER,
    Status INTEGER          -- 1 - None, 2 - Completed, 3 - Partial
);

CREATE INDEX AggregationDaily_Metric_IDX ON AggregationDaily (Metric);
CREATE INDEX AggregationDaily_CalculationGroup_IDX ON AggregationDaily (CalculationGroup);
CREATE INDEX AggregationDaily_Year_Month_Day_IDX ON AggregationDaily (Year, Month, Day);
CREATE INDEX AggregationDaily_Year_Month_WeekDay_IDX ON AggregationDaily (Year, Month, WeekDay);
CREATE INDEX AggregationDaily_StartDate_IDX ON AggregationDaily (StartDate);
CREATE INDEX AggregationDaily_EndDate_IDX ON AggregationDaily (EndDate);
CREATE INDEX AggregationDaily_IntegerValue_IDX ON AggregationDaily (IntegerValue);
CREATE INDEX AggregationDaily_DecimalValue_IDX ON AggregationDaily (DecimalValue);
