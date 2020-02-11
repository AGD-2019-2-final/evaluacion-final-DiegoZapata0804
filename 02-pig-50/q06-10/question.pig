-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
-- columna 3. En otras palabras, cuántos registros hay que tengan la clave 
-- `aaa`?
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


r = FOREACH dt GENERATE FLATTEN(f3) AS letra;
g = GROUP r BY letra;
z = FOREACH g GENERATE group,COUNT(r);

STORE z INTO 'output' USING PigStorage(',');


