CREATE TABLE Activity
    (_id INTEGER PRIMARY KEY,
    StartLocationId INTEGER,
    StopLocationId INTEGER,
    ActivityType INTEGER,
    Confidence INTEGER,
    VehicleType INTEGER,
    Role INTEGER,
    ExtendedInfo INTEGER,
    StartTimestamp INTEGER,
    StartTimestampLocal INTEGER,
    StopTimestamp INTEGER,
    StopTimestampLocal INTEGER,
    OriginActivityType INTEGER,
    OriginVehicleType INTEGER
);

CREATE INDEX Activity_StartLocationId_IDX ON Activity (StartLocationId);
CREATE INDEX Activity_StopLocationId_IDX ON Activity (StopLocationId);
CREATE INDEX Activity_ActivityType_IDX ON Activity (ActivityType);
CREATE INDEX Activity_StartTimestamp_IDX ON Activity (StartTimestamp);
CREATE INDEX Activity_StartTimestampLocal_IDX ON Activity (StartTimestampLocal);
CREATE INDEX Activity_StopTimestamp_IDX ON Activity (StopTimestamp);
CREATE INDEX Activity_StopTimestampLocal_IDX ON Activity (StopTimestampLocal);

CREATE TABLE Location
(
    _id                   INTEGER PRIMARY KEY,
    LocationTime          INTEGER,
    LocationTimeLocal     INTEGER,
    LocationTimeSinceBoot INTEGER,
    Latitude              REAL,
    Longitude             REAL,
    Accuracy              REAL,
    Altitude              REAL,
    Speed                 REAL,
    Bearing               REAL,
    Provider              TEXT,
    Floor                 INTEGER,
    VerticalAccuracy      REAL,
    NetCountry            TEXT,
    SimCountry            TEXT,
    Barometer             REAL,
    DeltaStepsCounted     INTEGER,
    Geohash               TEXT
);

CREATE INDEX Location_LocationTime_IDX ON Location (LocationTime);
CREATE INDEX Location_LocationTimeLocal_IDX ON Location (LocationTimeLocal);
CREATE INDEX Location_Accuracy_IDX ON Location (Accuracy);
CREATE INDEX Location_Provider_IDX ON Location (Provider);
CREATE INDEX Location_DeltaStepsCounted_IDX ON Location (DeltaStepsCounted);
CREATE INDEX Location_Geohash_IDX ON Location (Geohash);

CREATE TABLE Visit
(
    _id                  INTEGER PRIMARY KEY,
    EnterTimestamp       INTEGER,
    ExitTimestamp        INTEGER,
    EnterTimestampLocal  INTEGER,
    ExitTimestampLocal   INTEGER,
    Latitude             REAL,
    Longitude            REAL,
    Accuracy             REAL,
    Altitude             REAL,
    PoiId                INTEGER,
    PoiAlgorithmType     INTEGER,
    NetCountry           TEXT,
    SimCountry           TEXT,
    Geohash              TEXT,
    OriginPoiId          INTEGER
);

CREATE INDEX Visit_EnterTimestamp_IDX ON Visit (EnterTimestamp);
CREATE INDEX Visit_ExitTimestamp_IDX ON Visit (ExitTimestamp);
CREATE INDEX Visit_EnterTimestampLocal_IDX ON Visit (EnterTimestampLocal);
CREATE INDEX Visit_ExitTimestampLocal_IDX ON Visit (ExitTimestampLocal);
CREATE INDEX Visit_PoiId_IDX ON Visit (PoiId);
CREATE INDEX Visit_Geohash_IDX ON Visit (Geohash);


CREATE TABLE Cluster
(
    _id                   INTEGER PRIMARY KEY,
    Latitude              REAL,
    Longitude             REAL,
    ClusterOwnerId        INTEGER,
    Geohash               TEXT
);

CREATE INDEX Cluster_ClusterOwnerId_IDX ON Cluster (ClusterOwnerId);
CREATE INDEX Cluster_Geohash_IDX ON Cluster (Geohash);

CREATE TABLE ClusteredActivities
(
    _id                   INTEGER PRIMARY KEY,
    ClusterId             INTEGER,
    ActivityId            INTEGER
);

CREATE INDEX ClusteredActivities_ClusterIdActivityId_IDX ON ClusteredActivities (ClusterId,ActivityId);
CREATE INDEX ClusteredActivities_ClusterId_IDX ON ClusteredActivities (ClusterId);
CREATE INDEX ClusteredActivities_ActivityId_IDX ON ClusteredActivities (ActivityId);

CREATE TABLE ClusteredVisits
(
    _id                   INTEGER PRIMARY KEY,
    ClusterId             INTEGER,
    VisitId               INTEGER
);

CREATE INDEX ClusteredVisits_ClusterId_IDX ON ClusteredVisits (ClusterId);
CREATE INDEX ClusteredVisits_VisitId_IDX ON ClusteredVisits (VisitId);
CREATE INDEX ClusteredVisits_ClusterIdVisitId_IDX ON ClusteredVisits (ClusterId,VisitId);

CREATE TABLE SDKUpgrade
(
    VersionNumber       TEXT,
    BuildNumber         INTEGER,
    Timestamp           INTEGER PRIMARY KEY
);

CREATE TABLE SDKVersion
(
    FullVersion         TEXT,
    EffectiveVersion    INTEGER,
    UpgradeVersion      INTEGER
);

INSERT INTO SDKVersion (FullVersion, EffectiveVersion, UpgradeVersion) VALUES("0.0.0.0", 0, 0);

CREATE TABLE VisitedPois
(
    _id             INTEGER PRIMARY KEY,
    PoiId           TEXT,
    Name            TEXT,
    Type            TEXT,
    Category        TEXT,
    BrandId         TEXT,
    BrandName       TEXT,
    RawType         TEXT,
    SubType         TEXT,
    Extra           TEXT,
    Latitude        REAL,
    Longitude       REAL,
    AlgorithmType   INTEGER,
    Geohash         TEXT,
    Polygon         BLOB
);

CREATE INDEX VisitedPois_Type_IDX ON VisitedPois (Type);
CREATE INDEX VisitedPois_SubType_IDX ON VisitedPois (SubType);
CREATE INDEX VisitedPois_Geohash_IDX ON VisitedPois (Geohash);
CREATE INDEX VisitedPois_Category_IDX ON VisitedPois (Category);
CREATE INDEX VisitedPois_RawType_IDX ON VisitedPois (RawType);
CREATE INDEX VisitedPois_BrandId_IDX ON VisitedPois (BrandId);

CREATE TABLE PersonalPoi
(
    _id             INTEGER PRIMARY KEY,
    PoiId           TEXT,
    Name            TEXT,
    Type            TEXT,
    Category        TEXT,
    BrandId         TEXT,
    BrandName       TEXT,
    RawType         TEXT,
    SubType         TEXT,
    Latitude        REAL,
    Longitude       REAL,
    AlgorithmType   INTEGER,
    Geohash         TEXT,
    Extra           TEXT,
    Polygon         BLOB
);

CREATE INDEX PersonalPoi_Type_IDX ON PersonalPoi (Type);
CREATE INDEX PersonalPoi_SubType_IDX ON PersonalPoi (SubType);
CREATE INDEX PersonalPoi_Geohash_IDX ON PersonalPoi (Geohash);
CREATE INDEX PersonalPoi_AlgorithmType_IDX ON PersonalPoi (AlgorithmType);
CREATE INDEX PersonalPoi_Category_IDX ON PersonalPoi (Category);
CREATE INDEX PersonalPoi_RawType_IDX ON PersonalPoi (RawType);
CREATE INDEX PersonalPoi_BrandId_IDX ON PersonalPoi (BrandId);

CREATE TABLE Trip
    (_id INTEGER PRIMARY KEY,
    StartTimestamp INTEGER,
    StartTimestampLocal INTEGER,
    StopTimestamp INTEGER,
    StopTimestampLocal INTEGER,
    StartLatitude REAL,
    StartLongitude REAL,
    StartGeohash TEXT,
    StopLatitude REAL,
    StopLongitude REAL,
    StopGeohash TEXT,
    StartLocationTimestamp INTEGER,
    StopLocationTimestamp INTEGER,
    StartLocationTimestampLocal INTEGER,
    StopLocationTimestampLocal INTEGER,
    StartCountry TEXT,
    StopCountry TEXT,
    VehicleType INTEGER DEFAULT (1),
    DrivingTime INTEGER,
    DrivingDistance REAL,
    AvgSpeed REAL
);

CREATE INDEX Trip_StartTimestamp_IDX ON Trip (StartTimestamp);
CREATE INDEX Trip_StartTimestampLocal_IDX ON Trip (StartTimestampLocal);
CREATE INDEX Trip_StopTimestamp_IDX ON Trip (StopTimestamp);
CREATE INDEX Trip_StopTimestampLocal_IDX ON Trip (StopTimestampLocal);
CREATE INDEX Trip_VehicleType_IDX ON Trip (VehicleType);
CREATE INDEX Trip_StartCountry_IDX ON Trip (StartCountry);
CREATE INDEX Trip_StopCountry_IDX ON Trip (StopCountry);

CREATE TABLE Stats
    (
    Name Text,
    Index1 Text,
    Index2 Text,
    TimeRange Text,
    TimeRangeFrom INTEGER,
    TimeRangeTo INTEGER,
    Timestamp INTEGER,
    TimestampLocal INTEGER,
    StringValue Text,
    DecimalValue REAL,
    IntegerValue INTEGER
);

CREATE INDEX Stats_Name_IDX ON Stats (Name);
CREATE INDEX Stats_Index1_IDX ON Stats (Index1);
CREATE INDEX Stats_Index2_IDX ON Stats (Index2);
CREATE INDEX Stats_TimeRange_IDX ON Stats (TimeRange);

CREATE VIEW V_Activity AS
SELECT a._id AS Id,
    datetime((a.StartTimestamp)/1000,'unixepoch') AS StartDate,
    datetime((a.StopTimestamp)/1000,'unixepoch') AS EndDate,
    datetime((a.StartTimestampLocal)/1000,'unixepoch') AS StartDateLocal,
    datetime((a.StopTimestampLocal)/1000,'unixepoch') AS EndDateLocal,
    l1.Latitude AS StartLatitude,
    l1.Longitude AS StartLongitude,
    l2.Latitude AS StopLatitude,
    l2.Longitude AS StopLongitude,
    a.ActivityType,
    a.VehicleType,
    a.Role,
    a.Confidence,
    a.ExtendedInfo,
    a.StartLocationId,
    a.StopLocationId
    FROM Activity AS a JOIN Location as l1 ON a.StartLocationId == l1._id  JOIN Location as l2 ON a.StopLocationId == l2._id
    ORDER BY Id;

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

CREATE VIEW V_Location AS
SELECT l._id AS Id,
    datetime((l.LocationTime)/1000,'unixepoch') AS LocationDate,
    datetime((l.LocationTimeLocal)/1000,'unixepoch') AS LocationDateLocal,
    l.Latitude,
    l.Longitude,
    l.Accuracy,
    l.Altitude,
    l.Speed,
    l.Bearing,
    l.Provider,
    l.Floor,
    l.VerticalAccuracy,
    l.Barometer,
    l.DeltaStepsCounted,
    l.NetCountry,
    l.SimCountry,
    l.Geohash
    FROM Location AS l
    ORDER BY Id;

CREATE VIEW V_Trip AS
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

CREATE VIEW V_Stats AS
SELECT s.Name,
    datetime((s.Timestamp)/1000,'unixepoch') AS Date,
    datetime((s.TimestampLocal)/1000,'unixepoch') AS DateLocal,
    s.Index1,
    s.Index2,
    s.TimeRange,
    s.StringValue,
    s.DecimalValue,
    s.IntegerValue
    FROM Stats AS s
    ORDER BY Name;


-- Aggregation

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
    Week INTEGER,
    StringValue TEXT,
    DecimalValue REAL,
    IntegerValue INTEGER,
    Status INTEGER          -- 1 - None, 2 - Completed, 3 - Partial
);

CREATE INDEX AggregationDaily_Metric_IDX ON AggregationDaily (Metric);
CREATE INDEX AggregationDaily_CalculationGroup_IDX ON AggregationDaily (CalculationGroup);
CREATE INDEX AggregationDaily_Year_Month_Day_IDX ON AggregationDaily (Year, Month, Day);
CREATE INDEX AggregationDaily_Year_Month_WeekDay_IDX ON AggregationDaily (Year, Month, WeekDay);
CREATE INDEX AggregationDaily_Week_IDX ON AggregationDaily (Week);
CREATE INDEX AggregationDaily_StartDate_IDX ON AggregationDaily (StartDate);
CREATE INDEX AggregationDaily_EndDate_IDX ON AggregationDaily (EndDate);
CREATE INDEX AggregationDaily_IntegerValue_IDX ON AggregationDaily (IntegerValue);
CREATE INDEX AggregationDaily_DecimalValue_IDX ON AggregationDaily (DecimalValue);

CREATE TABLE Steps (
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

CREATE INDEX Steps_StartTimestamp_IDX ON Steps (StartTimestamp);
CREATE INDEX Steps_StartTimestampLocal_IDX ON Steps (StartTimestampLocal);
CREATE INDEX Steps_StopTimestamp_IDX ON Steps (StopTimestamp);
CREATE INDEX Steps_StopTimestampLocal_IDX ON Steps (StopTimestampLocal);

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
