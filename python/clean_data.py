import numpy as np
import pandas as pd
pd.set_option('display.max_columns', None)

a = pd.read_csv("data/raw/CVD_raw.csv")
print(a.head())

a = a.rename(columns={
    'entity': 'country',
    'age_standardized_death_rate_per_100_000_standard_population__sex_both_sexes__age_group_all_ages__cause_cardiovascular_diseases__icd10_codes_i00_i99': 'death_rate'
})

print(a.head())

a.to_csv("data/cleaned/CVD_cleaned.csv", index=False)
