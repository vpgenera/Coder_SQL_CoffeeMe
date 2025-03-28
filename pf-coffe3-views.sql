-- VISTAS

-- 1. Vista de pedidos, detalles y productos:
DROP VIEW IF EXISTS vw_pedido_detalle_producto;
CREATE VIEW vw_pedido_detalle_producto AS
SELECT dp.id_pedido, dp.id_detalle, dp.id_producto, pr.nombre_producto, dp.cantidad, pr.precio, pe.total, pe.fecha, pe.hora
FROM detalle_pedido dp
INNER JOIN pedido pe ON pe.id_pedido = dp.id_pedido
INNER JOIN producto pr ON pr.id_producto = dp.id_producto
;

SELECT * FROM vw_pedido_detalle_producto; 


-- 2. Vista de productos, recetas e insumos:
DROP VIEW IF EXISTS vw_producto_receta_insumo;
CREATE VIEW vw_producto_receta_insumo AS
SELECT r.id_receta, pr.id_producto,pr.nombre_producto, i.nombre_insumo,i.id_insumo,r.cantidad, r.unidad
FROM receta r
INNER JOIN insumo i ON  r.id_insumo= i.id_insumo
INNER JOIN producto pr ON pr.id_producto = r.id_producto;
;

SELECT * FROM vw_producto_receta_insumo;

-- 3. Vista de inventario critico:
DROP VIEW IF EXISTS vw_inventario_critico;
CREATE VIEW vw_inventario_critico AS
SELECT id_insumo, nombre_insumo, stock_actual, stock_minimo
FROM insumo
WHERE stock_actual <= stock_minimo
;

SELECT * FROM vw_inventario_critico;







  


