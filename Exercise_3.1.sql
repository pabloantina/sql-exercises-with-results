/*Primer consulta, referida a:  'participantes únicos que realizaron al menos 1 un examen en cada día (a partir del primer día del concurso)' */


WITH contabilziacion_fechas_unicas AS (
   SELECT
     COUNT(DISTINCT fecha_examen) AS cantidad_de_dias_unicos
   FROM table_examenes),

legajos_por_dia AS (
   SELECT
     legajo,
     COUNT(DISTINCT fecha_examen) AS cantidad_dias_rendido
   FROM table_examenes
   GROUP BY 
     legajo)
     
SELECT
ld.legajo
FROM legajos_por_dia AS ld
JOIN contabilziacion_fechas_unicas AS cfu
ON ld.cantidad_dias_rendido = cfu.cantidad_de_dias_unicos
