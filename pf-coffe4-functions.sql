-- FUNCIONES 


-- 1. Fn para obtener el stock disponible de un insumo:

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


-- 2. Fn Cantidad vendida por producto

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



-- 3. Fn para que detalle_pedido calcule el subtotal según el precio del producto en la tabla producto

DELIMITER $$

CREATE FUNCTION calcular_subtotal(p_id_producto INT, p_cantidad INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE v_precio DECIMAL(10,2);
    DECLARE v_subtotal DECIMAL(10,2);
    
    -- Obtener el precio del producto, asegurando que solo devuelve una fila
    SELECT precio INTO v_precio
    FROM producto
    WHERE id_producto = p_id_producto
    LIMIT 1; -- Esto evita el error de múltiples filas
    
    -- Calcular el subtotal
    SET v_subtotal = v_precio * p_cantidad;
    
    RETURN v_subtotal;
END $$

DELIMITER ;


-- 4. Fn para que el total de Pedido se calcule desde los subtotales de Detalle_pedido

DELIMITER $$

CREATE FUNCTION calcular_total_pedido(p_id_pedido INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE v_total DECIMAL(10,2);

    -- Sumar todos los subtotales del pedido específico
    SELECT COALESCE(SUM(subtotal), 0) INTO v_total
    FROM detalle_pedido
    WHERE id_pedido = p_id_pedido;

    RETURN v_total;
END $$

DELIMITER ;














