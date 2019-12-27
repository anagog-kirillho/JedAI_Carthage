CREATE TABLE SDKVersion
(
    FullVersion         TEXT,
    EffectiveVersion    INTEGER,
    UpgradeVersion      INTEGER
);

INSERT INTO SDKVersion (FullVersion, EffectiveVersion, UpgradeVersion) VALUES("0.0.0.0", 0, 0);
