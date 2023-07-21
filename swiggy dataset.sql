create database Swiggy;
use Swiggy;

CREATE TABLE users (
user_id INT,
u_name VARCHAR(20),
email VARCHAR(30),
password VARCHAR(10)
);

INSERT INTO users
(user_id, u_name, email, password) 
VALUES
(1, 'Nitish', 'nitish@gmail.com', 'p252h'),
(2, 'Khushboo', 'khushboo@gmail.com', 'hxn9b'),
(3, 'Vartika', 'vartika@gmail.com', '9hu7j'),
(4, 'Ankit', 'ankit@gmail.com', 'ikko3'),
(5, 'Neha', 'neha2gmail.com', '3i7qm'),
(6, 'Anupama', 'anupama@gmail.com', '46rdw2'),
(7, 'Rishabh', 'rishabh@gmail.com', '4sw123'),
(8, 'Nishant', 'nishant@gmail.com', '5q12m'),
(9, 'Shivani', 'shivani@gmail.com', '12shi2'),
(10, 'Aadarsh', 'aadarsh@gmail.com', 'aa56s');

CREATE TABLE restaurants (
r_id INT,
r_name VARCHAR(15),
cuisine VARCHAR(20)
);

INSERT INTO restaurants 
(r_id, r_name, cuisine)
VALUES
(1, 'Dominos', 'Italian'),
(2, 'KFC', 'American'),
(3, 'Box8', 'North Indian'),
(4, 'Dosa Plaza', 'South Indian'),
(5, 'China Town', 'Chinese'),
(6, 'Momos House', 'Korean');

CREATE TABLE food (
f_id INT,
f_name VARCHAR(30),
f_type VARCHAR(15)
);

INSERT INTO food 
(f_id, f_name, f_type)
VALUES 
(1, 'Non-Veg Pizza', 'Non-Veg'),
(2, 'Veg Pizza', 'Veg'),
(3, 'Pari-pari Momos', 'Veg'),
(4, 'Choco Lava Cake', 'Veg'),
(5, 'Chicken Wings', 'Non-Veg'),
(6, 'Paneer Momos', 'Veg'),
(7, 'Chicken Popcorn', 'Non-Veg'),
(8, 'Rice Meal', 'Veg'),
(9, 'Roti Meal', 'Veg'),
(10, 'Chicken Momos', 'Non-Veg'),
(11, 'Masala Dhosa', 'Veg'),
(12, 'Rava Idli', 'Veg'),
(13, 'Schezwan Noodles', 'Veg'),
(14, 'Veg Manchurian', 'Veg'),
(15, 'Chicken Peri Peri momos', 'Non-Veg'); 

CREATE TABLE menu (
menu_id INT,
r_id INT,
f_id INT,
Price INT
);

INSERT INTO menu 
(menu_id, r_id, f_id, Price)
VALUES
(1, 1, 1, 450),
(2, 1, 2, 400),
(3, 1, 3, 100),
(4, 2, 3, 150),
(5, 2, 4, 230),
(6, 2, 4, 250),
(7, 3, 5, 300),
(8, 3, 3, 275),
(9, 3, 5, 80),
(10, 4, 6, 160),
(11, 4, 7, 140),
(12, 4, 7, 200),
(13, 5, 6, 230),
(14, 5, 8, 180),
(15, 5, 9, 120),
(16, 6, 6, 250),
(17, 6, 10, 220),
(18, 6, 11, 180),
(19, 1, 11, 200),
(20, 2, 12, 150),
(21, 3, 15, 170),
(22, 4, 14, 300),
(23, 5, 9, 150),
(24, 6, 10, 80);

CREATE TABLE orders (
order_id INT,
user_id INT,
r_id INT, 
amount INT, 
date DATE
);

INSERT INTO orders VALUES 
(1001, 1, 1, 550, '2023-05-10'),
(1002, 1, 2, 415, '2023-05-26'),
(1003, 1, 2, 240, '2023-05-14'),
(1004, 1, 3, 240, '2023-06-15'),
(1005, 2, 3, 240, '2023-06-29'),
(1006, 2, 3, 220, '2023-07-10'),
(1007, 2, 1, 950, '2023-06-10'),
(1008, 2, 4, 800, '2023-05-20'),
(1009, 3, 4, 530, '2023-06-23'),
(1010, 3, 5, 240, '2023-07-07'),
(1011, 3, 4, 300, '2023-07-17'),
(1012, 3, 5, 650, '2023-07-31'),
(1013, 4, 1, 450, '2023-05-10'),
(1014, 4, 4, 180, '2023-05-20'),
(1015, 4, 2, 230, '2023-05-30'),
(1016, 4, 2, 230, '2023-06-11'),
(1017, 5, 2, 230, '2023-06-22'),
(1018, 5, 4, 300, '2023-05-15'),
(1019, 5, 4, 300, '2023-05-30'),
(1020, 5, 4, 400, '2023-06-15'),
(1021, 6, 5, 400, '2023-06-30'),
(1022, 6, 5, 400, '2023-07-15'),
(1023, 6, 1, 550, '2023-07-01'),
(1024, 6, 1, 550, '2023-07-08'),
(1025, 5, 2, 645, '2023-07-15'),
(1026, 4, 2, 645, '2023-07-21'),
(1027, 2, 2, 645, '2023-07-28'),
(1028, 3, 4, 350, '2023-05-25'),
(1029, 1, 5, 300, '2023-06-30'),
(1030, 6, 4, 250, '2023-05-29');

CREATE TABLE orders_details (
id INT, 
order_id INT, 
f_id int);

INSERT INTO orders_details
(id, order_id, f_id)
VALUES 
(1, 1001, 1),
(2, 1001, 3),
(3, 1002, 4),
(4, 1003, 3),
(5, 1004, 6),
(6, 1004, 3),
(7, 1004, 6),
(8, 1005, 3),
(9, 1005, 7),
(10, 1006, 3),
(11, 1006, 1),
(12, 1007, 2),
(13, 1008, 3), 
(14, 1008, 6),
(15, 1009, 3),
(16, 1010, 8),
(17, 1010, 9),
(18, 1011, 10),
(19, 1011, 11),
(20, 1012, 11),
(21, 1012, 12),
(22, 1013,15),
(23, 1013, 6),
(24, 1013, 1),
(25, 1014, 8),
(26, 1014, 4),
(27, 1015, 4),
(28, 1015, 4),
(29, 1016, 8),
(30, 1017, 9),
(31, 1017, 13),
(32, 1018, 14),
(33, 1019, 15),
(34, 1019, 12),
(35, 1020, 14),
(36, 1021, 13),
(37, 1021, 10),
(38, 1022, 8),
(39, 1023, 9),
(40, 1023, 10),
(41, 1024, 11),
(42, 1025, 10),
(45, 1025, 12),
(46, 1026, 1),
(47, 1026, 3),
(48, 1027, 4),
(49, 1027, 5),
(50, 1028, 3),
(51, 1028, 4),
(52, 1028, 5),
(53, 1029, 3),
(54, 1029, 14),
(55, 1030, 15);
