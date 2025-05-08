create or replace function ftrigger4()
returns trigger  as $$
declare
	un int;
	id_panier int;
begin 
	if new.prix <> old.prix then
		select c.unit, c.id_panier into un, id_panier from choix c where c.id_jeu = new.id;
		update panier set total = total + (new.prix - old.prix)*un where panier.id = id_panier;
	end if;
	return new;
end; $$ LANGUAGE plpgsql;

create trigger trigger4
after update on jeu
for each row
execute function ftrigger4();

select * from panier where id = 9; -- 880.53            0.5
select * from choix where id_panier = 9; -- 70 * 2
select * from jeu where id = 70; -- 880.53

update jeu set prix = 1000 where id = 70;