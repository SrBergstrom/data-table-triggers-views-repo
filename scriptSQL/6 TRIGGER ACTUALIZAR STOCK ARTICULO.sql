/*
   Este trigger tiene como objetivo actualizar la tabla 'articulo' en la columna 'stock'
   cuando se realiza una inserción en la tabla 'detalle_ingresos'.
*/
-- Se elimina el trigger existente si existe
DROP TRIGGER IF EXISTS tgrActualizarStockAIdtalleIngresos;

-- Cambio del delimitador para permitir el uso de ';' dentro del trigger
DELIMITER //

-- Creación del trigger
CREATE TRIGGER tgrActualizarStockAIdtalleIngresos
AFTER INSERT ON detalle_ingresos
FOR EACH ROW
BEGIN
    DECLARE v_stock_anterior INT;

    -- Obtener el stock anterior del artículo
    -- y actualizar el stock en la tabla 'articulos' después de una inserción en 'detalle_ingresos'
    SELECT stock INTO v_stock_anterior
    FROM articulos
    WHERE id_Articulo = NEW.id_Articulo;

    IF v_stock_anterior IS NOT NULL THEN
        -- El stock no es nulo, actualiza sumando la cantidad
        UPDATE articulos
        SET stock = v_stock_anterior + NEW.cantidad
        WHERE id_Articulo = NEW.id_Articulo;
    ELSE
        -- El stock es nulo, actualiza con la cantidad directamente
        UPDATE articulos
        SET stock = NEW.cantidad
        WHERE id_Articulo = NEW.id_Articulo;
    END IF;

END //

-- Restaurar el delimitador a ';'
DELIMITER ;




/*
   Este trigger tiene como objetivo actualizar la tabla 'articulo' en la columna 'stock'
   cuando se realiza una inserción en la tabla 'detalle_ventas'.
*/
-- Elimina el trigger existente si existe
DROP TRIGGER IF EXISTS tgrActualizarStockAIdetalleVentas;

-- Cambia el delimitador para permitir el uso de ';' dentro del trigger
DELIMITER //

-- Creación del trigger
CREATE TRIGGER tgrActualizarStockAIdetalleVentas
AFTER INSERT ON detalle_ventas
FOR EACH ROW
BEGIN
    -- Variable para almacenar el stock anterior del artículo
    DECLARE v_stock_anterior INT;

    -- Variable para almacenar el nuevo stock después de la venta
    DECLARE v_nuevo_stock INT;

    -- Obtener el stock anterior del artículo
    -- y actualizar el stock en la tabla 'articulos' después de una inserción en 'detalle_ventas'
    SELECT stock INTO v_stock_anterior FROM articulos WHERE id_articulo = NEW.id_articulo;

    -- Verificar si el id_articulo existe en la tabla articulos
    IF v_stock_anterior IS NOT NULL THEN
        -- Calcular el nuevo stock después de la venta
        SET v_nuevo_stock = v_stock_anterior - NEW.cantidad;

        -- Verificar si el nuevo stock es negativo
        IF v_nuevo_stock < 0 THEN
            -- Manejar la advertencia de stock insuficiente
            SET @msg = CONCAT('Advertencia: Stock insuficiente para el artículo con ID ', CAST(NEW.id_articulo AS CHAR));
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @msg;
        ELSE
            -- Actualizar el stock en la tabla 'articulos' después de una venta en 'detalle_ventas'
            UPDATE articulos
            SET stock = v_nuevo_stock
            WHERE id_articulo = NEW.id_articulo;
        END IF;
    ELSE
        -- Manejar el caso cuando id_articulo no existe en la tabla articulos
        SET @msg = CONCAT('Error: El artículo con ID ', CAST(NEW.id_articulo AS CHAR), ' no existe.');
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @msg;
    END IF;

END; //

-- Restaura el delimitador a ';'
DELIMITER ;


