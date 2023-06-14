-- ===========================================================================================================
    -- Declaración de variables.
    DECLARE
    nombre_variable tipo_dato;
    otra_variable tipo_dato;
    BEGIN
    -- Asignar valores a las variables.
    nombre_variable := valor;
    otra_variable := valor;

    -- Realizar operaciones utilizando las variables.
    -- Ejemplo:
    IF nombre_variable = 1 THEN
    DBMS_OUTPUT.PUT_LINE('El valor de la variable es 1');
    ELSE
    DBMS_OUTPUT.PUT_LINE('El valor de la variable no es 1');
    END IF;

    -- ...
    -- Resto del código PL/SQL
    -- ...

    END;
    /
-- ===========================================================================================================
    -- Estructuras de control (IF-THEN-ELSE, CASE, LOOP, WHILE, FOR).
    IF condición THEN
    -- Código a ejecutar si la condición es verdadera.
    ELSIF otra_condición THEN
    -- Código a ejecutar si la otra condición es verdadera.
    ELSE
    -- Código a ejecutar si ninguna de las condiciones anteriores es verdadera.
    END IF;

    CASE variable
    WHEN valor1 THEN
    -- Código a ejecutar si la variable es igual a valor1.
    WHEN valor2 THEN
    -- Código a ejecutar si la variable es igual a valor2.
    ELSE
    -- Código a ejecutar si la variable no coincide con ninguno de los valores anteriores.
    END CASE;

    LOOP
    -- Código a repetir en un bucle infinito.
    -- Se puede utilizar la instrucción EXIT para salir del bucle en un momento determinado.
    END LOOP;

    WHILE condición LOOP
    -- Código a repetir mientras la condición sea verdadera.
    -- Se puede utilizar la instrucción EXIT para salir del bucle en un momento determinado.
    END LOOP;

    FOR variable IN valor_inicial..valor_final LOOP
    -- Código a repetir para cada valor en el rango especificado.
    -- Se puede utilizar la instrucción EXIT para salir del bucle en un momento determinado.
    END LOOP;
-- ===========================================================================================================
    -- Cursores.
    DECLARE
    CURSOR cursor_name IS
        SELECT column1, column2, ... 
        FROM table_name 
        WHERE condition;

    variable1 tipo_dato;
    variable2 tipo_dato;

    BEGIN
    OPEN cursor_name;
    LOOP
        FETCH cursor_name INTO variable1, variable2;
        EXIT WHEN cursor_name%NOTFOUND;
        -- Código para procesar los valores obtenidos del cursor.
    END LOOP;

    CLOSE cursor_name;

    END;
    /
-- ===========================================================================================================
    -- Excepciones y manejo de errores.
    DECLARE
    -- Declaración de variables

    BEGIN
    -- Código PL/SQL

    EXCEPTION
        WHEN excepción1 THEN
        -- Código a ejecutar si se produce excepción1.
        WHEN excepción2 THEN
        -- Código a ejecutar si se produce excepción2.
        WHEN OTHERS THEN
        -- Código a ejecutar si se produce cualquier otra excepción.
    END;
    /
-- ===========================================================================================================
    -- Procedimientos almacenados.
    CREATE OR REPLACE PROCEDURE nombre_procedimiento (parámetro1 tipo_dato, parámetro2 tipo_dato) IS
    BEGIN
    -- Código del procedimiento.
    -- Puede incluir operaciones SQL, estructuras de control y más.
    END;
    /

    -- Llamada a un procedimiento almacenado.
    EXECUTE nombre_procedimiento(valor1, valor2);
    -- 
-- ===========================================================================================================
    -- Funciones almacenadas.
    CREATE OR REPLACE FUNCTION nombre_función (parámetro1 tipo_dato, parámetro2 tipo_dato) RETURN tipo_dato IS
    variable tipo_dato;
    BEGIN
    -- Código de la función.
    -- Puede incluir operaciones SQL, estructuras de control y más.

    RETURN variable;
    END;
    /

    -- Llamada a una función almacenada.
    variable := nombre_función(valor1, valor2);
    -- 
-- ===========================================================================================================
    -- Tipos de datos compuestos (registros y tablas anidadas).
    DECLARE
    TYPE tipo_registro IS RECORD (
    columna1 tipo_dato,
    columna2 tipo_dato,
    ...
    );

    tipo_variable_registro tipo_registro;

    TYPE tipo_tabla IS TABLE OF tipo_registro;
    tabla tipo_tabla;
    BEGIN
    -- Asignar valores a las variables de registro.
    tipo_variable_registro.columna1 := valor1;
    tipo_variable_registro.columna2 := valor2;

    -- Agregar registros a la tabla.
    tabla := tipo_tabla();
    tabla.extend();
    tabla(1).columna1 := valor3;
    tabla(1).columna2 := valor4;

    -- Acceder a los valores de los registros y las tablas.
    variable := tipo_variable_registro.columna1;
    variable := tabla(1).columna2;

    -- ...
    -- Resto del código PL/SQL
    -- ...

    END;
    /
    -- 
-- ===========================================================================================================
    -- Cursores implícitos y bucle FOR.
    BEGIN
    FOR variable IN (SELECT columna1, columna2 FROM tabla) LOOP
    -- Código a ejecutar para cada fila del resultado de la consulta.
    -- Se pueden acceder a los valores utilizando variable.columna1, variable.columna2, etc.
    END LOOP;
    END;
    /
-- ===========================================================================================================
    -- Transacciones.
    BEGIN
    -- Iniciar una transacción.
    BEGIN
    -- Código para realizar operaciones en la transacción.
    -- Puedes realizar modificaciones en la base de datos (INSERT, UPDATE, DELETE, etc.).
    -- Utiliza COMMIT para confirmar los cambios o ROLLBACK para deshacerlos.
    EXCEPTION
    WHEN excepción THEN
    -- Manejo de excepciones.
    -- Puedes utilizar ROLLBACK para deshacer los cambios en caso de error.
    END;

    -- ...
    -- Resto del código PL/SQL
    -- ...
    END;
    /
-- ===========================================================================================================
    -- Paquetes.
    CREATE OR REPLACE PACKAGE nombre_paquete IS
    -- Declaración de tipos, variables, cursores, constantes, procedimientos y funciones.
    -- Puedes agrupar múltiples elementos relacionados en un paquete.

    PROCEDURE nombre_procedimiento (parámetro1 tipo_dato, parámetro2 tipo_dato);

    FUNCTION nombre_función (parámetro1 tipo_dato, parámetro2 tipo_dato) RETURN tipo_dato;
    END;
    /

    CREATE OR REPLACE PACKAGE BODY nombre_paquete IS
    -- Implementación de procedimientos y funciones declarados en el paquete.

    PROCEDURE nombre_procedimiento (parámetro1 tipo_dato, parámetro2 tipo_dato) IS
    BEGIN
    -- Código del procedimiento.
    END;

    FUNCTION nombre_función (parámetro1 tipo_dato, parámetro2 tipo_dato) RETURN tipo_dato IS
    variable tipo_dato;
    BEGIN
    -- Código de la función.
    RETURN variable;
    END;
    END;
    /

    -- Llamada a un procedimiento o función en un paquete.
    nombre_paquete.nombre_procedimiento(valor1, valor2);
    variable := nombre_paquete.nombre_función(valor1, valor2);

-- ===========================================================================================================