/*
	Creamos un trigger apoyado en una función para mejorar la legibilidad de nuestro código.
*/

DROP FUNCTION IF EXISTS udfEncontrarCategoria;
-- Función para encontrar la categoría de un artículo dado su "idArticulo".
DELIMITER //
CREATE FUNCTION udfEncontrarCategoria(v_id_articulo INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE v_categoria DECIMAL(10,2);

    SELECT COALESCE(c.id_categoria, 0) INTO v_categoria
    FROM categorias c
    INNER JOIN articulos a ON c.id_categoria = a.id_categoria
    WHERE a.id_articulo = v_id_articulo;

    RETURN v_categoria;
END //
DELIMITER ;




/*
	Este trigger tiene la finalidad de calcular automáticamente el "descuento" y el 
    "precio" de la tabla "detalle_venta". El descuento se calcula en función al artículo
    y su porcentaje de descuento asociado a la misma, y el precio se calcula restando
    el descuento anterior al precio de la tabla "articulos".
*/

DROP TRIGGER IF EXISTS tgrCalcularPrecioBDetalleVentas;

DELIMITER //
CREATE TRIGGER tgrCalcularPrecioBDetalleVentas
BEFORE INSERT ON detalle_ventas
FOR EACH ROW
BEGIN
    DECLARE v_categoria INT;
    DECLARE v_descuento DECIMAL(10, 2);
    DECLARE v_precio DECIMAL(10, 2);

    -- Obtenemos la categoría del artículo
    SELECT COALESCE(udfEncontrarCategoria(NEW.id_articulo), 0) INTO v_categoria;

    -- Obtenemos el precio del artículo
    SELECT COALESCE(precio_venta, 0) INTO v_precio FROM articulos WHERE id_articulo = NEW.id_articulo;

    -- Calculamos el descuento basado en la categoría
    SET v_descuento = 
        CASE 
            WHEN v_categoria = 1 THEN  0.11
            WHEN v_categoria = 2 THEN  0.12
            WHEN v_categoria = 3 THEN  0.13
            WHEN v_categoria = 4 THEN  0.14
            WHEN v_categoria = 5 THEN  0.15
            WHEN v_categoria = 6 THEN  0.16
            WHEN v_categoria = 7 THEN  0.17
            ELSE 0  -- Valor por defecto si ninguna condición es verdadera
        END;

    -- Asignamos el descuento al nuevo registro en detalle_ventas
    SET NEW.descuento = (v_descuento * v_precio);

    -- Calculamos el precio final
    SET NEW.precio = v_precio - NEW.descuento;
END //
DELIMITER ;


