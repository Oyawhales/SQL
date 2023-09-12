use sql_store; -- This highlight the database meaning ready/prepare the sql_store database  for use. In summary, callup the database 
select * from sql_store.customers;  -- select all field from the customers table; one of table making up the sql_store database 


-- First name contain elka or ambur 
SELECT * 
FROM customers 
WHERE first_name REGEXP  "elka|ambur"; 

-- First name are elka or ambur and based on the case; here lower case 
SELECT * 
FROM customers 
WHERE first_name REGEXP BINARY "elka|ambur"; 

-- ^ indicates the start of the string.
-- B matches the literal letter "B".
-- [A-Za-z] matches any single alphabetical character (uppercase or lowercase) following the "B".
SELECT * 
FROM customers 
WHERE last_name REGEXP '^B[A-Za-z]';


-- Last name ends with EY or ON 
SELECT * 
FROM customers 
WHERE last_name REGEXP  "EY$|ON$" ; 

-- last name starts with MY and contains SE
SELECT * 
FROM customers 
WHERE last_name REGEXP  "^MY|SE"; 



-- Last name ends with EY or ON 
SELECT * 
FROM customers 
WHERE last_name LIKE  "EY$" OR  "ON$"; 

-- point takes a constatnt value of 10  
SELECT first_name, last_name, 10 AS points
FROM customers;

-- select all records with points as 2273
SELECT *
FROM customers 
WHERE points LIKE  2273; 

-- select all records with points as 2273
SELECT *
FROM customers 
WHERE points = 2273; 



-- contains B followed by R or U 
SELECT * 
FROM customers 
WHERE last_name REGEXP   "B[RU]"; 

SELECT * 
FROM customers 
WHERE last_name REGEXP   "br|bu"; 

-- IS NULL & IS NOT NULL  

-- Get orders that   shipped 
use sql_store; 

SELECT * 
FROM orders
WHERE shipped_date IS NOT NULL;  

-- Get orders that are not  shipped 
SELECT * 
FROM orders
WHERE shipped_date IS NULL;

SELECT * 
FROM orders
WHERE shipper_id IS NOT NULL;



