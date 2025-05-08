from faker import Faker
import pandas as pd

fake = Faker()

clients = []
for i in range(1,1001):
    client = {
        'id' : i,
        'Prenom' : fake.first_name(),
        "Nom" : fake.last_name(),
        "Date_naiss": fake.date_of_birth(minimum_age=13, maximum_age=90).strftime('%d/%m/%Y'),
        "Adress" : fake.country(),
        "Email" : fake.email(),
        "MDP" : fake.password(length=12, special_chars=True, digits=True, upper_case=True, lower_case=True),
        "Date_insc" : fake.date_between(start_date="-10y", end_date="today").strftime('%d/%m/%Y'),
        "Numero" : fake.phone_number()
    }

    clients.append(client)
clients = pd.DataFrame(clients)
clients.to_csv("bdd/clients.csv", index=False)