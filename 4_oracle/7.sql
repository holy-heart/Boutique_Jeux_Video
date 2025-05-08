CREATE OR REPLACE PROCEDURE proc_update_stock(
    jeunn VARCHAR2, 
    delta NUMBER
)
AS
BEGIN
    UPDATE jeu SET stock = stock + delta WHERE jeu.nom = jeunn;
END;


BEGIN
    proc_update_stock('God of war', -30);
END;


SELECT * FROM jeu;