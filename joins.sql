




# inner join - returns records that have matching values in both tables

# SELECT *
# FROM users
# INNER JOIN user_skills
# ON users.user_id = user_skills.user_id

SELECT *
FROM customers;

SELECT *
FROM customer_orders;

SELECT *
FROM customers c
INNER JOIN customer_orders co
	ON c.customer_id = co.customer_id
ORDER BY c.customer_id;


SELECT *
FROM products;

SELECT *
FROM customer_orders;

SELECT product_name, SUM(order_total) AS Total
FROM products p
JOIN customer_orders co
	ON p.product_id = co.product_id
GROUP BY product_name
ORDER BY 2;


SELECT *
FROM suppliers;

SELECT *
FROM ordered_items;

SELECT *
FROM suppliers s
INNER JOIN ordered_items oi
	ON s.supplier_id = oi.shipper_id;

# Joining multiple tables

SELECT *
FROM products p
JOIN customer_orders co
	ON p.product_id = co.product_id
JOIN customers c
	ON co.customer_id = c.customer_id
    ;
    
SELECT product_name, order_total, first_name
FROM products p
JOIN customer_orders co
	ON p.product_id = co.product_id
JOIN customers c
	ON co.customer_id = c.customer_id;

SELECT p.product_id, co.product_id, co.customer_id, c.customer_id
FROM products p
JOIN customer_orders co
	ON p.product_id = co.product_id
JOIN customers c
	ON co.customer_id = c.customer_id;
    
# Joining on Multiple Conditions

SELECT *
FROM customer_orders;

SELECT *
FROM customer_orders_review;

SELECT *
FROM customer_orders co
JOIN customer_orders_review cor
	ON co.order_id = cor.order_id;

SELECT *
FROM customer_orders co
JOIN customer_orders_review cor
	ON co.order_id = cor.order_id
	AND co.customer_id = cor.customer_id;
    
SELECT *
FROM customer_orders co
JOIN customer_orders_review cor
	ON co.order_id = cor.order_id
	AND co.customer_id = cor.customer_id
    AND co.order_date = cor.order_date;
    
# outer joins

# Left join - returns all records from the left table, and matched records from the right table

SELECT c.customer_id, first_name, co.order_id 
FROM customers c
LEFT OUTER JOIN customer_orders co
	ON c.customer_id = co.customer_id
ORDER BY c.customer_id;

# Right join - returns all records from the right table, and matched records from the left table

SELECT c.customer_id, first_name, co.order_id 
FROM customers c
RIGHT OUTER JOIN customer_orders co
	ON c.customer_id = co.customer_id
ORDER BY c.customer_id;


# self joins - table is joined to itself: aliases are required

SELECT *
FROM customers c
JOIN customers ss
	ON c.first_name = ss.first_name;

SELECT *
FROM customers c
JOIN customers ss
	ON c.customer_id = ss.customer_id + 1;

SELECT c.customer_id, c.first_name, c.last_name, ss.customer_id, ss.first_name, ss.last_name
FROM customers c
JOIN customers ss
	ON c.customer_id + 1 = ss.customer_id;


# cross joins - returns all possible combinations of all rows: no 'ON' clause

SELECT *
FROM customers;

SELECT *
From customer_orders;

SELECT *
FROM customers
CROSS JOIN customer_orders;

SELECT *
FROM customers c
CROSS JOIN customer_orders co
ORDER BY c.customer_id;

SELECT c.customer_id, c.first_name, co.customer_id, co.order_id
FROM customers c
CROSS JOIN customer_orders co
ORDER BY c.customer_id;

# Unions - combine the results of two or more SELECT statements into a single result



