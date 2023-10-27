DROP PROCEDURE IF EXISTS get_dish_by_id;
DELIMITER //
CREATE PROCEDURE get_dish_by_id(id_dish INT UNSIGNED)
BEGIN
	SELECT * FROM restaurant.dishes
	WHERE dish_id = id_dish;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS get_ingredient_by_id;
DELIMITER //
CREATE PROCEDURE get_ingredient_by_id(id_ingredient INT UNSIGNED)
BEGIN
	SELECT * FROM restaurant.ingredients
	WHERE ingredient_id = id_ingredient;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS get_menu_by_id;
DELIMITER //
CREATE PROCEDURE get_menu_by_id(id_menu INT UNSIGNED)
BEGIN
	SELECT * FROM restaurant.menus
	WHERE menu_id = id_menu;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS get_order_by_id;
DELIMITER //
CREATE PROCEDURE get_order_by_id(id_order INT UNSIGNED)
BEGIN
	SELECT * FROM restaurant.orders
	WHERE order_id = id_order;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS get_payment_by_id;
DELIMITER //
CREATE PROCEDURE get_payment_by_id(id_payment INT UNSIGNED)
BEGIN
	SELECT * FROM restaurant.payments
	WHERE payment_id = id_payment;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS get_reservation_by_id;
DELIMITER //
CREATE PROCEDURE get_reservation_by_id(id_reservation INT UNSIGNED)
BEGIN
	SELECT * FROM restaurant.reservations
	WHERE reservation_id = id_reservation;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS get_role_by_id;
DELIMITER //
CREATE PROCEDURE get_role_by_id(id_role INT UNSIGNED)
BEGIN
	SELECT * FROM restaurant.roles
	WHERE role_id = id_role;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS get_table_by_id;
DELIMITER //
CREATE PROCEDURE get_table_by_id(id_table INT UNSIGNED)
BEGIN
	SELECT * FROM restaurant.tables
	WHERE table_id = id_table;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS get_user_by_id;
DELIMITER //
CREATE PROCEDURE get_user_by_id(id_user INT UNSIGNED)
BEGIN
	SELECT * FROM restaurant.users
	WHERE user_id = id_user;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS get_ingredient_dish_by_id;
DELIMITER //
CREATE PROCEDURE get_ingredient_dish_by_id(id_ingredient_dish INT UNSIGNED)
BEGIN
	SELECT * FROM restaurant.ingredients_dishes
	WHERE ingredient_dish_id = id_ingredient_dish;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS get_dish_menu_by_id;
DELIMITER //
CREATE PROCEDURE get_dish_menu_by_id(id_dish_menu INT UNSIGNED)
BEGIN
	SELECT * FROM restaurant.dishes_menus
	WHERE dish_menu_id = id_dish_menu;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS get_table_reservation_by_id;
DELIMITER //
CREATE PROCEDURE get_table_reservation_by_id(id_table_reservation INT UNSIGNED)
BEGIN
	SELECT * FROM restaurant.tables_reservations
	WHERE table_reservation_id = id_table_reservation;
END //
DELIMITER ;


DROP PROCEDURE IF EXISTS get_dish_order_by_id;
DELIMITER //
CREATE PROCEDURE get_dish_order_by_id(id_dish_order INT UNSIGNED)
BEGIN
	SELECT * FROM restaurant.dishes_orders
	WHERE dish_order_id = id_dish_order;
END //
DELIMITER ;

