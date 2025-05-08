CREATE OR REPLACE FUNCTION ftrigger4()
RETURN TRIGGER AS
    un INT;
    id_panier INT;
BEGIN
    IF :NEW.prix <> :OLD.prix THEN
        SELECT c.unit, c.id_panier INTO un, id_panier FROM choix c WHERE c.id_jeu = :NEW.id;
        UPDATE panier SET total = total + (:NEW.prix - :OLD.prix)*un WHERE panier.id = id_panier;
    END IF;
    RETURN :NEW;
END;

CREATE TRIGGER trigger4
AFTER UPDATE ON jeu
FOR EACH ROW
BEGIN
    ftrigger4();
END;


SELECT * FROM panier WHERE id = 9;
SELECT * FROM choix WHERE id_panier = 9;
SELECT * FROM jeu WHERE id = 70;

UPDATE jeu SET prix = 1000 WHERE id = 70;