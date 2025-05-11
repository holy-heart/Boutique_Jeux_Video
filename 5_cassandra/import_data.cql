-- Attention : placez les fichiers CSV dans la VM, dans le même dossier que cqlsh, ou utilisez le chemin absolu.

COPY clients (id, prenom, nom, date_naiss, adress, email, mdp, date_insc, numero) 
FROM 'bdd/clients.csv' WITH HEADER = true;

COPY jeux (id, nom, date_sortie, prix, stock, id_editor) 
FROM 'bdd/jeux.csv' WITH HEADER = true;

COPY genres (id, nom_complet, id_best_game, date_aparition) 
FROM 'bdd/genres.csv' WITH HEADER = true;

COPY editors (id, nom, date_creation, region) 
FROM 'bdd/editors.csv' WITH HEADER = true;

COPY consols (id, nom) 
FROM 'bdd/consols.csv' WITH HEADER = true;

COPY promotions (id, promotion) 
FROM 'bdd/promotions.csv' WITH HEADER = true;

COPY paniers (id, total, id_promotion, id_client, date_create, acheté, date_achat, paiment) 
FROM 'bdd/paniers.csv' WITH HEADER = true;

COPY choix (id, id_panier, id_jeu, unit) 
FROM 'bdd/choix.csv' WITH HEADER = true;

COPY jeu_genre (id_jeu, id_genre) 
FROM 'bdd/Jg.csv' WITH HEADER = true;

COPY jeu_console (id_jeu, id_consol) 
FROM 'bdd/Jc.csv' WITH HEADER = true;