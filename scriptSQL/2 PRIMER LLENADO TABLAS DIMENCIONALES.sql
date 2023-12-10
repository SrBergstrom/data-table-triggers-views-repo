/*
Primer llenado de la base de datos corresponde a las tablas dimencionales.
Las tablas dimensionales suelen contener información descriptiva o contextual 
que proporciona detalles sobre los datos almacenados en las tablas de hechos.
*/


-- Insertar datos en la tabla de categorías
INSERT INTO categorias (id_categoria, nombre, descripcion, activa) VALUES
	(1, 'Ropa y Accesorios', 'Descubre las últimas tendencias en moda para hombres, mujeres y niños. Desde elegantes accesorios hasta calzado de moda, encuentra todo lo que necesitas para expresar tu estilo único.', 1),
	(2, 'Electrónica', 'Explora nuestra gama de productos electrónicos de vanguardia. Desde smartphones y portátiles hasta accesorios innovadores, ofrecemos lo último en tecnología para satisfacer tus necesidades digitales.', 1),
	(3, 'Hogar y Jardín', 'Transforma tu hogar en un oasis con nuestra selección de muebles elegantes, electrodomésticos modernos y accesorios de decoración. Descubre soluciones creativas para interiores y exteriores.', 1),
	(4, 'Salud y Belleza', 'Cuida de ti mismo con nuestra colección de productos de cuidado facial, capilar y de belleza. Encuentra todo lo necesario para realzar tu belleza y mantener un estilo de vida saludable.', 1),
	(5, 'Libros y Entretenimiento', 'Sumérgete en un mundo de historias con nuestra amplia variedad de libros. Además, disfruta de entretenimiento en casa con películas, música y juegos que satisfacen todos los gustos.', 1),
	(6, 'Deportes y Aire Libre', 'Haz del deporte una parte integral de tu vida con nuestra ropa deportiva, equipos de ejercicio y artículos para actividades al aire libre. Encuentra todo lo que necesitas para mantenerte activo y en forma.', 1),
	(7, 'Alimentación y Bebidas', 'Deléitate con nuestra selección de alimentos frescos, bebidas deliciosas y snacks irresistibles. Descubre productos de alta calidad para satisfacer tus antojos y necesidades alimenticias.', 1)
	;



-- Insertar datos en la tabla de artículos
INSERT INTO articulos (id_articulo, id_categoria, codigo, nombre, precio_venta, stock, descripcion, activa) VALUES
	(1, 1, 'A-001', 'Chaqueta de Cuero Clásica', 200, 10, 'Eleva tu estilo con nuestra chaqueta de cuero clásica. Con un diseño atemporal, esta prenda es perfecta para cualquier ocasión. Fabricada con cuero de alta calidad, proporciona durabilidad y un toque de elegancia a tu guardarropa.', 1),
	(2, 1, 'A-002', 'Bolso Tote Versátil', 130, 5, 'Descubre la funcionalidad y la moda con nuestro bolso tote versátil. Con múltiples compartimentos y un diseño moderno, este bolso es ideal para el trabajo, la universidad o un día de compras. Está confeccionado con materiales resistentes para acompañarte en todas tus actividades diarias.', 1),
	(3, 1, 'A-003', 'Zapatos Deportivos de Última Generación', 100, 5, 'Alcanza tus metas fitness con nuestros zapatos deportivos de última generación. Diseñados para brindar comodidad y soporte, estos zapatos son ideales para correr, entrenar en el gimnasio o simplemente para un estilo de vida activo. Su diseño moderno y tecnología avanzada los convierten en una opción perfecta para los entusiastas del deporte.', 1),
	(4, 2, 'A-004', 'Teléfono Inteligente de Última Generación', 2300, 15, 'Experimenta la potencia y la innovación con nuestro teléfono inteligente de última generación. Equipado con una cámara de alta resolución, rendimiento rápido y una pantalla impresionante, este dispositivo redefine la experiencia móvil. Mantente conectado y disfruta de todas las funciones avanzadas que ofrece.', 1),
	(5, 2, 'A-005', 'Portátil Ultradelgado para Profesionales', 3500, 10, 'Potencia tu productividad con nuestro portátil ultradelgado diseñado para profesionales en movimiento. Con un diseño elegante y especificaciones de vanguardia, este portátil ofrece rendimiento excepcional en un formato ligero. Perfecto para negocios, estudio o entretenimiento, te acompañará a donde vayas con estilo.', 1),
	(6, 2, 'A-006', 'Auriculares Inalámbricos con Cancelación de Ruido', 80, 30, 'Sumérgete en un mundo de sonido de alta calidad con nuestros auriculares inalámbricos con cancelación de ruido. Disfruta de una experiencia auditiva inmersiva mientras bloqueas el ruido del entorno. Ligeros y cómodos, estos auriculares son ideales para viajar, trabajar o simplemente relajarte con tu música favorita.', 1),
	(7, 3, 'A-007', 'Sofá Modular para Espacios Modernos', 300, 10, 'Transforma tu sala de estar con nuestro sofá modular para espacios modernos. Con líneas limpias y un diseño versátil, este sofá se adapta a cualquier configuración de sala. Además, su comodidad superior lo convierte en el lugar perfecto para relajarte después de un día ajetreado.', 1),
	(8, 3, 'A-008', 'Set de Utensilios de Cocina de Acero Inoxidable', 200, 5, 'Eleva tu experiencia culinaria con nuestro set de utensilios de cocina de acero inoxidable. Cada pieza está diseñada para la durabilidad y la funcionalidad, proporcionando las herramientas esenciales para cocinar con estilo. Con mangos ergonómicos, este set aporta un toque de elegancia a tu cocina.', 1),
	(9, 3, 'A-009', 'Juego de Muebles de Jardín para Exteriores', 800, 5, 'Crea un oasis al aire libre con nuestro juego de muebles de jardín. Fabricado con materiales resistentes a la intemperie, este conjunto incluye cómodos sillones y una mesa elegante. Perfecto para reuniones familiares, barbacoas o simplemente relajarse bajo el sol, este juego transformará tu espacio exterior en un lugar acogedor y elegante.', 1),
	(10, 4, 'A-010', 'Set de Cuidado Facial de Lujo', 400, 10, 'Dale a tu piel el amor que se merece con nuestro set de cuidado facial de lujo. Diseñado para rejuvenecer y revitalizar, este conjunto incluye productos premium que hidratan, nutren y protegen tu piel. Disfruta de una rutina de cuidado facial que realza tu belleza natural.', 1),
	(11, 4, 'A-011', 'Secador de Cabello Profesional con Tecnología Iónica', 140, 5, 'Logra un cabello brillante y sin frizz con nuestro secador de cabello profesional. Equipado con tecnología iónica, este secador seca rápidamente mientras reduce el daño causado por el calor. Con múltiples ajustes de velocidad y calor, es la herramienta perfecta para lograr peinados espectaculares.', 1),
	(12, 4, 'A-012', 'Colección de Maquillaje de Edición Limitada', 60, 20, 'Despierta tu creatividad con nuestra colección de maquillaje de edición limitada. Desde tonos vibrantes hasta colores clásicos, esta colección ofrece una gama versátil para expresar tu estilo único. Descubre productos de alta calidad que realzan tu belleza con un toque de elegancia y glamour.', 1),
	(13, 5, 'A-013', 'Bestsellers del Momento', 50, 10, 'Sumérgete en las historias más cautivadoras con nuestra selección de bestsellers del momento. Desde emocionantes novelas hasta apasionantes no-ficciones, estos libros te transportarán a mundos fascinantes y te mantendrán entretenido durante horas.', 1),
	(14, 5, 'A-014', 'Colección de Películas Clásicas en Blu-ray', 90, 5, 'Revive los momentos más icónicos del cine con nuestra colección de películas clásicas en Blu-ray. Experimenta la magia del séptimo arte con una calidad de imagen excepcional.', 1),
	(15, 5, 'A-015', 'Vinilos de Artistas Legendarios', 30, 10, 'Sumérgete en la nostalgia musical con nuestra colección de vinilos de artistas legendarios. Desde clásicos del rock hasta las melodías atemporales de jazz, estos vinilos ofrecen una experiencia auditiva auténtica. Descubre la riqueza del sonido analógico con estas joyas musicales.', 1),
	(16, 6, 'A-016', 'Equipo de Ejercicio para Casa', 700, 5, 'Transforma tu hogar en un gimnasio personal con nuestro equipo de ejercicio de alta calidad. Desde pesas ajustables hasta bandas de resistencia, este conjunto te ofrece las herramientas necesarias para mantenerte en forma cómodamente en casa. Logra tus metas fitness sin salir de tu espacio.', 1),
	(17, 6, 'A-017', 'Ropa Deportiva de Alto Rendimiento', 160, 10, 'Alcanza tu máximo potencial con nuestra línea de ropa deportiva de alto rendimiento. Diseñada para la comodidad y la transpirabilidad, esta colección te mantendrá fresco y enfocado durante tus entrenamientos. Desde camisetas técnicas hasta mallas transpirables, encuentra la ropa perfecta para tu actividad favorita.', 1),
	(18, 6, 'A-018', 'Set de Camping Todo en Uno', 1100, 5, 'Prepárate para la aventura al aire libre con nuestro set de camping todo en uno. Con tienda de campaña resistente, saco de dormir cómodo y utensilios de cocina portátiles, este conjunto facilita la planificación de tu próxima escapada. Disfruta de la naturaleza con equipamiento confiable y de calidad.', 1),
	(19, 7, 'A-019', 'Selección Gourmet de Tés y Infusiones', 320, 5, 'Deléitate con nuestra selección gourmet de tés y infusiones de alta calidad. Descubre aromas exquisitos y sabores únicos que transformarán tu experiencia de la hora del té. Desde clásicos atemporales hasta mezclas creativas, nuestra colección ofrece una variedad que satisfará incluso a los paladares más exigentes.', 1),
	(20, 7, 'A-020', 'Caja de Snacks Saludables', 10, 50, 'Disfruta de la combinación perfecta entre sabor y salud con nuestra caja de snacks saludables. Desde nueces y frutas deshidratadas hasta opciones bajas en calorías, esta caja ofrece una variedad de delicias que te mantendrán satisfecho entre comidas. Descubre una nueva forma de picar de manera inteligente.', 1),
	(21, 7, 'A-021', 'Vinos Seleccionados de las Mejores Bodegas', 25, 40, 'Eleva tus momentos especiales con nuestra colección de vinos seleccionados de las mejores bodegas. Desde tintos robustos hasta blancos refrescantes, cada botella cuenta una historia única. Descubre la exquisitez en cada sorbo y celebra la vida con estas joyas vinícolas.', 1)
	;



-- Insertar datos en la tabla de roles
INSERT INTO roles (id_rol, nombre, descripcion, activa)
VALUES
    (1, 'Gerente de Tienda', 'El gerente de tienda supervisa todas las operaciones diarias, gestiona al personal, establece metas de ventas, coordina el inventario y garantiza que la tienda funcione de manera eficiente. También se encarga de crear estrategias para mejorar las ventas y la satisfacción del cliente.', 1),
    (2, 'Asociado de Ventas', 'Los asociados de ventas interactúan directamente con los clientes. Ayudan a los clientes a encontrar productos, responden preguntas, procesan transacciones de compra y ofrecen asesoramiento sobre productos. La amabilidad y la capacidad para trabajar en un entorno de ritmo rápido son habilidades clave.', 1),
    (3, 'Cajero/a', 'Los cajeros procesan las transacciones de compra, manejan pagos en efectivo y tarjeta, y proporcionan recibos a los clientes. La precisión en el manejo del dinero y la atención al cliente son fundamentales en este rol.', 1),
    (4, 'Encargado/a de Almacén o Stock', 'Este rol se encarga de gestionar el inventario, recibir mercancía, organizar el stock en el almacén y reponer los productos en la tienda. Mantener un inventario preciso y garantizar que los productos estén disponibles para los clientes son responsabilidades clave.', 1),
    (5, 'Visual Merchandiser (Merchandising Visual)', 'Los visual merchandisers son responsables de crear exhibiciones atractivas en la tienda para destacar productos y atraer a los clientes. Estos profesionales comprenden la importancia de la presentación visual para estimular las ventas y mejorar la experiencia de compra.', 1),
    (6, 'Especialista en Servicio al Cliente', 'Los especialistas en servicio al cliente se centran en garantizar una experiencia positiva para los clientes. Ayudan a resolver problemas, manejan devoluciones y cambios, y ofrecen asistencia para garantizar la satisfacción del cliente.', 1),
    (7, 'Responsable de Marketing y Promociones', 'Este rol se encarga de planificar y ejecutar estrategias de marketing y promociones para aumentar la visibilidad de la tienda y atraer a nuevos clientes. También puede supervisar las campañas publicitarias y las actividades promocionales en la tienda.', 1)
    ;
    
    
    
-- Insertar datos en la tabla de roles
INSERT INTO usuarios (id_usuario, id_rol, nombre, tipo_documento, direccion, telefono, email, clave, activa)
VALUES
    (1, 1, 'Gerente Carlos', 'RUC', 'Calle Principal 123', '982934921', 'gerente_carlos@empresa.com', 'gerentecarlos123', 1),
    (2, 2, 'Asociado Ventas Juan', 'RUC', 'Calle Asociado 123', '978027124', 'asociado_ventas_juan@empresa.com', 'asociadoventasjuan123', 1),
    (3, 2, 'Asociado Ventas Pedro', 'RUC', 'Calle Asociado 789', '986236789', 'asociado_ventas_pedro@empresa.com', 'asociadoventaspedro123', 1),
    (4, 3, 'Cajero Lucas', 'DNI', 'Calle Cajero 123', '98636123', 'cajero_lucas@empresa.com', 'cajerolucas123', 1),
    (5, 3, 'Cajera Maria', 'DNI', 'Calle Cajero 789', '987567890', 'cajero_maria@empresa.com', 'cajeromaria123', 1),
    (6, 3, 'Cajero Luis', 'DNI', 'Calle Cajero 456', '908766654', 'cajero_luis@empresa.com', 'cajeroluis123', 1),
    (7, 4, 'Almacen Angel', 'DNI', 'Calle Almacen 123', '964223123', 'almacenangel@empresa.com', 'almacenangel123', 1),
    (8, 4, 'Almacen Piero', 'DNI', 'Calle Almacen 789', '980087456', 'almacen_piero@empresa.com', 'almacenpiero123', 1),
    (9, 5, 'Visual Melia', 'RUC', 'Calle Visual 123', '976556777', 'visual_melia@empresa.com', 'visualmelia123', 1),
    (10, 6, 'Servicio Cliente Michael', 'DNI', 'Calle Servicio Cliente 123', '980966789', 'servicio_cliente_michael@empresa.com', 'servicioclientemichael123', 1),
    (11, 6, 'Servicio Cliente Paul', 'DNI', 'Calle Servicio Cliente 789', '980007555', 'servicio_cliente_paul@empresa.com', 'servicioclientepaul123', 1),
    (12, 7, 'Marketing Luana', 'DNI', 'Calle Marketing 123', '987654328', 'marketing_luana@empresa.com', 'marketingluana123', 1),
    (13, 7, 'Marketing Jhon', 'DNI', 'Calle Marketing 789', '961123423', 'marketing_jhon@empresa.com', 'marketingjhon123', 1)
    ;



-- Insertar datos en la tabla de clientes
INSERT INTO clientes (id_cliente, tipo_cliente, nombre, tipo_documento, num_documento, direccion, telefono, email)
VALUES
    (1, 'Persona Natural', 'Pnatural 1', 'DNI', '11111111', 'Calle Pnatural 001', '999999999', 'pnatural1@gmail.com'),
    (2, 'Persona Natural', 'Pnatural 2', 'DNI', '22222222', 'Calle Pnatural 002', '988888888', 'pnatural2@gmail.com'),
    (3, 'Persona Natural', 'Pnatural 3', 'DNI', '33333333', 'Calle Pnatural 003', '977777777', 'pnatural3@gmail.com'),
    (4, 'Persona Natural', 'Pnatural 4', 'DNI', '44444444', 'Calle Pnatural 004', '966666666', 'pnatural4@gmail.com'),
    (5, 'SA', 'Empresa 1', 'RUC', '2010101010', 'Calle Empresa 001', '955555555', 'empresa1@empresa.com'),
    (6, 'SAC', 'Empresa 2', 'RUC', '2030303030', 'Calle Empresa 002', '944444444', 'empresa2@empresa.com'),
    (7, 'Persona Juridica', 'Pjuridica1', 'RUC', '2040404040', 'Calle Pjuridica001', '93333333', 'pjuridica@empresa.com')
    ;








