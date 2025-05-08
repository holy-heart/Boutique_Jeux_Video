from faker import Faker
import pandas as pd
import random

fake = Faker()
C= ["Xbox one", "PC", "Playstation 1", "Playstation 2", "Playstation 3", "Playstation 4", "Xbox 360"]
consols = []
for i, j in enumerate(C, start=1):

    consol = {
        'id' : i,
        'Nom': j
    }

    consols.append(consol)

consols = pd.DataFrame(consols)
consols.to_csv("bdd/consols.csv", index=False)