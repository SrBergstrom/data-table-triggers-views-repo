-- creamos la database
DROP DATABASE IF EXISTS tienda;
CREATE SCHEMA `tienda`
DEFAULT CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE tienda;


-- Tabla de Categorías mejorada para MySQL
CREATE TABLE IF NOT EXISTS categorias (
    id_categoria INT AUTO_INCREMENT COMMENT 'Llave primaria de categorías',
    nombre VARCHAR(100) COMMENT 'Nombre de la categoría',
    descripcion VARCHAR(500) COMMENT 'Descripción de la categoría',
    activa TINYINT COMMENT 'Estado de la categoria (0: inactivo, 1: activo)',
    fecha_cre TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de creación',
    fecha_mod TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha de última modificación',
    PRIMARY KEY (id_categoria)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT 'Tabla que almacena información sobre categorías';



-- Tabla de Artículos
CREATE TABLE IF NOT EXISTS articulos (
    id_articulo INT AUTO_INCREMENT COMMENT 'Llave primaria de artículos',
    id_categoria INT NOT NULL COMMENT 'Llave foránea de categorías',
    codigo VARCHAR(50) COMMENT 'Código del artículo',
    nombre VARCHAR(100) COMMENT 'Nombre del artículo',
    precio_venta DECIMAL(10,2) COMMENT 'Precio de venta del artículo',
    stock INT NOT NULL DEFAULT 0 COMMENT 'Cantidad en stock del artículo',
    descripcion VARCHAR(500) COMMENT 'Descripción detallada del artículo',
    activa TINYINT DEFAULT 0 COMMENT 'Estado del articulo (0: inactivo, 1: activo)',
    fecha_cre TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de creación',
    fecha_mod TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha de última modificación',
    PRIMARY KEY (id_articulo),
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT 'Tabla que almacena información sobre artículos';


-- Tabla de Roles
CREATE TABLE IF NOT EXISTS roles (
    id_rol INT AUTO_INCREMENT COMMENT 'Llave primaria de roles',
    nombre VARCHAR(100) COMMENT 'Nombre del rol',
    descripcion VARCHAR(500) COMMENT 'Descripción del rol',
    activa TINYINT DEFAULT 0 COMMENT 'Estado del rol (0: inactivo, 1: activo)',
    fecha_cre TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de creación',
    fecha_mod TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha de última modificación',
    PRIMARY KEY (id_rol)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT 'Tabla que almacena información sobre roles';


-- Tabla de Usuarios
CREATE TABLE IF NOT EXISTS usuarios (
    id_usuario INT AUTO_INCREMENT COMMENT 'Llave primaria de usuarios',
    id_rol INT NOT NULL COMMENT 'Llave foránea de roles',
    nombre VARCHAR(100) COMMENT 'Nombre del usuario',
    tipo_documento ENUM('DNI', 'RUC', 'Pasaporte', 'Licencia', 'Otro') COMMENT 'Tipo de documento del usuario',
    direccion VARCHAR(70) COMMENT 'Dirección del usuario',
    telefono VARCHAR(20) COMMENT 'Número de teléfono del usuario',
    email VARCHAR(50) COMMENT 'Correo electrónico del usuario',
    clave VARBINARY(255) COMMENT 'Clave del usuario almacenada de forma segura',  -- BLOB
    activa TINYINT DEFAULT 0 COMMENT 'Estado del usuario (0: inactivo, 1: activo)',
    fecha_cre TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de creación',
    fecha_mod TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha de última modificación',
    PRIMARY KEY (id_usuario),
    FOREIGN KEY (id_rol) REFERENCES roles(id_rol) ON DELETE CASCADE  
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT 'Tabla que almacena información sobre usuarios';



-- Tabla de Clientes
CREATE TABLE IF NOT EXISTS clientes (
    id_cliente INT AUTO_INCREMENT COMMENT 'Llave primaria de clientes',
    tipo_cliente VARCHAR(20) COMMENT 'Tipo de persona del cliente (comprador, vendedor, etc.)',
    nombre VARCHAR(100) COMMENT 'Nombre completo del cliente',
    tipo_documento ENUM('DNI', 'Pasaporte', 'RUC', 'Otro') COMMENT 'Tipo de documento del cliente',
    num_documento VARCHAR(20) COMMENT 'Número del documento de identidad o registro único del cliente',
    direccion VARCHAR(255) COMMENT 'Dirección del cliente',
    telefono VARCHAR(15) COMMENT 'Número de teléfono del cliente',
    email VARCHAR(50) COMMENT 'Correo electrónico del cliente',
    PRIMARY KEY (id_cliente)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT 'Tabla que almacena información sobre clientes';




-- Tabla de Ventas
CREATE TABLE IF NOT EXISTS ventas (
    id_venta INT AUTO_INCREMENT COMMENT 'Llave primaria de ventas',
    id_cliente INT NOT NULL COMMENT 'Llave foránea de clientes',
    id_usuario INT NOT NULL COMMENT 'Llave foránea de usuario',
    tipo_comprobante ENUM('Factura', 'Boleta', 'Otro') NOT NULL COMMENT 'Tipo de comprobante de venta',
    num_serie_comprobante VARCHAR(20) NOT NULL COMMENT 'Número de serie del comprobante',
    num_comprobante VARCHAR(10) NOT NULL COMMENT 'Número del comprobante',
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha y hora de la venta',
    impuesto DECIMAL(5, 2) DEFAULT 0 NOT NULL COMMENT 'Tasa de impuesto aplicada en porcentaje',
    total DECIMAL(11, 2) DEFAULT 0 NOT NULL COMMENT 'Total de la venta',
    estado VARCHAR(20) DEFAULT 'Pendiente' NOT NULL COMMENT 'Estado de la venta (Pendiente, Pagado, Otro)',
    PRIMARY KEY (id_venta),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente) ON DELETE CASCADE,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT 'Tabla que almacena información sobre ventas';

    

  
-- Tabla de Detalle de Ventas
CREATE TABLE IF NOT EXISTS detalle_ventas (
    id_venta INT NOT NULL COMMENT 'Llave foránea de ventas',
    id_articulo INT NOT NULL COMMENT 'Llave foránea de artículos',
    cantidad INT NOT NULL COMMENT 'Cantidad de unidades vendidas',
    precio DECIMAL(10, 2) DEFAULT 0 NOT NULL COMMENT 'Precio unitario del artículo vendido',
    descuento DECIMAL(8, 2) DEFAULT 0 NOT NULL COMMENT 'Monto del descuento aplicado al artículo',
    PRIMARY KEY (id_venta, id_articulo),  -- Llave compuesta
    FOREIGN KEY (id_venta) REFERENCES ventas(id_venta) ON DELETE CASCADE,
    FOREIGN KEY (id_articulo) REFERENCES articulos(id_articulo) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT 'Tabla que almacena el detalle de las ventas';




-- Tabla de Ingresos
CREATE TABLE IF NOT EXISTS ingresos (
    id_ingreso INT AUTO_INCREMENT COMMENT 'Llave primaria de ingresos',
    id_cliente INT NOT NULL COMMENT 'Llave foránea de clientes',
    id_usuario INT NOT NULL COMMENT 'Llave foránea de usuarios',
    tipo_comprobante ENUM('Factura', 'Boleta', 'Otro') COMMENT 'Tipo de comprobante del ingreso (Factura o Boleta)',
    num_serie_comprobante VARCHAR(10) COMMENT 'Número de serie del comprobante',
    num_comprobante VARCHAR(10) COMMENT 'Número del comprobante',
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha y hora del ingreso',
    impuesto DECIMAL(5, 2) DEFAULT 0 NOT NULL COMMENT 'Tasa de impuesto aplicada en porcentaje',
    total DECIMAL(11, 2) DEFAULT 0  NOT NULL COMMENT 'Total del ingreso',
    estado VARCHAR(20) DEFAULT 'Pendiente' COMMENT 'Estado del ingreso (Pendiente, Pagado, Otro)',
    PRIMARY KEY (id_ingreso),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente) ON DELETE CASCADE,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT 'Tabla que almacena información sobre ingresos';




-- Tabla de Detalle de Ingresos
CREATE TABLE IF NOT EXISTS detalle_ingresos (
    id_ingreso INT NOT NULL COMMENT 'Llave foránea de ingresos',
    id_articulo INT NOT NULL COMMENT 'Llave foránea de artículos',
    cantidad INT NOT NULL COMMENT 'Cantidad de unidades ingresadas',
    precio DECIMAL(10, 2) NOT NULL COMMENT 'Precio unitario del artículo ingresado',
    PRIMARY KEY (id_ingreso, id_articulo),   -- Llave compuesta
    FOREIGN KEY (id_ingreso) REFERENCES ingresos(id_ingreso) ON DELETE CASCADE,
    FOREIGN KEY (id_articulo) REFERENCES articulos(id_articulo) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT 'Tabla que almacena el detalle de los ingresos';













