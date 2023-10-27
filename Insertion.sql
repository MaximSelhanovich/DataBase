INSERT INTO restaurant.roles (name) 
VALUES ('director'), ('manager'), ('chef'), ('cook'), ('waiter'), ('user');


INSERT INTO restaurant.users (role_id, surname, name, patronymic, phone_number, email, salary, password)
VALUES (1, 'Иванов', 'Иван', 'Иванович', '+375291234567', 'qwe@mial.ru', 5000.0, '1234567'),
(2, 'Петров', 'Петр', 'Петрович', '+375297654321', 'asd@mial.ru', 3000.0, '12345678'),
(3, 'Ермаков', 'Антон', 'Владимирович', '+375299876543', 'post@gmail.com', 2000.0, '87654321'),
(4, 'Джейсон', 'Стейтем', '', '+375293456789', 'cool@mial.ru', 1500.0, 'cool'),
(4, 'Фамильев', 'Дементий', 'Батькович', '+375337531598', NULL, 1300.0, 'password'),
(5, 'Сергеев', 'Сергей', 'Сергеевич', '+375291237894', 'zxc@gmail.com', 1000.0, '54321'),
(5, 'Пирров', 'Царь', 'Альбертович', '+375448246951', 'tsarprostotsar@gmail.com', 900.0, 'yaeststar'),
(6, 'Cool', 'User', 'Name', '+375291111111', NULL, NULL, '123456789'),
(6, 'Граф', 'Монте', 'Кристо', '+375291234567', 'qwe@list.ru', NULL, '891234567'),
(6, 'Агафьев', 'Поц', 'Никитьевич', '+375336541238', 'agaw@gmail.com', NULL, '8951387945');


INSERT INTO restaurant.ingredients (name, description, price_per_kilogram)
VALUES ('картофель', 'очень вкусный', 3.0),
('свинина', 'шейная часть', 20.0),
('лук репчатый', 'чертовски ядреный', 5.0),

('тмин', 'бывает', 25.0),
('сыр твердый', 'hard', 20.5),
('морковь', 'видывала всякое', 2.5),

('перец болгарский', 'уже отдохнувший', 7.8),
('сыр', 'Пармезан', 25.0),
('соль', 'нейодированная', 1),

('перец черный', 'молотый', 15),/*10*/
('мука', 'пшеничная, высший сорт', 10),
('сливки', 'жирность 10%', 8),

('сметана', 'жирность 46%', 19),
('масло сливочное', 'жирность 80%', 16),
('вода', 'без нее никуда', 0),

('фарш свинной', 'без специй', 11.49),
('куриное филе', 'нежнейшее', 10.99),
('масло растительное', 'рафинированное', 9.54),

('яйцо куриное', 'Желток, Белок и Яйко', 7.12),
('молоко коровье', 'жирность 3.2%', 1.96),
('крупа манная', 'не придумал', 3.89),/*21*/

('сахар', 'белый', 6),
('чеснок', 'да', 12.54),
('салат зеленый', 'как и я в проге', 14.14),

('помидор', 'стандартный', 7.7),
('соус для цезаря', 'ибо лень писать все ингредиенты', 15.95),
('батон', 'для шашек сгодится', 6.7);

INSERT INTO restaurant.dishes (name, description, price, approved)
VALUES ('Рагу со свининой', 'пальчики оближешь', 20.0, TRUE),
('Драники со сметаной', 'нежнее тебя', 17.17, TRUE),
('Куриное филе в сливках', 'главное, чтобы сливки не свернулись', 23.50, FALSE),
('Каша манная', 'жизнь туманная', 10.0, TRUE),
('Мит боллы', 'котлеты, не выпендривайся', 19.0, TRUE);

INSERT INTO restaurant.ingredients_dishes (ingredient_id, dish_id, gram)
VALUE
/*Рагу*/
(1, 1, 1000), (2, 1, 500),
(3, 1, 150), (6, 1, 200),
(7, 1, 150), (9, 1, 10),
(10, 1, 5), (15, 1, 300),
(18, 1, 60),
/*Драники*/
(1, 2, 800), (11, 2, 40),
(13, 2, 60), (3, 2, 80) ,
(19, 2, 60), (18, 2, 60),
(9, 2, 5), 
/*Филе*/
(17, 3, 700), (12, 3, 100),
(14, 3, 30), (3, 3, 80) ,
(6, 3, 80), (9, 3, 5),
(5, 3, 150),
/*каша*/
(21, 4, 150), (15, 4, 700),
(20, 4, 700), (22, 4,50),
(14, 4, 70),
/*Болл*/
(16, 5, 800), (3, 5, 80),
(1, 5, 160), (9, 5, 3),
(23, 5, 15), (18, 5, 100);

INSERT INTO restaurant.menus (type, description)
VALUES ('morning', 'Обажаю запах напалма по утрам'),
('day', 'Комплексный обед от всех бед');

INSERT INTO restaurant.dishes_menus(dish_id, menu_id, available)
VALUE (2, 1, TRUE), (4, 1, TRUE),
(1, 2, TRUE), (3, 2, TRUE), (5, 2, TRUE);

INSERT INTO restaurant.tables (capacity)
VALUES (2), (2), (2), (2), (2), 
(4), (4), (4), (4),
(5), (5), (5),
(6), (6), (6),
(8), (8), (8);

INSERT INTO restaurant.reservations(customer_id, manager_id, date, number_of_guests, approved)
VALUES (8, 2, '2022-12-2 15:00:10', 4, TRUE),
(9, 2, '2022-11-25 12:00:10', 3, FALSE),
(10, 2, '2022-11-30 18:00:10', 8, TRUE);

INSERT INTO restaurant.tables_reservations(table_id, reservation_id)
VALUES (7, 1), (9, 2), (1, 3), (14, 3);

INSERT INTO restaurant.orders(customer_id, paid)
VALUES (10, TRUE), (9, FALSE), (8, TRUE);

INSERT INTO restaurant.dishes_orders (dish_id, order_id, chef_id, waiter_id, number_of_dishes, reception_time, cooked_time) 
VALUES (1, 1, 3, 6, 1, DEFAULT, DATE_ADD(restaurant.dishes_orders.reception_time, INTERVAL 1 HOUR)),
(2, 1, 4, 7, 2, DEFAULT, DATE_ADD(restaurant.dishes_orders.reception_time, INTERVAL 45 MINUTE)),
(5, 2, 5, 6, 1, DATE_ADD(CURRENT_TIMESTAMP, INTERVAL 2 HOUR), DATE_ADD(restaurant.dishes_orders.reception_time, INTERVAL 35 MINUTE)),
(4, 3, 4, 7, 1,  DATE_ADD(CURRENT_TIMESTAMP, INTERVAL 5 HOUR), DATE_ADD(restaurant.dishes_orders.reception_time, INTERVAL 25 MINUTE));

INSERT INTO restaurant.payments(order_id, price, tax, tips)
VALUES (1, 37.17, 3.72, 5), (3, 10, 1, 2);

/*INSERT INTO restaurant.orders_waiters(order_id, waiter_id)
VALUES (1, 6), (2, 7), (3, 6);*/
