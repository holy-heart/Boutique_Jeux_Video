CREATE OR REPLACE PROCEDURE proc_ajouter_jeu2(
    nom TEXT, 
    date_sortie DATE, 
    prix NUMERIC, 
    stock INT, 
    editornn TEXT
)
AS
    edit_id NUMERIC := 0;
    jeu_id INT := 1;
BEGIN
    SELECT e.id INTO edit_id FROM editor e WHERE editornn = e.nom;
    SELECT MAX(id)+1 INTO jeu_id FROM jeu;
    INSERT INTO jeu(id, nom, date_sortie, prix, stock, id_editor) 
    VALUES (jeu_id, nom, date_sortie, prix, stock, edit_id);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('une valeurs est erroné');
END;

BEGIN
    proc_ajouter_jeu2('assasins', TO_DATE('2007-07-19', 'YYYY-MM-DD'), 59.99, -50, 'Reynolds PLC');
END;

SELECT * FROM jeu;

ALTER TABLE jeu ADD CONSTRAINT jeu_prix_check CHECK (prix >= 0);
ALTER TABLE jeu ADD CONSTRAINT jeu_stock_check CHECK (stock >= 0);