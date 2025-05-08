CREATE OR REPLACE FUNCTION fn_nom_complet(client_id INT)
RETURN VARCHAR2 IS
    NP VARCHAR2(100) := 'cette personne n"existe pas';
BEGIN
    SELECT prenom || ', ' || nom INTO NP
    FROM client
    WHERE id = client_id;

    RETURN NP;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NP;
END;
/

SELECT NVL(fn_nom_complet(1000000), 'cette personne n"existe pas') FROM DUAL;

select * from client;