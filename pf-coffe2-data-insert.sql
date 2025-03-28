-- INSERCIÓN DE DATOS
USE COFFEE;
SET AUTOCOMMIT=0;

START TRANSACTION;

SAVEPOINT insertando_producto;
INSERT INTO producto(id_producto, nombre_producto, descripcion_producto, precio) VALUES
(1, 'Espresso', 'Café concentrado con un sabor fuerte.', 2.50),
(2, 'Americano', 'Espresso diluido con agua caliente.', 3.00),
(3, 'Capuccino', 'Espresso con espuma de leche vaporizada.', 3.50),
(4, 'Latte', 'Espresso con mucha leche vaporizada.', 3.75),
(5, 'Moka', 'Café con chocolate y leche vaporizada.', 4.00),
(6, 'Macchiato', 'Espresso con un toque de espuma de leche.', 3.25),
(7, 'Flat White', 'Café con leche texturizada, más intenso que un latte.', 4.00),
(8, 'Affogato', 'Café espresso con helado de vainilla.', 4.50),
(9, 'Café Descafeinado', 'Café sin cafeína, suave y equilibrado.', 3.50),
(10, 'Chocolate Caliente', 'Bebida caliente a base de cacao.', 3.75),
(11, 'Té Verde', 'Infusión de hojas de té verde.', 2.80),
(12, 'Té Negro', 'Infusión fuerte de hojas de té negro.', 2.80),
(13, 'Matcha Latte', 'Bebida de té matcha con leche vaporizada.', 4.25),
(14, 'Frapuccino', 'Bebida fría con café, leche y hielo.', 4.50),
(15, 'Chai Latte', 'Infusión de especias con leche vaporizada.', 4.00);


SAVEPOINT insertando_insumo;
INSERT INTO insumo(nombre_insumo, descripcion_insumo, stock_actual, unidad, stock_minimo) VALUES
('Café en grano', 'Granos de café arábica de alta calidad.', 50, 'kg', 10),
('Leche', 'Leche fresca para preparar bebidas.', 100, 'litros', 20),
('Chocolate en polvo', 'Cacao en polvo para bebidas moka', 10, 'kg', 2),
('Chocolate bitter', 'Monedas de chocolate bitter para bebidas como chocolate caliente', 10, 'kg', 3),
('Chocolate semi amargo', 'Monedas de chocolate semiamargo para bebidas como chocolate caliente', 10, 'kg', 3),
('Azúcar flor', 'Azúcar pulverizada para endulzar bebidas.', 40, 'kg', 10),
('Canela', 'Especia en polvo para chai latte y decoración.', 10, 'kg', 2),
('Té Verde', 'Hojas de té verde para infusiones y matcha latte.', 20, 'kg', 5),
('Té Negro', 'Hojas de té negro para preparar infusiones.', 20, 'kg', 5),
('Jarabe de Vainilla', 'Jarabe de vainilla para aromatizar bebidas.', 15, 'litros', 5),
('Jarabe de Caramelo', 'Sirope de caramelo para bebidas dulces.', 15, 'litros', 5),
('Helado de Vainilla', 'Helado usado en affogato.', 10, 'kg', 2),
('Hielo', 'Hielo en cubos para bebidas frías.', 200, 'kg', 50),
('Leche de Almendras', 'Alternativa a la leche de vaca.', 30, 'litros', 10),
('Leche de Avena', 'Alternativa vegetal con sabor suave.', 30, 'litros', 10),
('Chai en polvo', 'Mezcla de especias para chai latte.', 15, 'kg', 3),
('Agua caliente', 'Agua caliente.', 20, 'litros', 2),
('Matcha en polvo', 'Té matcha polvo.', 10, 'kg', 2),
('Café en grano descafeinado', 'Granos de café arábica libres de cafeína.', 30, 'kg', 5);


ALTER TABLE insumo 
ADD COLUMN costo_unitario DECIMAL(10,2) NOT NULL DEFAULT 0;

SAVEPOINT agregando_costo_insumo;

UPDATE insumo SET costo_unitario = 15.00 WHERE id_insumo = 1; --  'Café en grano'
UPDATE insumo SET costo_unitario = 1.20 WHERE id_insumo = 2; --  'Leche';
UPDATE insumo SET costo_unitario = 10.00 WHERE id_insumo = 3; --  'Chocolate en polvo';
UPDATE insumo SET costo_unitario = 12.00 WHERE id_insumo = 4; --  'Chocolate bitter';
UPDATE insumo SET costo_unitario = 11.50 WHERE id_insumo = 5; --  'Chocolate semi amargo';
UPDATE insumo SET costo_unitario = 2.50 WHERE id_insumo = 6; --  'Azúcar flor';
UPDATE insumo SET costo_unitario = 8.00 WHERE id_insumo = 7; --  'Canela';
UPDATE insumo SET costo_unitario = 9.00 WHERE id_insumo = 8; --  'Té Verde';
UPDATE insumo SET costo_unitario = 7.50 WHERE id_insumo = 9; --  'Té Negro';
UPDATE insumo SET costo_unitario = 6.00 WHERE id_insumo = 10; --  'Jarabe de Vainilla';
UPDATE insumo SET costo_unitario = 6.50 WHERE id_insumo = 11; -- 'Jarabe de Caramelo';
UPDATE insumo SET costo_unitario = 8.00 WHERE id_insumo = 12; --  'Helado de Vainilla';
UPDATE insumo SET costo_unitario = 0.50 WHERE id_insumo = 13; --  'Hielo';
UPDATE insumo SET costo_unitario = 3.50 WHERE id_insumo = 14; --  'Leche de Almendras';
UPDATE insumo SET costo_unitario = 3.20 WHERE id_insumo = 15; --  'Leche de Avena';
UPDATE insumo SET costo_unitario = 12.00 WHERE id_insumo = 16; --  'Chai en polvo';
UPDATE insumo SET costo_unitario = 0.05 WHERE id_insumo = 17; --  'Agua caliente';
UPDATE insumo SET costo_unitario = 25.00 WHERE id_insumo = 18; -- 'Matcha en polvo';
UPDATE insumo SET costo_unitario = 16.00 WHERE id_insumo = 19; --  'Café en grano descafeinado';


SAVEPOINT insertando_receta;
INSERT INTO receta(id_producto, id_insumo, cantidad, unidad) VALUES
-- Espresso
(1, 1, 0.02, 'kg'),  -- Café en grano (20g)
-- Americano
(2, 1, 0.02, 'kg'),  -- Café en grano (20g)
(2, 13, 0.25, 'litros'),  -- Agua caliente (250ml)* error
-- Capuccino
(3, 1, 0.02, 'kg'),  -- Café en grano (20g)
(3, 2, 0.15, 'litros'),  -- Leche (150ml)
-- Latte
(4, 1, 0.02, 'kg'),  -- Café en grano (20g)
(4, 2, 0.25, 'litros'),  -- Leche (250ml)
-- Moka
(5, 1, 0.02, 'kg'),  -- Café en grano (20g)
(5, 2, 0.20, 'litros'),  -- Leche (200ml)
(5, 3, 0.02, 'kg'),  -- Chocolate en polvo (20g)
-- Macchiato
(6, 1, 0.02, 'kg'),  -- Café en grano (20g)
(6, 2, 0.05, 'litros'),  -- Leche (50ml)
-- Flat White
(7, 1, 0.02, 'kg'),  -- Café en grano (20g)
(7, 2, 0.20, 'litros'),  -- Leche (200ml)
-- Affogato
(8, 1, 0.02, 'kg'),  -- Café en grano (20g)
(8, 12, 0.10, 'kg'),  -- Helado de vainilla (100g)
-- Café Descafeinado
(9, 1, 0.02, 'kg'),  -- Café descafeinado en grano (20g) **agregar cafe descafeinado
-- Chocolate Caliente
(10, 4, 0.05, 'kg'),  -- Chocolate bitter (50g)
(10, 5, 0.05, 'kg'),  -- Chocolate semi amargo (50g)
(10, 2, 0.20, 'litros'),  -- Leche (200ml)
-- Té Verde
(11, 8, 0.02, 'kg'),  -- Té verde (20g)
(11, 13, 0.25, 'litros'),  -- Agua caliente (250ml)
-- Té Negro
(12, 9, 0.02, 'kg'),  -- Té negro (20g)
(12, 13, 0.25, 'litros'),  -- Agua caliente (250ml)
-- Matcha Latte
(13, 8, 0.02, 'kg'),  -- Té verde (20g) **agregar matcha a insumos
(13, 2, 0.20, 'litros'),  -- Leche (200ml)
-- Frapuccino
(14, 1, 0.02, 'kg'),  -- Café en grano (20g)
(14, 2, 0.20, 'litros'),  -- Leche (200ml)
(14, 13, 0.10, 'kg'),  -- Hielo (100g)
(14, 12, 0.05, 'kg'),  -- Helado de vainilla (50g)
-- Chai Latte
(15, 16, 0.02, 'kg'),  -- Chai en polvo (20g)
(15, 2, 0.20, 'litros');  -- Leche (200ml)


UPDATE receta SET id_insumo =17 WHERE id_receta=3;
UPDATE receta SET id_insumo =17 WHERE id_receta=22;
UPDATE receta SET id_insumo =17 WHERE id_receta=24;
UPDATE receta SET id_insumo =17 WHERE id_receta=24;
UPDATE receta SET id_insumo =18 WHERE id_receta=25;
UPDATE receta SET id_insumo =19 WHERE id_receta=17;


SAVEPOINT insertando_pedido;
INSERT INTO pedido(fecha, hora, total) VALUES
('2024-02-25', '08:30:00', 11.00),  -- 3.50 + 3.75 + 3.75
('2024-02-25', '09:00:00', 9.50),   -- 2.50 + 3.00 + 4.00
('2024-02-25', '09:15:00', 7.00),   -- 7.00
('2024-02-25', '10:00:00', 14.55),  -- 4.50 + 3.25 + 4.00 + 2.80
('2024-02-25', '10:30:00', 4.50),   -- 4.50
('2024-02-25', '11:00:00', 10.30),  -- 4.00 + 3.50 + 2.80
('2024-02-25', '12:00:00', 8.25),   -- 4.00 + 4.25
('2024-02-25', '13:15:00', 9.25);   -- 3.00 + 2.50 + 3.75



SAVEPOINT insertando_detallepedido;
INSERT INTO detalle_pedido (id_pedido, id_producto, cantidad, subtotal) VALUES
(1, 3, 1, 3.50),  -- Capuccino
(1, 4, 1, 3.75),  -- Latte
(1, 10, 1, 3.75), -- Chocolate Caliente
(2, 1, 1, 2.50),  -- Espresso
(2, 2, 1, 3.00),  -- Americano
(2, 5, 1, 4.00),  -- Moka
(3, 3, 2, 7.00),  -- 2 Capuccinos
(4, 8, 1, 4.50),  -- Affogato
(4, 6, 1, 3.25),  -- Macchiato
(4, 15, 1, 4.00), -- Chai Latte
(4, 11, 1, 2.80), -- Té Verde
(5, 14, 1, 4.50), -- Frapuccino
(6, 7, 1, 4.00),  -- Flat White
(6, 9, 1, 3.50),  -- Café Descafeinado
(6, 12, 1, 2.80), -- Té Negro
(7, 5, 1, 4.00),  -- Moka
(7, 13, 1, 4.25), -- Matcha Latte
(8, 2, 1, 3.00),  -- Americano
(8, 1, 1, 2.50),  -- Espresso
(8, 10, 1, 3.75); -- Chocolate Caliente



SAVEPOINT insertando_mov_inventario;
INSERT INTO movim_inventario (tipo, id_insumo, cantidad, motivo, fecha, hora) VALUES
('SALIDA', 1, 0.02, 'Venta de Espresso', '2024-01-25', '11:43:33'),
('SALIDA', 2, 0.15, 'Venta de Capuccino', '2024-01-25', '11:43:33'),
('SALIDA', 2, 0.25, 'Venta de Latte', '2024-01-25', '11:43:33'),
('SALIDA', 4, 0.05, 'Venta de Chocolate Caliente', '2024-01-25', '11:43:33'),
('SALIDA', 1, 0.02, 'Venta de Americano', '2024-02-18', '21:49:10'),
('SALIDA', 1, 0.02, 'Venta de Moka', '2024-02-18', '21:49:10'),
('SALIDA', 3, 0.15, 'Venta de Capuccino', '2024-02-18', '21:49:10'),
('SALIDA', 5, 0.02, 'Venta de Latte', '2024-02-18', '21:49:10'),
('SALIDA', 6, 0.05, 'Venta de Macchiato', '2024-02-07', '08:55:02'),
('SALIDA', 2, 0.25, 'Venta de Café Descafeinado', '2024-02-07', '08:55:02'),
('SALIDA', 1, 0.02, 'Venta de Espresso', '2024-02-07', '08:55:02'),
('SALIDA', 2, 0.25, 'Venta de Latte', '2024-01-16', '13:07:14'),
('SALIDA', 1, 0.02, 'Venta de Espresso', '2024-01-16', '13:07:14'),
('SALIDA', 3, 0.20, 'Venta de Moka', '2024-01-16', '13:07:14'),
('SALIDA', 12, 0.10, 'Venta de Affogato', '2024-02-28', '16:30:49'),
('SALIDA', 6, 0.05, 'Venta de Macchiato', '2024-02-28', '16:30:49'),
('SALIDA', 1, 0.02, 'Venta de Espresso', '2024-02-28', '16:30:49'),
('SALIDA', 3, 0.15, 'Venta de Capuccino', '2024-02-28', '16:30:49'),
('ENTRADA', 1, 50, 'Compra de café en grano', '2024-02-20', '10:00:00'),
('ENTRADA', 2, 100, 'Compra de leche', '2024-02-20', '10:00:00'),
('ENTRADA', 3, 10, 'Compra de chocolate en polvo', '2024-02-20', '10:00:00'),
('ENTRADA', 4, 10, 'Compra de chocolate bitter', '2024-02-20', '10:00:00'),
('ENTRADA', 5, 10, 'Compra de chocolate semi amargo', '2024-02-20', '10:00:00'),
('ENTRADA', 7, 40, 'Compra de azúcar flor', '2024-02-20', '10:00:00'),
('ENTRADA', 8, 20, 'Compra de té verde', '2024-02-20', '10:00:00'),
('ENTRADA', 9, 20, 'Compra de té negro', '2024-02-20', '10:00:00');


SELECT * FROM receta;
SELECT * FROM producto;
SELECT * FROM insumo;
SELECT * FROM pedido;
SELECT * FROM detalle_pedido;
SELECT * FROM movim_inventario;

-- ROLLBACK;
COMMIT;

-- INSERT INTO movim_inventario(tipo, id_insumo, cantidad, motivo, fecha, hora) VALUES
-- ('ENTRADA', 1, 5, 'Compra de café en grano', '2024-02-21', '10:00:00'); -- inserción para probar función stock insumo


-- Insertando más pedidos
START TRANSACTION;
SAVEPOINT ampliando_pedidos;
SET FOREIGN_KEY_CHECKS = 0;
INSERT INTO detalle_pedido (id_pedido, id_producto, cantidad, subtotal) VALUES
(9, 1, 1, 2.50),  -- Espresso
(9, 3, 2, 7.00),  -- 2 Capuccinos
(9, 4, 1, 3.75),  -- Latte
(10, 5, 1, 4.00),  -- Moka
(10, 7, 1, 4.00),  -- Flat White
(11, 8, 1, 4.50),  -- Affogato
(11, 6, 1, 3.25),  -- Macchiato
(12, 14, 1, 4.50),  -- Frapuccino
(12, 9, 1, 3.50),  -- Café Descafeinado
(13, 12, 1, 2.80), -- Té Negro
(13, 15, 1, 4.00), -- Chai Latte
(14, 10, 1, 3.75), -- Chocolate Caliente
(14, 5, 1, 4.00),  -- Moka
(15, 3, 2, 7.00),  -- 2 Capuccinos
(16, 4, 1, 3.75),  -- Latte
(16, 1, 1, 2.50),  -- Espresso
(17, 13, 1, 4.25), -- Matcha Latte
(17, 9, 1, 3.50),  -- Café Descafeinado
(18, 2, 1, 3.00),  -- Americano
(18, 15, 1, 4.00), -- Chai Latte
(19, 8, 1, 4.50),  -- Affogato
(19, 6, 1, 3.25),  -- Macchiato
(20, 3, 1, 3.50),  -- Capuccino
(20, 5, 1, 4.00),  -- Moka
(21, 14, 1, 4.50),  -- Frapuccino
(21, 10, 1, 3.75), -- Chocolate Caliente
(22, 1, 1, 2.50),  -- Espresso
(22, 6, 1, 3.25),  -- Macchiato
(23, 7, 1, 4.00),  -- Flat White
(23, 12, 1, 2.80), -- Té Negro
(24, 4, 1, 3.75),  -- Latte
(24, 8, 1, 4.50),  -- Affogato
(25, 13, 1, 4.25), -- Matcha Latte
(25, 3, 1, 3.50),  -- Capuccino
(26, 10, 1, 3.75), -- Chocolate Caliente
(26, 1, 1, 2.50),  -- Espresso
(27, 2, 1, 3.00),  -- Americano
(27, 5, 1, 4.00),  -- Moka
(28, 7, 1, 4.00),  -- Flat White
(28, 9, 1, 3.50),  -- Café Descafeinado
(29, 14, 1, 4.50),  -- Frapuccino
(29, 15, 1, 4.00), -- Chai Latte
(30, 6, 1, 3.25),  -- Macchiato
(30, 8, 1, 4.50),  -- Affogato
(31, 3, 1, 3.50),  -- Capuccino
(31, 10, 1, 3.75), -- Chocolate Caliente
(32, 5, 1, 4.00),  -- Moka
(32, 4, 1, 3.75),  -- Latte
(33, 1, 1, 2.50),  -- Espresso
(33, 7, 1, 4.00),  -- Flat White
(34, 9, 1, 3.50),  -- Café Descafeinado
(34, 12, 1, 2.80), -- Té Negro
(35, 15, 1, 4.00), -- Chai Latte
(35, 13, 1, 4.25), -- Matcha Latte
(36, 5, 1, 4.00),  -- Moka
(36, 4, 1, 3.75),  -- Latte
(37, 3, 2, 7.00),  -- 2 Capuccinos
(37, 6, 1, 3.25),  -- Macchiato
(38, 2, 1, 3.00),  -- Americano
(38, 10, 1, 3.75), -- Chocolate Caliente
(39, 8, 1, 4.50),  -- Affogato
(39, 5, 1, 4.00),  -- Moka
(40, 4, 1, 3.75),  -- Latte
(40, 7, 1, 4.00),  -- Flat White
(41, 14, 1, 4.50),  -- Frapuccino
(41, 15, 1, 4.00), -- Chai Latte
(42, 1, 1, 2.50),  -- Espresso
(42, 6, 1, 3.25),  -- Macchiato
(43, 9, 1, 3.50),  -- Café Descafeinado
(43, 5, 1, 4.00),  -- Moka
(44, 12, 1, 2.80), -- Té Negro
(44, 7, 1, 4.00),  -- Flat White
(45, 6, 1, 3.25),  -- Macchiato
(45, 10, 1, 3.75), -- Chocolate Caliente
(46, 3, 1, 3.50),  -- Capuccino
(46, 5, 1, 4.00),  -- Moka
(47, 13, 1, 4.25), -- Matcha Latte
(47, 2, 1, 3.00),  -- Americano
(48, 4, 1, 3.75),  -- Latte
(48, 8, 1, 4.50),  -- Affogato
(49, 1, 1, 2.50),  -- Espresso
(49, 3, 1, 3.50),  -- Capuccino
(50, 7, 1, 4.00),  -- Flat White
(50, 10, 1, 3.75), -- Chocolate Caliente
(51, 9, 1, 3.50),  -- Café Descafeinado
(51, 14, 1, 4.50),  -- Frapuccino
(52, 8, 1, 4.50),  -- Affogato
(52, 6, 1, 3.25),  -- Macchiato
(53, 2, 1, 3.00),  -- Americano
(53, 13, 1, 4.25), -- Matcha Latte
(54, 5, 1, 4.00),  -- Moka
(54, 4, 1, 3.75),  -- Latte
(55, 7, 1, 4.00),  -- Flat White
(55, 15, 1, 4.00), -- Chai Latte
(56, 1, 1, 2.50),  -- Espresso
(56, 10, 1, 3.75), -- Chocolate Caliente
(57, 6, 1, 3.25),  -- Macchiato
(57, 3, 1, 3.50),  -- Capuccino
(58, 14, 1, 4.50),  -- Frapuccino
(59, 5, 1, 4.00), --

(60, 3, 2, 7.00),  -- 2 Capuccinos
(60, 5, 1, 4.00),  -- Moka
(61, 7, 1, 4.00),  -- Flat White
(61, 12, 1, 2.80), -- Té Negro
(62, 1, 1, 2.50),  -- Espresso
(62, 6, 1, 3.25),  -- Macchiato
(63, 4, 2, 7.50),  -- 2 Lattes
(63, 10, 1, 3.75), -- Chocolate Caliente
(64, 8, 1, 4.50),  -- Affogato
(64, 7, 1, 4.00),  -- Flat White
(65, 3, 1, 3.50),  -- Capuccino
(65, 5, 1, 4.00),  -- Moka
(66, 15, 1, 4.00), -- Chai Latte
(66, 13, 1, 4.25), -- Matcha Latte
(67, 1, 2, 5.00),  -- 2 Espressos
(67, 2, 1, 3.00),  -- Americano
(68, 14, 1, 4.50),  -- Frapuccino
(68, 9, 1, 3.50),  -- Café Descafeinado
(69, 4, 1, 3.75),  -- Latte
(69, 12, 1, 2.80), -- Té Negro
(70, 3, 2, 7.00),  -- 2 Capuccinos
(70, 10, 1, 3.75), -- Chocolate Caliente
(71, 6, 1, 3.25),  -- Macchiato
(71, 5, 1, 4.00),  -- Moka
(72, 7, 1, 4.00),  -- Flat White
(72, 13, 1, 4.25), -- Matcha Latte
(73, 8, 1, 4.50),  -- Affogato
(73, 4, 1, 3.75),  -- Latte
(74, 15, 1, 4.00), -- Chai Latte
(74, 6, 1, 3.25),  -- Macchiato
(75, 1, 1, 2.50),  -- Espresso
(75, 10, 1, 3.75), -- Chocolate Caliente
(76, 12, 1, 2.80), -- Té Negro
(76, 2, 1, 3.00),  -- Americano
(77, 7, 1, 4.00),  -- Flat White
(77, 14, 1, 4.50),  -- Frapuccino
(78, 9, 1, 3.50),  -- Café Descafeinado
(78, 6, 1, 3.25),  -- Macchiato
(79, 4, 2, 7.50),  -- 2 Lattes
(79, 3, 1, 3.50),  -- Capuccino
(80, 5, 1, 4.00),  -- Moka
(80, 13, 1, 4.25), -- Matcha Latte
(81, 15, 1, 4.00), -- Chai Latte
(81, 8, 1, 4.50),  -- Affogato
(82, 3, 1, 3.50),  -- Capuccino
(82, 10, 1, 3.75), -- Chocolate Caliente
(83, 1, 1, 2.50),  -- Espresso
(83, 2, 1, 3.00),  -- Americano
(84, 14, 1, 4.50),  -- Frapuccino
(84, 5, 1, 4.00),  -- Moka
(85, 6, 1, 3.25),  -- Macchiato
(85, 12, 1, 2.80), -- Té Negro
(86, 7, 1, 4.00),  -- Flat White
(86, 4, 1, 3.75),  -- Latte
(87, 9, 1, 3.50),  -- Café Descafeinado
(87, 8, 1, 4.50),  -- Affogato
(88, 3, 2, 7.00),  -- 2 Capuccinos
(88, 1, 1, 2.50),  -- Espresso
(89, 5, 1, 4.00),  -- Moka
(89, 13, 1, 4.25), -- Matcha Latte
(90, 2, 1, 3.00),  -- Americano
(90, 6, 1, 3.25),  -- Macchiato
(91, 4, 1, 3.75),  -- Latte
(91, 7, 1, 4.00),  -- Flat White
(92, 14, 1, 4.50),  -- Frapuccino
(92, 1, 1, 2.50),  -- Espresso
(93, 12, 1, 2.80), -- Té Negro
(93, 8, 1, 4.50),  -- Affogato
(94, 5, 1, 4.00),  -- Moka
(94, 10, 1, 3.75), -- Chocolate Caliente
(95, 3, 2, 7.00),  -- 2 Capuccinos
(95, 7, 1, 4.00),  -- Flat White
(96, 6, 1, 3.25),  -- Macchiato
(96, 9, 1, 3.50),  -- Café Descafeinado
(97, 15, 1, 4.00), -- Chai Latte
(97, 5, 1, 4.00),  -- Moka
(98, 2, 1, 3.00),  -- Americano
(98, 14, 1, 4.50),  -- Frapuccino
(99, 10, 1, 3.75), -- Chocolate Caliente
(99, 6, 1, 3.25),  -- Macchiato
(100, 8, 1, 4.50),  -- Affogato
(100, 7, 1, 4.00),  -- Flat White
(101, 3, 1, 3.50),  -- Capuccino
(101, 9, 1, 3.50),  -- Café Descafeinado
(102, 1, 2, 5.00),  -- 2 Espressos
(102, 5, 1, 4.00),  -- Moka
(103, 2, 1, 3.00),  -- Americano
(103, 13, 1, 4.25), -- Matcha Latte
(104, 6, 1, 3.25),  -- Macchiato
(104, 7, 1, 4.00),  -- Flat White
(105, 3, 1, 3.50),  -- Capuccino
(105, 8, 1, 4.50),  -- Affogato
(106, 5, 1, 4.00),  -- Moka
(106, 4, 1, 3.75),  -- Latte
(107, 12, 1, 2.80), -- Té Negro
(107, 1, 1, 2.50),  -- Espresso
(108, 7, 1, 4.00),  -- Flat White
(108, 13, 1, 4.25), -- Matcha Latte
(109, 2, 1, 3.00),  -- Americano
(109, 5, 1, 4.00),  -- Moka
(110, 4, 1, 3.75),  -- Latte
(110, 6, 1, 3.25),  -- Macchiato
(111, 7, 1, 4.00),  -- Flat White
(111, 3, 1, 3.50),  -- Capuccino
(112, 10, 1, 3.75), -- Chocolate Caliente
(112, 9, 1, 3.50),  -- Café Descafeinado
(113, 14, 1, 4.50),  -- Frapuccino
(113, 1, 1, 2.50),  -- Espresso
(114, 6, 1, 3.25),  -- Macchiato
(114, 2, 1, 3.00),  -- Americano
(115, 7, 1, 4.00),  -- Flat White
(115, 8, 1, 4.50),  -- Affogato
(116, 4, 1, 3.75),  -- Latte
(116, 5, 1, 4.00),  -- Moka
(117, 1, 1, 2.50),  -- Espresso
(117, 3, 1, 3.50),  -- Capuccino
(118, 6, 1, 3.25),  -- Macchiato
(118, 14, 1, 4.50),  -- Frapuccino
(119, 9, 1, 3.50),  -- Café Descafeinado
(120, 12, 1, 2.80),

(121, 3, 1, 3.50),  -- Capuccino
(121, 10, 1, 3.75), -- Chocolate Caliente
(121, 2, 1, 3.00),  -- Americano
(122, 7, 1, 4.00),  -- Flat White
(122, 8, 1, 4.50),  -- Affogato
(122, 15, 1, 4.00), -- Chai Latte
(123, 5, 2, 8.00),  -- 2 Moka
(123, 13, 1, 4.25), -- Matcha Latte
(124, 6, 1, 3.25),  -- Macchiato
(124, 4, 1, 3.75),  -- Latte
(124, 9, 1, 3.50),  -- Café Descafeinado
(125, 14, 1, 4.50),  -- Frapuccino
(125, 7, 1, 4.00),  -- Flat White
(126, 1, 2, 5.00),  -- 2 Espressos
(126, 3, 1, 3.50),  -- Capuccino
(127, 8, 1, 4.50),  -- Affogato
(127, 10, 1, 3.75), -- Chocolate Caliente
(127, 6, 1, 3.25),  -- Macchiato
(128, 2, 1, 3.00),  -- Americano
(128, 5, 1, 4.00),  -- Moka
(129, 7, 1, 4.00),  -- Flat White
(129, 12, 1, 2.80), -- Té Negro
(130, 4, 2, 7.50),  -- 2 Lattes
(130, 6, 1, 3.25),  -- Macchiato
(131, 1, 1, 2.50),  -- Espresso
(131, 5, 1, 4.00),  -- Moka
(132, 15, 1, 4.00), -- Chai Latte
(132, 2, 1, 3.00),  -- Americano
(133, 13, 1, 4.25), -- Matcha Latte
(133, 3, 1, 3.50),  -- Capuccino
(134, 7, 1, 4.00),  -- Flat White
(134, 9, 1, 3.50),  -- Café Descafeinado
(135, 5, 1, 4.00),  -- Moka
(135, 8, 1, 4.50),  -- Affogato
(136, 14, 1, 4.50),  -- Frapuccino
(136, 3, 1, 3.50),  -- Capuccino
(137, 1, 1, 2.50),  -- Espresso
(137, 4, 1, 3.75),  -- Latte
(138, 10, 1, 3.75), -- Chocolate Caliente
(138, 7, 1, 4.00),  -- Flat White
(139, 6, 1, 3.25),  -- Macchiato
(139, 5, 1, 4.00),  -- Moka
(140, 12, 1, 2.80), -- Té Negro
(140, 8, 1, 4.50),  -- Affogato
(141, 7, 1, 4.00),  -- Flat White
(141, 6, 1, 3.25),  -- Macchiato
(142, 13, 1, 4.25), -- Matcha Latte
(142, 15, 1, 4.00), -- Chai Latte
(143, 1, 1, 2.50),  -- Espresso
(143, 14, 1, 4.50),  -- Frapuccino
(144, 5, 2, 8.00),  -- 2 Moka
(144, 4, 1, 3.75),  -- Latte
(145, 6, 1, 3.25),  -- Macchiato
(145, 9, 1, 3.50),  -- Café Descafeinado
(146, 8, 1, 4.50),  -- Affogato
(146, 2, 1, 3.00),  -- Americano
(147, 3, 1, 3.50),  -- Capuccino
(147, 10, 1, 3.75), -- Chocolate Caliente
(148, 4, 1, 3.75),  -- Latte
(148, 1, 1, 2.50),  -- Espresso
(149, 15, 1, 4.00), -- Chai Latte
(149, 12, 1, 2.80), -- Té Negro
(150, 7, 1, 4.00),  -- Flat White
(150, 3, 1, 3.50),  -- Capuccino
(151, 9, 1, 3.50),  -- Café Descafeinado
(151, 6, 1, 3.25),  -- Macchiato
(152, 14, 1, 4.50),  -- Frapuccino
(152, 2, 1, 3.00),  -- Americano
(153, 13, 1, 4.25), -- Matcha Latte
(153, 4, 1, 3.75),  -- Latte
(154, 1, 1, 2.50),  -- Espresso
(154, 7, 1, 4.00),  -- Flat White
(155, 8, 1, 4.50),  -- Affogato
(155, 10, 1, 3.75), -- Chocolate Caliente
(156, 5, 1, 4.00),  -- Moka
(156, 12, 1, 2.80), -- Té Negro
(157, 3, 1, 3.50),  -- Capuccino
(157, 6, 1, 3.25),  -- Macchiato
(158, 4, 1, 3.75),  -- Latte
(158, 15, 1, 4.00), -- Chai Latte
(159, 1, 2, 5.00),  -- 2 Espressos
(159, 9, 1, 3.50),  -- Café Descafeinado
(160, 7, 1, 4.00),  -- Flat White
(160, 13, 1, 4.25), -- Matcha Latte
(161, 8, 1, 4.50),  -- Affogato
(161, 2, 1, 3.00),  -- Americano
(162, 6, 1, 3.25),  -- Macchiato
(162, 5, 1, 4.00),  -- Moka
(163, 3, 2, 7.00),  -- 2 Capuccinos
(163, 4, 1, 3.75),  -- Latte
(164, 14, 1, 4.50),  -- Frapuccino
(164, 12, 1, 2.80), -- Té Negro
(165, 1, 1, 2.50),  -- Espresso
(165, 7, 1, 4.00),  -- Flat White
(166, 15, 1, 4.00), -- Chai Latte
(166, 10, 1, 3.75), -- Chocolate Caliente
(167, 4, 1, 3.75),  -- Latte
(167, 13, 1, 4.25), -- Matcha Latte
(168, 6, 1, 3.25),  -- Macchiato
(168, 8, 1, 4.50),  -- Affogato
(169, 2, 1, 3.00),  -- Americano
(169, 1, 1, 2.50),  -- Espresso
(170, 3, 1, 3.50),  -- Capuccino
(170, 5, 1, 4.00);  -- Moka

SELECT * FROM detalle_pedido;


DELETE FROM detalle_pedido;
ALTER TABLE detalle_pedido AUTO_INCREMENT = 1;

START TRANSACTION;
SAVEPOINT ampliando_pedido;
INSERT INTO pedido (id_pedido, fecha, hora, total) VALUES
(9, '2025-03-27', '08:30', 19.75),
(10, '2025-03-27', '09:00', 8.00),
(11, '2025-03-27', '09:30', 7.75),
(12, '2025-03-27', '10:00', 8.00),
(13, '2025-03-27', '10:30', 6.80),
(14, '2025-03-27', '11:00', 7.75),
(15, '2025-03-27', '11:30', 14.00),
(16, '2025-03-27', '12:00', 6.25),
(17, '2025-03-27', '12:30', 8.25),
(18, '2025-03-27', '13:00', 7.00),
(19, '2025-03-27', '13:30', 7.75);

INSERT INTO pedido (id_pedido, fecha, hora, total) VALUES
(20, '2025-03-27', '14:00', 12.25),
(21, '2025-03-27', '14:30', 8.00),
(22, '2025-03-27', '15:00', 9.50),
(23, '2025-03-27', '15:30', 10.75),
(24, '2025-03-27', '16:00', 9.75),
(25, '2025-03-27', '16:30', 11.75),
(26, '2025-03-27', '17:00', 7.25),
(27, '2025-03-27', '17:30', 8.50),
(28, '2025-03-27', '18:00', 6.25),
(29, '2025-03-27', '18:30', 9.75);

INSERT INTO pedido (id_pedido, fecha, hora, total) VALUES
(30, '2025-03-28', '00:30', 6.25),
(31, '2025-03-28', '01:00', 9.00),
(32, '2025-03-28', '01:30', 10.00),
(33, '2025-03-28', '02:00', 8.25),
(34, '2025-03-28', '02:30', 6.75),
(35, '2025-03-28', '03:00', 7.50),
(36, '2025-03-28', '03:30', 7.25),
(37, '2025-03-28', '04:00', 5.50),
(38, '2025-03-28', '04:30', 6.00),
(39, '2025-03-28', '05:00', 8.50),
(40, '2025-03-28', '05:30', 7.25),
(41, '2025-03-28', '06:00', 9.50),
(42, '2025-03-28', '06:30', 8.00),
(43, '2025-03-28', '07:00', 7.75),
(44, '2025-03-28', '07:30', 6.25),
(45, '2025-03-28', '08:00', 7.50);

INSERT INTO pedido (id_pedido, fecha, hora, total) VALUES
(46, '2025-03-28', '08:30', 8.25),
(47, '2025-03-28', '09:00', 9.00),
(48, '2025-03-28', '09:30', 6.50),
(49, '2025-03-28', '10:00', 7.75),
(50, '2025-03-28', '10:30', 9.25),
(51, '2025-03-28', '11:00', 7.00),
(52, '2025-03-28', '11:30', 6.75),
(53, '2025-03-28', '12:00', 8.00),
(54, '2025-03-28', '12:30', 9.50),
(55, '2025-03-28', '13:00', 10.00),
(56, '2025-03-28', '13:30', 7.50),
(57, '2025-03-28', '14:00', 6.25),
(58, '2025-03-28', '14:30', 9.75),
(59, '2025-03-28', '15:00', 8.25),
(60, '2025-03-28', '15:30', 10.00),
(61, '2025-03-28', '16:00', 7.00),
(62, '2025-03-28', '16:30', 8.50),
(63, '2025-03-28', '17:00', 9.25),
(64, '2025-03-28', '17:30', 6.50),
(65, '2025-03-28', '18:00', 8.75),
(66, '2025-03-28', '18:30', 7.25),
(67, '2025-03-28', '19:00', 9.00),
(68, '2025-03-28', '19:30', 8.50),
(69, '2025-03-28', '20:00', 7.75),
(70, '2025-03-28', '20:30', 9.50),
(71, '2025-03-28', '21:00', 6.75),
(72, '2025-03-28', '21:30', 8.25),
(73, '2025-03-28', '22:00', 7.50),
(74, '2025-03-28', '22:30', 9.75),
(75, '2025-03-28', '23:00', 6.00),
(76, '2025-03-28', '23:30', 8.75),
(77, '2025-03-29', '00:00', 9.00),
(78, '2025-03-29', '00:30', 7.25),
(79, '2025-03-29', '01:00', 8.50),
(80, '2025-03-29', '01:30', 7.00),
(81, '2025-03-29', '02:00', 6.75),
(82, '2025-03-29', '02:30', 8.25),
(83, '2025-03-29', '03:00', 9.50),
(84, '2025-03-29', '03:30', 7.75),
(85, '2025-03-29', '04:00', 8.00),
(86, '2025-03-29', '04:30', 9.25),
(87, '2025-03-29', '05:00', 6.50),
(88, '2025-03-29', '05:30', 8.75),
(89, '2025-03-29', '06:00', 7.25),
(90, '2025-03-29', '06:30', 9.00),
(91, '2025-03-29', '07:00', 6.75),
(92, '2025-03-29', '07:30', 8.00),
(93, '2025-03-29', '08:00', 9.50),
(94, '2025-03-29', '08:30', 7.50),
(95, '2025-03-29', '09:00', 6.25),
(96, '2025-03-29', '09:30', 8.25),
(97, '2025-03-29', '10:00', 9.75),
(98, '2025-03-29', '10:30', 7.25),
(99, '2025-03-29', '11:00', 6.00),
(100, '2025-03-29', '11:30', 8.50);

INSERT INTO pedido (id_pedido, fecha, hora, total) VALUES
(101, '2025-03-29', '12:00', 9.00),
(102, '2025-03-29', '12:30', 8.75),
(103, '2025-03-29', '13:00', 7.50),
(104, '2025-03-29', '13:30', 9.25),
(105, '2025-03-29', '14:00', 6.25),
(106, '2025-03-29', '14:30', 8.50),
(107, '2025-03-29', '15:00', 9.75),
(108, '2025-03-29', '15:30', 7.25),
(109, '2025-03-29', '16:00', 8.00),
(110, '2025-03-29', '16:30', 9.00),
(111, '2025-03-29', '17:00', 6.50),
(112, '2025-03-29', '17:30', 8.25),
(113, '2025-03-29', '18:00', 7.75),
(114, '2025-03-29', '18:30', 9.50),
(115, '2025-03-29', '19:00', 6.00),
(116, '2025-03-29', '19:30', 8.75),
(117, '2025-03-29', '20:00', 9.25),
(118, '2025-03-29', '20:30', 7.50),
(119, '2025-03-29', '21:00', 8.50),
(120, '2025-03-29', '21:30', 6.75),
(121, '2025-03-29', '22:00', 7.00),
(122, '2025-03-29', '22:30', 8.25),
(123, '2025-03-29', '23:00', 6.25),
(124, '2025-03-29', '23:30', 9.50),
(125, '2025-03-30', '00:00', 7.25),
(126, '2025-03-30', '00:30', 8.00),
(127, '2025-03-30', '01:00', 9.00),
(128, '2025-03-30', '01:30', 7.75),
(129, '2025-03-30', '02:00', 6.50),
(130, '2025-03-30', '02:30', 8.25),
(131, '2025-03-30', '03:00', 9.25),
(132, '2025-03-30', '03:30', 7.50),
(133, '2025-03-30', '04:00', 8.75),
(134, '2025-03-30', '04:30', 9.50),
(135, '2025-03-30', '05:00', 7.00),
(136, '2025-03-30', '05:30', 8.25),
(137, '2025-03-30', '06:00', 6.75),
(138, '2025-03-30', '06:30', 9.00),
(139, '2025-03-30', '07:00', 7.25),
(140, '2025-03-30', '07:30', 8.50),
(141, '2025-03-30', '08:00', 9.75),
(142, '2025-03-30', '08:30', 6.25),
(143, '2025-03-30', '09:00', 7.75),
(144, '2025-03-30', '09:30', 8.00),
(145, '2025-03-30', '10:00', 9.25),
(146, '2025-03-30', '10:30', 7.00),
(147, '2025-03-30', '11:00', 8.75),
(148, '2025-03-30', '11:30', 9.00),
(149, '2025-03-30', '12:00', 6.50),
(150, '2025-03-30', '12:30', 7.25),
(151, '2025-03-30', '13:00', 8.50),
(152, '2025-03-30', '13:30', 9.75),
(153, '2025-03-30', '14:00', 6.75),
(154, '2025-03-30', '14:30', 7.50),
(155, '2025-03-30', '15:00', 8.25),
(156, '2025-03-30', '15:30', 9.00),
(157, '2025-03-30', '16:00', 6.25),
(158, '2025-03-30', '16:30', 8.75),
(159, '2025-03-30', '17:00', 9.00),
(160, '2025-03-30', '17:30', 7.25),
(161, '2025-03-30', '18:00', 8.50),
(162, '2025-03-30', '18:30', 9.25),
(163, '2025-03-30', '19:00', 7.75),
(164, '2025-03-30', '19:30', 8.00),
(165, '2025-03-30', '20:00', 9.50),
(166, '2025-03-30', '20:30', 7.25),
(167, '2025-03-30', '21:00', 8.25),
(168, '2025-03-30', '21:30', 6.75),
(169, '2025-03-30', '22:00', 9.75),
(170, '2025-03-30', '22:30', 7.50);

SAVEPOINT verificando_precios;
UPDATE detalle_pedido
SET subtotal = calcular_subtotal(id_producto, cantidad);

UPDATE pedido
SET total = calcular_total_pedido(id_pedido);

COMMIT;


