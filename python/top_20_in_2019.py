import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
pd.set_option('display.max_columns', None)

a = pd.read_csv("data/cleaned/CVD_cleaned.csv")
print(a.head())

year_2019 = a[a['year'] == 2019]
top_20 = year_2019.nlargest(20, 'death_rate').set_index('country')

top_20['death_rate'].plot(kind='barh', title='20 Countries with Highest Death Rates in 2019', figsize=(10, 10))
plt.xlabel('Death Rates')
plt.ylabel('Country')
plt.savefig("visualizations/top_20_in_2019.png", dpi=300, bbox_inches='tight')
plt.show()
