create or replace function agg_ca_mensuel(anmoi DATE)
returns numeric as $$
declare 
	M varchar :=to_char(anmoi, 'MM');
	Y varchar :=to_char(anmoi, 'YYYY');
	T numeric :=0;
begin
	select sum(total) into T
	from panier
	where M=to_char(date_achat, 'MM') and Y=to_char(date_achat, 'YYYY') and  achete = True;

	return T;
end $$ LANGUAGE plpgsql;

SELECT COALESCE(agg_ca_mensuel('2025-03-20'), 0);


select * from panier