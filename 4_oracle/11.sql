CREATE OR REPLACE PROCEDURE proc
AS
    CURSOR c_genre IS SELECT * FROM genre;
    c_jeux SYS_REFCURSOR;
    jeu jeu%ROWTYPE;
BEGIN
    FOR ids IN c_genre LOOP
        DBMS_OUTPUT.PUT_LINE('Le genre : ' || ids.nom_complet);
        OPEN c_jeux FOR
            SELECT jj.id, jj.nom
            FROM jeu jj
            INNER JOIN jeu_genre jg ON jg.id_jeu = jj.id
            WHERE jj.stock > 500 AND jg.id_genre = ids.id;
        LOOP
            FETCH c_jeux INTO jeu;
            EXIT WHEN c_jeux%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE('Le jeu : ' || jeu.nom);
        END LOOP;
        
        CLOSE c_jeux;
    END LOOP;
END;


BEGIN
    proc;
END;

SELECT * FROM panier;