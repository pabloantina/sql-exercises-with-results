# Resumen Ejecutivo: Análisis de Contenido de Netflix


## Introducción y Objetivo del Proyecto

Este proyecto tiene como objetivo principal realizar un análisis del catálogo de contenido de peiculas y series de Netflix. A través de la manipulación y visualización de datos, buscamos identificar patrones acerca de la duración de películas 
y de la cantidad de temporadas que tienen las series-tv shows, también evaluamos las categorias a las que pertenecen las peliculas y series y realizamos un análsis del contenido que se encuentra en la plataforma a partir de su año de lanzamiento.

[modelo de datos en estrella](sql/modelo_estrella_estandarizado.sql).
## Componentes Clave del Repositorio

Nuestro repositorio de GitHub se estructura para ofrecer una visión completa del proceso de análisis de datos:

* **`sql/` (Scripts SQL):** Contiene los scripts SQL utilizados para la creación y el procesamiento de la base de datos en PostgreSQL, mediante tablas relacionales y un script destinado a ser utilizado como fuente posterior del dashboard realizado en Looker Studio.
* Como asi también se podra visualizar el modelo estrella creado, el cúal tiene como fin ser utilizado para consultas analíticas. A su vez, se podrá visualizar pequeños códigos creados para responder a ejercicios solicitados y consultas específicas.
* **`netflix_analysis.ipynb` (Código de Python):** Un script de Python desarrollado en Google Colab dedicado al filtrado, procesamiento y generación de gráficos con el fin de clarificar los datos y obtener insights referidos a evolución del contenido a lo largo del tiempo y Outliers.
[Abrir Notebook de Análisis en Google Colab](https://colab.research.google.com/drive/1GZ_hteDzXQfPQ6bIjg5XAKuivhGxQvjV?usp=sharing)

## Metodología General

El proyecto siguió un enfoque de análisis de datos estructurado, partiendo desde la correción de erróres de formato y carga de los datos provenientes de la base de datos de Kaggle, 
pasando por su organización en un modelo de datos relacional para desagregar la información de por ejemplo las variables de pais, actores y categoria, entre otros.


## Insights Clave y Hallazgos Principales

Tras el análisis, se han identificado varios puntos destacados:

* **Presencia de erróres en la base de datos:** Se encontro erróres de carga y columnas con datos mezclados que respondian a otra columna. Las columnas de country, listed_in, director	y cast se encontraban en cadena de texto separadas por coma.
* Se realizaron bases relacionales con el objetivo de desagreagr dichas columnas teniendo para un show_id todos los valores referidos a cada una de esas columnas. Se encontro erróres tipográficos en la columna de duration puesto que habia valores en plural
* y singular para 'Season', como asi también se mencionaba valores del tipo tiempo, por lo que se desagrego dicha columna en dos duration_int y	duration_type de manera de poder realizar una correcta contabilización por duración de tiempo o cantidad de temporadas.
*
* **Duración de Películas:** La duración promedio de las películas en Netflix se sitúa alrededor de 90 minutos. Se observa una concentración significativa de películas en el rango de [90 a 100] minutos, con algunas películas outliers excepcionalmente largas o cortas.
* Como por ejemplo la película más larga fue Black Mirror: Bandersnatch (312 min)
*
* **Distribución de Temporadas en Series:** La gran mayoría de las series en Netflix se desarrollan en [1 o 2] temporadas. Hay algunos casos atipicos representados en la cola larga del Boxplot creado en Python, el cual refiere  a serires con un mayor número de temporadas, pero son menos frecuentes.
* Como por ejemplo la serie Grace Anatomy con 17 temporadas.
* 
* **Tendencias de Lanzamiento:**
* Se realizo un gráfico destinado a analizar la tendencia temporal para peliculas en el mismo se puede apreciar una gran variabilidad en la duración promedio de las películas sobre todo en el tramo que abarca la decada 40-70.
* En el periodo de la decada 70-90 se observa una varabilidad mas acotada que va de una duracion de las peliculas de 150 a 100 minutos promedio. Luego se visualiza una cierta estabilidad y una ligera tendencia bajista en la decada de los 90-20 alrededor de los 110-120 minutos promedio.
* Conclusión: La duración promedio de las películas ha experimentado fluctuaciones significativas a lo largo de su historia, con un pico en los años 60 y una caida en la duracion posterior a este. Por ultimo, se debe tener en cuenta de no caer en un sesgo por la falta de datos de las primeras 4 decadas.

* También se realizo un analisis de la tendencia temporal para series pudiendo observar que hay una gran variabilidad entre la decada del 60-80, ya que hay presencia de picos que aluden a series con cantidad de temporadas superior a 4. A partir de mediados
* de la decada de los 90 se puede visualizar una tendencia general a la baja en la cantidad de temporadas. Especialmente después de 2010, la línea muestra una tendencia a establecerse en un promedio muy bajo, casi siempre por debajo de las 2 temporadas, con algunas pequeñas fluctuaciones.
* Esto último es coherente con el auge de las miniseries o las series de unica temporada en los ultimos años.

* **Contenido por Tipo:** Del total de datos pudimos concluir que hay 6132 peliculas que representan [69.6]% del catálogo y hay 2677 series que representan [30.38]% del catalogo, lo que indica una relación de [3/1] de peliculas por sobre las series.


## Dashboard Interactivo (Looker Studio)

Para una exploración visual interactiva de estos insights y otros detalles del catálogo de Netflix como por ejemplo concentración de titulos por pais, categorias y evolución del contenido a lo largo del tiempo, se comparte el siguiente dashboard realizado en Looker Studio:

[Acceder al Dashboard de Análisis (Looker Studio)](https://lookerstudio.google.com/reporting/0d580124-7616-462e-8409-c1bec239f7c7)

## Conclusión

Este proyecto proporciona una visión integral de la composición del catalogo y de las tendencias del contenido de Netflix, incoporando nuevas variables táles como cantidad de visualizaciones por titulos y costo de producción
e ingresos alcanzados se podria profundizar acerca de proyecciones y toma de decisiones estratégicas sobre inversiones del futuro catalogo de Netflix.

---
**Autor:** [Pablo Leonel Antinarelli]
**Fecha de entrega:** [10 de junio de 2025]
