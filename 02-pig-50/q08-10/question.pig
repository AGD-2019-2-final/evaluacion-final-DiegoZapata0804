-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
-- columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
-- registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
-- columna 3 es:
-- 
--   ((b,jjj), 216)
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
--fs -rm data.tsv;
--fs -put data.tsv;

dt = LOAD 'data.tsv'
    AS (f1:chararray, 
        f2:BAG{t: (p:chararray)},  
        f3:MAP[]);


l = FOREACH dt GENERATE FLATTEN(f2), FLATTEN(f3);
s = FOREACH l GENERATE ($0,$1) AS t_uple;
g = GROUP s BY t_uple;
r = FOREACH g GENERATE group, COUNT(s);

STORE r INTO 'output';

--fs -get output/ ;