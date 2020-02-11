-- 
-- Pregunta
-- ===========================================================================
--
-- Para resolver esta pregunta use el archivo `data.tsv`.
--
-- Compute la cantidad de registros por cada letra de la columna 1.
-- Escriba el resultado ordenado por letra. 
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

DROP TABLE IF EXISTS data;
DROP TABLE IF EXISTS tabla1;

CREATE TABLE data (
    c1 STRING,
    c2 STRING,
    c3 INT)
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n';

LOAD DATA LOCAL INPATH 'data.tsv' INTO TABLE data;

CREATE TABLE tabla1
AS 
    SELECT letra, count(1) AS count
    FROM
        (SELECT c1 AS letra FROM data) w   
GROUP BY
    letra
ORDER BY
    letra;

INSERT OVERWRITE DIRECTORY '/tmp/output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT * FROM tabla1;

!hdfs dfs -copyToLocal /tmp/output output;