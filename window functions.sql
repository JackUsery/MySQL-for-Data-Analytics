

/*
The OVER clause 
 defines a window or set of rows within the query result set. 
 A window function then computes a value for each row in the window. 
 You can think of it as a moving or sliding window for each row.
*/






/* 
PARTITION BY:
 The PARTITION BY clause divides the result set produced by the FROM clause into partitions to which the window function is applied. 
 In other words, it creates a 'window' for each set of rows sharing the same values of the PARTITION BY clause.
*/






/*
 ROW_NUMBER() is a window function in SQL that assigns a unique row number to each row within the partition of a result set. 
 The first row selected has a row number of 1, the second has 2, and so on.

 Syntax Example:
 SELECT product_name, 
       ROW_NUMBER() OVER (ORDER BY product_price DESC) AS row_number
 FROM products;
*/



# RANK() and DENSE_RANK() are both window functions in SQL that assign a unique rank to each row within a partition of a result set.

/*
RANK() function assigns a unique rank to each distinct row within a partition but leaves gaps in the ranking for tied rows. 
If two (or more) rows tie for a rank, each tied rows receives the same rank, and then the next rank in the sequence is skipped.
 For example, if two rows tie for rank 1, RANK() gives both rows a rank of 1, but the next row receives a rank of 3.
 */
 
 
/*
DENSE_RANK() function also assigns a unique rank to each distinct row within a partition, but unlike RANK(), it does not skip any ranks. 
If two (or more) rows tie for a rank, each tied rows receives the same rank, and the next row receives the next rank in the sequence. 
For example, if two rows tie for rank 1, DENSE_RANK() gives both rows a rank of 1, and the next row receives a rank of 2.
*/

/*
LAG() and LEAD() are window functions in SQL that provide a way to access data from a different row in the same result set without using a self-join. 
They are often used in data analysis to compare the current row with the previous or next row.
*/

/*
LAG() function fetches the value from a row that is a certain number of rows before the current row within the same result set. 
It's useful when you want to compare a value in a row with a value in a preceding row.
*/

# LEAD() function fetches the value from a row that is a certain number of rows after the current row within the same result set.











