use sql_store; -- This highlight the database meaning ready/prepare the sql_store database  for use. In summary, callup the database 
-- select * from sql_store.customers;  -- select all field from the customers table; one of table making up the sql_store database -- another approach to select the store DB 

-- Order by
SELECT * 
FROM customers 
ORDER BY state DESC; 

-- Return fields with order_id = 2 and order by the multiplication of the unit price and the quantity 
SELECT * 
FROM order_items 
WHERE order_id = 2 
ORDER BY  quantity*unit_price DESC; 

-- selecting all field with another added field and alias total_price  
SELECT * , quantity*unit_price AS total_price  
FROM order_items 
WHERE order_id = 2 
ORDER BY  total_price DESC; 

-- 	first name in the Ascending order 
SELECT * 
FROM customers 
ORDER BY first_name ASC, state  ASC; 

-- Return the first name and last name in ascending order of the first name  
SELECT first_name as ordered_first_name , last_name 
FROM customers; 


-- count all existing customers  
SELECT count(first_name) 
from customers; 

SELECT COUNT(*)
FROM customers; 


-- select all columns from customers where first name takes the descneding order  
SELECT *
FROM customers 
ORDER BY  first_name ASC; 

-- limiting the number of return from a querry 
SELECT * 
FROM customers 
LIMIT 4; 

-- return the nxt 6 records having excluded first 4 items  
SELECT * 
FROM customers 
LIMIT 4, 6; 

-- Get the top 3 loyal customers 
SELECT * 
FROM customers 
ORDER BY points DESC
LIMIT 3; 

-- INNER JOINS - This join columns or birng intersection of columns of table in same database and does for multiple database 
-- -- You can also relate return all the fields from both the order and customers table with the customer_id as intersection (ON as the intersection; where the 
---- customer_id intersect on the order and the customers table 

SELECT * 
FROM orders  
JOIN customers ON orders.customer_id = customers.customer_id
LIMIT 4; 

-- You can also relate return all the fields from both the order and customers table with the customer_id as intersection (ON as the intersection; where the 
-- customer_id intersect on the order and the customers table 
SELECT * 
FROM orders  o -- is like alias 
JOIN customers c -- c is alias 
     ON o.customer_id = c.customer_id
LIMIT 4; 

-- watchout for the error here: Customer_id is ambioguous. This is because customer_id is seen as an intersection, 
-- so it require it being specify if from the customer table or from the 
SELECT order_id, orders.customer_id, first_name 
FROM orders
JOIN customers 
		ON orders.customer_id = customers.customer_id 
LIMIT 4; 

-- alternative coding 
SELECT order_id, o.customer_id, first_name 
FROM orders  o -- access the table; if table is to be access via database with dot, then use to callup
JOIN customers c 
		ON o.customer_id = c.customer_id 
LIMIT 4; 

-- Combining columns from table in multiple Database 

use sql_store;
select product_id 
from order_items;

use sql_inventory;
select product_id 
from products; 

-- With the assumption that product_id is not in store database, so that we will join the product_id to the inventory database  

-- Method 1 : The dot is used to callup the table here, then we join with inmtersection  
SELECT * 
FROM sql_store.order_items oi   -- access the table thru the database  
JOIN sql_inventory.products  p
	 ON oi.product_id = p.product_id; 

-- Method2 : The product table is access thru the use method in the inventory 
use sql_inventory;
SELECT * 
FROM sql_store.order_items oi   -- access the table thru the database  
JOIN products  p
	 ON oi.product_id = p.product_id; 


-- SELF JOIN  



