DROP TRIGGER IF EXISTS create_dish_log;
DELIMITER //
CREATE TRIGGER create_dish_log
	BEFORE INSERT ON restaurant.dishes
	FOR EACH ROW
	BEGIN
		CALL logger(@CUR_ID, 'create', 'dish', NEW.dish_id);
	END //
DELIMITER ;

DROP TRIGGER IF EXISTS create_ingredient_log;
DELIMITER //
CREATE TRIGGER create_ingredient_log
	BEFORE INSERT ON restaurant.ingredients
	FOR EACH ROW
	BEGIN
		CALL logger(@CUR_ID, 'create', 'ingredient', NEW.ingredient_id);
	END //
DELIMITER ;

DROP TRIGGER IF EXISTS create_menu_log;
DELIMITER //
CREATE TRIGGER create_menu_log
	BEFORE INSERT ON restaurant.menus
	FOR EACH ROW
	BEGIN
		CALL logger(@CUR_ID, 'create', 'menu', NEW.menu_id);
	END //
DELIMITER ;

DROP TRIGGER IF EXISTS create_order_log;
DELIMITER //
CREATE TRIGGER create_order_log
	BEFORE INSERT ON restaurant.orders
	FOR EACH ROW
	BEGIN
		CALL logger(@CUR_ID, 'create', 'order', NEW.order_id);
	END //
DELIMITER ;

DROP TRIGGER IF EXISTS create_payment_log;
DELIMITER //
CREATE TRIGGER create_payment_log
	BEFORE INSERT ON restaurant.payments
	FOR EACH ROW
	BEGIN
		CALL logger(@CUR_ID, 'create', 'payment', NEW.payment_id);
	END //
DELIMITER ;

DROP TRIGGER IF EXISTS create_reservation_log;
DELIMITER //
CREATE TRIGGER create_reservation_log
	BEFORE INSERT ON restaurant.reservations
	FOR EACH ROW
	BEGIN
		CALL logger(@CUR_ID, 'create', 'reservation', NEW.reservation_id);
	END //
DELIMITER ;

DROP TRIGGER IF EXISTS create_role_log;
DELIMITER //
CREATE TRIGGER create_role_log
	BEFORE INSERT ON restaurant.roles
	FOR EACH ROW
	BEGIN
		CALL logger(@CUR_ID, 'create', 'role', NEW.role_id);
	END //
DELIMITER ;

DROP TRIGGER IF EXISTS create_table_log;
DELIMITER //
CREATE TRIGGER create_table_log
	BEFORE INSERT ON restaurant.tables
	FOR EACH ROW
	BEGIN
		CALL logger(@CUR_ID, 'create', 'table', NEW.table_id);
	END //
DELIMITER ;

DROP TRIGGER IF EXISTS create_user_log;
DELIMITER //
CREATE TRIGGER create_user_log
	BEFORE INSERT ON restaurant.users
	FOR EACH ROW
	BEGIN
		CALL logger(@CUR_ID, 'create', 'user', NEW.user_id);
	END //
DELIMITER ;

DROP TRIGGER IF EXISTS create_ingredient_dish_log;
DELIMITER //
CREATE TRIGGER create_ingredient_dish_log
	BEFORE INSERT ON restaurant.ingredients_dishes
	FOR EACH ROW
	BEGIN
		CALL logger(@CUR_ID, 'create', 'ingredient_dish', NEW.ingredient_dish_id);
	END //
DELIMITER ;

DROP TRIGGER IF EXISTS create_dish_menu_log;
DELIMITER //
CREATE TRIGGER create_dish_menu_log
	BEFORE INSERT ON restaurant.dishes_menus
	FOR EACH ROW
	BEGIN
		CALL logger(@CUR_ID, 'create', 'dish_menu', NEW.dish_menu_id);
	END //
DELIMITER ;

DROP TRIGGER IF EXISTS create_table_reservation_log;
DELIMITER //
CREATE TRIGGER create_table_reservation_log
	BEFORE INSERT ON restaurant.tables_reservations
	FOR EACH ROW
	BEGIN
		CALL logger(@CUR_ID, 'create', 'table_reservation', NEW.table_reservation_id);
	END //
DELIMITER ;


DROP TRIGGER IF EXISTS create_dish_order_log;
DELIMITER //
CREATE TRIGGER create_dish_order_log
	BEFORE INSERT ON restaurant.dishes_orders
	FOR EACH ROW
	BEGIN
		CALL logger(@CUR_ID, 'create', 'dish_order', NEW.dish_order_id);
	END //
DELIMITER ;

DROP TRIGGER IF EXISTS update_dish_log;
DELIMITER //
CREATE TRIGGER update_dish_log
	BEFORE UPDATE ON restaurant.dishes
	FOR EACH ROW
	BEGIN
		CALL logger(@CUR_ID, 'update', 'dish', NEW.dish_id);
	END //
DELIMITER ;

DROP TRIGGER IF EXISTS update_ingredient_log;
DELIMITER //
CREATE TRIGGER update_ingredient_log
	BEFORE UPDATE ON restaurant.ingredients
	FOR EACH ROW
	BEGIN
		CALL logger(@CUR_ID, 'update', 'ingredient', NEW.ingredient_id);
	END //
DELIMITER ;

DROP TRIGGER IF EXISTS update_menu_log;
DELIMITER //
CREATE TRIGGER update_menu_log
	BEFORE UPDATE ON restaurant.menus
	FOR EACH ROW
	BEGIN
		CALL logger(@CUR_ID, 'update', 'menu', NEW.menu_id);
	END //
DELIMITER ;

DROP TRIGGER IF EXISTS update_order_log;
DELIMITER //
CREATE TRIGGER update_order_log
	BEFORE UPDATE ON restaurant.orders
	FOR EACH ROW
	BEGIN
		CALL logger(@CUR_ID, 'update', 'order', NEW.order_id);
	END //
DELIMITER ;

DROP TRIGGER IF EXISTS update_payment_log;
DELIMITER //
CREATE TRIGGER update_payment_log
	BEFORE UPDATE ON restaurant.payments
	FOR EACH ROW
	BEGIN
		CALL logger(@CUR_ID, 'update', 'payment', NEW.payment_id);
	END //
DELIMITER ;

DROP TRIGGER IF EXISTS update_reservation_log;
DELIMITER //
CREATE TRIGGER update_reservation_log
	BEFORE UPDATE ON restaurant.reservations
	FOR EACH ROW
	BEGIN
		CALL logger(@CUR_ID, 'update', 'reservation', NEW.reservation_id);
	END //
DELIMITER ;

DROP TRIGGER IF EXISTS update_role_log;
DELIMITER //
CREATE TRIGGER update_role_log
	BEFORE UPDATE ON restaurant.roles
	FOR EACH ROW
	BEGIN
		CALL logger(@CUR_ID, 'update', 'role', NEW.role_id);
	END //
DELIMITER ;

DROP TRIGGER IF EXISTS update_table_log;
DELIMITER //
CREATE TRIGGER update_table_log
	BEFORE UPDATE ON restaurant.tables
	FOR EACH ROW
	BEGIN
		CALL logger(@CUR_ID, 'update', 'table', NEW.table_id);
	END //
DELIMITER ;

DROP TRIGGER IF EXISTS update_user_log;
DELIMITER //
CREATE TRIGGER update_user_log
	BEFORE UPDATE ON restaurant.users
	FOR EACH ROW
	BEGIN
		CALL logger(@CUR_ID, 'update', 'user', NEW.user_id);
	END //
DELIMITER ;

DROP TRIGGER IF EXISTS update_ingredient_dish_log;
DELIMITER //
CREATE TRIGGER update_ingredient_dish_log
	BEFORE UPDATE ON restaurant.ingredients_dishes
	FOR EACH ROW
	BEGIN
		CALL logger(@CUR_ID, 'update', 'ingredient_dish', NEW.ingredient_dish_id);
	END //
DELIMITER ;

DROP TRIGGER IF EXISTS update_dish_menu_log;
DELIMITER //
CREATE TRIGGER update_dish_menu_log
	BEFORE UPDATE ON restaurant.dishes_menus
	FOR EACH ROW
	BEGIN
		CALL logger(@CUR_ID, 'update', 'dish_menu', NEW.dish_menu_id);
	END //
DELIMITER ;

DROP TRIGGER IF EXISTS update_table_reservation_log;
DELIMITER //
CREATE TRIGGER update_table_reservation_log
	BEFORE UPDATE ON restaurant.tables_reservations
	FOR EACH ROW
	BEGIN
		CALL logger(@CUR_ID, 'update', 'table_reservation', NEW.table_reservation_id);
	END //
DELIMITER ;


DROP TRIGGER IF EXISTS update_dish_order_log;
DELIMITER //
CREATE TRIGGER update_dish_order_log
	BEFORE UPDATE ON restaurant.dishes_orders
	FOR EACH ROW
	BEGIN
		CALL logger(@CUR_ID, 'update', 'dish_order', NEW.dish_order_id);
	END //
DELIMITER ;

DROP TRIGGER IF EXISTS delete_dish_log;
DELIMITER //
CREATE TRIGGER delete_dish_log
	BEFORE DELETE ON restaurant.dishes
	FOR EACH ROW
	BEGIN
		CALL logger(@CUR_ID, 'delete', 'dish', OLD.dish_id);
	END //
DELIMITER ;

DROP TRIGGER IF EXISTS delete_ingredient_log;
DELIMITER //
CREATE TRIGGER delete_ingredient_log
	BEFORE DELETE ON restaurant.ingredients
	FOR EACH ROW
	BEGIN
		CALL logger(@CUR_ID, 'delete', 'ingredient', OLD.ingredient_id);
	END //
DELIMITER ;

DROP TRIGGER IF EXISTS delete_menu_log;
DELIMITER //
CREATE TRIGGER delete_menu_log
	BEFORE DELETE ON restaurant.menus
	FOR EACH ROW
	BEGIN
		CALL logger(@CUR_ID, 'delete', 'menu', OLD.menu_id);
	END //
DELIMITER ;

DROP TRIGGER IF EXISTS delete_order_log;
DELIMITER //
CREATE TRIGGER delete_order_log
	BEFORE DELETE ON restaurant.orders
	FOR EACH ROW
	BEGIN
		CALL logger(@CUR_ID, 'delete', 'order', OLD.order_id);
	END //
DELIMITER ;

DROP TRIGGER IF EXISTS delete_payment_log;
DELIMITER //
CREATE TRIGGER delete_payment_log
	BEFORE DELETE ON restaurant.payments
	FOR EACH ROW
	BEGIN
		CALL logger(@CUR_ID, 'delete', 'payment', OLD.payment_id);
	END //
DELIMITER ;

DROP TRIGGER IF EXISTS delete_reservation_log;
DELIMITER //
CREATE TRIGGER delete_reservation_log
	BEFORE DELETE ON restaurant.reservations
	FOR EACH ROW
	BEGIN
		CALL logger(@CUR_ID, 'delete', 'reservation', OLD.reservation_id);
	END //
DELIMITER ;

DROP TRIGGER IF EXISTS delete_role_log;
DELIMITER //
CREATE TRIGGER delete_role_log
	BEFORE DELETE ON restaurant.roles
	FOR EACH ROW
	BEGIN
		CALL logger(@CUR_ID, 'delete', 'role', OLD.role_id);
	END //
DELIMITER ;

DROP TRIGGER IF EXISTS delete_table_log;
DELIMITER //
CREATE TRIGGER delete_table_log
	BEFORE DELETE ON restaurant.tables
	FOR EACH ROW
	BEGIN
		CALL logger(@CUR_ID, 'delete', 'table', OLD.table_id);
	END //
DELIMITER ;

DROP TRIGGER IF EXISTS delete_user_log;
DELIMITER //
CREATE TRIGGER delete_user_log
	BEFORE DELETE ON restaurant.users
	FOR EACH ROW
	BEGIN
		CALL logger(@CUR_ID, 'delete', 'user', OLD.user_id);
	END //
DELIMITER ;

DROP TRIGGER IF EXISTS delete_ingredient_dish_log;
DELIMITER //
CREATE TRIGGER delete_ingredient_dish_log
	BEFORE DELETE ON restaurant.ingredients_dishes
	FOR EACH ROW
	BEGIN
		CALL logger(@CUR_ID, 'delete', 'ingredient_dish', OLD.ingredient_dish_id);
	END //
DELIMITER ;

DROP TRIGGER IF EXISTS delete_dish_menu_log;
DELIMITER //
CREATE TRIGGER delete_dish_menu_log
	BEFORE DELETE ON restaurant.dishes_menus
	FOR EACH ROW
	BEGIN
		CALL logger(@CUR_ID, 'delete', 'dish_menu', OLD.dish_menu_id);
	END //
DELIMITER ;

DROP TRIGGER IF EXISTS delete_table_reservation_log;
DELIMITER //
CREATE TRIGGER delete_table_reservation_log
	BEFORE DELETE ON restaurant.tables_reservations
	FOR EACH ROW
	BEGIN
		CALL logger(@CUR_ID, 'delete', 'table_reservation', OLD.table_reservation_id);
	END //
DELIMITER ;


DROP TRIGGER IF EXISTS delete_dish_order_log;
DELIMITER //
CREATE TRIGGER delete_dish_order_log
	BEFORE DELETE ON restaurant.dishes_orders
	FOR EACH ROW
	BEGIN
		CALL logger(@CUR_ID, 'delete', 'dish_order', OLD.dish_order_id);
	END //
DELIMITER ;

