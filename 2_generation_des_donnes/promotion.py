import pandas as pd

promotions = []
valeurs_promotion = [0, 0.1, 0.25, 0.5, 0.75, 1.2]

for i, valeur in enumerate(valeurs_promotion, start=1):
    promo = {
        'id': i,
        'promotion': valeur
    }
    promotions.append(promo)

promotions = pd.DataFrame(promotions)
promotions.to_csv("bdd/promotions.csv", index=False)
