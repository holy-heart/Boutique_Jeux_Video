from faker import Faker
import pandas as pd
import random

fake = Faker()

Jg = []


for i in range(1,101):

    jeu_g = {
        'id_jeu' : i,
        'id_genre' : random.randint(1,12)
    }

    Jg.append(jeu_g)


    
Jg = pd.DataFrame(Jg)
Jg.to_csv("bdd/Jg.csv", index=False)