CREATE OR REPLACE FUNCTION ftrigger2()
RETURN TRIGGER AS
    em NUMBER;
BEGIN
    IF INSERTING THEN
        SELECT j.prix INTO em FROM jeu j WHERE :NEW.id_jeu = j.id;  
        UPDATE panier SET total = (:NEW.unit * em) + total WHERE id = :NEW.id_panier;
    ELSIF UPDATING THEN
        IF :NEW.unit <> :OLD.unit THEN
            SELECT j.prix INTO em FROM jeu j WHERE :NEW.id_jeu = j.id;  
            UPDATE panier SET total = (:NEW.unit*em - :OLD.unit*em) + total WHERE id = :NEW.id_panier;    
        END IF;
    END IF;
    RETURN :NEW;
END;
/

CREATE TRIGGER trigger2
AFTER INSERT OR UPDATE ON choix
FOR EACH ROW
BEGIN
    ftrigger2();
END;


INSERT INTO choix (id, id_panier, id_jeu, unit) 
VALUES (1005, 1, 44, 4); 

SELECT * FROM panier;