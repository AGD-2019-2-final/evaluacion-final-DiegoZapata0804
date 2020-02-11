-- Pregunta
-- ===========================================================================
-- 
-- Obtenga los cinco (5) valores más pequeños de la 3ra columna.
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
--fs -rm data.tsv;
--fs -put data.tsv;

lines = LOAD 'data.tsv'
    AS (letra:CHARARRAY, 
        fecha:CHARARRAY,  
        valor:INT);
    
ordenar = ORDER lines BY $2;

extra = LIMIT ordenar 5;

l = FOREACH extra GENERATE $2;

STORE l INTO 'output';


