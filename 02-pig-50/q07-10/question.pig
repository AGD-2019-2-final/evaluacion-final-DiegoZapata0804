-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
-- la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
-- columna 3 separados por coma. La tabla debe estar ordenada por las 
-- columnas 1, 2 y 3.
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


l= FOREACH dt GENERATE f1,COUNT(f2),SIZE(f3);
r = ORDER l BY $0,$1,$2;

STORE r INTO 'output' USING PigStorage(',');

