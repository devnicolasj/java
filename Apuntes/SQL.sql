-- ===========================================================================================================
    -- Crea base de datos.
    CREATE DATABASE [nombre_bd]:
-- ===========================================================================================================
    -- Crea una tabla.
    CREATE TABLE [nombre_tabla](columna1 tipo_dato, 
                                columna2 tipo_dato,
                                columna3 tipo_dato):
    -- Eliminar tabla.
    DROP TABLE [nombre_tabla]:
-- ===========================================================================================================  
    -- Agrega nueva columna a una tabla.
    ALTER TABLE [nombre_tabla] ADD COLUMN [nombre_columna] tipo_dato:
    -- Elimina una columna de una tabla.
    ALTER TABLE [nombre_tabla] DROP COLUMN [nombre_columna]:
-- ===========================================================================================================
    -- Consulta básica de una tabla.
    SELECT columnas FROM tabla WHERE condición:
    -- Selecciona columnas de una tabla con ordenamiento descendente.
    SELECT columnas FROM [nombre_tabla] ORDER BY columna DESC:
    -- Selecciona columnas de una tabla con una cláusula LIMIT para obtener un número específico de filas.
    SELECT columnas FROM [nombre_tabla] LIMIT cantidad:
    -- Selecciona columnas de una tabla con una cláusula LIMIT y OFFSET para paginación.
    SELECT columnas FROM [nombre_tabla] LIMIT cantidad OFFSET inicio:
    -- Realiza una consulta con la cláusula DISTINCT para obtener valores únicos.
    SELECT DISTINCT columnas FROM [nombre_tabla]:
    -- Realiza una consulta con la cláusula GROUP BY para agrupar filas según valores de una columna.
    SELECT columna, función_agregada(columna) FROM [nombre_tabla] GROUP BY columna:
    -- Realiza una consulta con la cláusula HAVING para filtrar resultados de una cláusula GROUP BY.
    SELECT columna, función_agregada(columna) FROM [nombre_tabla] GROUP BY columna HAVING condición:
    -- Realiza una consulta con la cláusula WHERE utilizando el operador IN para buscar valores dentro de una lista.
    SELECT columnas FROM [nombre_tabla] WHERE columna IN (valor1, valor2, ...):
    -- Realiza una consulta con la cláusula WHERE utilizando el operador BETWEEN para buscar valores dentro de un rango.
    SELECT columnas FROM [nombre_tabla] WHERE columna BETWEEN valor1 AND valor2:
    -- Realiza una consulta con la cláusula WHERE utilizando el operador IS NULL para buscar valores nulos.
    SELECT columnas FROM [nombre_tabla] WHERE columna IS NULL:
-- ===========================================================================================================
    -- Inserta registros en una tabla.
    INSERT INTO [nombre_tabla] (columnas) VALUES (valores):
    -- Modifica los valores de las columnas de una tabla.
    UPDATE [nombre_tabla] SET columna = valor WHERE condición:
    -- Elimina los registros de una tabla segun condición.
    DELETE FROM [nombre_tabla] WHERE condición:
-- ===========================================================================================================
    -- Crea índices para mejorar la velocidad de las consultas.
    CREATE INDEX [nombre_indice] ON [nombre_tabla] (columnas):
-- ===========================================================================================================
    -- Realiza una consulta con la cláusula UNION para combinar resultados de múltiples consultas.
    SELECT columnas FROM [nombre_tabla1] UNION SELECT columnas FROM [nombre_tabla2]:
    -- Realiza una consulta con la cláusula JOIN para combinar datos de varias tablas basándose en una relación entre ellas.
    SELECT columnas FROM tabla1 JOIN tabla2 ON tabla1.columna = tabla2.columna:
    -- Realiza una consulta con el JOIN LEFT para obtener todos los registros de la tabla izquierda y los registros coincidentes de la tabla derecha.
    SELECT columnas FROM tabla1 LEFT JOIN tabla2 ON tabla1.columna = tabla2.columna:
    -- Realiza una consulta con el JOIN RIGHT para obtener todos los registros de la tabla derecha y los registros coincidentes de la tabla izquierda.
    SELECT columnas FROM tabla1 RIGHT JOIN tabla2 ON tabla1.columna = tabla2.columna:
    -- Realiza una consulta con el JOIN FULL OUTER para obtener todos los registros de ambas tablas.
    SELECT columnas FROM tabla1 FULL OUTER JOIN tabla2 ON tabla1.columna = tabla2.columna:
-- ===========================================================================================================
    -- Crea una vista, que es una consulta almacenada como una tabla virtual.
    CREATE VIEW [nombre_vista] AS SELECT columnas FROM [nombre_tabla] WHERE condición:
-- ===========================================================================================================
    -- Crea un procedimiento almacenado.
    CREATE PROCEDURE [nombre_procedimiento]
    AS
    -- Declaracion de variables
    BEGIN
    -- Cuerpo del procedimiento
    END;
    ----------------------------------------
    -- Para ejecutar un procedimiento:
    EXECUTE [nombre_procedimiento];
-- ===========================================================================================================
    -- Crea una especificación de paquete.
    CREATE PACKAGE [nombre_paquete]
    AS
        -- Declaraciones de variables, tipos y subprogramas
    END;

    -- Crea un cuerpo de paquete.
    CREATE PACKAGE BODY [nombre_paquete]
    AS
        -- Implementación de los subprogramas declarados en la especificación
    END;
-- ===========================================================================================================
    CREATE FUNCTION [nombre_funcion] ([parámetros])
    RETURNS [tipo_retorno]
    AS
    BEGIN
    -- Cuerpo de la función
    END; 
    ------------------------------------------------
    -- Ejecuta una función.
    SELECT [nombre_funcion]([parámetros]);
-- ===========================================================================================================
    -- Crea un trigger.
    CREATE TRIGGER [nombre_trigger]
    {AFTER | INSTEAD OF} {INSERT | UPDATE | DELETE}
    ON [nombre_tabla]
    FOR EACH ROW
    BEGIN
    -- Cuerpo del trigger
    END;
-- ===========================================================================================================
    - Crea una secuencia.
    CREATE SEQUENCE [nombre_secuencia]
    START WITH [valor_inicial]
    INCREMENT BY [incremento]
    MINVALUE [valor_mínimo]
    MAXVALUE [valor_máximo]
    CYCLE | NO CYCLE;
    -------------------------------------
    [valor_inicial] es el número en el que comenzará la secuencia.
    [incremento] es la cantidad que se sumará o restará a la secuencia cada vez que se genere un nuevo valor.
    [valor_mínimo] y [valor_máximo] establecen los límites inferior y superior de la secuencia.
    La opción CYCLE indica que la secuencia volverá al [valor_mínimo] después de llegar al [valor_máximo], mientras que NO CYCLE detendrá la secuencia en el [valor_máximo].
-- ===========================================================================================================
    -- Probar consultas con dual
    SELECT TO_DATE(TO_CHAR('20000927', 'yyyymmdd'), 'yyyymmdd') FROM DUAL; -- ejemplo
-- ===========================================================================================================
    AVG: Utilizada para calcular el promedio de los valores de un campo determinado.
    COUNT: Utilizada para devolver el número de registros de la selección.
    SUM: Utilizada para devolver la suma de todos los valores de un campo determinado.
    MAX: Utilizada para devolver el valor más alto de un campo especificado.
    MIN: Utilizada para devolver el valor más bajo de un campo especificado.
-- ===========================================================================================================
    TO_CHAR: Convierte un valor en una cadena de caracteres con un formato específico.
    Ejemplo: TO_CHAR(fecha, 'DD/MM/YYYY')

    TO_DATE: Convierte una cadena de caracteres en un valor de fecha.
    Ejemplo: TO_DATE('20/06/2023', 'DD/MM/YYYY')

    TO_NUMBER: Convierte una cadena de caracteres en un valor numérico.
    Ejemplo: TO_NUMBER('123.45')

    CONVERT: Convierte un valor en un tipo de datos específico.
    Ejemplo: CONVERT(fecha, VARCHAR)

    CAST: Convierte un valor en un tipo de datos específico.
    Ejemplo: CAST(numero AS VARCHAR)

    NVL: Devuelve un valor alternativo si una expresión es nula.
    Ejemplo: NVL(columna, 'Valor Alternativo')

    COALESCE: Devuelve el primer valor no nulo en una lista de expresiones.
    Ejemplo: COALESCE(columna1, columna2, columna3)

    SUBSTR: Extrae una parte de una cadena de caracteres.
    Ejemplo: SUBSTR(nombre, 1, 3)

    TRIM: Elimina los espacios en blanco al inicio y al final de una cadena de caracteres.
    Ejemplo: TRIM(' Hola ')

    UPPER: Convierte una cadena de caracteres a mayúsculas.
    Ejemplo: UPPER('hola')

    LOWER: Convierte una cadena de caracteres a minúsculas.
    Ejemplo: LOWER('HOLA')
-- ===========================================================================================================
