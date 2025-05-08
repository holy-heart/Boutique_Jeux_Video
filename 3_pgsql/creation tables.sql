-- Database: Boutique Jeux Video

-- DROP DATABASE IF EXISTS "Boutique Jeux Video";

CREATE DATABASE "Boutique Jeux Video"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'fr-FR'
    LC_CTYPE = 'fr-FR'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;





	-- creation des tables


	create table client(
		id INT primary key,
		prenom VARCHAR(30),
		nom VARCHAR(30) NOT NULL,
		date_naiss DATE,
		adress VARCHAR(30),
		email VARCHAR(100) UNIQUE,
		mpd VARCHAR(100),
		date_creation DATE,
		numero VARCHAR(30)
	);

	CREATE TABLE choix (
	    id INT PRIMARY KEY,
	    id_panier INT,
	    id_jeu INT,
	    unit INT CHECK (unit > 0)
	);
	
	CREATE TABLE consol (
	    id INT PRIMARY KEY,
	    nom VARCHAR(50) CHECK (
	        nom IN (
	            'Xbox one','PC','Playstation 1','Playstation 2','Playstation 3','Playstation 4','Xbox 360'
	        )
	    )
	);

	CREATE TABLE editor (
	    id INT PRIMARY KEY,
	    nom VARCHAR(100),
	    date_creation DATE,
	    region VARCHAR(50) CHECK (
	        region IN ('USA', 'UK', 'France', 'Canada', 'China')
	    )
	);

	
	CREATE TABLE genre (
	    id INT PRIMARY KEY,
	    nom_complet VARCHAR(50) CHECK (
	        nom_complet IN (
	            'Action',
	            'Aventure',
	            'RPG',
	            'Strategie',
	            'Simulation',
	            'Sport',
	            'Course',
	            'FPS',
	            'Puzzle',
	            'Horreur',
	            'Plateforme',
	            'MMO'
	        )
	    ),
	    id_best_game INT,
	    date_aparition DATE
	);


	CREATE TABLE jeu_consol (
	    id_jeu INT,
	    id_consol INT,
	    PRIMARY KEY (id_jeu, id_consol)
	);

	CREATE TABLE jeu (
	    id INT PRIMARY KEY,
	    nom VARCHAR(100),
	    date_sortie DATE,
	    prix NUMERIC(8, 2),
	    stock INT,
	    id_editor INT
	);


	CREATE TABLE jeu_genre (
	    id_jeu INT,
	    id_genre INT,
	    PRIMARY KEY (id_jeu, id_genre)
	);

	CREATE TABLE panier (
	    id INT PRIMARY KEY,
	    total NUMERIC(8, 2),
	    id_promotion INT,
		id_client INT,
	    date_create DATE,
	    achete BOOLEAN,
	    date_achat DATE,
	    paiment VARCHAR(50) 
	);

	CREATE TABLE promotion (
	    id INT PRIMARY KEY,
	    promotion NUMERIC(3, 2) CHECK (promotion IN (0, 0.1, 0.25, 0.5, 0.75, 1.2))
	);


	alter table jeu_consol 
	add constraint pk foreign key (id_jeu) REFERENCES jeu(id),
	add	constraint pk2 foreign key (id_consol) REFERENCES consol(id);

	
	alter table jeu
	add constraint pk foreign key (id_editor) REFERENCES editor(id);


	alter table jeu_genre 
	add constraint pk foreign key (id_jeu) REFERENCES jeu(id),
	add	constraint pk2 foreign key (id_genre) REFERENCES genre(id);

	alter table panier
	add constraint pk foreign key (id_promotion) REFERENCES promotion(id),
	add constraint pk2 foreign key (id_client) REFERENCES client(id);

	alter table choix
	add constraint pk foreign key (id_panier) references panier(id),
	add constraint pk2 foreign key (id_jeu) references jeu(id);

	alter table genre
	add constraint pk2 foreign key (id_best_game) references jeu(id);

	alter table panier
	add constraint checking check (paiment in ('cb', 'paypal', 'applepay', 'googlepay'));

	


ALTER TABLE client ALTER COLUMN prenom TYPE VARCHAR(80);
ALTER TABLE client ALTER COLUMN nom TYPE VARCHAR(80);
ALTER TABLE client ALTER COLUMN adress TYPE VARCHAR(80);
ALTER TABLE client ALTER COLUMN email TYPE VARCHAR(150);
ALTER TABLE client ALTER COLUMN mpd TYPE VARCHAR(150);
ALTER TABLE client ALTER COLUMN numero TYPE VARCHAR(80);

ALTER TABLE client DROP CONSTRAINT client_email_key;

alter table genre drop constraint genre_nom_complet_check;
alter table genre add constraint gen check (
	        nom_complet IN (
	            'Action',
	            'Aventure',
	            'RPG',
	            'Strategie',
	            'Simulation',
	            'Sport',
	            'Course',
	            'FPS',
	            'Puzzle',
	            'Horreur',
	            'Plateforme',
	            'MMO'
	        )
	    )

-- "CHECK (((paiment)::text = ANY ((ARRAY['cb'::character varying, 'paypal'::character varying, 'applepay'::character varying, 'googlepay'::character varying])::text[])))"