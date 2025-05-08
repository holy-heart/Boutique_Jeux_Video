CREATE OR REPLACE PROCEDURE proc_valider_panier(
    panier_id NUMBER,
    mode_paiement VARCHAR2
)
AS
    CURSOR ids_jeux IS 
        SELECT c.id id, c.unit unit, j.stock
        FROM choix c 
        INNER JOIN panier p ON p.id = c.id_panier 
        INNER JOIN jeu j ON j.id = c.id_jeu 
        WHERE p.id = panier_id;
BEGIN
    FOR ids IN ids_jeux LOOP
        IF ids.stock < ids.unit THEN
            RAISE_APPLICATION_ERROR(-20001, 'desolé mais il faut revoir le panier');
        END IF;
    END LOOP;
    
    UPDATE panier SET achete = 1 WHERE panier.id = panier_id;
    UPDATE panier SET date_achat = SYSDATE WHERE panier.id = panier_id;
    UPDATE panier SET paiment = mode_paiement WHERE panier.id = panier_id;
END;
 
BEGIN
    proc_valider_panier(7, 'cb');
END;
 
SELECT * FROM panier;