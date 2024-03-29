# Subquery Introduction

# A Subquery is essentially a query within a query.

#Example:
#SELECT customer_name, customer_id
#FROM customers
#WHERE customer_id 
#IN (SELECT customer_id 
       #FROM orders 
       #WHERE order_amount > 1000);





# Subquery Basics


SELECT *
FROM customers;


SELECT *
FROM customers
WHERE customer_id IN 
	( SELECT customer_id
	FROM customer_orders);

# only can have 1 colume in sub
SELECT *
FROM customers
WHERE customer_id IN 
	( SELECT customer_id, tip
	FROM customer_orders
    WHERE tip > 1);
    
SELECT *
FROM customers
WHERE customer_id IN 
	( SELECT customer_id
	FROM customer_orders
    WHERE tip > 1);    
    
    
    
SELECT *
FROM customers
WHERE total_money_spent > (SELECT AVG(total_money_spent)
							FROM customers);  

# ANY and ALL Operators

# ANY Operator:

# The ANY operator returns true if the comparison is true for any value in the set of values returned by the subquery.

# For example:

# SELECT product_name 
# FROM products 
# WHERE product_price > ANY (SELECT product_price FROM products WHERE supplier_id = 10);


SELECT shipper_id, order_id, quantity, unit_price, (quantity * unit_price) AS total_order_price
FROM ordered_items
WHERE (quantity * unit_price) > ANY (SELECT (quantity * unit_price) as total_order_price
							FROM ordered_items
							WHERE shipper_id = 1);


# ALL Operator:

# The ALL operator returns true only if the comparison is true for all values in the set of values returned by the subquery.

# For example:

# SELECT product_name 
# FROM products 
# WHERE product_price > ALL (SELECT product_price FROM products WHERE supplier_id = 10);

SELECT *
FROM ordered_items;


SELECT MAX(quantity * unit_price) as total_order_price
FROM ordered_items
WHERE shipper_id = 1;

SELECT order_id, quantity, unit_price, (quantity * unit_price) AS total_order_price
FROM ordered_items
WHERE (quantity * unit_price) > (SELECT MAX(quantity * unit_price) as total_order_price
							FROM ordered_items
							WHERE shipper_id = 1);

SELECT shipper_id, order_id, quantity, unit_price, (quantity * unit_price) AS total_order_price
FROM ordered_items
WHERE (quantity * unit_price) > (SELECT MAX(quantity * unit_price) as total_order_price
							FROM ordered_items
							WHERE shipper_id = 1);


SELECT shipper_id, order_id, quantity, unit_price, (quantity * unit_price) AS total_order_price
FROM ordered_items
WHERE (quantity * unit_price) > ALL (SELECT (quantity * unit_price) as total_order_price
							FROM ordered_items
							WHERE shipper_id = 1);




# Exists

SELECT *
FROM customers
WHERE EXISTS
	( SELECT customer_id
	FROM customer_orders);


SELECT *
FROM customers c
WHERE EXISTS
	( SELECT customer_id
	FROM customer_orders
    WHERE customer_id = c.customer_id);

# Subqueries in Select and From

SELECT *
FROM ordered_items;

SELECT product_id, 
quantity, 
(SELECT AVG(quantity)
	FROM ordered_items) avg_quantity
FROM ordered_items;

SELECT product_id, 
quantity, 
(SELECT SUM(quantity)
	FROM ordered_items) sum_quantity
FROM ordered_items;

SELECT product_id, 
quantity, 
quantity/(SELECT SUM(quantity)
	FROM ordered_items) sum_quantity
FROM ordered_items;

SELECT product_id, 
quantity,
(SELECT SUM(quantity)
	FROM ordered_items) sum_quantity,
(quantity/(SELECT SUM(quantity)
	FROM ordered_items) * 100) percent_quantity
FROM ordered_items;


SELECT product_id, avg_quantity
FROM (SELECT product_id,
quantity,
(SELECT AVG(quantity)
	FROM ordered_items) AS avg_quantity
FROM ordered_items) AS avg_quant;

