WITH examenes_totales AS (
SELECT
   fecha_examen,
   legajo,
   COUNT(legajo) AS cantidad_de_examenes
FROM table_examenes
GROUP BY 
   fecha_examen,
   legajo
ORDER BY
  fecha_examen ASC,
  legajo ASC,
  cantidad_de_examenes DESC),
  
ranking AS (
SELECT
  fecha_examen,
  legajo,
  cantidad_de_examenes,
  ROW_NUMBER() OVER (PARTITION BY fecha_examen ORDER BY cantidad_de_examenes DESC, legajo ASC) AS cantidad_filas_por_legajo
FROM examenes_totales
ORDER BY fecha_examen ASC)

SELECT
  fecha_examen,
  cantidad_de_examenes,
  ranking.legajo,
  nombre
FROM ranking 
JOIN table_participantes 
ON table_participantes.legajo = ranking.legajo
WHERE cantidad_filas_por_legajo = 1
ORDER BY ranking.fecha_examen
