CREATE OR REPLACE PROCEDURE proc3
AS
    CURSOR c_region IS SELECT DISTINCT(region) FROM editor;
    c_editors SYS_REFCURSOR;
    edit editor%ROWTYPE; 
    c_jeux SYS_REFCURSOR;
    jax jeu%ROWTYPE;
BEGIN
    FOR reg IN c_region LOOP
        DBMS_OUTPUT.PUT_LINE('La region : ' || reg.region);
        OPEN c_editors FOR
            SELECT *
            FROM editor ee
            WHERE ee.region = reg.region;
        LOOP
            FETCH c_editors INTO edit;
            EXIT WHEN c_editors%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE('    Lediteur : ' || edit.nom);
            OPEN c_jeux FOR 
                SELECT *
                FROM jeu jj
                WHERE jj.id_editor = edit.id;
            LOOP
                FETCH c_jeux INTO jax;
                EXIT WHEN c_jeux%NOTFOUND;
                DBMS_OUTPUT.PUT_LINE('        le jeu : ' || jax.id);
            END LOOP;
            CLOSE c_jeux;
        END LOOP;
        
        CLOSE c_editors;
    END LOOP;
END;
BEGIN
    proc3;
END;

SELECT * FROM panier;