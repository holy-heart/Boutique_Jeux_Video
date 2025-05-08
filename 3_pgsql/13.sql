create or replace procedure proc3()
as $$
declare
    c_region CURSOR for SELECT distinct(region) FROM editor;
    c_editors refcursor;
   	edit editor%rowtype; 
	c_jeux refcursor;
	jax jeu%rowtype;
begin
    for reg in c_region loop
        RAISE NOTICE 'La region : %', reg.region;
        open c_editors for
            SELECT *
            FROM editor ee
            WHERE ee.region = reg.region;
        loop
            fetch c_editors into edit;
            exit when not found;
            raise notice '	Lediteur : %', edit.nom;
			open c_jeux for 
				select *
				from jeu jj
				where jj.id_editor = edit.id;
			loop
				fetch c_jeux into jax;
				exit when not found;
				raise notice '		le jeu : %', jax.id;
			end loop;
			close c_jeux;
        end loop;
        
        close c_editors;
    end loop;
end $$ LANGUAGE plpgsql;



call proc3();

select * from panier
