import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
pd.set_option('display.max_columns', None)

a = pd.read_csv("data/cleaned/CVD_cleaned.csv")
print(a.head())

selected_countries = ['Egypt', 'Moldova', 'Tajikistan', 'Ukraine']
selected = a[a['country'].isin(selected_countries)]

pivot = selected.pivot(index='year', columns='country', values='death_rate')

pivot.plot(kind='line', title='Yearly Changes for Selected Countries', figsize=(10, 6))
plt.xlabel('year')
plt.savefig("visualizations/yearly_changes_for_selected_countries.png", dpi=300, bbox_inches='tight')
plt.show()
