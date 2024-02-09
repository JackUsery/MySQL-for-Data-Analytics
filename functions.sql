#String Func.

SELECT length('Sky'); # gives us the length of sky = 3

SELECT first_name, length(first_name) AS Len_first
FROM customers
ORDER BY Len_first;


SELECT first_name, UPPER(first_name) AS UPP_first # Makes everything uppercase
FROM customers
ORDER BY UPP_first;


SELECT first_name, lower(first_name) AS lOW_first # Makes everything lowwecase
FROM customers
ORDER BY lOW_first;

SELECT  TRIM('   SKY'); # removes white space

SELECT  LTRIM('   SKY'); # removes white spcae on left hand side

SELECT  RTRIM('   SKY    '); # removes white spcae on right hand side


SELECT LEFT('Jack',2); # will only take 2 char from LEFT = 'ja'	

SELECT first_name, LEFT(first_name,3)
FROM customers;

SELECT RIGHT('Jack',2); # will only take 2 char from RIGHT = 'ck'

SELECT first_name, RIGHT(first_name,3)
FROM customers;

SELECT SUBSTR('Jack', 2, 3); # 2 = satrt, 3 = how may after, = 'ack'

SELECT phone, 
SUBSTR(phone, 1, 3), 
SUBSTR(phone, 5, 3),
SUBSTR(phone, 9, 4)
FROM customers;


SELECT first_name, REPLACE(first_name, 'a', 'z') # replace the letter a with z
FROM customers;

# use case
SELECT phone, REPLACE(phone, '-', '') # replace the letter - with ''
FROM customers;


SELECT LOCATE('a', 'Jack'); # what positoion this string is located

SELECT first_name, LOCATE('MIC', first_name)
FROM customers;

select CONCAT(first_name, last_name) # join the names together = 'JackUsery'
FROM customers;

SELECT phone, 
SUBSTR(phone, 1, 3), 
SUBSTR(phone, 5, 3),
SUBSTR(phone, 9, 4),
CONCAT(SUBSTR(phone, 1, 3), SUBSTR(phone, 5, 3), SUBSTR(phone, 9, 4))
FROM customers;


#Date and Date Format Func.

SELECT * 
FROM customers;

SELECT NOW(); # Gives current date and time rn

SELECT CURDATE(); # Gives current date

SELECT CURTIME(); # gives current time

SELECT YEAR(NOW()); # gives just year

SELECT MONTH(NOW()); # gives just MONTH

SELECT DAY(NOW()); # gives just DAY

# use case
SELECT *
FROM customers
WHERE YEAR(birth_date) = YEAR(NOW());


SELECT *
FROM customer_orders
WHERE YEAR(order_date) = YEAR(NOW()) - 2;


SELECT DAYNAME(NOW()); # name of the day

SELECT order_date, DAYNAME(order_date), MONTHNAME(order_date)
FROM customer_orders;


SELECT birth_date, DATE_FORMAT(birth_date, '%M %D %Y'), 
DATE_FORMAT(birth_date, '%m %d %y'),
DATE_FORMAT(birth_date, '%m - %d - %y')
FROM customers;




#If Func.


SELECT *
FROM customer_orders;

SELECT tip,
IF(tip > 1, 'GREAT!', 'CHEAP')
FROM customer_orders;


SELECT order_total, 
tip,
IF(tip > 2, order_total * 0.75, order_total * 1.1) AS new_total
FROM customer_orders;



#Case


SELECT units_in_stock,
CASE
	WHEN units_in_stock < 20 THEN 'ORDER NOW'
    WHEN units_in_stock BETWEEN 21 AND 50 THEN 'CHECK IN 3 DAYS'
    WHEN units_in_stock > 51 THEN 'IN STOCK'
END AS 'Order Status'
FROM products;


SELECT units_in_stock,
CASE
	WHEN units_in_stock < 20 THEN 'ORDER NOW'
    WHEN units_in_stock BETWEEN 21 AND 50 THEN 'CHECK IN 3 DAYS'
    ELSE'IN STOCK'
END AS 'Order Status'
FROM products;

SELECT order_id,
order_date,
CASE
	WHEN YEAR(order_date) = YEAR(NOW()) - 1 THEN 'Active'
	WHEN YEAR(order_date) = YEAR(NOW()) - 2 THEN 'Last Year'
    ELSE 'Archive'
    END AS 'Years'
FROM customer_orders;

#Cast and Convert Func.



SELECT CAST('2022-01-01' AS DATETIME);


SELECT birth_date,
CAST(birth_date AS DATETIME),
CONVERT(birth_date, DATETIME)
FROM customers;


SELECT first_name,
CAST(first_name AS DECIMAL)
FROM customers;