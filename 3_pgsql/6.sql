create or replace procedure proc_ajouter_jeu(nom TEXT, date_sortie DATE, prix NUMERIC, stock INT, editornn text)
as $$
declare
	edit_id numeric :=0;
	jeu_id int :=1;
begin
	select e.id into edit_id from editor e where editornn = e.nom;
	select max(id)+1 into jeu_id from jeu;
 	insert into jeu(id, nom, date_sortie, prix, stock, id_editor) values (jeu_id , nom, date_sortie, prix, stock, edit_id);
end $$ LANGUAGE plpgsql;

call proc_ajouter_jeu('God of war', '2006-04-11', 59.99, 2000, 'Hudson, Macias and Brown');

select * from jeu


