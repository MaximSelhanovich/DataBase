USE restaurant;

DROP PROCEDURE IF EXISTS create_dish_without_ingredients;
DELIMITER //
CREATE PROCEDURE create_dish_without_ingredients(d_name VARCHAR(30),
												d_description VARCHAR(70),
												d_price DECIMAL(10, 2),
												d_approved TINYINT)
BEGIN
	INSERT INTO restaurant.dishes(name, description, price, approved)
    VALUE (d_name, d_description, d_price, d_approved);
END //
DELIMITER ;


DROP PROCEDURE IF EXISTS create_menu_without_dishes;
DELIMITER //
CREATE PROCEDURE create_menu_without_dishes(m_description VARCHAR(30),m_type VARCHAR(70))
BEGIN
	INSERT INTO restaurant.menus(description, type)
    VALUE (m_description, m_type);
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS create_ingredient;
DELIMITER //
CREATE PROCEDURE create_ingredient(i_name VARCHAR(30), i_description VARCHAR(70), i_price_per_kilogram DECIMAL(10, 2))
BEGIN
	INSERT INTO restaurant.ingredients (name, description, price_per_kilogram)
    VALUE (i_name, i_description, i_price_per_kilogram);
END //
DELIMITER ;


DROP PROCEDURE IF EXISTS get_dishes_recipes;
DELIMITER //
CREATE PROCEDURE get_dishes_recipes()
BEGIN
	SELECT ingredients_dishes.dish_id, ingredients_dishes.ingredient_id, ingredients.name AS 'ingredient name', ingredients_dishes.gram 
	FROM restaurant.ingredients 
		INNER JOIN restaurant.ingredients_dishes 
		ON ingredients.ingredient_id = ingredients_dishes.ingredient_id 
	ORDER BY ingredients_dishes.dish_id;
END //
DELIMITER ;
CALL get_dishes_recipes();

DROP PROCEDURE IF EXISTS get_dish_recipe;
DELIMITER //
CREATE PROCEDURE get_dish_recipe(id_dish INT UNSIGNED)
BEGIN
	SELECT ingredients_dishes.ingredient_id, ingredients.name AS 'ingredient name', ingredients_dishes.gram 
	FROM restaurant.ingredients 
		INNER JOIN restaurant.ingredients_dishes 
		ON ingredients.ingredient_id = ingredients_dishes.ingredient_id
        WHERE ingredients_dishes.dish_id = id_dish
	ORDER BY ingredients_dishes.dish_id;
END //
DELIMITER ;


DROP PROCEDURE IF EXISTS update_dish;
DELIMITER //
CREATE PROCEDURE update_dish(id_dish INT UNSIGNED,
							d_name VARCHAR(30),
							d_description VARCHAR(70),
							d_price DOUBLE,
							d_approved TINYINT)
BEGIN
	UPDATE restaurant.dishes
    SET dishes.name = d_name,
        dishes.description = d_description,
        dishes.price = d_price,
        dishes.approved = d_approved
	WHERE dishes.dish_id = id_dish;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS update_menu;
DELIMITER //
CREATE PROCEDURE update_menu(id_menu INT UNSIGNED,
							m_type VARCHAR(20),
							m_description VARCHAR(200))
BEGIN
	UPDATE restaurant.menus
    SET menus.type = m_type,
        menus.description = m_description
	WHERE menus.menu_id = id_menu;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS get_ingredients_recipe;
DELIMITER //
CREATE PROCEDURE get_ingredients_recipe(id_dish INT UNSIGNED)
BEGIN
	SELECT ingredients.ingredient_id, ingredients.name AS 'ingredient name', ingredients.description, ingredients.price_per_kilogram, ing.gram 
	FROM  restaurant.ingredients
		LEFT JOIN (
			select * 
            FROM restaurant.ingredients_dishes 
			WHERE ingredients_dishes.dish_id = id_dish
            ) as ing
        ON ingredients.ingredient_id = ing.ingredient_id
	;
END //
DELIMITER ;


DROP PROCEDURE IF EXISTS get_user_by_login;
DELIMITER //
CREATE PROCEDURE get_user_by_login(user_email VARCHAR(100), user_password VARCHAR(100))
BEGIN
	SELECT * FROM restaurant.users
    WHERE emai = user_email AND password = user_password;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS get_dishes_by_ingredient_id;
DELIMITER //
CREATE PROCEDURE get_dishes_by_ingredient_id(id_ingredient INT UNSIGNED)
BEGIN
	SELECT name, description, price,
    CASE
		WHEN 1 THEN 'Да'
        WHEN 0 THEN 'Нет'
        ELSE 'Неизвестно'
	END AS 'Available'
    FROM restaurant.dishes
    WHERE dish_id IN
		(SELECT dish_id
        FROM restaurant.ingredients_dishes
		WHERE ingredient_id = id_ingredient);
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS order_dish;
DELIMITER //
CREATE PROCEDURE order_dish(id_dish INT UNSIGNED, number_of_dishes INT UNSIGNED, 
							id_user INT UNSIGNED, id_chef INT UNSIGNED)
BEGIN
	DECLARE id_order INT UNSIGNED;
	SELECT order_id INTO id_order
    FROM restaurant.dishes_orders
    WHERE order_id = id_order;
    IF id_order IS NULL THEN
		BEGIN
			INSERT INTO restaurant.orders(customer_id, paid)
            VALUE (id_user, FALSE);
            SET id_order = last_insert_id();
        END;
	END IF;
    INSERT INTO restaurant.dishes_orders(dish_id, order_id, chef_id, number_of_dishes, reception_time, cooked_time)
    VALUE (id_dish, id_order,id_chef, number_of_dishes, DEFAULT);
END//
DELIMITER ;

DROP PROCEDURE IF EXISTS add_ingredient_dish;
DELIMITER //
CREATE PROCEDURE add_ingredient_dish(id_ingredient INT UNSIGNED, id_dish INT UNSIGNED, ingredient_gram DOUBLE)
BEGIN    
	INSERT INTO restaurant.ingredients_dishes(ingredient_id, dish_id, gram) VALUE (id_ingredient, id_dish, ingredient_gram);
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS add_dish_menu;
DELIMITER //
CREATE PROCEDURE add_dish_menu(id_dish INT UNSIGNED, id_menu INT UNSIGNED, d_available TINYINT)
BEGIN    
	INSERT INTO restaurant.dishes_menus(dish_id, menu_id, available) VALUE (id_dish, id_menu, d_available);
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS update_ingredient_dish;
DELIMITER //
CREATE PROCEDURE update_ingredient_dish(id_ingredient_dish INT UNSIGNED, id_ingredient INT UNSIGNED, id_dish INT UNSIGNED, ingredient_gram DOUBLE)
BEGIN    
	REPLACE INTO restaurant.ingredients_dishes VALUES (id_ingredient_dish, id_ingredient, id_dish, ingredient_gram);
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS get_ingredient_dish;
DELIMITER //
CREATE PROCEDURE get_ingredient_dish(id_ingredient INT UNSIGNED, id_dish INT UNSIGNED)
BEGIN
    SELECT ingredient_dish_id FROM restaurant.ingredients_dishes
    WHERE dish_id = id_dish AND ingredient_id = id_ingredient;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS delete_dish;
DELIMITER //
CREATE PROCEDURE delete_dish(id_dish INT UNSIGNED)
BEGIN
    DELETE FROM restaurant.dishes
    WHERE dish_id = id_dish;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS delete_menu;
DELIMITER //
CREATE PROCEDURE delete_menu(id_menu INT UNSIGNED)
BEGIN
    DELETE FROM restaurant.dishes
    WHERE menu_id = id_menu;
END //
DELIMITER ;


DROP PROCEDURE IF EXISTS delete_ingredient_dish;
DELIMITER //
CREATE PROCEDURE delete_ingredient_dish(id_ingredient INT UNSIGNED, id_dish INT UNSIGNED)
BEGIN
    DELETE FROM restaurant.ingredients_dishes
    WHERE dish_id = id_dish AND ingredient_id = id_ingredient;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS delete_dish_menu;
DELIMITER //
CREATE PROCEDURE delete_dish_menu(id_dish INT UNSIGNED, id_menu INT UNSIGNED)
BEGIN
    DELETE FROM restaurant.dishes_menus
    WHERE dish_id = id_dish AND menu_id = id_menu;
END //
DELIMITER ;




DROP PROCEDURE IF EXISTS set_dish_ready;
DELIMITER //
CREATE PROCEDURE set_dish_ready(id_dish INT UNSIGNED, id_order INT UNSIGNED)
BEGIN
	UPDATE restaurant.dishes_orders
    SET cooked_time = CURRENT_TIMESTAMP
    WHERE order_id = id_order AND dish_id = id_dish AND cooked_time IS NULL;
END//
DELIMITER ;

DROP PROCEDURE IF EXISTS get_user_by_name;
DELIMITER //
CREATE PROCEDURE get_user_by_name(name VARCHAR(200))
BEGIN
	SELECT * FROM restaurant.users
    WHERE users.name = name;
END//
DELIMITER ;


DROP PROCEDURE IF EXISTS get_unpaid_orders;
DELIMITER //
CREATE PROCEDURE get_unpaid_orders()
BEGIN
	SELECT o.order_id, o.customer_id 
	FROM restaurant.orders o 
	WHERE paid = False;
END //
DELIMITER ;
CALL get_unpaid_orders();


DROP PROCEDURE IF EXISTS get_full_menu_by_id;
DELIMITER //
CREATE PROCEDURE get_full_menu_by_id(IN id_menu INT UNSIGNED) 
BEGIN
	SELECT *
    FROM restaurant.dishes
    WHERE dishes.dish_id in
		(SELECT dish_id 
        FROM restaurant.dishes_menus 
        WHERE menu_id = id_menu);
END //
DELIMITER ;


DROP PROCEDURE IF EXISTS get_dishes_not_in_menu_by_id;
DELIMITER //
CREATE PROCEDURE get_dishes_not_in_menu_by_id(IN id_menu INT UNSIGNED) 
BEGIN
	SELECT *
    FROM restaurant.dishes
    WHERE dishes.dish_id not in
		(SELECT dish_id 
        FROM restaurant.dishes_menus 
        WHERE menu_id = id_menu);
END //
DELIMITER ;


DROP PROCEDURE IF EXISTS get_recipe_by_dish_id;
DELIMITER //
CREATE PROCEDURE get_recipe_by_dish_id(id_dish INT UNSIGNED)
BEGIN
	SELECT name, description, price_per_kilogram 
    FROM restaurant.ingredients
    WHERE ingredient_id in
		(SELECT ingredient_id
        FROM restaurant.ingredients_dishes
        WHERE dish_id = id_dish);
END //
DELIMITER ;


DROP PROCEDURE IF EXISTS get_recipe_by_dish_name;
DELIMITER //
CREATE PROCEDURE get_recipe_by_dish_name(dish_name VARCHAR(100))
BEGIN
	SELECT name, description, price_per_kilogram 
    FROM restaurant.ingredients
    WHERE ingredient_id in
		(SELECT ingredient_id
        FROM restaurant.ingredients_dishes
        WHERE dish_id = 
			(SELECT dish_id
            FROM restaurant.dishes
            WHERE name = dish_name));
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS get_orders_by_user_id;
DELIMITER //
CREATE PROCEDURE get_orders_by_user_id(id_user INT UNSIGNED)
BEGIN
	SELECT * 
    FROM restaurant.orders
    WHERE customer_id = id_user;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS get_full_order_info;
DELIMITER //
CREATE PROCEDURE get_full_order_info(id_order INT UNSIGNED)
BEGIN
	SELECT dish_id, chef_id, waiter_id, number_of_dishes, reception_time, cooked_time
    FROM restaurant.orders
    INNER JOIN restaurant.dishes_orders
    ON dishes_orders.order_id = orders.order_id
    WHERE dishes_orders.order_id = id_order;
END //
DELIMITER ;
call get_full_order_info(1);