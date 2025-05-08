create or replace function fn_nom_complet(client_id INT)
returns text as $$
declare 
	NP varchar :='cette personne n"existe pas';
begin
	select prenom || ', ' || nom into NP
	from client
	where id=client_id;

	return NP;
end $$ LANGUAGE plpgsql;

SELECT COALESCE(fn_nom_complet(1000000), 'cette personne n"existe pas');


select * from client