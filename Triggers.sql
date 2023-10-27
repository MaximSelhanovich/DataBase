USE restaurant;

SET @CUR_ID = 3;
DROP PROCEDURE IF EXISTS logger;
DELIMITER //
CREATE PROCEDURE logger(actor_id INT UNSIGNED, CRUD VARCHAR(50), acted_upon_type VARCHAR(50), acted_upon_id INT UNSIGNED)
BEGIN
	INSERT INTO restaurant.loggs(user_id, performed_action, acted_upon_type, acted_upon_id)
    VALUE (actor_id, CRUD, acted_upon_type, acted_upon_id);
END //
DELIMITER ;
DROP TRIGGER IF EXISTS calc_total_price_insert;
DELIMITER //
CREATE TRIGGER calc_total_price_insert
	BEFORE INSERT ON restaurant.payments
	FOR EACH ROW
	BEGIN
		SET NEW.total_price = NEW.price + NEW.TAX + NEW.tips;
	END //
DELIMITER ;


DROP TRIGGER IF EXISTS calc_total_price_update;
DELIMITER //
CREATE TRIGGER calc_total_price_update
	BEFORE UPDATE ON restaurant.payments
	FOR EACH ROW
	BEGIN
		SET NEW.total_price = NEW.price + NEW.TAX + NEW.tips;
	END //
DELIMITER ;


DROP TRIGGER IF EXISTS set_order_paid;
DELIMITER //
CREATE TRIGGER set_order_paid
	BEFORE INSERT ON restaurant.payments
	FOR EACH ROW
	BEGIN
		UPDATE restaurant.orders
        SET paid = TRUE
        WHERE order_id = NEW.order_id;
	END //
DELIMITER ;