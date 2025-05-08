create or replace function fn_total_achats(client_id INT)
returns numeric as $$
declare 
	T numeric :=0;
begin
	select sum(total) into T
	from panier
	where id = client_id and  achete = True;

	return T;
end $$ LANGUAGE plpgsql;

SELECT COALESCE(fn_total_achats(1), 0);
