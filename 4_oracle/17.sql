CREATE OR REPLACE FUNCTION ftrigger3()
RETURN TRIGGER AS
un INT;
jeu_id INT;
BEGIN
IF :NEW.achete = 1 AND :OLD.achete = 0 THEN
SELECT c.unit, j.id INTO un, jeu_id FROM choix c INNER JOIN jeu j ON j.id = c.id_jeu WHERE c.id_panier = :NEW.id;
UPDATE jeu SET stock = stock-un WHERE id = jeu_id;
END IF;
RETURN :NEW;
END;


CREATE TRIGGER trigger3
AFTER UPDATE ON panier
FOR EACH ROW
BEGIN
ftrigger3();
END;


SELECT * FROM panier WHERE id = 6;
SELECT * FROM choix WHERE id_panier = 6;
SELECT * FROM jeu WHERE id = 5;

UPDATE panier SET achete = 1 WHERE id = 6;

SELECT * FROM panier WHERE id = 6;
SELECT * FROM choix WHERE id_panier = 6;
SELECT * FROM jeu WHERE id = 5;