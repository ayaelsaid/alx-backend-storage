-- creates a trigger that decreases the quantity of an item

DELIMITER $$

CREATE TRIGGER update_quantity
BEFORE UPDATE ON items
FOR EACH ROW
BEGIN
    SET NEW.quantity = items.quantity - order.number
END $$

DELIMITER ;
