WITH table_total_vistas AS (
  SELECT 
    desafio_id, 
    SUM(total_vistas) AS total_vistas, 
    SUM(total_vistas_unicas) AS total_vistas_unicas
  FROM table_vistas_desafios
  GROUP BY desafio_id),
  
table_total_desafios AS (
  SELECT 
    desafio_id, 
    SUM(total_intentos) AS total_intentos, 
    SUM(total_aceptados) AS total_aceptados
  FROM table_resultados_desafios
  GROUP BY desafio_id)

SELECT 
  anuncios.anuncio_id,
  anuncios.candidato_id,
  anuncios.nombre,
  SUM(results.total_intentos) AS total_intentos,
  SUM(results.total_aceptados) AS total_aceptados,
  SUM(vistas.total_vistas) AS total_vistas,
  SUM(vistas.total_vistas_unicas) AS total_vistas_unicas

FROM table_anuncios AS anuncios 

JOIN table_universidad as universidad 
on anuncios.anuncio_id = universidad.anuncio_id

JOIN table_desafios as desafios
ON universidad.universidad_id = desafios.universidad_id

JOIN table_total_vistas AS vistas
ON desafios.desafio_id = vistas.desafio_id

JOIN table_total_desafios AS results
ON desafios.desafio_id = results.desafio_id

GROUP BY 
  anuncios.anuncio_id,
  anuncios.candidato_id,
  anuncios.nombre
  
HAVING 
  SUM(results.total_intentos) > 0 AND
  SUM(results.total_aceptados) > 0 AND
  SUM(vistas.total_vistas) > 0 AND
  SUM(vistas.total_vistas_unicas) > 0
