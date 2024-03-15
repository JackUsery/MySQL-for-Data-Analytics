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







# Exists


















# Subqueries in Select and From








