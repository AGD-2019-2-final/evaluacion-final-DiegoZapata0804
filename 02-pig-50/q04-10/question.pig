--
-- Pregunta
-- ===========================================================================
-- 
-- El archivo `truck_event_text_partition.csv` tiene la siguiente estructura:
-- 
--   driverId       INT
--   truckId        INT
--   eventTime      STRING
--   eventType      STRING
--   longitude      DOUBLE
--   latitude       DOUBLE
--   eventKey       STRING
--   correlationId  STRING
--   driverName     STRING
--   routeId        BIGINT
--   routeName      STRING
--   eventDate      STRING
-- 
-- Escriba un script en Pig que carge los datos y obtenga los primeros 10 
-- registros del archivo para las primeras tres columnas, y luego, ordenados 
-- por driverId, truckId, y eventTime. 
--
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
-- 
--  >>> Escriba su respuesta a partir de este punto <<<
-- 
--fs -rm truck_event_text_partition.csv;
--fs -put truck_event_text_partition.csv;

truck = LOAD 'truck_event_text_partition.csv' USING PigStorage(',')
        AS (driverId:INT,
        truckId:INT,
        eventTime:chararray,
        eventType:chararray,
        longitude:DOUBLE,
        latitude:DOUBLE,
        eventKey:chararray,
        correlationId:chararray,
        driverName:chararray,
        routeId:chararray,
        routeName:chararray,
        eventDate:chararray);

v = FOREACH truck GENERATE $0..$2;

l = LIMIT v 10;

z = ORDER l BY $0,$1,$2;

STORE z INTO 'output' USING PigStorage(',');



