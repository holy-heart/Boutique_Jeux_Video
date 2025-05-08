from faker import Faker
import pandas as pd
import random

fake = Faker()

jeux = []
for i in range(1,101):

    jeu = {
        'id' : i,
        'Nom': random.choice([fake.word().capitalize() + " " + ' '.join(fake.words()), fake.word().capitalize() + " of " + ' '.join(fake.words())]),        
        "Date_sortie" : fake.date_between(start_date="-50y", end_date="today").strftime('%d/%m/%Y'),
        "prix" : round(random.uniform(0.99, 999.99), 2),
        "stock" : random.randint(0, 8000),
        "id_editor": random.randint(1,20),
    }

    jeux.append(jeu)

jeux = pd.DataFrame(jeux)
jeux.to_csv("bdd/jeux.csv", index=False)