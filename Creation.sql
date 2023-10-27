drop database restaurant;
CREATE DATABASE restaurant;
CREATE TABLE restaurant.roles(
    role_id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    name VARCHAR(45) NOT NULL
);

CREATE TABLE restaurant.users (
    user_id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    role_id INT UNSIGNED NOT NULL,
    surname VARCHAR(100) NOT NULL,
    name VARCHAR(100) NOT NULL,
    patronymic VARCHAR(100) DEFAULT '',
    phone_number VARCHAR(13) NOT NULL,
    email VARCHAR(100) DEFAULT '',
    salary DECIMAL(10,2) UNSIGNED DEFAULT NULL,
    password VARCHAR(100) NOT NULL,
    FOREIGN KEY (role_id)
        REFERENCES restaurant.roles (role_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE restaurant.ingredients (
    ingredient_id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    description VARCHAR(70) DEFAULT '',
    price_per_kilogram DECIMAL(10,2) UNSIGNED NOT NULL
);

CREATE TABLE restaurant.dishes (
    dish_id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    description VARCHAR(70) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    approved TINYINT NOT NULL
);

CREATE TABLE restaurant.ingredients_dishes (
    ingredient_dish_id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    ingredient_id INT UNSIGNED NOT NULL,
    dish_id INT UNSIGNED NOT NULL,
    gram DOUBLE UNSIGNED NOT NULL,
    FOREIGN KEY (ingredient_id)
        REFERENCES restaurant.ingredients (ingredient_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (dish_id)
        REFERENCES restaurant.dishes (dish_id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT unique_ingredient UNIQUE INDEX(ingredient_id, dish_id)
);
CREATE TABLE restaurant.menus (
    menu_id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
	type ENUM('morning', 'day', 'evening'),
    description VARCHAR(200) NOT NULL
);

CREATE TABLE restaurant.dishes_menus (
    dish_menu_id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    dish_id INT UNSIGNED NOT NULL,
    menu_id INT UNSIGNED NOT NULL,
    available TINYINT NOT NULL,
    FOREIGN KEY (dish_id)
        REFERENCES restaurant.dishes (dish_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (menu_id)
        REFERENCES restaurant.menus (menu_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE restaurant.tables (
    table_id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    capacity TINYINT UNSIGNED NOT NULL
    /*free TINYINT UNSIGNED NOT NULL
    in_hall TINYINT UNSIGNED NOT NULL*/ /*necessary?*/
);

CREATE TABLE restaurant.reservations (
    reservation_id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    customer_id INT UNSIGNED NOT NULL,
    manager_id INT UNSIGNED NOT NULL,
    date DATETIME NOT NULL,
    number_of_guests SMALLINT UNSIGNED NOT NULL,
    approved TINYINT UNSIGNED NOT NULL,
    FOREIGN KEY (customer_id)
        REFERENCES restaurant.users (user_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (manager_id)
        REFERENCES restaurant.users (user_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE restaurant.tables_reservations (
    table_reservation_id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    table_id INT UNSIGNED NOT NULL,
    reservation_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (table_id)
        REFERENCES restaurant.tables (table_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (reservation_id)
        REFERENCES restaurant.reservations (reservation_id) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE restaurant.orders (
    order_id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    customer_id INT UNSIGNED NOT NULL,
    paid TINYINT NOT NULL,
    FOREIGN KEY (customer_id)
        REFERENCES restaurant.users (user_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE restaurant.dishes_orders (
    dish_order_id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    dish_id INT UNSIGNED NOT NULL,
    order_id INT UNSIGNED NOT NULL,
	chef_id INT UNSIGNED NOT NULL,
    waiter_id INT UNSIGNED NOT NULL,
    number_of_dishes SMALLINT UNSIGNED NOT NULL DEFAULT 1,
    reception_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    cooked_time DATETIME DEFAULT NULL,
    FOREIGN KEY (dish_id)
        REFERENCES restaurant.dishes (dish_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (order_id)
        REFERENCES restaurant.orders (order_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (chef_id)
        REFERENCES restaurant.users (user_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (waiter_id)
        REFERENCES restaurant.users (user_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE restaurant.payments (
	payment_id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
	order_id INT UNSIGNED NOT NULL,
	price DECIMAL(10, 2) UNSIGNED NOT NULL,
	tax DECIMAL(10, 2) UNSIGNED NOT NULL DEFAULT (payments.price * 0.1),
	tips DECIMAL(10, 2) UNSIGNED NOT NULL DEFAULT (payments.price * 0.1),
	total_price DECIMAL(10, 2) 
		UNSIGNED DEFAULT (restaurant.payments.price + restaurant.payments.tax + restaurant.payments.tips),
	FOREIGN KEY (order_id) 
		REFERENCES restaurant.orders(order_id) ON DELETE CASCADE ON UPDATE CASCADE
);

/*CREATE TABLE restaurant.orders_waiters (
    order_waiter_id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    order_id INT UNSIGNED NOT NULL,
    waiter_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (waiter_id)
        REFERENCES restaurant.users (user_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (order_id)
        REFERENCES restaurant.orders (order_id) ON DELETE CASCADE ON UPDATE CASCADE
);*/


CREATE TABLE restaurant.loggs(
    logg_id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    user_id INT UNSIGNED NOT NULL,
    performed_action ENUM('create', 'read', 'update', 'delete') NOT NULL,
    acted_upon_type ENUM('dish', 'ingredient', 'menu', 'order', 'payment', 'reservation', 'role', 'table', 'user', 'ingredient_dish', 'dish_menu', 'table_reservation', 'order_waiter', 'dish_order') NOT NULL,
    acted_upon_id INT UNSIGNED NOT NULL,
    action_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id)
        REFERENCES restaurant.users (user_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);