-- Vérifie si Cassandra fonctionne
--  nodetool status

-- Lancer l'interface pour les requêtes
-- cqlsh

-- Modifier la config (sudo nano ou vim)
-- sudo nano /etc/cassandra/cassandra.yaml

-- Redémarrer Cassandra
--  sudo systemctl restart cassandra




-- 1. Total des achats d’un client (id_client = 1)
SELECT id, total, acheté FROM paniers WHERE id_client = 1 ALLOW FILTERING;


-- 3. Top 5 des jeux les plus vendus (approximation via nombre de choix)
SELECT id_jeu, COUNT(*) AS nb_ventes FROM choix GROUP BY id_jeu LIMIT 5;
-- Cassandra ne supporte pas vraiment GROUP BY globalement, donc cette requête peut être indicative.


-- 4. Nom complet du client (id = 1)
SELECT prenom, nom FROM clients WHERE id = 1;


-- 12. Paniers non achetés du client 1
SELECT id, total, date_create FROM paniers WHERE id_client = 1 AND acheté = false ALLOW FILTERING;


-- 17. Vérification du stock d’un jeu après ajout (jeu id = 10)
SELECT id, nom, stock FROM jeux WHERE id = 10;
