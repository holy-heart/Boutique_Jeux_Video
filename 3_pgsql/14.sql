create or replace procedure proc_ajouter_jeu2(nom TEXT, date_sortie DATE, prix NUMERIC, stock INT, editornn text)
as $$
declare
	edit_id numeric :=0;
	jeu_id int :=1;
begin
	select e.id into edit_id from editor e where editornn = e.nom;
	select max(id)+1 into jeu_id from jeu;
 	insert into jeu(id, nom, date_sortie, prix, stock, id_editor) values (jeu_id , nom, date_sortie, prix, stock, edit_id);
EXCEPTION
	when check_violation then
		raise notice 'une valeurs est erroné';
end $$ LANGUAGE plpgsql;

call proc_ajouter_jeu2('assasins', '2007-07-19', 59.99, -50, 'Reynolds PLC');

select * from jeu

ALTER TABLE jeu ADD CONSTRAINT jeu_prix_check CHECK (prix >= 0);
ALTER TABLE jeu ADD CONSTRAINT jeu_stock_check CHECK (stock >= 0);