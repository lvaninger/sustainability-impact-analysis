-- Sustainability Impact Analysis for Intel (hypothetical dataset)
-- Purpose: Analyze device repurposing, estimated energy savings, and CO2 reductions.
-- Source: LevelUp portfolio project PDF. Dataset is illustrative, not verified Intel operational data.
-- Tables: intel.device_data, intel.impact_data
-- SQL dialect follows the assignment examples (PostgreSQL-style date/rounding/window syntax).

-- TASK 1A: Join device and impact data
SELECT *
FROM intel.device_data AS d
INNER JOIN intel.impact_data AS i
    ON d.device_id = i.device_id;

-- TASK 1B: Add device age (dataset represents devices repurposed in 2024)
SELECT
    d.*,
    i.*,
    2024 - d.model_year AS device_age
FROM intel.device_data AS d
INNER JOIN intel.impact_data AS i
    ON d.device_id = i.device_id;

-- TASK 1C: Order devices by model year (oldest to newest)
SELECT
    d.device_id,
    d.device_type,
    d.model_year,
    2024 - d.model_year AS device_age
FROM intel.device_data AS d
ORDER BY d.model_year ASC;

-- TASK 1D: Add device age bucket
SELECT
    d.*,
    i.*,
    2024 - d.model_year AS device_age,
    CASE
        WHEN 2024 - d.model_year <= 3 THEN 'newer'
        WHEN 2024 - d.model_year <= 6 THEN 'mid-age'
        ELSE 'older'
    END AS device_age_bucket
FROM intel.device_data AS d
INNER JOIN intel.impact_data AS i
    ON d.device_id = i.device_id;

-- TASK 2A: Total number of devices in the joined dataset
SELECT COUNT(*) AS total_devices
FROM intel.device_data AS d
INNER JOIN intel.impact_data AS i
    ON d.device_id = i.device_id;

-- TASK 2B: Overall summary metrics
WITH device_impact AS (
    SELECT
        d.device_id,
        d.device_type,
        d.model_year,
        i.energy_savings_yr,
        i.co2_saved_kg_yr
    FROM intel.device_data AS d
    INNER JOIN intel.impact_data AS i
        ON d.device_id = i.device_id
)
SELECT
    COUNT(*) AS total_devices,
    AVG(2024 - model_year) AS average_device_age,
    AVG(energy_savings_yr) AS avg_energy_savings_kwh_per_year,
    SUM(co2_saved_kg_yr) / 1000.0 AS total_co2_saved_metric_tons_per_year
FROM device_impact;

-- TASK 3A: Summary by device type
SELECT
    d.device_type,
    COUNT(*) AS total_devices,
    AVG(i.energy_savings_yr) AS avg_energy_savings_kwh_per_year,
    AVG(i.co2_saved_kg_yr) / 1000.0 AS avg_co2_saved_metric_tons_per_device_year
FROM intel.device_data AS d
INNER JOIN intel.impact_data AS i
    ON d.device_id = i.device_id
GROUP BY d.device_type
ORDER BY d.device_type;

-- TASK 3C: Summary by device age bucket
SELECT
    CASE
        WHEN 2024 - d.model_year <= 3 THEN 'newer'
        WHEN 2024 - d.model_year <= 6 THEN 'mid-age'
        ELSE 'older'
    END AS device_age_bucket,
    COUNT(*) AS total_devices,
    AVG(i.energy_savings_yr) AS avg_energy_savings_kwh_per_year,
    AVG(i.co2_saved_kg_yr) AS avg_co2_saved_kg_per_year
FROM intel.device_data AS d
INNER JOIN intel.impact_data AS i
    ON d.device_id = i.device_id
GROUP BY
    CASE
