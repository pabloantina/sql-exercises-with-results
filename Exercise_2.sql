WITH table_total_vistas AS (
  SELECT 
    c1 as desafio_id, 
    SUM(c2) AS total_vistas, 
    SUM(c3) AS total_vistas_unicas
  FROM table_vistas_desafios
  GROUP BY c1),
  
table_total_desafios AS (
  SELECT 
    c1 as desafio_id, 
    SUM(c2) AS total_intentos, 
    SUM(c3) AS total_aceptados
  FROM table_resultados_de_desafios
  GROUP BY c1)

SELECT 
  anuncios.c1 AS anuncio_id,
  anuncios.c2 AS candidato_id,
  anuncios.c3 AS nombre,
  SUM(results.total_intentos) AS total_intentos,
  SUM(results.total_aceptados) AS total_aceptados,
  SUM(vistas.total_vistas) AS total_vistas,
  SUM(vistas.total_vistas_unicas) AS total_vistas_unicas

FROM table_anuncios AS anuncios 

JOIN table_university as university 
on anuncios.c1 = university.c2

JOIN table_desafios as desafios
ON university.c1 = desafios.c2

JOIN table_total_vistas AS vistas
ON desafios.c1 = vistas.desafio_id

JOIN table_total_desafios AS results
ON desafios.c1 = results.desafio_id

GROUP BY 
  anuncio_id,
  candidato_id,
  nombre
  
HAVING 
  SUM(results.total_intentos) > 0 AND
  SUM(results.total_aceptados) > 0 AND
  SUM(vistas.total_vistas) > 0 AND
  SUM(vistas.total_vistas_unicas) > 0