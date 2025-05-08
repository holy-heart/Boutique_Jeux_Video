

	create table client(
		id INT primary key,
		prenom VARCHAR(80),
		nom VARCHAR(80) NOT NULL,
		date_naiss DATE,
		adress VARCHAR(300),
		email VARCHAR(300),
		mpd VARCHAR(200),
		date_creation DATE,
		numero VARCHAR(80)
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
	    id_best_game INT
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
	    achete CHAR(1) check( achete in ('Y','N')),
	    date_achat DATE,
	    paiment VARCHAR(50) 
	);

	CREATE TABLE promotion (
	    id INT PRIMARY KEY,
	    promotion NUMERIC(3, 2) CHECK (promotion IN (0, 0.1, 0.25, 0.5, 0.75, 1.2))
	);


ALTER TABLE jeu_consol 
  ADD CONSTRAINT fk_jeu_consol_jeu FOREIGN KEY (id_jeu) REFERENCES jeu(id);

ALTER TABLE jeu_consol 
  ADD CONSTRAINT fk_jeu_consol_consol FOREIGN KEY (id_consol) REFERENCES consol(id);

ALTER TABLE jeu
  ADD CONSTRAINT fk_jeu_editor FOREIGN KEY (id_editor) REFERENCES editor(id);

ALTER TABLE jeu_genre 
  ADD CONSTRAINT fk_jeu_genre_jeu FOREIGN KEY (id_jeu) REFERENCES jeu(id);

ALTER TABLE jeu_genre 
  ADD CONSTRAINT fk_jeu_genre_genre FOREIGN KEY (id_genre) REFERENCES genre(id);

ALTER TABLE panier
  ADD CONSTRAINT fk_panier_promotion FOREIGN KEY (id_promotion) REFERENCES promotion(id);

ALTER TABLE panier
  ADD CONSTRAINT fk_panier_client FOREIGN KEY (id_client) REFERENCES client(id);

ALTER TABLE choix
  ADD CONSTRAINT fk_choix_panier FOREIGN KEY (id_panier) REFERENCES panier(id);

ALTER TABLE choix
  ADD CONSTRAINT fk_choix_jeu FOREIGN KEY (id_jeu) REFERENCES jeu(id);

ALTER TABLE genre
  ADD CONSTRAINT fk_genre_best_game FOREIGN KEY (id_best_game) REFERENCES jeu(id);

ALTER TABLE panier
  ADD CONSTRAINT chk_paiement_type CHECK (paiment IN ('cb', 'paypal', 'applepay', 'googlepay'));
