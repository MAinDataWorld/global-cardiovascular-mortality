# global-cardiovascular-mortality

End-to-end analysis of global cardiovascular mortality trends using Python, SQL, and Power BI.

# CVD Mortality Analysis

## Project Overview

This project analyzes cardiovascular disease (CVD) mortality rates across countries and over time using **Python, SQL, and Power BI**, with a specific focus on Egypt.

The workflow covers data preparation, statistical analysis, exploratory visualization, and interactive dashboard development.

## Main Question

**How has cardiovascular disease mortality changed over time, how do countries differ, and how does Egypt compare with other countries?**

## Data Source

The dataset was obtained from **Our World in Data**, based on data from the WHO Mortality Database:

[Our World in Data — Death rate from cardiovascular diseases](https://ourworldindata.org/grapher/cardiovascular-disease-death-rate-who-mdb?country=EGY)

### Dataset Overview

* **Rows:** 4,904
* **Countries:** 117
* **Years:** 1950–2023 globally
* **Egypt:** 1965–2019
* **Variables:** Country, country code, year, and age-standardized CVD mortality rate per 100,000 population
* **Initial data inspection:** No null values, zero/negative values, or formatting issues were identified.

## Repository Structure

```text
data/
├── raw/
│   └── CVD_raw.csv
│
└── cleaned/
    └── CVD_cleaned.csv

python/
├── clean_data.py
├── egypt_trends_over_time.py
├── overall_cvd_mortality.py
├── top_20_in_2019.py
└── yearly_changes_for_selected_countries.py

sql/
├── cvd_mortality_metrics.sql
└── sql_key_findings.md

results/
├── 01_average_overall_mortality_rate.csv
├── 02_average_mortality_rate_per_country.csv
├── 03_yearly_change_all_countries.csv
├── 04_yearly_change_each_country.csv
├── 05_percentage_change_all_countries.csv
├── 06_percentage_change_each_country.csv
└── 07_egypt_vs_selected_countries.csv

visualizations/
├── egypt_trends_over_time.png
├── overall_cvd_mortality.png
├── top_20_in_2019.png
└── yearly_changes_for_selected_countries.png

powerbi/
├── cvd_mortality_analysis.pbix
├── country_comparison_filtered_canada.png
├── country_comparison_overview.png
├── egypt_page.png
├── global_overview.png
└── global_overview_filtered_turkmenistan.png

└── README.md
```

## Analysis Workflow

### 1. Data Preparation

The raw dataset is stored in:

[`data/raw/CVD_raw.csv`](data/raw/CVD_raw.csv)

The Python script [`python/clean_data.py`](python/clean_data.py) standardizes the raw data and saves the processed dataset to:

[`data/cleaned/CVD_cleaned.csv`](data/cleaned/CVD_cleaned.csv)

### 2. SQL Analysis

The cleaned dataset is analyzed using:

[`sql/cvd_mortality_metrics.sql`](sql/cvd_mortality_metrics.sql)

The analysis covers:

1. Dataset preview
2. Average overall mortality rate
3. Average mortality rate by country
4. Yearly mortality-rate changes
5. Yearly changes for individual countries
6. Percentage changes across countries
7. Percentage changes for individual countries
8. Comparison of Egypt with selected countries

The resulting datasets are stored in `results/`, with key findings documented in:

[`sql/sql_key_findings.md`](sql/sql_key_findings.md)

### 3. Python Analysis and Visualization

Four Python scripts use the cleaned dataset to generate exploratory visualizations:

* [`python/egypt_trends_over_time.py`](python/egypt_trends_over_time.py)
* [`python/overall_cvd_mortality.py`](python/overall_cvd_mortality.py)
* [`python/top_20_in_2019.py`](python/top_20_in_2019.py)
* [`python/yearly_changes_for_selected_countries.py`](python/yearly_changes_for_selected_countries.py)

The resulting figures are stored in `visualizations/`.

### 4. Power BI Dashboard

The interactive dashboard is contained in:

[`powerbi/cvd_mortality_analysis.pbix`](powerbi/cvd_mortality_analysis.pbix)

The dashboard combines KPI cards, trend analysis, country comparisons, and an Egypt-focused view. Dashboard screenshots are also included in the `powerbi/` folder.

## Power BI DAX Measures

The dashboard uses DAX measures to calculate key indicators and support dynamic filtering.

### Dataset Overview Measures

```dax
Average =
AVERAGE(cvd_mortality_clean[death_rate])

Latest_year =
MAX(cvd_mortality_clean[year])

startyear =
MIN(cvd_mortality_clean[year])

Number_countries =
DISTINCTCOUNT(cvd_mortality_clean[country])

Timespan =
FORMAT([startyear], "0") & "-" & FORMAT([Latest_year], "0")
```

### Latest Mortality Rate

Calculates the average mortality rate for the most recent available year within the current filter context.

```dax
latest_mortality_rate =
VAR LatestYear = [Latest_year]

RETURN
    CALCULATE(
        AVERAGE(cvd_mortality_clean[death_rate]),
        cvd_mortality_clean[year] = LatestYear
    )
```

### Percentage Change

Compares the average mortality rate in the earliest available year with the average rate in the latest available year within the current filter context.

```dax
percentage_change =
VAR FIRSTTDATE =
    MIN(cvd_mortality_clean[year])

VAR FIRSTVALUE =
    CALCULATE(
        AVERAGE(cvd_mortality_clean[death_rate]),
        cvd_mortality_clean[year] = FIRSTTDATE
    )

VAR LASTTDATE =
    MAX(cvd_mortality_clean[year])

VAR LASTVALUE =
    CALCULATE(
        AVERAGE(cvd_mortality_clean[death_rate]),
        cvd_mortality_clean[year] = LASTTDATE
    )

RETURN
    DIVIDE(
        LASTVALUE - FIRSTVALUE,
        FIRSTVALUE
    )
```

## Data Limitations

### Missing Data for Egypt

Egypt has substantial gaps in the available data. No observations are available before 1965, with additional missing periods in:

* 1968–1969
* 1981–1986
* 1988–1990
* 1993–1999

The source dataset does not specify why these years are missing.

There are also no available observations for Egypt after 2019, so more recent trends cannot be assessed from this dataset.

### Interpretation of Egypt's Trend

The missing periods affect interpretation of Egypt's long-term trend. Some of the largest observed changes occur immediately after multi-year gaps, including:

* Approximately **169 points** between 1980 and 1987
* Approximately **144 points** between 1992 and 2000

These represent differences between available observations separated by missing years and should not be interpreted as continuous year-by-year changes.

The analysis also does not independently assess the original methodology used to estimate mortality rates for each country. For methodological details, the underlying OWID and WHO Mortality Database documentation should be consulted.

## Key Analytical Areas

The project examines:

* **Global patterns** in CVD mortality rates and changes over time.
* **Country-level differences** in average mortality and temporal change.
* **Egypt's mortality trend**, including comparisons with selected countries.
* **Yearly and percentage changes** to provide context beyond individual mortality-rate values.

## Tools and Technologies

* **Python** — data cleaning, analysis, and visualization
* **SQL** — analytical queries and mortality metrics
* **Power BI** — interactive dashboard development
* **DAX** — calculated measures and dynamic KPIs
* **GitHub** — version control and project documentation

## Project Workflow

```text
Raw CVD Mortality Data
        ↓
Python Data Cleaning
        ↓
Cleaned Dataset
        ↓
 ┌───────────────┬──────────────────┐
 ↓               ↓                  ↓
SQL Analysis   Python Analysis   Power BI
 ↓               ↓                  ↓
CSV Results    Visualizations    Interactive
 ↓                                  Dashboard
Key Findings
```

## Project Outputs

The repository contains the complete analytical workflow, including:

* Raw and cleaned datasets
* SQL analysis and results
* Documented analytical findings
* Python analysis and visualizations
* Power BI dashboard and DAX measures
* Dashboard screenshots
* Documentation of data limitations and methodology

## Conclusion

This project demonstrates an end-to-end approach to analyzing health-related mortality data, combining **Python, SQL, and Power BI** to move from raw data preparation to statistical analysis, visualization, and interactive reporting.
