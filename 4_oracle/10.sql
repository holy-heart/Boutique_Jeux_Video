CREATE OR REPLACE PROCEDURE proc_augmenter_prix(
    pourcentage NUMBER,
    seuil_age NUMBER
)
AS
BEGIN
    UPDATE jeu SET prix = prix * pourcentage 
    WHERE EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM date_sortie) > seuil_age;
END;

BEGIN
    proc_augmenter_prix(1.25, 25);
END;

SELECT * FROM jeu;