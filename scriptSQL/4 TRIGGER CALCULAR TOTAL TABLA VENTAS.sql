/*
    Este script SQL tiene como objetivo la implementación de triggers para automatizar
    el cálculo de columnas en nuestras tablas. La elección de triggers en lugar de
    columnas calculadas se debe a que MYSQL no permite referencias a otras tablas directamente.
*/

/*
	En algunos sistemas de bases de datos, como PostgreSQL, puedes crear columnas calculadas 
    que obtienen su valor directamente de otras tablas sin necesidad de recurrir a triggers o procedimientos almacenados.
    Esto se hace a través de expresiones y funciones que pueden referenciar datos en otras tablas.
*/



/*
    Trigger para calcular el total en la tabla ventas:
    Antes de insertar un nuevo registro en detalle_ventas, se calcula el total multiplicando el precio por la cantidad
    y se actualiza la tabla 'ventas' con el total calculado, asociándolo a la venta correspondiente.
*/
DROP TRIGGER IF EXISTS tgrActualizarVentasTotalAIdetalleVentas;

DELIMITER //
CREATE TRIGGER tgrActualizarVentasTotalAIdetalleVentas
AFTER INSERT ON detalle_ventas
FOR EACH ROW
BEGIN
    -- Declaramos las variables locales para almacenar precio, cantidad y total
    DECLARE v_precio DECIMAL(10, 2);
    DECLARE v_cantidad INT;
    DECLARE v_total DECIMAL(10, 2);
    DECLARE v_total_anterior DECIMAL(10, 2);

    -- Obtenemos precio y cantidad del nuevo registro en detalle_ventas
    SELECT NEW.precio, NEW.cantidad INTO v_precio, v_cantidad;
    
    -- Obtenemos el total anterior
    SELECT COALESCE(total, 0) INTO v_total_anterior FROM ventas WHERE id_venta = NEW.id_venta;

    -- Calculamos el total
    SET v_total = v_precio * v_cantidad;

    -- Actualizamos la tabla ventas con el total calculado
    UPDATE ventas SET total = v_total + v_total_anterior WHERE id_venta = NEW.id_venta;
END //
DELIMITER ;







/*
    Trigger para calcular el impuesto en la tabla ventas al actualizar:
    Antes de actualizar una venta en la tabla 'ventas', se obtiene el nuevo total y se calcula el impuesto,
    aplicando un 18% sobre el nuevo total. El resultado se asigna a la columna 'impuesto' en la fila actualizada.
*/
DROP TRIGGER IF EXISTS tgrActualizarVentasImpuestoBUVentas;

DELIMITER //
CREATE TRIGGER tgrActualizarVentasImpuestoBUVentas
BEFORE UPDATE ON ventas
FOR EACH ROW
BEGIN
    -- Declaramos la variable local para almacenar total
    DECLARE v_total DECIMAL(10, 2);

    -- Obtenemos el total
    SET v_total = IFNULL(NEW.total, 0);

    -- Actualizamos la tabla ventas con el descuento calculado --> 18%
    SET NEW.impuesto = v_total * 0.18;
END //
DELIMITER ;






