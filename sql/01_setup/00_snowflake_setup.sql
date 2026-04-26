CREATE OR REPLACE DATABASE healthcare_analytics;
CREATE OR REPLACE SCHEMA healthcare_analytics.provider_ops;

CREATE OR REPLACE TABLE healthcare_analytics.provider_ops.provider_credentialing_raw (
    provider_id STRING,
    provider_name STRING,
    state STRING,
    specialty STRING,
    intake_source STRING,
    assigned_analyst STRING,
    received_date DATE,
    completed_date DATE,
    status STRING,
    turnaround_days NUMBER,
    documents_missing_flag NUMBER,
    verification_issue_flag NUMBER,
    committee_required_flag NUMBER,
    sla_target_days NUMBER
);

/* Example file load:
PUT file://provider_credentialing.csv @%provider_credentialing_raw;
COPY INTO healthcare_analytics.provider_ops.provider_credentialing_raw
FROM @%provider_credentialing_raw
FILE_FORMAT = (TYPE = CSV SKIP_HEADER = 1 FIELD_OPTIONALLY_ENCLOSED_BY='"');
*/
