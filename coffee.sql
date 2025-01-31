DROP SCHEMA IF EXISTS COFFEE;
CREATE SCHEMA COFFEE;

USE COFFEE;

DROP TABLE IF EXISTS productos;
CREATE TABLE productos(
`id_producto` INT AUTO_INCREMENT NOT NULL,
`nombre_producto` VARCHAR(80),
`descripcion_producto` TEXT,
`precio` DECIMAL (10,2) , -- (PENSANDO EN USAR USD PARA ENTENDIMIENTO GLOBAL)
CONSTRAINT PK_PRODUCTOS PRIMARY KEY(id_producto)
);


DROP TABLE IF EXISTS insumos;
CREATE TABLE insumos(
`id_insumo` INT AUTO_INCREMENT NOT NULL,
`nombre_insumo` VARCHAR(80),
`descripcion_insumo` TEXT,
`stock_actual` INT,
`unidad` VARCHAR(50),
`stock_minimo` INT, 
CONSTRAINT PK_INSUMOS PRIMARY KEY(id_insumo)
);


DROP TABLE IF EXISTS recetas;
CREATE TABLE recetas(
`id_receta` INT AUTO_INCREMENT NOT NULL,
`id_producto`INT,
`id_insumo` INT,
`cantidad`DECIMAL(10,2),
`unidad` VARCHAR(20),
CONSTRAINT PK_RECETAS PRIMARY KEY(id_receta),
CONSTRAINT FK_RECETAS_PRODUCTOS FOREIGN KEY (id_producto)  REFERENCES productos(id_producto) , -- PRODUCTOS
CONSTRAINT FK_RECETAS_INSUMOS FOREIGN KEY (id_insumo) REFERENCES insumos(id_insumo) -- INSUMOS
);



DROP TABLE IF EXISTS pedidos;
CREATE TABLE pedidos(
`id_pedido` INT AUTO_INCREMENT NOT NULL,
`fecha` DATE,
`hora` TIME,
`total` DECIMAL (10,2),
CONSTRAINT PK_PEDIDO PRIMARY KEY(id_pedido)
);



DROP TABLE IF EXISTS detalle_pedidos;
CREATE TABLE detalle_pedidos(
`id_detalle` INT AUTO_INCREMENT NOT NULL,
`id_pedido` INT  NOT NULL,
`id_producto` INT NOT NULL,
`cantidad` INT,
`subtotal` DECIMAL (10,2),
CONSTRAINT PK_DETALLE PRIMARY KEY(id_detalle),
-- UNIQUE (id_pedido),
CONSTRAINT FK_DETALLE_PEDIDO FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido), -- PEDIDOS
CONSTRAINT FK_DETALLE_PRODUCTO FOREIGN KEY (id_producto) REFERENCES productos(id_producto) -- PRODUCTOS
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
CONSTRAINT FK_MOVIM_INSUMOS FOREIGN KEY (id_insumo) REFERENCES insumos(id_insumo) -- INSUMOS
);









