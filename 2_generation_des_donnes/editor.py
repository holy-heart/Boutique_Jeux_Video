from faker import Faker
import pandas as pd
import random
fake = Faker()
country = ["USA", "UK", "France", "Canada", "China"]
editors = []
for i in range(1, 21):
    editor = {
        'id': i,
        'nom': fake.company(),
        "Date_creation": fake.date_between(start_date="-50y", end_date="today").strftime('%d/%m/%Y'),
        "region": random.choice(country),
    }
    editors.append(editor)

editors = pd.DataFrame(editors)
editors.to_csv("bdd/editors.csv", index=False)