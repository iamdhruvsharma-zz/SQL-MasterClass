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


-- Provide a table for all web_events associated with account name of Walmart. 
-- There should be three columns. Be sure to include the primary_poc, time of the event, 
-- and the channel for each event. Additionally, 
-- you might choose to add a fourth column to assure only Walmart events were chosen.
SELECT a.primary_poc, w.occurred_at, w.channel, a.name 
FROM accounts AS a 
JOIN web_events AS w 
ON w.account_id = a.id 
AND a.name = 'Walmart';


-- Equivalent

SELECT a.primary_poc, w.occurred_at, w.channel, a.name
FROM web_events w
JOIN accounts a
ON w.account_id = a.id
WHERE a.name = 'Walmart';


-- Provide a table that provides the region for each sales_rep along 
-- with their associated accounts. Your final table should include three columns: the region name, the sales rep name, and the account name. 
-- Sort the accounts alphabetically (A-Z) according to account name
SELECT r.name AS r_name, 
s_r.name AS s_r_namev, 
a.name AS a_name 
FROM sales_reps AS s_r 
JOIN region AS r 
ON  s_r.region_id = r.id 
JOIN accounts AS a 
ON a.sales_rep_id = s_r.id
ORDER BY a_name;

--Equivalent

SELECT r.name region, s.name rep, a.name account
FROM sales_reps s
JOIN region r
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
ORDER BY a.name;
-- Provide the name for each region for every order, as well as the account name 
-- and the unit price they paid (total_amt_usd/total) for the order. 
-- Your final table should have 3 columns: region name, account name, and unit price. 
-- A few accounts have 0 for total, so I divided by (total + 0.01) to assure not dividing 
-- by zero.
SELECT r.name AS r_name, 
a.name AS a_name, 
(o.total_amt_usd / (total+0.01)) AS unit_price 
FROM orders AS o 
JOIN accounts AS a 
ON o.account_id = a.id 
JOIN sales_reps AS s_r 
ON a.sales_rep_id = s_r.id 
JOIN region as r 
ON s_r.region_id = r.id;

-- Equivalent

SELECT r.name region, a.name account, 
       o.total_amt_usd/(o.total + 0.01) unit_price
FROM region r
JOIN sales_reps s
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id;

-- IMP

-- The ON statement should always occur with the foreign key being equal to the primary key.

-- JOIN statements allow us to pull data from multiple tables in a SQL database.

-- You can use all of the commands we saw in the first lesson along with JOIN statements.


-- Provide a table that provides the region for each sales_rep along with 
-- their associated accounts. This time only for the Midwest region. 
-- Your final table should include three columns: the region name, 
-- the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) 
-- according to account name.
SELECT r.name r_name, s_r.name s_r_name, a.name a_name 
FROM sales_reps s_r 
JOIN region r 
ON s_r.region_id = r.id AND r.name = 'Midwest' 
JOIN accounts a ON a.sales_rep_id = s_r.id;


-- Provide a table that provides the region for each sales_rep along 
-- with their associated accounts. This time only for accounts where 
-- the sales rep has a first name starting with S and in the Midwest region. 
-- Your final table should include three columns: the region name, the sales rep name, 
-- and the account name. Sort the accounts alphabetically (A-Z) according to account name.
SELECT r.name r_name, s_r.name s_r_name, a.name a_name 
FROM sales_reps s_r 
JOIN region r 
ON s_r.region_id = r.id AND r.name = 'Midwest' AND s_r.name LIKE 'S%' 
JOIN accounts a 
ON a.sales_rep_id = s_r.id 
ORDER BY a_name;


-- Provide a table that provides the region for each sales_rep along 
-- with their associated accounts. This time only for accounts
-- where the sales rep has a last name starting with K and in the Midwest region. 
-- Your final table should include three columns: the region name, the sales rep name, 
-- and the account name. Sort the accounts alphabetically (A-Z) according to account name.
SELECT r.name r_name, s_r.name s_r_name, a.name a_name 
FROM sales_reps s_r 
JOIN region r 
ON s_r.region_id = r.id AND r.name = 'Midwest' AND s_r.name LIKE '% K%' 
JOIN accounts a 
ON a.sales_rep_id = s_r.id 
ORDER BY a_name;


-- Provide the name for each region for every order, as well as the account name 
-- and the unit price they paid (total_amt_usd/total) for the order. However, 
-- you should only provide the results if the standard order quantity exceeds 100. 
-- Your final table should have 3 columns: region name, account name, and unit price. 
-- In order to avoid a division by zero error, adding .01 to the denominator here is 
-- helpful total_amt_usd/(total+0.01).
SELECT r.name r_name, a.name a_name, (o.total_amt_usd / (o.total + 0.01)) unit_price 
FROM orders o 
JOIN accounts a 
ON o.account_id = a.id AND o.standard_qty > 100 
JOIN sales_reps s_r 
ON a.sales_rep_id = s_r.id 
JOIN region r 
ON s_r.region_id = r.id;


-- Provide the name for each region for every order, as well as the account name and 
-- the unit price they paid (total_amt_usd/total) for the order. However, 
-- you should only provide the results if the standard order quantity exceeds 100 
-- and the poster order quantity exceeds 50. Your final table should have 3 columns: 
-- region name, account name, and unit price. Sort for the smallest unit price first. 
-- In order to avoid a division by zero error, adding .01 to the denominator here is 
-- helpful (total_amt_usd/(total+0.01).


-- Provide the name for each region for every order, as well as the account name 
-- and the unit price they paid (total_amt_usd/total) for the order. However, you 
-- should only provide the results if the standard order quantity exceeds 100 and 
-- the poster order quantity exceeds 50. Your final table should have 3 columns: region 
-- name, account name, and unit price. Sort for the largest unit price first. In 
-- order to avoid a division by zero error, adding .01 to the denominator here is 
-- helpful (total_amt_usd/(total+0.01).


-- What are the different channels used by account id 1001? Your final table should 
-- have only 2 columns: account name and the different channels. You can try 
-- SELECT DISTINCT to narrow down the results to only the unique values.


-- Find all the orders that occurred in 2015. Your final table should have 4 columns: 
-- occurred_at, account name, order total, and order total_amt_usd.

