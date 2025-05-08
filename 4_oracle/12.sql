CREATE OR REPLACE PROCEDURE proc2(client_id NUMBER)
AS
    ct NUMBER := 1;
    CURSOR nom_achat IS 
        SELECT c.id id_c, p.achete achat 
        FROM client c 
        INNER JOIN panier p ON c.id = p.id_client 
        WHERE c.id = client_id;
BEGIN
    FOR ach IN nom_achat LOOP
        IF ach.achat = 0 THEN
            SELECT COUNT(*) INTO ct FROM panier WHERE ach.id_c = panier.id_client;
            DBMS_OUTPUT.PUT_LINE('Le client ' || ach.id_c || ' a encore ' || ct || ' panier(s).');
        END IF;
    END LOOP;
END;


BEGIN
    proc2(6);
END;


SELECT * FROM panier;