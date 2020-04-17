-- SQL STATEMENTS
/*Used UPPERCASE for KEYWORDS and lowercase for other text*/

SELECT occurred_at, account_id, channel 
FROM web_events;
SELECT occurred_at, account_id, channel 
FROM web_events LIMIT 15;

#Write a query to return the 10 earliest orders in the orders table. 
#Include the id, occurred_at, and total_amt_usd.
SELECT id, occurred_at, total_amt_usd 
FROM orders 
ORDER BY occurred_at 
LIMIT 10;

#rite a query to return the top 5 orders in terms of largest total_amt_usd. 
#Include the id, account_id, and total_amt_usd.
SELECT id, account_id, total_amt_usd 
FROM orders 
ORDER BY total_amt_usd DESC
LIMIT 5;

#Write a query to return the lowest 20 orders in terms of smallest total_amt_usd. 
#Include the id, account_id, and total_amt_usd.
SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY total_amt_usd
LIMIT 20;

#Write a query that displays the order ID, account ID, and total dollar amount 
#for all the orders, sorted first by the account ID (in ascending order), 
#and then by the total dollar amount (in descending order).
SELECT id, account_id, total_amt_usd 
FROM orders 
ORDER BY account_id, total_amt_usd DESC; #First sorting will be based on first 
#Column and if and only if same unit exists they will be sorted based on
#Second Column

#Now write a query that again displays order ID, 
#account ID, and total dollar amount for each order, 
#but this time sorted first by total dollar amount (in descending order), 
#and then by account ID (in ascending order).
SELECT id, account_id, total_amt_usd 
FROM orders 
ORDER BY total_amt_usd DESC, account_id;

#ulls the first 5 rows and all columns from 
#the orders table that have a dollar amount of gloss_amt_usd greater than or equal to 1000.
SELECT * 
FROM orders 
WHERE gloss_amt_usd >= 1000 
LIMIT 5;

#Pulls the first 10 rows and all columns 
#from the orders table that have a total_amt_usd less than 500.
SELECT * 
FROM orders
WHERE total_amt_usd < 500 
LIMIT 10;

#Filter the accounts table to include the company name, website, 
#and the primary point of contact (primary_poc) just for the 
#Exxon Mobil company in the accounts table.
SELECT name, website, primary_poc
FROM accounts
WHERE name = 'Exxon Mobil';

#Create a column that divides the standard_amt_usd by the standard_qty to 
#find the unit price for standard paper for each order. 
#Limit the results to the first 10 orders, and include the id and account_id fields.
SELECT id, account_id, (standard_amt_usd/standard_qty) AS std_unit_price
FROM orders 
LIMIT 10;

#rite a query that finds the percentage of revenue 
#that comes from poster paper for each order. You will need to use only the columns 
#that end with _usd. (Try to do 
#this without using the total column.) Display the id and account_id fields also.
SELECT id, account_id, (poster_amt_usd/(standard_amt_usd + gloss_amt_usd + poster_amt_usd)) 
AS prec_reve_poster
FROM orders 
LIMIT 10;