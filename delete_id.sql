DROP PROCEDURE IF EXISTS delete_dish;
DELIMITER //
CREATE PROCEDURE delete_dish(id_dish INT UNSIGNED)
BEGIN
DELETE FROM restaurant.dishes
	WHERE dish_id = id_dish;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS delete_ingredient;
DELIMITER //
CREATE PROCEDURE delete_ingredient(id_ingredient INT UNSIGNED)
BEGIN
DELETE FROM restaurant.ingredients
	WHERE ingredient_id = id_ingredient;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS delete_menu;
DELIMITER //
CREATE PROCEDURE delete_menu(id_menu INT UNSIGNED)
BEGIN
DELETE FROM restaurant.menus
	WHERE menu_id = id_menu;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS delete_order;
DELIMITER //
CREATE PROCEDURE delete_order(id_order INT UNSIGNED)
BEGIN
DELETE FROM restaurant.orders
	WHERE order_id = id_order;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS delete_payment;
DELIMITER //
CREATE PROCEDURE delete_payment(id_payment INT UNSIGNED)
BEGIN
DELETE FROM restaurant.payments
	WHERE payment_id = id_payment;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS delete_reservation;
DELIMITER //
CREATE PROCEDURE delete_reservation(id_reservation INT UNSIGNED)
BEGIN
DELETE FROM restaurant.reservations
	WHERE reservation_id = id_reservation;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS delete_role;
DELIMITER //
CREATE PROCEDURE delete_role(id_role INT UNSIGNED)
BEGIN
DELETE FROM restaurant.roles
	WHERE role_id = id_role;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS delete_table;
DELIMITER //
CREATE PROCEDURE delete_table(id_table INT UNSIGNED)
BEGIN
DELETE FROM restaurant.tables
	WHERE table_id = id_table;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS delete_user;
DELIMITER //
CREATE PROCEDURE delete_user(id_user INT UNSIGNED)
BEGIN
DELETE FROM restaurant.users
	WHERE user_id = id_user;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS delete_ingredient_dish;
DELIMITER //
CREATE PROCEDURE delete_ingredient_dish(id_ingredient_dish INT UNSIGNED)
BEGIN
DELETE FROM restaurant.ingredients_dishes
	WHERE ingredient_dish_id = id_ingredient_dish;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS delete_dish_menu;
DELIMITER //
CREATE PROCEDURE delete_dish_menu(id_dish_menu INT UNSIGNED)
BEGIN
DELETE FROM restaurant.dishes_menus
	WHERE dish_menu_id = id_dish_menu;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS delete_table_reservation;
DELIMITER //
CREATE PROCEDURE delete_table_reservation(id_table_reservation INT UNSIGNED)
BEGIN
DELETE FROM restaurant.tables_reservations
	WHERE table_reservation_id = id_table_reservation;
END //
DELIMITER ;


DROP PROCEDURE IF EXISTS delete_dish_order;
DELIMITER //
CREATE PROCEDURE delete_dish_order(id_dish_order INT UNSIGNED)
BEGIN
DELETE FROM restaurant.dishes_orders
	WHERE dish_order_id = id_dish_order;
END //
DELIMITER ;

