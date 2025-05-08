create or replace procedure proc()
as $$
declare
    c_genre CURSOR for SELECT * FROM genre;
    c_jeux refcursor;
    jeu jeu%rowtype; 
begin
    for ids in c_genre loop
        RAISE NOTICE 'Le genre : %', ids.nom_complet;
        open c_jeux for
            SELECT jj.id, jj.nom
            FROM jeu jj
            inner join jeu_genre jg on jg.id_jeu = jj.id
            WHERE jj.stock > 500 and jg.id_genre = ids.id;
        loop
            fetch c_jeux into jeu;
            exit when not found;
            raise notice 'Le jeu : %', jeu.nom;
        end loop;
        
        close c_jeux;
    end loop;
end $$ LANGUAGE plpgsql;



call proc();

select * from panier
