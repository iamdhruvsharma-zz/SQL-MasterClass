-- SQL STATEMENTS
-- Used UPPERCASE for KEYWORDS and lowercase for other text

SELECT orders.account_id, accounts.name 
FROM orders 
JOIN accounts 
ON orders.account_id = accounts.id;

-- Try pulling all the data from the accounts table, 
-- and all the data from the orders table.

SELECT *  -- Columns from other the tables
FROM orders
JOIN accounts
ON orders.account_id = accounts.id;

-- Try pulling standard_qty, gloss_qty, and poster_qty from the orders table, 
-- and the website and the primary_poc from the accounts table.
SELECT orders.standard_qty, orders.gloss_qty, orders.poster_qty, accounts.primary_poc, accounts.website 
FROM orders 
JOIN accounts 
ON orders.account_id = accounts.id;