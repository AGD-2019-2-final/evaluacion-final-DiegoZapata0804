-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Cuente la cantidad de personas nacidas por año.
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

a = FOREACH u GENERATE FLATTEN(STRSPLIT($3,'-',0));
b = FOREACH a GENERATE $0 AS year;
c = GROUP b BY year;
d = FOREACH c GENERATE group , COUNT(b);

STORE d INTO 'output' USING PigStorage(',');

--fs -get output/;