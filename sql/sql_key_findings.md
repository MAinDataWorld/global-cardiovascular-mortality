# Key Findings — CVD Mortality SQL Analysis

This document summarizes the main findings generated from the SQL analysis of the cleaned cardiovascular disease (CVD) mortality dataset. The analysis covers 117 countries/entities across the period 1950–2023.

The full analysis is reproducible using the queries in [View the SQL analysis](cvd_mortality_metrics.sql) and the cleaned dataset in [View the cleaned dataset](../data/cleaned/).

---

## 1. Dataset Overview

* **117 countries/entities** represented in the dataset
* **Coverage period:** 1950–2023
* **Global average mortality rate across the full period:** 279.54 deaths per 100,000 (age-standardized)

---

## 2. Global Mortality Trend

The global average CVD mortality rate declined substantially over the period covered by the dataset.

* **1950:** 429.5 deaths per 100,000
* **2022:** 172.2 deaths per 100,000
* **2023:** 189.8 deaths per 100,000

The rate reached its lowest observed value in 2022 before increasing in 2023. The available data alone cannot determine whether this increase represents a sustained reversal or a short-term fluctuation.

---

## 3. Countries with the Highest and Lowest Average Mortality Rates

The following countries/entities had the highest and lowest average mortality rates across their available years in the dataset.

| Highest average rate |  Rate | Lowest average rate  |  Rate |
| -------------------- | ----: | -------------------- | ----: |
| Turkmenistan         | 564.0 | Lebanon              |  63.4 |
| Moldova              | 540.8 | Thailand             |  71.3 |
| Ukraine              | 537.1 | Peru                 |  82.6 |
| Uzbekistan           | 519.5 | United Arab Emirates | 102.8 |
| Russia               | 518.7 | Mayotte              | 103.8 |

The highest average rates in this analysis are concentrated among several former Soviet states, while several countries in the Gulf and East/Southeast Asia appear among the lower-rate group.

---

## 4. Highest and Lowest Mortality Rates in 2023

For the most recent year represented in the dataset:

* **Highest observed rate:** Uzbekistan — 594.1 deaths per 100,000
* **Lowest observed rate:** Lebanon — 47.8 deaths per 100,000

These values represent the highest and lowest observations among the countries/entities available for 2023 in the dataset.

---

## 5. Egypt's Mortality Trend

Egypt showed a different trajectory from the overall global trend across its available observations.

|       Year | Mortality rate |
| ---------: | -------------: |
|       1965 |          259.2 |
|       2019 |          459.3 |
| **Change** |     **+200.1** |

Across the available years analyzed for Egypt, the mortality rate increased by 200.1 deaths per 100,000 between the earliest and latest observations.

The SQL analysis identified this as the largest increase among countries based on their respective earliest and latest available observations.

For comparison, Guyana showed the largest decline identified using the same approach, decreasing from 727.8 in 1977 to 220.9 in 2020, a change of -506.9 deaths per 100,000.

---

## 6. Egypt Compared with Selected Countries

Average mortality rates across all available years were compared between Egypt and three selected countries.

| Country        | Average mortality rate | Difference from Egypt |
| -------------- | ---------------------: | --------------------: |
| Egypt          |                  373.9 |                     — |
| United States  |                  305.2 |                 -68.7 |
| United Kingdom |                  299.6 |                 -74.3 |
| Japan          |                  213.0 |                -160.8 |

Egypt had a higher average mortality rate across the available observations than the United States, United Kingdom, and Japan in this analysis.

---

## 7. Egypt Data Coverage Limitations

The analysis identified substantial gaps in the annual data available for Egypt. The dataset does not contain observations for 36 years within the 1950–2023 study period:

1950–1964, 1968–1969, 1981–1986, 1988–1990, 1993–1999, and 2020–2023.

This means that Egypt's available observations do not represent a continuous annual time series.

