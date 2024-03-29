




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

# Natural Join - let the database assume the connection (for simple tables)

SELECT *
FROM products p
NATURAL JOIN customer_orders co
ORDER BY p.product_id;

# USING Keyword

SELECT c.customer_id, first_name, co.order_id 
FROM customers c
LEFT OUTER JOIN customer_orders co
	ON c.customer_id = co.customer_id
ORDER BY c.customer_id, co.order_id;

SELECT c.customer_id, first_name, co.order_id 
FROM customers c
LEFT OUTER JOIN customer_orders co
	USING(customer_id)
ORDER BY c.customer_id, co.order_id;


# The UNION operator in SQL is used to combine the result sets of two or more SELECT statements. However, it only includes distinct values.

#The UNION ALL operator does the same, but includes duplicates.

#Union Syntax:

#SELECT sale_id, product_id, sale_amount
#FROM sales_2022
#UNION
#SELECT sale_id, product_id, sale_amount
#FROM sales_2023;


#Union All Syntax:

#SELECT sale_id, product_id, sale_amount
#FROM sales_2022
#UNION ALL
#SELECT sale_id, product_id, sale_amount
#FROM sales_2023;

SELECT *
FROM customers;

SELECT *
FROM products;

SELECT first_name, last_name
FROM customers
UNION
SELECT product_id, product_name
FROM products;


SELECT first_name, last_name, 'old'
FROM customers
WHERE YEAR(birth_date) < 1950;

SELECT first_name, last_name, 'old'
FROM customers
WHERE YEAR(birth_date) < 1950
UNION
SELECT first_name, last_name, 'Good Tipper'
FROM customers c
JOIN customer_orders co
	ON c.customer_id = co.customer_id
WHERE tip > 3;


SELECT first_name, last_name, 'old' as Lable
FROM customers
WHERE YEAR(birth_date) < 1950
UNION
SELECT first_name, last_name, 'Good Tipper'
FROM customers c
JOIN customer_orders co
	ON c.customer_id = co.customer_id
WHERE tip > 3
UNION
SELECT first_name, last_name, 'Big Spender'
FROM customers c
JOIN customer_orders co
	ON c.customer_id = co.customer_id
WHERE total_money_spent > 1000
ORDER BY first_name, last_name;


# removes duplicates
SELECT first_name, last_name, 'old' as Lable
FROM customers
WHERE YEAR(birth_date) < 1950
UNION DISTINCT
SELECT first_name, last_name, 'Good Tipper'
FROM customers c
JOIN customer_orders co
	ON c.customer_id = co.customer_id
WHERE tip > 3
UNION DISTINCT
SELECT first_name, last_name, 'Big Spender'
FROM customers c
JOIN customer_orders co
	ON c.customer_id = co.customer_id
WHERE total_money_spent > 1000
ORDER BY first_name, last_name;

SELECT first_name, last_name, 'old' as Lable
FROM customers
WHERE YEAR(birth_date) < 1950
UNION ALL
SELECT first_name, last_name, 'old' as Lable
FROM customers
WHERE YEAR(birth_date) < 1950;


# Join Use Cases

SELECT *
FROM ordered_items;

SELECT *
FROM products;



SELECT p.product_name, o.unit_price, p.sale_price
FROM ordered_items o
JOIN products p
	ON o.product_id = p.product_id;


SELECT DISTINCT p.product_name, o.unit_price, p.sale_price
FROM ordered_items o
JOIN products p
	ON o.product_id = p.product_id;


SELECT DISTINCT p.product_name, 
o.unit_price, 
p.sale_price,
p.sale_price - o.unit_price AS Profit
FROM ordered_items o
JOIN products p
	ON o.product_id = p.product_id;


SELECT DISTINCT p.product_name, 
o.unit_price, 
p.sale_price,
p.sale_price - o.unit_price AS Profit
FROM ordered_items o
JOIN products p
	ON o.product_id = p.product_id
ORDER BY Profit DESC;


SELECT DISTINCT p.product_name, 
o.unit_price, 
p.sale_price,
units_in_stock,
p.sale_price - o.unit_price AS Profit
FROM ordered_items o
JOIN products p
	ON o.product_id = p.product_id
ORDER BY Profit DESC;


SELECT DISTINCT p.product_name, 
o.unit_price, 
p.sale_price,
units_in_stock,
p.sale_price - o.unit_price AS Profit,
(p.sale_price - o.unit_price) * units_in_stock AS potential_profit
FROM ordered_items o
JOIN products p
	ON o.product_id = p.product_id
ORDER BY potential_profit DESC;


# use case

SELECT *
FROM supplier_delivery_status;

SELECT *
FROM ordered_items;

SELECT *
FROM suppliers;


SELECT *
FROM ordered_items o
JOIN supplier_delivery_status sds
	ON o.status = sds.order_status_id
JOIN suppliers s
	ON o.shipper_id = s.supplier_id;


SELECT o.order_id, sds.name, o.status, o.shipped_date, s.name
FROM ordered_items o
JOIN supplier_delivery_status sds
	ON o.status = sds.order_status_id
JOIN suppliers s
	ON o.shipper_id = s.supplier_id;


SELECT o.order_id, sds.name, o.status, o.shipped_date, s.name
FROM ordered_items o
JOIN supplier_delivery_status sds
	ON o.status = sds.order_status_id
JOIN suppliers s
	ON o.shipper_id = s.supplier_id
WHERE sds.name <> 'Delivered';

SELECT o.order_id, sds.name, o.status, o.shipped_date, s.name
FROM ordered_items o
JOIN supplier_delivery_status sds
	ON o.status = sds.order_status_id
JOIN suppliers s
	ON o.shipper_id = s.supplier_id
WHERE sds.name <> 'Delivered'
AND YEAR(shipped_date) < YEAR(NOW()) - 2;
