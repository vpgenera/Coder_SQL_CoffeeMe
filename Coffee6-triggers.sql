-- TRIGGERS

-- 1. Trigger para descontar inventario por venta de producto

DELIMITER //
CREATE TRIGGER descontar_stock
AFTER INSERT ON detalle_pedido
FOR EACH ROW
BEGIN
    -- Restar stock de insumos según la receta del producto vendido
    UPDATE insumo i
    JOIN receta r ON i.id_insumo = r.id_insumo
    SET i.stock_actual = i.stock_actual - (r.cantidad * NEW.cantidad)
    WHERE r.id_producto = NEW.id_producto;
    
    -- Registrar el movimiento de stock en movim_inventario
    INSERT INTO movim_inventario (tipo, id_insumo, cantidad, motivo, fecha, hora)
    SELECT 'SALIDA', r.id_insumo, r.cantidad * NEW.cantidad, 
           CONCAT('Venta de producto ID ', NEW.id_producto), NOW(), NOW()
    FROM receta r
    WHERE r.id_producto = NEW.id_producto;
END //
DELIMITER ;
-- probamos con el sp: 
INSERT INTO detalle_pedido (id_pedido, id_producto, cantidad, subtotal) 
VALUES (@id_pedido, 2, 1, 0); -- 1 Americano.

-- 2. Trigger de auditoría
-- (*Como ta tabla movim_inventario ya posee información de los movimientos de stock -> creo log_auditoria2 para el historial más detallado)
-- Crear la tabla de auditoría
CREATE TABLE log_auditoria2 (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    id_movimiento INT,
    id_insumo INT,
    accion VARCHAR(10),  -- 'UPDATE' o 'DELETE'
    cantidad_antes DECIMAL(10,2),
    cantidad_despues DECIMAL(10,2) NULL,
    usuario VARCHAR(50),
    fecha DATETIME DEFAULT NOW(),
    descripcion TEXT
);

DELIMITER //

-- Trigger para registrar cambios en movim_inventario (UPDATE)
CREATE TRIGGER auditoria_update_movim_inventario
AFTER UPDATE ON movim_inventario
FOR EACH ROW
BEGIN
    INSERT INTO log_auditoria2 (id_movimiento, id_insumo, accion, cantidad_antes, cantidad_despues, usuario, descripcion)
    VALUES (OLD.id_movimiento, OLD.id_insumo, 'UPDATE', OLD.cantidad, NEW.cantidad, USER(), 
            CONCAT('Modificación en movim_inventario: Cantidad de ', OLD.cantidad, ' a ', NEW.cantidad));
END;
//

-- Trigger para registrar eliminaciones en movim_inventario (DELETE)
CREATE TRIGGER auditoria_delete_movim_inventario
AFTER DELETE ON movim_inventario
FOR EACH ROW
BEGIN
    INSERT INTO log_auditoria2 (id_movimiento, id_insumo, accion, cantidad_antes, usuario, descripcion)
    VALUES (OLD.id_movimiento, OLD.id_insumo, 'DELETE', OLD.cantidad, USER(), 
            CONCAT('Se eliminó un registro en movim_inventario con cantidad ', OLD.cantidad));
END;
//

DELIMITER ;

-- Probando:
INSERT INTO detalle_pedido (id_pedido, id_producto, cantidad, subtotal) 
VALUES (@id_pedido, 2, 1, 0); -- No activa el trigger por ser INSERT

UPDATE movim_inventario
SET cantidad = 20
WHERE id_movimiento = 29; -- Activa el trigger y crea un registro en log_auditoría 2

SELECT * FROM log_auditoria2;

DELETE FROM movim_inventario WHERE id_movimiento IN (33,34);