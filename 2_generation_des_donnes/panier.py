from faker import Faker
import pandas as pd
import random
from datetime import datetime

fake = Faker()

paniers = []
for i in range(1,11):

    panier = {
        'id' : i,
        'total': None,
        "id_promotion" : random.randint(1,6),   
        "id_client" : random.randint(1,10),
        "Date_create" : datetime.today().strftime('%d/%m/%Y'),
        'acheté' : False,
        'Date_achat' : None,
        "paiment" : None
    }

    paniers.append(panier)

paniers = pd.DataFrame(paniers)
paniers.to_csv("bdd/paniers.csv", index=False)