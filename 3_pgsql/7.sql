create or replace procedure proc_update_stock(jeunn text, delta INT)
as $$

begin
 	update jeu set stock = stock + delta where jeu.nom = jeunn;
end $$ LANGUAGE plpgsql;

call proc_update_stock('God of war', -30 );

select * from jeu	