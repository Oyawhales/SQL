USE sql_store;

-- return customers with last_name as either field or rose or mac in any position as elements 
SELECT * 
FROM customers
WHERE last_name REGEXP "field|rose|mac"