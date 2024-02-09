
# Group by basics

SELECT *
FROM customer_orders;

SELECT customer_id, SUM(tip)
FROM customer_orders
GROUP BY customer_id;

SELECT product_id, AVG(order_total)
FROM customer_orders
GROUP BY product_id;

SELECT product_id, AVG(order_total) AS avg_total
FROM customer_orders
GROUP BY product_id
ORDER BY avg_total DESC;


# Aggergate fun.

SELECT customer_id, 
AVG(tip) AS avg_tip
FROM customer_orders
GROUP BY customer_id
ORDER BY avg_tip;

SELECT customer_id, 
MAX(tip) AS max_tip
FROM customer_orders
GROUP BY customer_id
ORDER BY max_tip;

SELECT customer_id, 
MIN(tip) AS min_tip
FROM customer_orders
GROUP BY customer_id
ORDER BY min_tip;

SELECT customer_id, 
COUNT(tip) AS count_of_tip
FROM customer_orders
GROUP BY customer_id
ORDER BY count_of_tip;

SELECT first_name,
last_name,
COUNT(phone) AS count_of_phone
FROM customers
Group BY first_name, last_name;


SELECT product_id,
tip,
COUNT(tip),
COUNT(DISTINCT tip)
FROM customer_orders
GROUP BY product_id, tip
ORDER BY product_id;


# Having 


SELECT customer_id, SUM(tip) AS total_tips
FROM customer_orders
GROUP BY customer_id;

 # ERRO must do Having 
SELECT customer_id, SUM(tip) AS total_tips
FROM customer_orders
WHERE total_tips > 5
GROUP BY customer_id;

SELECT customer_id, SUM(tip) AS total_tips
FROM customer_orders
GROUP BY customer_id
HAVING total_tips > 5;


SELECT customer_id, SUM(order_total) AS total
FROM customer_orders
GROUP BY customer_id
HAVING total > 40
ORDER BY total;


# Rollup sum of ouput of Aggergate

SELECT customer_id, SUM(tip) AS total
FROM customer_orders
GROUP BY customer_id WITH ROLLUP;

SELECT customer_id, COUNT(tip) AS total
FROM customer_orders
GROUP BY customer_id WITH ROLLUP;




