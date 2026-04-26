SELECT COUNT(*) AS total_providers
FROM healthcare_analytics.provider_ops.v_provider_credentialing_reporting;

SELECT
    SUM(CASE WHEN status = 'Completed' THEN 1 ELSE 0 END) AS completed_cases,
    SUM(CASE WHEN status <> 'Completed' THEN 1 ELSE 0 END) AS pending_cases,
    ROUND(AVG(turnaround_days), 2) AS avg_turnaround_days,
    SUM(sla_breach_flag) AS sla_breaches
FROM healthcare_analytics.provider_ops.v_provider_credentialing_reporting;

SELECT state, COUNT(*) AS pending_backlog
FROM healthcare_analytics.provider_ops.v_provider_credentialing_reporting
WHERE status <> 'Completed'
GROUP BY state
ORDER BY pending_backlog DESC;

SELECT aging_bucket, COUNT(*) AS pending_count
FROM healthcare_analytics.provider_ops.v_provider_credentialing_reporting
WHERE status <> 'Completed'
GROUP BY aging_bucket
ORDER BY pending_count DESC;

SELECT
    assigned_analyst,
    COUNT(*) AS total_cases,
    SUM(CASE WHEN status = 'Completed' THEN 1 ELSE 0 END) AS completed_cases,
    ROUND(AVG(turnaround_days), 2) AS avg_turnaround_days,
    SUM(sla_breach_flag) AS sla_breaches
FROM healthcare_analytics.provider_ops.v_provider_credentialing_reporting
GROUP BY assigned_analyst
ORDER BY completed_cases DESC;

SELECT
    SUM(documents_missing_flag) AS missing_document_cases,
    SUM(verification_issue_flag) AS verification_issue_cases,
    SUM(committee_required_flag) AS committee_review_cases
FROM healthcare_analytics.provider_ops.v_provider_credentialing_reporting;

SELECT received_month, COUNT(*) AS intake_volume
FROM healthcare_analytics.provider_ops.v_provider_credentialing_reporting
GROUP BY received_month
ORDER BY received_month;
