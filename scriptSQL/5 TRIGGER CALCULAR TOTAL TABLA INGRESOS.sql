/*
Este trigger calcula automáticamente el total en la tabla "ingresos"
y se activa antes de realizar una inserción en la tabla "detalle_ingresos".
*/

DROP TRIGGER IF EXISTS tgrActualizarVentasTotalBIdetalleIngresos;

DELIMITER //
CREATE TRIGGER tgrActualizarVentasTotalBIdetalleIngresos
BEFORE INSERT ON detalle_ingresos
FOR EACH ROW
BEGIN
    -- Declaración de variables local
    DECLARE v_precio DECIMAL(10, 2);
    DECLARE v_cantidad INT;
    DECLARE v_total_anterior DECIMAL(10, 2);

    -- Manejo de casos en los que precio o cantidad pueden ser nulos
    SELECT COALESCE(NEW.precio, 0), COALESCE(NEW.cantidad, 0) INTO v_precio, v_cantidad;

    -- Obtención del total anterior
    SELECT COALESCE(total, 0) INTO v_total_anterior FROM ingresos WHERE id_ingreso = NEW.id_ingreso;

    -- Verificación de existencia de un registro con el mismo idIngreso
    IF v_total_anterior IS NOT NULL THEN
        -- Actualización del total sumando la nueva cantidad total
        UPDATE ingresos SET total = v_total_anterior + (v_precio * v_cantidad) WHERE id_ingreso = NEW.id_ingreso;
    ELSE
        -- Inserción de un nuevo registro si no existe uno con el mismo idIngreso
        UPDATE ingresos SET total = (v_precio * v_cantidad) WHERE id_ingreso = NEW.id_ingreso;
    END IF;
END //
DELIMITER ;




/*
Este trigger calcula el impuesto al 18% y
se ejecuta antes de actualizar el impuesto en la tabla "ingresos".
*/

DROP TRIGGER IF EXISTS tgrActualizarIngresosTotalBUingresos;

DELIMITER //
CREATE TRIGGER tgrActualizarIngresosTotalBUingresos
BEFORE UPDATE ON ingresos
FOR EACH ROW
BEGIN
    -- Declaración de variable local
    DECLARE v_total DECIMAL(10, 2);
    
    -- Manejo de valores nulos en NEW.total
    SET v_total = IFNULL(NEW.total, 0);

    -- Actualización del impuesto (no se necesita un UPDATE adicional ya que el trigger está en esa tabla)
    SET NEW.impuesto = v_total * 0.18;  -- Impuesto del 18%
END //
DELIMITER ;
















