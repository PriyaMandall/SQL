use swiggy;
# 1. Find Customer who has never ordered
SELECT u_name FROM users 
WHERE user_id NOT IN (SELECT user_id FROM orders);

# 2. Average price/dish
SELECT f.f_name, avg(price) AS Average_Price
FROM menu m
JOIN food f
ON m.f_id=f.f_id
GROUP BY f.f_name
ORDER BY AVG(price) desc;

# 3. Find Top resturant in terms of number of orders for a given month

#for the month of june
SELECT r.r_name, COUNT(*) AS total_order 
from orders o
JOIN restaurants r
ON o.r_id=r.r_id
WHERE MONTHNAME(date) LIKE 'June'
GROUP BY r.r_name
ORDER BY count(*) DESC LIMIT 1;

# for the month of may
SELECT r.r_name, COUNT(*) AS total_order
from orders o
JOIN restaurants r
ON o.r_id=r.r_id
WHERE MONTHNAME(date) LIKE 'May'
GROUP BY r.r_name
ORDER BY count(*) DESC LIMIT 1;

#for the month of july
SELECT r.r_name, COUNT(*) AS total_order
from orders o
JOIN restaurants r
ON o.r_id=r.r_id
WHERE MONTHNAME(date) LIKE 'July'
GROUP BY r.r_name
ORDER BY count(*) DESC LIMIT 1;

# 4.Restaurant with monthly sales greate then x
#june
SELECT r.r_name, SUM(amount) AS revenue
FROM orders o
JOIN restaurants r
ON o.r_id=r.r_id
WHERE monthname(date) LIKE 'June'
GROUP BY r.r_name HAVING SUM(amount)>500;

#july
SELECT r.r_name, SUM(amount) AS revenue
FROM orders o
JOIN restaurants r
ON o.r_id=r.r_id
WHERE monthname(date) LIKE 'July'
GROUP BY r.r_name HAVING SUM(amount)>500;

#may
SELECT r.r_name, SUM(amount) AS revenue
FROM orders o
JOIN restaurants r
ON o.r_id=r.r_id
WHERE monthname(date) LIKE 'May'
GROUP BY r.r_name HAVING SUM(amount)>500;

# 5.Show all oders with orders details for a perticular customer in a perticular date range
SELECT o.order_id, r.r_name, od.f_id, f.f_name
FROM orders o
JOIN restaurants r
ON o.r_id=r.r_id
JOIN orders_details od
ON o.order_id = od.order_id
JOIN food f
ON od.f_id=f.f_id
WHERE user_id = (SELECT user_id FROM users WHERE u_name LIKE 'Khushboo')
AND date BETWEEN '2023-06-10' AND '2023-07-10' ;

#6. Find restaurants with max repeted orders
SELECT r.r_name, COUNT(*) AS max_customer
FROM (
		SELECT r_id, user_id, COUNT(*) AS visits
		FROM orders 
		GROUP BY r_id, user_id 
        HAVING visits>1 
	) MAXX
JOIN restaurants r
ON r.r_id = maxx.r_id
GROUP BY r.r_name
ORDER BY max_customer DESC LIMIT 1;

# 6. Month over month revenu growth of swiggy
SELECT month, ((revenue-previous)/previous)*100 AS growth FROM (
	WITH sales AS 
	(
		SELECT MONTHNAME(date) AS month, SUM(amount) AS revenue 
		FROM orders
		GROUP BY month
	)
SELECT month, revenue, LAG(revenue) OVER (ORDER BY revenue) AS previous FROM sales
) growth

# customers name and his/her fav food
WITH temp AS
 (
	SELECT o.user_id, od.f_id, COUNT(*) AS frequency 
	FROM orders o 
	JOIN orders_details od
	ON o.order_id = od.order_id
	GROUP BY o.user_id, od.f_id
)
SELECT u.u_name, f.f_name, frequency
FROM temp t1 
JOIN users u
ON u.user_id=t1.user_id
JOIN food f
ON f.f_id=t1.f_id
WHERE t1.frequency = (
	SELECT MAX(frequency) 
    FROM temp t2 
    WHERE t2.user_id=t1.user_id
)