DROP PROCEDURE IF EXISTS get_dishes;
DELIMITER //
CREATE PROCEDURE get_dishes()
BEGIN
	 SELECT * FROM restaurant.dishes;
END //
DELIMITER ;
call get_dishes();

DROP PROCEDURE IF EXISTS get_ingredients;
DELIMITER //
CREATE PROCEDURE get_ingredients()
BEGIN
	 SELECT * FROM restaurant.ingredients;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS get_menus;
DELIMITER //
CREATE PROCEDURE get_menus()
BEGIN
	 SELECT * FROM restaurant.menus;
END //
DELIMITER ;
call get_menus();

DROP PROCEDURE IF EXISTS get_orders;
DELIMITER //
CREATE PROCEDURE get_orders()
BEGIN
	 SELECT * FROM restaurant.orders;
END //
DELIMITER ;
call get_orders();

DROP PROCEDURE IF EXISTS get_payments;
DELIMITER //
CREATE PROCEDURE get_payments()
BEGIN
	 SELECT * FROM restaurant.payments;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS get_reservations;
DELIMITER //
CREATE PROCEDURE get_reservations()
BEGIN
	 SELECT * FROM restaurant.reservations;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS get_roles;
DELIMITER //
CREATE PROCEDURE get_roles()
BEGIN
	 SELECT * FROM restaurant.roles;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS get_tables;
DELIMITER //
CREATE PROCEDURE get_tables()
BEGIN
	 SELECT * FROM restaurant.tables;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS get_users;
DELIMITER //
CREATE PROCEDURE get_users()
BEGIN
	 SELECT * FROM restaurant.users;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS get_ingredients_dishes;
DELIMITER //
CREATE PROCEDURE get_ingredients_dishes()
BEGIN
	 SELECT * FROM restaurant.ingredients_dishes;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS get_dishes_menus;
DELIMITER //
CREATE PROCEDURE get_dishes_menus()
BEGIN
	 SELECT * FROM restaurant.dishes_menus;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS get_tables_reservations;
DELIMITER //
CREATE PROCEDURE get_tables_reservations()
BEGIN
	 SELECT * FROM restaurant.tables_reservations;
END //
DELIMITER ;


DROP PROCEDURE IF EXISTS get_dishes_orders;
DELIMITER //
CREATE PROCEDURE get_dishes_orders()
BEGIN
	 SELECT * FROM restaurant.dishes_orders;
END //
DELIMITER ;

