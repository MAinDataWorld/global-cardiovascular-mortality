import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
pd.set_option('display.max_columns', None)

a = pd.read_csv("data/cleaned/CVD_cleaned.csv")
print(a.head())

egypt = a[a['country'] == 'Egypt']

egypt.plot(x='year', y='death_rate', kind='line', title='Egypt Trends Over time', figsize=(10, 6))
plt.xlabel('Year')
plt.ylabel('Death Rates')
plt.savefig("visualizations/egypt_trends_over_time.png", dpi=300, bbox_inches='tight')
plt.show()
