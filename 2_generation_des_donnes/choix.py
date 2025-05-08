from faker import Faker
import pandas as pd
import random

fake = Faker()


choix = []
for i in range(1,5):
    choi = {
        'id' : i,
        'id_panier' : 1,
        'id_jeu' : random.randint(1,100),
        'unit' : random.randint(1,3)
    }

    choix.append(choi)

for i in range(5,7):
    choi = {
        'id' : i,
        'id_panier' : 2,
        'id_jeu' : random.randint(1,100),
        'unit' : random.randint(1,2)
    }

    choix.append(choi)



for i in range(7,10):
    choi = {
        'id' : i,
        'id_panier': 3,
        'id_jeu' : random.randint(1,100),
        'unit' : random.randint(1,6)
    }

    choix.append(choi)

for i in range(10,14):
    choi = {
        'id' : i,
        'id_panier' : 4,
        'id_jeu' : random.randint(1,100),
        'unit' : random.randint(1,6)
    }

    choix.append(choi)

choi = {
    'id' : 14,
    'id_panier' :5,
    'id_jeu' : random.randint(1,100),
    'unit' : 1
}

choix.append(choi)

for i in range(15,18):
    choi = {
        'id' : i,
        'id_panier' : 6,
        'id_jeu' : random.randint(1,100),
        'unit' : random.randint(1,6)
    }

    choix.append(choi)

choi = {
    'id' : 18,
    'id_panier' :7,
    'id_jeu' : random.randint(1,100),
    'unit' : 1
}

choix.append(choi)
choi = {
    'id' : 19,
    'id_panier' :8,
    'id_jeu' : random.randint(1,100),
    'unit' : 1
}

choix.append(choi)
choi = {
    'id' : 20,
    'id_panier' :9,
    'id_jeu' : random.randint(1,100),
    'unit' : 2
}

choix.append(choi)
choi = {
    'id' : 21,
    'id_panier' :10,
    'id_jeu' : random.randint(1,100),
    'unit' : 1
}

choix.append(choi)



choix = pd.DataFrame(choix)
choix.to_csv("bdd/choix.csv", index=False)
