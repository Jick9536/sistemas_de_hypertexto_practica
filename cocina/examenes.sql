-- ********* CONSULTA *********
-- Mostrar los datos de los articulos (art, titulo, revista, vol, nº, año, nombre de autores 
-- y nombre de autores que referencian), que referencian a articulos escritos por Luis:


SELECT art, titulo, revista, volumen, num, anio, aut.nombre
FROM   autor_objtab aut,articulo_objtab a, TABLE(a.referencias) t,TABLE(a.autores) tt,(TABLE( SELECT au.escribe
	   	                 FROM   autor_objtab au
                                 WHERE  au.nombre = 'Fred' ) w)
WHERE  t.COLUMN_VALUE=w.COLUMN_VALUE and aut.cod = tt.COLUMN_VALUE;

-- ********* CONSULTA *********
-- Mostrar los datos de los articulos (art, titulo, revista, vol, num, anio, nombre autores
-- y titulo articulos que referencia) financiados por el contrato 1
select a.art, a.titulo, a.revista, a.volumen, a.num, a.anio, aut.nombre, a2.titulo from articulo_objtab a, articulo_objtab a2 ,TABLE(a.autores) tt,TABLE(a.referencias) t2, autor_objtab aut ,(   
    SELECT art, titulo
    FROM   articulo_objtab a
    WHERE  TREAT (VALUE(a) AS articulo_interno).contrato_ref.cod = 1) w
where a.art = w.art and aut.cod = tt.COLUMN_VALUE and a2.art = t2.coLUMN_VALUE;

