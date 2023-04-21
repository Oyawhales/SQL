use sql_store; -- This highlight the database meaning ready/prepare the sql_store database  for use. In summary, callup the database 
select * from sql_store.customers;  -- select all field from the customers table; one of table making up the sql_store database 

-- SLECT FROM Keywords  
SELECT   
        name,
        unit_price, 
        unit_price * 1.1 AS new_price 
FROM sql_store.products;

-- NOT IN 
SELECT * 
FROM customers 
WHERE state NOT IN   ("VA", "FL"); -- In the use of NOT, must be encaps with round bracket 

-- < > range outside a value 
SELECT *
FROM customers 
WHERE birth_date <> 1990-01-01;   -- standard format for Date of birth


-- DEFINE RANGE 
SELECT * 
FROM customers 
WHERE birth_date BETWEEN  1990-01-01 AND 1989-01-01;


-- REGULAR EXPRESSION 
 
-- return customers with last_name as either field or rose or mac in any position as elements; with the use of pipe as separator -Logical OR 
-- Also, these words can be part of a complete word  
SELECT * 
FROM customers
WHERE last_name REGEXP "field|rose|mac"; 

-- Return customers with name ending with field and name containing rose and mac in any order 
SELECT * 
FROM customers
WHERE last_name REGEXP "field$|rose|mac";


-- With regular expression, last name ends with field 
SELECT * 
FROM customers
WHERE last_name REGEXP "field$"; 

-- With regular expression, last name  with bo
SELECT * 
FROM customers
WHERE last_name REGEXP "^bo"; 

-- WILD CARDS 
SELECT * 
FROM customers 
WHERE first_name LIKE "____ra"; -- exactly 4-letters preceeds ra 

SELECT * 
FROM customers 
WHERE first_name LIKE "%ra"; -- Any word preceeds ra; 




