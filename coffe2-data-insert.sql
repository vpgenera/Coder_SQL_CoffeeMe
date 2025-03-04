-- INSERCIÓN DE DATOS
USE COFFE;

INSERT INTO producto(nombre_producto, descripcion_producto, precio) VALUES
('Espresso', 'Café concentrado con un sabor fuerte.', 2.50),
('Americano', 'Espresso diluido con agua caliente.', 3.00),
('Capuccino', 'Espresso con espuma de leche vaporizada.', 3.50),
('Latte', 'Espresso con mucha leche vaporizada.', 3.75),
('Moka', 'Café con chocolate y leche vaporizada.', 4.00),
('Macchiato', 'Espresso con un toque de espuma de leche.', 3.25),
('Flat White', 'Café con leche texturizada, más intenso que un latte.', 4.00),
('Affogato', 'Café espresso con helado de vainilla.', 4.50),
('Café Descafeinado', 'Café sin cafeína, suave y equilibrado.', 3.50),
('Chocolate Caliente', 'Bebida caliente a base de cacao.', 3.75),
('Té Verde', 'Infusión de hojas de té verde.', 2.80),
('Té Negro', 'Infusión fuerte de hojas de té negro.', 2.80),
('Matcha Latte', 'Bebida de té matcha con leche vaporizada.', 4.25),
('Frapuccino', 'Bebida fría con café, leche y hielo.', 4.50),
('Chai Latte', 'Infusión de especias con leche vaporizada.', 4.00);

SELECT * FROM producto;

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



INSERT INTO pedido(fecha, hora, total) VALUES
('2024-02-25', '08:30:00', 11.00),  -- 3.50 + 3.75 + 3.75
('2024-02-25', '09:00:00', 9.50),   -- 2.50 + 3.00 + 4.00
('2024-02-25', '09:15:00', 7.50),   -- 7.50
('2024-02-25', '10:00:00', 14.55),  -- 4.50 + 3.25 + 4.00 + 2.80
('2024-02-25', '10:30:00', 4.50),   -- 4.50
('2024-02-25', '11:00:00', 10.30),  -- 4.00 + 3.50 + 2.80
('2024-02-25', '12:00:00', 8.25),   -- 4.00 + 4.25
('2024-02-25', '13:15:00', 9.25);   -- 3.00 + 2.50 + 3.75

UPDATE pedido SET total = 7.00 WHERE id_pedido =3;
UPDATE detalle_pedido SET subtotal = 7.00 WHERE id_pedido =3;


INSERT INTO detalle_pedido (id_pedido, id_producto, cantidad, subtotal) VALUES
(1, 3, 1, 3.50),  -- Capuccino
(1, 4, 1, 3.75),  -- Latte
(1, 10, 1, 3.75), -- Chocolate Caliente
(2, 1, 1, 2.50),  -- Espresso
(2, 2, 1, 3.00),  -- Americano
(2, 5, 1, 4.00),  -- Moka
(3, 3, 2, 7.50),  -- 2 Capuccinos
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

INSERT INTO movim_inventario(tipo, id_insumo, cantidad, motivo, fecha, hora) VALUES
('ENTRADA', 1, 5, 'Compra de café en grano', '2024-02-21', '10:00:00'); -- inserción para probar función stock insumo
