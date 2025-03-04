-- STORED PROCEDURES

-- 1. SP para obtener los productos que llevan el insumo (nivel facil para entender)

SELECT r.id_producto, pr.nombre_producto
FROM receta r 
	JOIN producto pr ON r.id_producto= pr.id_producto; -- entendiendo la consulta
    
-- creando el sp:
DELIMITER //
CREATE PROCEDURE obtener_productos_por_insumo(IN p_id_insumo INT)
BEGIN 
	SELECT r.id_producto, pr.nombre_producto
	FROM receta r 
		JOIN producto pr ON r.id_producto= pr.id_producto
	WHERE r.id_insumo = p_id_insumo;

END //
DELIMITER ;

CALL obtener_productos_por_insumo(2); -- los productos que usan el insumo nro 2 (leche).

-- 2. SP para registrar compra de insumos y modificar stock disponible
--  * Registrar la compra en una tabla movim_inventario.
-- 	* Aumentar el stock de los insumos comprados.

DELIMITER //
CREATE PROCEDURE registro_compra_insumo(IN p_id_insumo INT, IN p_cantidad DECIMAL(10,2), IN p_motivo VARCHAR(250))
BEGIN
    -- Insertar el movimiento en la tabla de mov_inventario
    INSERT INTO movim_inventario (id_insumo, tipo, cantidad, motivo, fecha, hora)
    VALUES (p_id_insumo, 'ENTRADA', p_cantidad, p_motivo, CURDATE(), CURTIME());

    -- Actualizar el stock del insumo
    UPDATE insumo 
    SET stock_actual = stock_actual + p_cantidad 
    WHERE id_insumo = p_id_insumo;
END //
DELIMITER ;

CALL registro_compra_insumo(2, 10, 'Compra de leche a proveedor Bidfood');

-- 3.SP para registrar venta de productos y modificar el stock disponible

DELIMITER //
CREATE PROCEDURE registro_pedido(
    IN p_fecha DATE,
    IN p_hora TIME,
    OUT p_id_pedido INT  -- Agregamos un parámetro de salida para obtener el ID del pedido
)
BEGIN
    -- Insertar un nuevo pedido con total en 0 inicialmente
    INSERT INTO pedido (fecha, hora, total) VALUES (p_fecha, p_hora, 0);

    -- Obtener el ID del pedido recién insertado y almacenarlo en la variable de salida
    SET p_id_pedido = LAST_INSERT_ID();
END //
DELIMITER ;

CALL registro_pedido(CURDATE(), CURTIME(), @id_pedido); -- crea nuevo pedido y obtiene @id_pedido

INSERT INTO detalle_pedido (id_pedido, id_producto, cantidad, subtotal) 
VALUES (@id_pedido, 4, 2, 0), -- 2 Lattes
       (@id_pedido, 3, 1, 0); -- 1 Capuccino.      /Agrega los productos al pedido con @id_pedido

UPDATE detalle_pedido dp
JOIN producto p ON dp.id_producto = p.id_producto
SET dp.subtotal = dp.cantidad * p.precio
WHERE dp.id_pedido = @id_pedido;  -- Calcula los subtotales.

UPDATE pedido p
SET p.total = (
    SELECT COALESCE(SUM(dp.subtotal), 0)
    FROM detalle_pedido dp
    WHERE dp.id_pedido = p.id_pedido
)
WHERE p.id_pedido = @id_pedido;  -- Suma los subtotales y actualiza el total en pedido.


--
INSERT INTO detalle_pedido (id_pedido, id_producto, cantidad, subtotal) 
VALUES (@id_pedido, 2, 1, 0); -- 1 Americano.


