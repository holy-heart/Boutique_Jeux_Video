from faker import Faker
import pandas as pd

fake = Faker()
G = [
    "Action",
    "Aventure",
    "RPG",
    "Strategie",
    "Simulation",
    "Sport",
    "Course",
    "FPS",
    "Puzzle",
    "Horreur",
    "Plateforme",
    "MMO"
]
genres = []
for i,j in enumerate(G, start=1):
    genre = {
        'id' : i,
        'Nom_complet' : j,
        'id_best_game' : None,
        'Date_aparition' : None
    }

    genres.append(genre)
genres = pd.DataFrame(genres)
genres.to_csv("bdd/genres.csv", index=False)


