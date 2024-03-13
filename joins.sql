




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
    
    
# outer joins

# Right join - returns all records from the right table, and matched records from the left table

# Left join - returns all records from the left table, and matched records from the right table

# Full join - returns all records from both tables

# self joins - table is joined to itself: aliases are required


# cross joins - returns all possible combinations of all rows: no 'ON' clause


# Unions - combine the results of two or more SELECT statements into a single result



