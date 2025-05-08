create or replace procedure proc2(client_id int)
as $$
declare
	ct int :=1;
	nom_achat cursor for select c.id id_c, p.achete achat from client c inner join panier p on c.id = p.id_client 
	where c.id = client_id;
	
begin
	for ach in nom_achat loop
		if ach.achat = False then
			select count(*) into ct from panier WHERE ach.id_c = panier.id_client;
			raise notice 'Le client % a encore % panier(s).', ach.id_c, ct;
		end if;
	end loop;
end $$ LANGUAGE plpgsql;

call proc2(6);
select * from panier





