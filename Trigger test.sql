SET @CUR_ID = 1;
INSERT INTO restaurant.users (role_id, surname, name, patronymic, phone_number, email, salary, password)
VALUE (6, 'user', 'TO ', 'TEST', '+375291111111', NULL, NULL, '123456789');

INSERT INTO restaurant.menus (type, description)
VALUE ('evening', 'Ночной дожор - это не позор!');

SET @CUR_ID = 3;
INSERT INTO restaurant.dishes (name, description, price, approved)
VALUE ('Салат Цезарь', 'и этот пал под ножом', 17.69, TRUE);

INSERT INTO restaurant.dishes_menus(dish_id, menu_id, available)
VALUES (2, 3, FALSE), (5, 3, TRUE), (6, 3, TRUE), (6, 1, False);

INSERT INTO restaurant.ingredients_dishes (ingredient_id, dish_id, gram)
VALUES /*цезарь*/
(24, 6, 400), (25, 6, 180),
(17, 6, 280), (27, 6, 220),
(8, 6, 80), (23, 6, 5),
(26, 6, 150), (9, 6, 5),
(10, 6, 5);

SELECT * FROM restaurant.loggs;

USE restaurant;
TRUNCATE TABLE payments;
INSERT INTO restaurant.payments(order_id, price, tax, tips)
VALUES (2, 10.00, 4.5, 6);
SELECT payments.order_id, payments.total_price
FROM restaurant.payments;