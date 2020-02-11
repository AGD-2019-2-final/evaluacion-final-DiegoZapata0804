--
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el código equivalente a la siguiente consulta SQL.
-- 
--    SELECT 
--        firstname,
--        color
--    FROM 
--        u 
--    WHERE color = 'blue' AND firstname LIKE 'Z%';
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
-- 
u = LOAD 'data.csv' USING PigStorage(',') 
    AS (id:int, 
        firstname:CHARARRAY, 
        surname:CHARARRAY, 
        birthday:CHARARRAY, 
        color:CHARARRAY, 
        quantity:INT);
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
--fs -rm data.csv;
--fs -put data.csv;

y = FILTER u BY $4 == 'blue' AND SUBSTRING($1,0,1) == 'Z';
z = FOREACH y GENERATE $1,$4;

STORE z INTO 'output';

--fs -get output/ ;