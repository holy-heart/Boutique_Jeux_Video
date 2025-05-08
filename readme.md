# Projet Base de Données Multisystèmes

Ce projet a pour but de modéliser, générer, manipuler et comparer une base de données multi-plateforme dans plusieurs SGBD (PostgreSQL, Oracle, Cassandra, Neo4j). Il se compose de 7 étapes principales décrites ci-dessous.

---

## 1. Conception de la base de données

L'objectif est de modéliser la structure relationnelle du projet en définissant les entités clés (Client, Jeu, Achat, Éditeur, Panier, Paiement, etc.), leurs relations, attributs, cardinalités et contraintes (clés primaires, étrangères, uniques, index).


---

## 2. Génération de données

Des scripts Python permettent de générer automatiquement les données :

- 1000 clients
- 100 jeux
- Un historique d’achats réaliste, incluant plusieurs achats par client

Chaque script Python génère un fichier CSV distinct, placé dans le dossier `2_generation_des_donnes`. Les bibliothèques utilisées incluent Faker, pandas et csv.

---

## 3. Développement sur PostgreSQL

- Création du schéma SQL via un script DDL
- Insertion des données via `psql`
- Écriture de 20 scripts en PL/pgSQL correspondant à différents cas d’usage :
  - Calcul du total des achats par client
  - Top des ventes
  - Ajout d’un jeu
  - Recommandations (requête récursive)
- Création de fonctions stockées, scalaires, d’agrégation
- Implémentation de triggers (ex. : mise à jour de stock après un achat)
- L’ensemble des scripts est dans le dossier `3_pgsql` :
  - Fichier `.sql` pour la création des tables
  - Fichiers `.sql` séparés pour les 20 cas d’usage
  - Documentation des cas d’usage dans `scripts.pdf`

---

## 4. Portage Oracle

- Conversion du schéma PostgreSQL en schéma Oracle
- Réécriture des fonctions, triggers et scripts en PL/SQL
- Importation des données (simplifiée grâce à Oracle Database XE)
- Test des 20 cas d’usage dans l’environnement Oracle

Les scripts adaptés sont stockés dans le dossier `4_oracle`.

---

## 5. Déploiement Cassandra

> (Section à compléter)

---

## 6. Benchmarking

- Sélection de 3 à 5 requêtes représentatives
- Utilisation d’un benchmark inspiré du TPC-C sur PostgreSQL et Oracle
- Mesure et comparaison des performances d’exécution des requêtes
- Résultats détaillés dans le fichier `6_Benchmark.pdf`

---

## 7. Conversion Neo4j

- Redéfinition du modèle relationnel en graphe (nœuds : Clients, Jeux, Achats)
- Import des données via CSV et Cypher
- Création des relations : `(Client)-[ACHÈTE]->(Jeu)`
- Écriture de 10 scripts Cypher pour interroger la base

Les scripts sont disponibles dans le dossier `7_neo4j`.

---

## Technologies utilisées

- PostgreSQL, Oracle Database XE, Apache Cassandra, Neo4j Desktop
- Python 3, Faker, pandas
- Draw.io (diagramme UML)
- SQL Developer, psql, cqlsh, Cypher

---

## Structure des dossiers


1_diagram.png

2_generation_des_donnes/        # Scripts Python et CSV

3_pgsql/                        # SQL PostgreSQL (DDL + scripts)

4_oracle/                       # Scripts Oracle

6_Benchmark.pdf

7_neo4j/                        # Scripts Cypher

## Auteur

Yacine FEZOUI, yacine.fezoui2002@gmail.com
