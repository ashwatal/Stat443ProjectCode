import pandas as pd
import numpy as np
data = pd.read_csv("TurbineGroup8.csv")
print(data.describe())

# Split TEY into 3 cases, then run individual models


