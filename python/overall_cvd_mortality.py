import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
pd.set_option('display.max_columns', None)

a = pd.read_csv("data/cleaned/CVD_cleaned.csv")
print(a.head())

avg_per_year = a['death_rate'].groupby(a['year']).mean()
avg_per_year = round(avg_per_year, 2)

avg_per_year.plot(kind='line', title='Overall CVD Mortality over Time', figsize=(10, 6))
plt.xlabel('Year')
plt.ylabel('Average CVD Death Rate')
plt.savefig("visualizations/overall_cvd_mortality.png", dpi=300, bbox_inches='tight')
plt.show()
