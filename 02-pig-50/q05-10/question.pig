-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
-- aparece cada letra minúscula en la columna 2.
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


r = FOREACH dt GENERATE FLATTEN($1) AS letra;
g = GROUP r BY letra;
z = FOREACH g GENERATE group,COUNT(r);

STORE z INTO 'output';



