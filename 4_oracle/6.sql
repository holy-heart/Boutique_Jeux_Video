CREATE OR REPLACE PROCEDURE proc_ajouter_jeu(
    nom VARCHAR2, 
    date_sortie DATE, 
    prix NUMBER, 
    stock NUMBER, 
    editornn VARCHAR2
)
AS
    edit_id NUMBER := 0;
    jeu_id NUMBER := 1;
BEGIN
    SELECT e.id INTO edit_id FROM editor e WHERE editornn = e.nom;
    SELECT MAX(id)+1 INTO jeu_id FROM jeu;
    INSERT INTO jeu(id, nom, date_sortie, prix, stock, id_editor) 
    VALUES (jeu_id, nom, date_sortie, prix, stock, edit_id);
END;

BEGIN
    proc_ajouter_jeu('God of war', TO_DATE('2006-04-11', 'YYYY-MM-DD'), 59.99, 2000, 'Hudson, Macias and Brown');
END;


SELECT * FROM jeu;