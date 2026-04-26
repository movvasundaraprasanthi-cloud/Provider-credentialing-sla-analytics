CREATE OR REPLACE VIEW healthcare_analytics.provider_ops.v_provider_credentialing_reporting AS
SELECT
    provider_id,
    provider_name,
    state,
    specialty,
    intake_source,
    assigned_analyst,
    received_date,
    completed_date,
    status,
    turnaround_days,
    documents_missing_flag,
    verification_issue_flag,
    committee_required_flag,
    sla_target_days,
    CASE
        WHEN turnaround_days BETWEEN 0 AND 7 THEN '0-7 Days'
        WHEN turnaround_days BETWEEN 8 AND 14 THEN '8-14 Days'
        WHEN turnaround_days BETWEEN 15 AND 30 THEN '15-30 Days'
        ELSE '31+ Days'
    END AS aging_bucket,
    CASE WHEN turnaround_days > sla_target_days THEN 1 ELSE 0 END AS sla_breach_flag,
    DATE_TRUNC('MONTH', received_date) AS received_month
FROM healthcare_analytics.provider_ops.provider_credentialing_raw;
