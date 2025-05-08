CREATE OR REPLACE PROCEDURE proc_appliquer_promo(
    client_id NUMBER,
    promo_id NUMBER
)
AS
    promo NUMBER := 1;
    CURSOR ids_paniers IS SELECT id FROM panier p WHERE p.id_client = client_id;
BEGIN
    SELECT promotion INTO promo FROM promotion WHERE id = promo_id;
    
    FOR ids IN ids_paniers LOOP
        UPDATE panier SET total = total * promo WHERE panier.id = ids.id;
    END LOOP;
END;
BEGIN
    proc_appliquer_promo(4, 3);
END;


SELECT * FROM panier;