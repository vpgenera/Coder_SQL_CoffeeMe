DROP SCHEMA IF EXISTS COFFE;
CREATE SCHEMA COFFE;

USE COFFE;

DROP TABLE IF EXISTS producto;
CREATE TABLE producto(
`id_producto` INT AUTO_INCREMENT NOT NULL,
`nombre_producto` VARCHAR(80),
`descripcion_producto` TEXT,
`precio` DECIMAL (10,2) , -- (PENSANDO EN USAR USD PARA ENTENDIMIENTO GLOBAL)
CONSTRAINT PK_PRODUCTO PRIMARY KEY(id_producto)
);


DROP TABLE IF EXISTS insumo;
CREATE TABLE insumo(
`id_insumo` INT AUTO_INCREMENT NOT NULL,
`nombre_insumo` VARCHAR(80),
`descripcion_insumo` TEXT,
`stock_actual` INT,
`unidad` VARCHAR(50),
`stock_minimo` INT, 
CONSTRAINT PK_INSUMO PRIMARY KEY(id_insumo)
);


DROP TABLE IF EXISTS receta;
CREATE TABLE receta(
`id_receta` INT AUTO_INCREMENT NOT NULL,
`id_producto`INT,
`id_insumo` INT,
`cantidad`DECIMAL(10,2),
`unidad` VARCHAR(20),
CONSTRAINT PK_RECETA PRIMARY KEY(id_receta),
CONSTRAINT FK_RECETA_PRODUCTO FOREIGN KEY (id_producto)  REFERENCES producto(id_producto), -- PRODUCTOS
CONSTRAINT FK_RECETAS_INSUMO FOREIGN KEY (id_insumo) REFERENCES insumo(id_insumo) -- INSUMOS
);



DROP TABLE IF EXISTS pedido;
CREATE TABLE pedido(
`id_pedido` INT AUTO_INCREMENT NOT NULL,
`fecha` DATE,
`hora` TIME,
`total` DECIMAL (10,2),
CONSTRAINT PK_PEDIDO PRIMARY KEY(id_pedido)
);



DROP TABLE IF EXISTS detalle_pedido;
CREATE TABLE detalle_pedido(
`id_detalle` INT AUTO_INCREMENT NOT NULL,
`id_pedido` INT  NOT NULL,
`id_producto` INT NOT NULL,
`cantidad` INT,
`subtotal` DECIMAL (10,2),
CONSTRAINT PK_DETALLE PRIMARY KEY(id_detalle),
-- UNIQUE (id_pedido),
CONSTRAINT FK_DETALLE_PEDIDO FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido), -- PEDIDOS
CONSTRAINT FK_DETALLE_PRODUCTO FOREIGN KEY (id_producto) REFERENCES producto(id_producto) -- PRODUCTOS
);


DROP TABLE IF EXISTS movim_inventario;
CREATE TABLE movim_inventario(
`id_movimiento` INT AUTO_INCREMENT NOT NULL,
`tipo` ENUM('ENTRADA', 'SALIDA'), 
`id_insumo` INT,
`cantidad` DECIMAL (10,2),
`motivo` VARCHAR(200),
`fecha` DATE, 
`hora` TIME,
CONSTRAINT PK_MOVIM PRIMARY KEY(id_movimiento),
CONSTRAINT FK_MOVIM_INSUMO FOREIGN KEY (id_insumo) REFERENCES insumo(id_insumo) -- INSUMOS
);







