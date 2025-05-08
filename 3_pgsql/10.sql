create or replace procedure proc_augmenter_prix(pourcentage NUMERIC, seuil_age INT)
as $$
begin
	update jeu set prix = prix*pourcentage 
	where EXTRACT(year from age(CURRENT_DATE, date_sortie))>seuil_age;
end $$ LANGUAGE plpgsql;

call proc_augmenter_prix(1.25,25);

select * from jeu


