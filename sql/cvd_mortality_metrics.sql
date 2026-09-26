-- Preview the cleaned dataset before running any analysis queries below.
SELECT *
FROM cvd_mortality_clean;

-- Average Overall Mortality Rate
SELECT
    ROUND(AVG(death_rate), 2) AS average_rate
FROM cvd_mortality_clean;

-- Average Mortality Rate Per Country
SELECT
    country,
    code,
    ROUND(AVG(death_rate), 2) AS average_rate
FROM cvd_mortality_clean
GROUP BY country, code;

-- Yearly Change in Mortality for All Countries
WITH cte_total AS (
    SELECT
        year,
        SUM(death_rate) AS total_rate
    FROM cvd_mortality_clean
    GROUP BY year
)
SELECT
    year,
    ROUND(total_rate, 2) AS current_year,
    ROUND(LEAD(total_rate) OVER (ORDER BY year), 2) AS next_year,
    ROUND(LEAD(total_rate) OVER (ORDER BY year) - total_rate, 2) AS change
FROM cte_total;

-- Yearly Change in Mortality for Each Country
SELECT
    country,
    code,
    year,
    death_rate AS current_year_rate,
    LEAD(death_rate) OVER (PARTITION BY country ORDER BY year) AS next_year_rate,
    ROUND(LEAD(death_rate) OVER (PARTITION BY country ORDER BY year) - death_rate, 2) AS change
FROM cvd_mortality_clean;

-- Percentage Change in Mortality Rate Per Year for All Countries
WITH cte_total AS (
    SELECT
        year,
        SUM(death_rate) AS total_rate
    FROM cvd_mortality_clean
    GROUP BY year
)
SELECT
    year,
    ROUND(total_rate, 2) AS current_year,
    ROUND(LEAD(total_rate) OVER (ORDER BY year), 2) AS next_year,
    ROUND(LEAD(total_rate) OVER (ORDER BY year) - total_rate, 2) AS change,
    CONCAT(ROUND(((LEAD(total_rate) OVER (ORDER BY year) - total_rate) / total_rate) * 100, 2), '%') AS percent_change
FROM cte_total;

-- Percentage Change in Mortality Rate Per Year for Each Country
SELECT
    country,
    code,
    year,
    death_rate AS current_year_rate,
    LEAD(death_rate) OVER (PARTITION BY country ORDER BY year) AS next_year_rate,
    ROUND(LEAD(death_rate) OVER (PARTITION BY country ORDER BY year) - death_rate, 2) AS change,
    CONCAT(ROUND(((LEAD(death_rate) OVER (PARTITION BY country ORDER BY year) - death_rate) / death_rate) * 100, 2), '%') AS percent_change
FROM cvd_mortality_clean;

-- Difference in Mortality Rates between Egypt and Other Countries
WITH cte_main AS (
    SELECT
        country,
        code,
        ROUND(AVG(death_rate), 2) AS average_rate
    FROM cvd_mortality_clean
    WHERE country IN ('Egypt', 'United States', 'United Kingdom', 'Japan')
    GROUP BY country, code
)
SELECT
    country,
    code,
    average_rate,
    ROUND(average_rate - (SELECT AVG(death_rate) FROM cvd_mortality_clean WHERE country = 'Egypt'), 2) AS difference_from_egypt
FROM cte_main;
