-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra. 
-- Escriba el resultado a la carpeta `output` del directorio actual.
--
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<

--fs -put 'data.tsv';

lines = LOAD 'data.tsv'
    AS (letra:CHARARRAY, 
        fecha:CHARARRAY,  
        valor:INT);
    
grouped = GROUP lines BY $0;

wordcount = FOREACH grouped GENERATE group, COUNT(lines);

STORE wordcount INTO 'output';

