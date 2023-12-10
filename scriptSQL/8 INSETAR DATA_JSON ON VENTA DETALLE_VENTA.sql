/*
    Este procedimiento almacenado tiene como objetivo insertar valores en las tablas 'ventas' y 'detalle_ventas'. 
    En caso de fallo en alguna de las inserciones, se realiza un rollback; en ausencia de errores, se efectúa un commit.
    Los datos suministrados provienen del registro realizado por nuestro sistema de cajero, por ejemplo.
*/

-- Eliminar el procedimiento almacenado si ya existe
DROP PROCEDURE IF EXISTS InsertarVentaJSON;

-- Cambiar el delimitador para permitir el uso de ; dentro del cuerpo del procedimiento almacenado
DELIMITER //

-- Crear el procedimiento almacenado InsertarVenta
CREATE PROCEDURE InsertarVentaJSON(
    IN p_idVenta INT,
    IN p_idCliente INT,
    IN p_idUsuario INT,
    IN p_tipoComprobante VARCHAR(30),
    IN p_serieComprobante VARCHAR(30),
    IN p_numComprobante VARCHAR(30),
    IN p_estado VARCHAR(30),
    IN p_detalleVentas JSON
)
BEGIN
	/*
		En MySQL, cuando se produce un error o una advertencia dentro de un bloque BEGIN...END. 
        el manejador de errores correspondiente se activará automáticamente. 
        El orden en el que declaras los manejadores de errores dentro del bloque no afecta su comportamiento.
    */
    -- Declaración de variables locales
    DECLARE i INT DEFAULT 0;
    DECLARE idArticulo INT;
    DECLARE cantidad INT;


  -- Manejar excepciones SQL
    DECLARE exit handler for sqlexception
    BEGIN
        -- Manejar la excepción SQL aquí
        ROLLBACK;
        SELECT 'Error al intentar insertar el registro' AS Rollback;
        SHOW ERRORS;
    END;

    -- Manejar advertencias SQL
    DECLARE exit handler for sqlwarning
    BEGIN
        -- Manejar la advertencia SQL aquí
        ROLLBACK;
        SELECT 'Advertencia al intentar insertar el registro' AS Advertencia;
        SHOW WARNINGS;
    END;
    
    
	IF 
		p_idVenta IS NULL OR p_idCliente IS NULL OR p_idUsuario IS NULL OR
		p_detalleVentas IS NULL THEN
        SELECT 'Faltan argumentos. No se realizaron inserciones.' AS Error;
        
	ELSE
		-- Iniciar la transacción
		START TRANSACTION;

		-- Insertar en la tabla de ventas
		INSERT INTO ventas (id_venta, id_cliente, id_usuario, tipo_comprobante, num_serie_comprobante, num_comprobante, estado)
		VALUES (p_idVenta, p_idCliente, p_idUsuario, p_tipoComprobante, p_serieComprobante, p_numComprobante, p_estado);

		-- Obtener la longitud del array JSON
		SET i = JSON_LENGTH(p_detalleVentas);

		-- Iterar sobre el array JSON de detalleVentas
		WHILE i > 0 DO
			/*
				La función JSON_UNQUOTE se utiliza para eliminar las comillas que rodean una cadena JSON.
				La función JSON_EXTRACT se utiliza para extraer un valor de un objeto o array JSON.
			*/
			-- Obtener valores del array JSON
			SET idArticulo = JSON_UNQUOTE(JSON_EXTRACT(p_detalleVentas, CONCAT('$[', i - 1, '].idArticulo')));
			SET cantidad = JSON_UNQUOTE(JSON_EXTRACT(p_detalleVentas, CONCAT('$[', i - 1, '].cantidad')));

			-- Insertar en la tabla de detalle_ventas
			INSERT INTO detalle_ventas (id_venta, id_articulo, cantidad)
			VALUES (p_idVenta, idArticulo, cantidad);

			-- Decrementar el índice para avanzar al siguiente elemento del array JSON
			SET i = i - 1;
			
		END WHILE;

		-- Confirmar la transacción
		COMMIT;
		SELECT 'Registro insertado correctamente' AS Commit;
    END IF;
    
END //

-- Restaurar el delimitador original
DELIMITER ;




/*
    Este procedimiento almacenado tiene como objetivo cargar datos en las tablas 'venta' y 'detalle_venta'
    a partir de un archivo JSON especificado por su ruta.

    Parametros:
        - p_rutaArchivo: Ruta del archivo JSON que contiene los datos a cargar en las tablas.

    Nota: El usuario de MySQL debe tener los permisos adecuados para leer el archivo en la ubicación especificada.
*/

DROP PROCEDURE IF EXISTS CargarYInsertarVenta;

DELIMITER //

CREATE PROCEDURE CargarYInsertarVenta(IN p_rutaArchivo VARCHAR(255))
BEGIN
    DECLARE jsonContent TEXT;

    -- Leer los datos desde el archivo JSON
    SET jsonContent = LOAD_FILE(p_rutaArchivo);
    SET jsonContent = REPLACE(jsonContent, '\\', '\\\\'); -- Corregir la escapada de barras invertidas

    -- Construir y ejecutar la consulta
    CALL InsertarVentaJSON(
        JSON_UNQUOTE(JSON_EXTRACT(jsonContent, '$.idVenta')),
        JSON_UNQUOTE(JSON_EXTRACT(jsonContent, '$.idCliente')),
        JSON_UNQUOTE(JSON_EXTRACT(jsonContent, '$.idUsuario')),
        JSON_UNQUOTE(JSON_EXTRACT(jsonContent, '$.tipoComprobante')),
        JSON_UNQUOTE(JSON_EXTRACT(jsonContent, '$.serieComprobante')),
        JSON_UNQUOTE(JSON_EXTRACT(jsonContent, '$.numComprobante')),
        JSON_UNQUOTE(JSON_EXTRACT(jsonContent, '$.estado')),
        JSON_UNQUOTE(JSON_EXTRACT(jsonContent, '$.detalleVentas'))
    );
END //

DELIMITER ;




/*
    Llamada al procedimiento almacenado CargarYInsertarVenta.

    Notas:
        - Asegúrese de que la ruta del archivo proporcionada sea correcta.
*/

CALL CargarYInsertarVenta('C:/Users/ALBERTO/Desktop/CODER2/dataVentasJSON/ventas1.json');






