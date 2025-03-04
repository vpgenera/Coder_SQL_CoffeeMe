-- FUNCIONES 

-- 1. Fn para calcular el total de un pedido:

SELECT * FROM vw_pedido_detalle_producto; -- (usando la vista)


SELECT id_pedido, SUM(cantidad * precio) AS total
FROM vw_pedido_detalle_producto
GROUP BY id_pedido; -- (entendiendo la dinámica de la consulta, con vw)

SELECT dp.id_pedido, SUM(dp.cantidad * pr.precio) AS total
FROM detalle_pedido dp
	INNER JOIN pedido pe ON pe.id_pedido = dp.id_pedido
	INNER JOIN producto pr ON pr.id_producto = dp.id_producto
GROUP BY dp.id_pedido;-- (cambiando la vw por la consulta original)

-- Crear la fn:
DELIMITER $$
CREATE FUNCTION calcular_total_pedido(p_id_pedido INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);
    
    SELECT SUM(dp.cantidad * pr.precio) INTO total
	FROM detalle_pedido dp
		INNER JOIN pedido pe ON pe.id_pedido = dp.id_pedido
		INNER JOIN producto pr ON pr.id_producto = dp.id_producto
	WHERE dp.id_pedido = p_id_pedido;

    RETURN COALESCE (total, 0);
END $$
DELIMITER;

SELECT calcular_total_pedido(1); 



-- 2. Fn para obtener el stock disponible de un insumo:

DELIMITER $$
CREATE FUNCTION obtener_stock_insumo(p_id_insumo INT) 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE stock_actual INT;

    SELECT COALESCE(SUM(
        CASE 
            WHEN tipo = 'entrada' THEN cantidad
            WHEN tipo = 'salida' THEN -cantidad
            ELSE 0 
        END
    ), 0) 
    INTO stock_actual
    FROM movim_inventario
    WHERE id_insumo = p_id_insumo;
    RETURN stock_actual;
END $$
DELIMITER ;

SELECT obtener_stock_insumo(1);


-- 3. Fn Cantidad vendida por producto

SELECT SUM(cantidad) AS cantidad
    FROM vw_pedido_detalle_producto
    WHERE id_producto = 3 AND fecha BETWEEN '2024-02-22' AND '2024-02-26'; -- entender la consulta, con vw
    
SELECT dp.id_producto, pe.fecha, SUM(dp.cantidad) AS cantidad 
FROM detalle_pedido dp
	INNER JOIN pedido pe ON pe.id_pedido = dp.id_pedido
	INNER JOIN producto pr ON pr.id_producto = dp.id_producto
GROUP BY pr.id_producto, pe.fecha
HAVING dp.id_producto = 3 AND fecha BETWEEN '2024-02-22' AND '2024-02-26'; -- entendiendo la consulta, sin vw


-- Definiendo la fn:
DELIMITER $$
CREATE FUNCTION cantidad_ventas_producto(p_id_producto INT, p_fechaInicio DATE, p_fechaFin DATE)
RETURNS INT DETERMINISTIC
BEGIN
    DECLARE cantidad INT;
    
    SELECT COALESCE(SUM(dp.cantidad), 0) INTO cantidad
    FROM detalle_pedido dp
		INNER JOIN pedido pe ON pe.id_pedido = dp.id_pedido
		INNER JOIN producto pr ON pr.id_producto = dp.id_producto
    WHERE dp.id_producto = p_id_producto AND pe.fecha BETWEEN p_fechaInicio AND p_fechaFin;
    
    RETURN cantidad;
END $$
DELIMITER ;

SELECT cantidad_ventas_producto (3, '2024-02-22', '2024-02-26') AS capuccinos_vendidos; -- 3 capuccinos










