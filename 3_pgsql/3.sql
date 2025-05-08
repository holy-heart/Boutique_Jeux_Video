create or replace function fn_top_vente()
returns Table(idjeu int, vendu bigint) as $$
begin
	return query
	select c.id_jeu idjeu, sum(c.unit) vendu
	from choix c
	group by idjeu
	order by vendu desc 
	limit 5; --fetch first 5 rows only

end $$ LANGUAGE plpgsql;

SELECT * from fn_top_vente();



