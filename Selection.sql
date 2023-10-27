/*Отдельное меню по id*/
SELECT name, description, price,
    CASE
        WHEN approved = 1 THEN 'ДА'
        WHEN approved = 0 THEN 'НЕТ'
        ELSE 'НЕ ИЗВЕСТНО'
    END AS 'available'
FROM restaurant.dishes
WHERE dish_id IN (SELECT dish_id 
				FROM restaurant.dishes_menus
				WHERE menu_id = 1);

SELECT ingredients_dishes.dish_id, ingredients_dishes.ingredient_id, ingredients.name AS 'ingredient name', ingredients_dishes.gram 
FROM restaurant.ingredients 
	INNER JOIN restaurant.ingredients_dishes 
	ON ingredients.ingredient_id = ingredients_dishes.ingredient_id 
ORDER BY ingredients_dishes.dish_id;

/*Рецепт блюда по имени*/
SELECT dishes.name AS 'dish name', smth.name AS 'ingredient name', smth.gram 
FROM (restaurant.dishes 
	INNER JOIN 
    (SELECT smth.dish_id, ingredients.name, smth.gram 
		FROM restaurant.ingredients 
		INNER JOIN restaurant.ingredients_dishes AS smth 
		ON ingredients.ingredient_id = smth.ingredient_id) smth 
	ON smth.dish_id = dishes.dish_id);

/*Получить все блюда в заказе*/
SELECT orders.order_id, dishes_orders.dish_id, dishes_orders.number_of_dishes 
FROM restaurant.orders 
	INNER JOIN restaurant.dishes_orders 
	ON orders.order_id = dishes_orders.order_id 
ORDER BY orders.order_id;


/*Кол-во обработанных заказов у официанта*/
SELECT COUNT(order_id) AS 'Complited orders', waiter_id 
FROM restaurant.orders_waiters 
GROUP BY waiter_id;

SELECT users.name, users.surname, COUNT(orders_waiters.order_id) AS 'Complited orders'
FROM restaurant.users 
	INNER JOIN restaurant.orders_waiters 
    ON users.user_id = orders_waiters.waiter_id 
GROUP BY orders_waiters.waiter_id;

/*Неоплаченные заказы*/
CREATE VIEW unpaid_orders AS 
SELECT o.order_id, o.customer_id 
FROM restaurant.orders o 
WHERE paid = False;

SELECT * FROM unpaid_orders;

CREATE VIEW unpaid_orders_and_names AS 
SELECT o.order_id, users.name, users.surname 
FROM restaurant.orders o 
	INNER JOIN restaurant.users  
	ON o.customer_id = users.user_id 
WHERE paid = False;

SELECT * FROM unpaid_orders_and_names;

/*Только пользователи*/
SELECT users.surname, users.name, users.patronymic, users. phone_number, users.email 
FROM restaurant.users 
WHERE users.role_id = 6;

/*Средняя зарплата*/
SELECT AVG(users.salary) ' - средня зарплата' 
FROM restaurant.users;

/*Дорогие продукты*/
SELECT AVG(ingredients.price_per_kilogram), ingredients.name, ingredients.description, ingredients.price_per_kilogram  
FROM  restaurant.ingredients 
HAVING (SELECT AVG(ingredients.price_per_kilogram) FROM restaurant.ingredients) < ingredients.price_per_kilogram;

/*не работает*/
SELECT ingredients.name, ingredients.description, ingredients.price_per_kilogram  
FROM restaurant.ingredients 
WHERE price_per_kilogram > 
	(SELECT AVG(ingredients.price_per_kilogram)     
    FROM restaurant.ingredients);

/*простой простмотр брони*/
SELECT reservations.reservation_id, tables_reservations.table_id, reservations.date, reservations.number_of_guests 
FROM restaurant.reservations 
	INNER JOIN restaurant.tables_reservations 
    ON reservations.reservation_id = tables_reservations.reservation_id 
ORDER BY reservations.reservation_id;

/*Крутой просмотр брони*/
SELECT users.name, users.surname, res.reservation_id, res.table_id, res.date, res.number_of_guests 
FROM restaurant.users 
	INNER JOIN 
		(SELECT reservations.customer_id, res.reservation_id, res.table_id, reservations.date, reservations.number_of_guests 
        FROM restaurant.reservations 
        INNER JOIN restaurant.tables_reservations AS res 
        ON res.reservation_id = reservations.reservation_id) res 
	ON users.user_id = res.customer_id 
ORDER BY users.name, users.surname;



SELECT  orders.customer_id, SUM(dos.summ)
FROM restaurant.orders
	INNER JOIN 
		(SELECT dishes_orders.order_id, sUM(dishes.price * dishes_orders.number_of_dishes) AS summ
		FROM restaurant.dishes
		INNER JOIN restaurant.dishes_orders
		ON dishes.dish_id = dishes_orders.dish_id
		GROUP BY dishes_orders.order_id) AS dos
    ON orders.order_id = dos.order_id
GROUP BY orders.order_id;


SELECT dishes_orders.order_id, sUM(dishes.price * dishes_orders.number_of_dishes) AS summ
    FROM restaurant.dishes
    INNER JOIN restaurant.dishes_orders
    ON dishes.dish_id = dishes_orders.dish_id
    GROUP BY dishes_orders.order_id ;
