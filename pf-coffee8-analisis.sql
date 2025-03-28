-- ANÁLISIS
-- 1. VENTAS:

-- 1.1 Ventas de un periodo (lo que va del año)

SELECT SUM(total) AS ventas_totales, COUNT(*) AS cantidad_pedidos
FROM pedido
WHERE fecha BETWEEN '2025-01-01' AND '2025-03-28'; -- ventas totales US$524.60 y 69 pedidos en total

-- 1.2 Ventas por producto en cierto espacio de tiempo

SELECT cantidad_ventas_producto (3, '2025-01-01', '2025-03-28') AS capuccinos_vendidos; -- 18 capuccinos vendidos en 2025

-- 1.3 Los productos más y menos vendidos
SELECT p.nombre_producto, SUM(dp.cantidad) AS total_vendido, SUM(dp.subtotal) AS ingresos_generados
FROM detalle_pedido dp
JOIN producto p ON dp.id_producto = p.id_producto
GROUP BY p.nombre_producto
ORDER BY total_vendido DESC; -- de la totalidad de los registros, el producto más vendido es el Capuccino, seguido por Moka y Espresso. El menos vendido es el Té verde.

-- 1.4 Ventas diarias
SELECT fecha, SUM(total) AS ventas_del_dia
FROM pedido
GROUP BY fecha
ORDER BY fecha DESC; 

-- 2. RENTABILIDAD
-- 2.1 Productos más rentables (mayor margen de ganancia)

SELECT p.nombre_producto, p.precio, 
       SUM(r.cantidad * i.costo_unitario) AS costo_total,
       (p.precio - SUM(r.cantidad * i.costo_unitario)) AS margen_ganancia
FROM producto p
JOIN receta r ON p.id_producto = r.id_producto
JOIN insumo i ON r.id_insumo = i.id_insumo
GROUP BY p.id_producto
ORDER BY margen_ganancia DESC; -- Chai latte el producto más rentable, espresso el menos rentable.

-- 2.2 Rentabilidad total por producto

SELECT p.nombre_producto, 
       SUM(dp.cantidad * (p.precio - (SELECT SUM(r.cantidad * i.costo_unitario) 
                                      FROM receta r 
                                      JOIN insumo i ON r.id_insumo = i.id_insumo
                                      WHERE r.id_producto = p.id_producto))) AS ganancia_total
FROM detalle_pedido dp
JOIN producto p ON dp.id_producto = p.id_producto
GROUP BY p.id_producto
ORDER BY ganancia_total DESC; -- Capuccino lidera, té verde es el último por lo que podría cuestionarse su estadía en la carta

-- 2.3 Margen de rentabilidad general 

SELECT SUM(pe.total) AS ingresos, 
       SUM(dp.cantidad * (SELECT SUM(r.cantidad * i.costo_unitario) 
                          FROM receta r 
                          JOIN insumo i ON r.id_insumo = i.id_insumo
                          WHERE r.id_producto = dp.id_producto)) AS costos_totales, 
       SUM(pe.total) - SUM(dp.cantidad * (SELECT SUM(r.cantidad * i.costo_unitario) 
                                         FROM receta r 
                                         JOIN insumo i ON r.id_insumo = i.id_insumo
                                         WHERE r.id_producto = dp.id_producto)) AS ganancia
FROM pedido pe
JOIN detalle_pedido dp ON pe.id_pedido = dp.id_pedido; -- ganancia de US$ 2536.0125 tomando en cuenta la totalidad de los registros. (ojo: no se consideran otros costos)


-- 3. INVENTARIOS

-- 3.1 Costo total de los insumos en stock

SELECT nombre_insumo, SUM(i.stock_actual * i.costo_unitario) AS costo_total_inventario
FROM insumo i
GROUP BY nombre_insumo;

-- 4. ESTRATEGIA COMERCIAL

-- 4.1 Productos más comprados juntos
SELECT dp1.id_producto AS producto1, dp2.id_producto AS producto2, COUNT(*) AS veces_comprados_juntos
FROM detalle_pedido dp1
JOIN detalle_pedido dp2 ON dp1.id_pedido = dp2.id_pedido AND dp1.id_producto <> dp2.id_producto
GROUP BY dp1.id_producto, dp2.id_producto
ORDER BY veces_comprados_juntos DESC
LIMIT 10; -- productos 8 y 6 son los que más se han comprado juntos (affogato y macchiato)

-- 4.2 Horarios con mayor cantidad de pedidos
SELECT HOUR(hora) AS hora, COUNT(id_pedido) AS cantidad_pedidos
FROM pedido
GROUP BY HOUR(hora)
ORDER BY cantidad_pedidos DESC; -- Entre las 9 y las 10 son los horarios que más pedidos se reciben

