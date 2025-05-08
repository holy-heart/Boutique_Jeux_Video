from faker import Faker
import pandas as pd
import random

fake = Faker()

Jc = []


for i in range(1,101):

    jeu_c = {
        'id_jeu' : i,
        'id_consol' : random.randint(1,7)
    }

    Jc.append(jeu_c)


    
Jc = pd.DataFrame(Jc)
Jc.to_csv("bdd/Jc.csv", index=False)