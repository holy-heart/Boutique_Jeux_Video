-- Machine initial (seed node)
-- apres avoir modifer cassandra.yaml : 
-- -- seeds: "192.168.1.1" 
-- -- listen_address: <ip_de_la_vm>
-- -- rpc_address: 0.0.0.0
-- -- broadcast_address: <ip_de_la_vm>
-- -- broadcast_rpc_address: <ip_de_la_vm>
-- -- 



-- Création keyspace (equivaut BDD)
CREATE KEYSPACE IF NOT EXISTS jeux_video
WITH replication = {
  'class': 'SimpleStrategy',
  'replication_factor': 3
};

-- Utilisation du keyspace
USE jeux_video;

CREATE TABLE IF NOT EXISTS clients (
  id int PRIMARY KEY,
  prenom text,
  nom text,
  date_naiss text,
  adress text,
  email text,
  mdp text,
  date_insc text,
  numero text
);

CREATE TABLE IF NOT EXISTS jeux (
  id int PRIMARY KEY,
  nom text,
  date_sortie text,
  prix decimal,
  stock int,
  id_editor int
);

-- Table : genres
CREATE TABLE IF NOT EXISTS genres (
  id int PRIMARY KEY,
  nom_complet text,
  id_best_game int,
  date_aparition text
);

CREATE TABLE IF NOT EXISTS editors (
  id int PRIMARY KEY,
  nom text,
  date_creation text,
  region text
);

CREATE TABLE IF NOT EXISTS consols (
  id int PRIMARY KEY,
  nom text
);

CREATE TABLE IF NOT EXISTS promotions (
  id int PRIMARY KEY,
  promotion float
);

CREATE TABLE IF NOT EXISTS paniers (
  id int PRIMARY KEY,
  total decimal,
  id_promotion int,
  id_client int,
  date_create text,
  acheté boolean,
  date_achat text,
  paiment text
);

-- Table : choix (association panier-jeu)
CREATE TABLE IF NOT EXISTS choix (
  id int,
  id_panier int,
  id_jeu int,
  unit int,
  PRIMARY KEY (id_panier, id) -- Panier comme partition key, id comme clustering key
);

-- Table : Jg (association jeu-genre)
CREATE TABLE IF NOT EXISTS jeu_genre (
  id_jeu int,
  id_genre int,
  PRIMARY KEY (id_jeu, id_genre)
);

-- Table : Jc (association jeu-console)
CREATE TABLE IF NOT EXISTS jeu_console (
  id_jeu int,
  id_consol int,
  PRIMARY KEY (id_jeu, id_consol)
);