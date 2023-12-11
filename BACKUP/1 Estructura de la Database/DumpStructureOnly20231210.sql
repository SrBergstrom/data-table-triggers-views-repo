CREATE DATABASE  IF NOT EXISTS `tienda` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `tienda`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: tienda
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.22-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `articulos`
--

DROP TABLE IF EXISTS `articulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articulos` (
  `id_articulo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de artículos',
  `id_categoria` int(11) NOT NULL COMMENT 'Llave foránea de categorías',
  `codigo` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Código del artículo',
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Nombre del artículo',
  `precio_venta` decimal(10,2) DEFAULT NULL COMMENT 'Precio de venta del artículo',
  `stock` int(11) NOT NULL DEFAULT 0 COMMENT 'Cantidad en stock del artículo',
  `descripcion` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Descripción detallada del artículo',
  `activa` tinyint(4) DEFAULT 0 COMMENT 'Estado del articulo (0: inactivo, 1: activo)',
  `fecha_cre` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de creación',
  `fecha_mod` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Fecha de última modificación',
  PRIMARY KEY (`id_articulo`),
  KEY `id_categoria` (`id_categoria`),
  CONSTRAINT `articulos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Tabla que almacena información sobre artículos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de categorías',
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Nombre de la categoría',
  `descripcion` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Descripción de la categoría',
  `activa` tinyint(4) DEFAULT NULL COMMENT 'Estado de la categoria (0: inactivo, 1: activo)',
  `fecha_cre` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de creación',
  `fecha_mod` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Fecha de última modificación',
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Tabla que almacena información sobre categorías';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de clientes',
  `tipo_cliente` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tipo de persona del cliente (comprador, vendedor, etc.)',
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Nombre completo del cliente',
  `tipo_documento` enum('DNI','Pasaporte','RUC','Otro') COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tipo de documento del cliente',
  `num_documento` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Número del documento de identidad o registro único del cliente',
  `direccion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Dirección del cliente',
  `telefono` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Número de teléfono del cliente',
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Correo electrónico del cliente',
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Tabla que almacena información sobre clientes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `detalle_ingresos`
--

DROP TABLE IF EXISTS `detalle_ingresos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_ingresos` (
  `id_ingreso` int(11) NOT NULL COMMENT 'Llave foránea de ingresos',
  `id_articulo` int(11) NOT NULL COMMENT 'Llave foránea de artículos',
  `cantidad` int(11) NOT NULL COMMENT 'Cantidad de unidades ingresadas',
  `precio` decimal(10,2) NOT NULL COMMENT 'Precio unitario del artículo ingresado',
  PRIMARY KEY (`id_ingreso`,`id_articulo`),
  KEY `id_articulo` (`id_articulo`),
  CONSTRAINT `detalle_ingresos_ibfk_1` FOREIGN KEY (`id_ingreso`) REFERENCES `ingresos` (`id_ingreso`) ON DELETE CASCADE,
  CONSTRAINT `detalle_ingresos_ibfk_2` FOREIGN KEY (`id_articulo`) REFERENCES `articulos` (`id_articulo`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Tabla que almacena el detalle de los ingresos';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER tgrActualizarVentasTotalBIdetalleIngresos
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
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER tgrActualizarStockAIdtalleIngresos
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

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `detalle_ventas`
--

DROP TABLE IF EXISTS `detalle_ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_ventas` (
  `id_venta` int(11) NOT NULL COMMENT 'Llave foránea de ventas',
  `id_articulo` int(11) NOT NULL COMMENT 'Llave foránea de artículos',
  `cantidad` int(11) NOT NULL COMMENT 'Cantidad de unidades vendidas',
  `precio` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT 'Precio unitario del artículo vendido',
  `descuento` decimal(8,2) NOT NULL DEFAULT 0.00 COMMENT 'Monto del descuento aplicado al artículo',
  PRIMARY KEY (`id_venta`,`id_articulo`),
  KEY `id_articulo` (`id_articulo`),
  CONSTRAINT `detalle_ventas_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`) ON DELETE CASCADE,
  CONSTRAINT `detalle_ventas_ibfk_2` FOREIGN KEY (`id_articulo`) REFERENCES `articulos` (`id_articulo`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Tabla que almacena el detalle de las ventas';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER tgrCalcularPrecioBDetalleVentas
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
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER tgrActualizarVentasTotalAIdetalleVentas
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
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER tgrActualizarStockAIdetalleVentas
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

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ingresos`
--

DROP TABLE IF EXISTS `ingresos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingresos` (
  `id_ingreso` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de ingresos',
  `id_cliente` int(11) NOT NULL COMMENT 'Llave foránea de clientes',
  `id_usuario` int(11) NOT NULL COMMENT 'Llave foránea de usuarios',
  `tipo_comprobante` enum('Factura','Boleta','Otro') COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tipo de comprobante del ingreso (Factura o Boleta)',
  `num_serie_comprobante` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Número de serie del comprobante',
  `num_comprobante` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Número del comprobante',
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha y hora del ingreso',
  `impuesto` decimal(5,2) NOT NULL DEFAULT 0.00 COMMENT 'Tasa de impuesto aplicada en porcentaje',
  `total` decimal(11,2) NOT NULL DEFAULT 0.00 COMMENT 'Total del ingreso',
  `estado` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'Pendiente' COMMENT 'Estado del ingreso (Pendiente, Pagado, Otro)',
  PRIMARY KEY (`id_ingreso`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `ingresos_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE CASCADE,
  CONSTRAINT `ingresos_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Tabla que almacena información sobre ingresos';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER tgrActualizarIngresosTotalBUingresos
BEFORE UPDATE ON ingresos
FOR EACH ROW
BEGIN
    -- Declaración de variable local
    DECLARE v_total DECIMAL(10, 2);
    
    -- Manejo de valores nulos en NEW.total
    SET v_total = IFNULL(NEW.total, 0);

    -- Actualización del impuesto (no se necesita un UPDATE adicional ya que el trigger está en esa tabla)
    SET NEW.impuesto = v_total * 0.18;  -- Impuesto del 18%
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id_rol` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de roles',
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Nombre del rol',
  `descripcion` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Descripción del rol',
  `activa` tinyint(4) DEFAULT 0 COMMENT 'Estado del rol (0: inactivo, 1: activo)',
  `fecha_cre` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de creación',
  `fecha_mod` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Fecha de última modificación',
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Tabla que almacena información sobre roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de usuarios',
  `id_rol` int(11) NOT NULL COMMENT 'Llave foránea de roles',
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Nombre del usuario',
  `tipo_documento` enum('DNI','RUC','Pasaporte','Licencia','Otro') COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tipo de documento del usuario',
  `direccion` varchar(70) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Dirección del usuario',
  `telefono` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Número de teléfono del usuario',
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Correo electrónico del usuario',
  `clave` varbinary(255) DEFAULT NULL COMMENT 'Clave del usuario almacenada de forma segura',
  `activa` tinyint(4) DEFAULT 0 COMMENT 'Estado del usuario (0: inactivo, 1: activo)',
  `fecha_cre` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de creación',
  `fecha_mod` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Fecha de última modificación',
  PRIMARY KEY (`id_usuario`),
  KEY `id_rol` (`id_rol`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Tabla que almacena información sobre usuarios';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `id_venta` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de ventas',
  `id_cliente` int(11) NOT NULL COMMENT 'Llave foránea de clientes',
  `id_usuario` int(11) NOT NULL COMMENT 'Llave foránea de usuario',
  `tipo_comprobante` enum('Factura','Boleta','Otro') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Tipo de comprobante de venta',
  `num_serie_comprobante` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Número de serie del comprobante',
  `num_comprobante` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Número del comprobante',
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha y hora de la venta',
  `impuesto` decimal(5,2) NOT NULL DEFAULT 0.00 COMMENT 'Tasa de impuesto aplicada en porcentaje',
  `total` decimal(11,2) NOT NULL DEFAULT 0.00 COMMENT 'Total de la venta',
  `estado` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pendiente' COMMENT 'Estado de la venta (Pendiente, Pagado, Otro)',
  PRIMARY KEY (`id_venta`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE CASCADE,
  CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Tabla que almacena información sobre ventas';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER tgrActualizarVentasImpuestoBUVentas
BEFORE UPDATE ON ventas
FOR EACH ROW
BEGIN
    -- Declaramos la variable local para almacenar total
    DECLARE v_total DECIMAL(10, 2);

    -- Obtenemos el total
    SET v_total = IFNULL(NEW.total, 0);

    -- Actualizamos la tabla ventas con el descuento calculado --> 18%
    SET NEW.impuesto = v_total * 0.18;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'tienda'
--

--
-- Dumping routines for database 'tienda'
--
/*!50003 DROP FUNCTION IF EXISTS `udfEncontrarCategoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `udfEncontrarCategoria`(v_id_articulo INT) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN
    DECLARE v_categoria DECIMAL(10,2);

    SELECT COALESCE(c.id_categoria, 0) INTO v_categoria
    FROM categorias c
    INNER JOIN articulos a ON c.id_categoria = a.id_categoria
    WHERE a.id_articulo = v_id_articulo;

    RETURN v_categoria;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CargarYInsertarIngreso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CargarYInsertarIngreso`(IN p_rutaArchivo VARCHAR(255))
BEGIN
    DECLARE jsonContent TEXT;

    -- Leer los datos desde el archivo JSON
    SET jsonContent = LOAD_FILE(p_rutaArchivo);
    SET jsonContent = REPLACE(jsonContent, '\\', '\\\\'); -- Corregir la escapada de barras invertidas

    -- Construir y ejecutar la consulta
    CALL InsertarIngresoJSON(
        JSON_UNQUOTE(JSON_EXTRACT(jsonContent, '$.idIngreso')),
        JSON_UNQUOTE(JSON_EXTRACT(jsonContent, '$.idCliente')),
        JSON_UNQUOTE(JSON_EXTRACT(jsonContent, '$.idUsuario')),
        JSON_UNQUOTE(JSON_EXTRACT(jsonContent, '$.tipoComprobante')),
        JSON_UNQUOTE(JSON_EXTRACT(jsonContent, '$.serieComprobante')),
        JSON_UNQUOTE(JSON_EXTRACT(jsonContent, '$.numComprobante')),
        JSON_UNQUOTE(JSON_EXTRACT(jsonContent, '$.estado')),
        JSON_UNQUOTE(JSON_EXTRACT(jsonContent, '$.detalleIngresos'))
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CargarYInsertarVenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CargarYInsertarVenta`(IN p_rutaArchivo VARCHAR(255))
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarIngresoJSON` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarIngresoJSON`(
    IN p_idIngreso INT,
    IN p_idCliente INT,
    IN p_idUsuario INT,
    IN p_tipoComprobante VARCHAR(30),
    IN p_serieComprobante VARCHAR(30),
    IN p_numComprobante VARCHAR(30),
    IN p_estado VARCHAR(30),
    IN p_detalleIngresos JSON
)
BEGIN
	/*
		En MySQL, cuando se produce un error o una advertencia dentro de un bloque BEGIN...END, 
        el manejador de errores correspondiente se activará automáticamente. 
        El orden en el que declaras los manejadores de errores dentro del bloque no afecta su comportamiento.
    */
    -- Declaración de variables locales
    DECLARE i INT DEFAULT 0;
    DECLARE idArticulo INT;
    DECLARE cantidad INT;
    DECLARE precio DECIMAL(10,2);

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
		p_idIngreso IS NULL OR p_idCliente IS NULL OR p_idUsuario IS NULL OR
		p_detalleIngresos IS NULL THEN
        SELECT 'Faltan argumentos. No se realizaron inserciones.' AS Error;
        
	ELSE
		-- Iniciar la transacción
		START TRANSACTION;

		-- Insertar en la tabla de ingresos
		INSERT INTO ingresos (id_ingreso, id_cliente, id_usuario, tipo_comprobante, num_serie_comprobante, num_comprobante, estado)
		VALUES (p_idIngreso, p_idCliente, p_idUsuario, p_tipoComprobante, p_serieComprobante, p_numComprobante, p_estado);

		-- Obtener la longitud del array JSON
		SET i = JSON_LENGTH(p_detalleIngresos);

		-- Iterar sobre el array JSON de detalleVentas
		WHILE i > 0 DO
			/*
				La función JSON_UNQUOTE se utiliza para eliminar las comillas que rodean una cadena JSON.
				La función JSON_EXTRACT se utiliza para extraer un valor de un objeto o array JSON.
			*/
			-- Obtener valores del array JSON
			SET idArticulo = JSON_UNQUOTE(JSON_EXTRACT(p_detalleIngresos, CONCAT('$[', i - 1, '].idArticulo')));
			SET cantidad = JSON_UNQUOTE(JSON_EXTRACT(p_detalleIngresos, CONCAT('$[', i - 1, '].cantidad')));
			SET precio = JSON_UNQUOTE(JSON_EXTRACT(p_detalleIngresos, CONCAT('$[', i - 1, '].precio')));

			-- Insertar en la tabla de detalle_ingresos
			INSERT INTO detalle_ingresos (id_ingreso, id_articulo, cantidad, precio)
			VALUES (p_idIngreso, idArticulo, cantidad, precio);

			-- Decrementar el índice para avanzar al siguiente elemento del array JSON
			SET i = i - 1;
			
		END WHILE;

		-- Confirmar la transacción
		COMMIT;
		SELECT 'Registro insertado correctamente' AS Commit;
	END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarVentaJSON` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarVentaJSON`(
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
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-10 23:02:21
