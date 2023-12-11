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
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Ropa y Accesorios','Descubre las últimas tendencias en moda para hombres, mujeres y niños. Desde elegantes accesorios hasta calzado de moda, encuentra todo lo que necesitas para expresar tu estilo único.',1,'2023-12-11 03:56:01','2023-12-11 03:56:01'),(2,'Electrónica','Explora nuestra gama de productos electrónicos de vanguardia. Desde smartphones y portátiles hasta accesorios innovadores, ofrecemos lo último en tecnología para satisfacer tus necesidades digitales.',1,'2023-12-11 03:56:01','2023-12-11 03:56:01'),(3,'Hogar y Jardín','Transforma tu hogar en un oasis con nuestra selección de muebles elegantes, electrodomésticos modernos y accesorios de decoración. Descubre soluciones creativas para interiores y exteriores.',1,'2023-12-11 03:56:01','2023-12-11 03:56:01'),(4,'Salud y Belleza','Cuida de ti mismo con nuestra colección de productos de cuidado facial, capilar y de belleza. Encuentra todo lo necesario para realzar tu belleza y mantener un estilo de vida saludable.',1,'2023-12-11 03:56:01','2023-12-11 03:56:01'),(5,'Libros y Entretenimiento','Sumérgete en un mundo de historias con nuestra amplia variedad de libros. Además, disfruta de entretenimiento en casa con películas, música y juegos que satisfacen todos los gustos.',1,'2023-12-11 03:56:01','2023-12-11 03:56:01'),(6,'Deportes y Aire Libre','Haz del deporte una parte integral de tu vida con nuestra ropa deportiva, equipos de ejercicio y artículos para actividades al aire libre. Encuentra todo lo que necesitas para mantenerte activo y en forma.',1,'2023-12-11 03:56:01','2023-12-11 03:56:01'),(7,'Alimentación y Bebidas','Deléitate con nuestra selección de alimentos frescos, bebidas deliciosas y snacks irresistibles. Descubre productos de alta calidad para satisfacer tus antojos y necesidades alimenticias.',1,'2023-12-11 03:56:01','2023-12-11 03:56:01');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Persona Natural','Pnatural 1','DNI','11111111','Calle Pnatural 001','999999999','pnatural1@gmail.com'),(2,'Persona Natural','Pnatural 2','DNI','22222222','Calle Pnatural 002','988888888','pnatural2@gmail.com'),(3,'Persona Natural','Pnatural 3','DNI','33333333','Calle Pnatural 003','977777777','pnatural3@gmail.com'),(4,'Persona Natural','Pnatural 4','DNI','44444444','Calle Pnatural 004','966666666','pnatural4@gmail.com'),(5,'SA','Empresa 1','RUC','2010101010','Calle Empresa 001','955555555','empresa1@empresa.com'),(6,'SAC','Empresa 2','RUC','2030303030','Calle Empresa 002','944444444','empresa2@empresa.com'),(7,'Persona Juridica','Pjuridica1','RUC','2040404040','Calle Pjuridica001','93333333','pjuridica@empresa.com');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Gerente de Tienda','El gerente de tienda supervisa todas las operaciones diarias, gestiona al personal, establece metas de ventas, coordina el inventario y garantiza que la tienda funcione de manera eficiente. También se encarga de crear estrategias para mejorar las ventas y la satisfacción del cliente.',1,'2023-12-11 03:56:01','2023-12-11 03:56:01'),(2,'Asociado de Ventas','Los asociados de ventas interactúan directamente con los clientes. Ayudan a los clientes a encontrar productos, responden preguntas, procesan transacciones de compra y ofrecen asesoramiento sobre productos. La amabilidad y la capacidad para trabajar en un entorno de ritmo rápido son habilidades clave.',1,'2023-12-11 03:56:01','2023-12-11 03:56:01'),(3,'Cajero/a','Los cajeros procesan las transacciones de compra, manejan pagos en efectivo y tarjeta, y proporcionan recibos a los clientes. La precisión en el manejo del dinero y la atención al cliente son fundamentales en este rol.',1,'2023-12-11 03:56:01','2023-12-11 03:56:01'),(4,'Encargado/a de Almacén o Stock','Este rol se encarga de gestionar el inventario, recibir mercancía, organizar el stock en el almacén y reponer los productos en la tienda. Mantener un inventario preciso y garantizar que los productos estén disponibles para los clientes son responsabilidades clave.',1,'2023-12-11 03:56:01','2023-12-11 03:56:01'),(5,'Visual Merchandiser (Merchandising Visual)','Los visual merchandisers son responsables de crear exhibiciones atractivas en la tienda para destacar productos y atraer a los clientes. Estos profesionales comprenden la importancia de la presentación visual para estimular las ventas y mejorar la experiencia de compra.',1,'2023-12-11 03:56:01','2023-12-11 03:56:01'),(6,'Especialista en Servicio al Cliente','Los especialistas en servicio al cliente se centran en garantizar una experiencia positiva para los clientes. Ayudan a resolver problemas, manejan devoluciones y cambios, y ofrecen asistencia para garantizar la satisfacción del cliente.',1,'2023-12-11 03:56:01','2023-12-11 03:56:01'),(7,'Responsable de Marketing y Promociones','Este rol se encarga de planificar y ejecutar estrategias de marketing y promociones para aumentar la visibilidad de la tienda y atraer a nuevos clientes. También puede supervisar las campañas publicitarias y las actividades promocionales en la tienda.',1,'2023-12-11 03:56:01','2023-12-11 03:56:01');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-11  6:27:49
