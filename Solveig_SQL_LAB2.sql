use bank;

-- Assume that any _id columns are incremental, meaning that higher ids always occur after lower ids. For example, 
-- a client with a higher client_id joined the bank after a client with a lower client_id.

select client_id, district_id 
from client
where district_id  =1
limit 5;

-- In the client table, get an id value of the last client where the district_id equals to 72.
select max(client_id), district_id 
from client
where district_id = 72;


-- Get the 3 lowest amounts in the loan table.
select amount 
from loan
order by amount
limit 3;


--  possible values for status, ordered alphabetically in ascending order in the loan table?
select distinct(status) from loan
order by status;

-- What is the loan_id of the highest payment received in the loan table?
select * from loan;

select loan_id, payments
from loan
order by payments desc
limit 1;


-- What is the loan amount of the lowest 5 account_ids in the loan table? Show the account_id and the corresponding amount


select account_id, amount 
from loan
order by account_id
limit 5;

-- What are the top 5 account_ids with the lowest loan amount that have a loan duration of 60 in the loan table?

select account_id, amount, duration 
FROM loan
WHERE duration = 60
ORDER BY  amount, account_id
LIMIT 5;


-- What are the unique values of k_symbol in the order table?
SELECT distinct k_symbol 
FROM `order`
order by k_symbol ;

-- In the order table, what are the order_ids of the client with the account_id 34?

SELECT order_id
FROM `order`
WHERE account_id = 34;

-- In the order table, which account_ids were responsible for orders between order_id 29540 and order_id 29560 (inclusive)?

SELECT distinct account_id
FROM `order`
WHERE order_id >= 29540 AND order_id<= 29560;

-- what are the individual amounts that were sent to (account_to) id 30067122?
SELECT  amount
FROM `order`
WHERE account_to = 30067122;

-- n the trans table, show the trans_id, date, type and amount of the 10 first transactions from account_id 793 in chronological order, from newest to oldest.

SELECT trans_id, date, type, amount
FROM trans
WHERE account_id = 793
order by date desc
limit 10;

-- In the client table, of all districts with a district_id lower than 10, how many clients are from each district_id? Show the results sorted by the district_id in ascending order.
SELECT  district_id, count(client_id)
FROM client
WHERE district_id < 10
group by district_id 
ORDER BY district_id;

-- In the card table, how many cards exist for each type? Rank the result starting with the most frequent type

SELECT type, COUNT(type) AS freq
FROM card
GROUP BY type
ORDER BY freq DESC;

-- Using the loan table, print the top 10 account_ids based on the sum of all of their loan amounts.
SELECT account_id, sum(amount) AS total 
FROM loan
GROUP BY account_id
ORDER BY total DESC
LIMIT 10; 

-- In the loan table, retrieve the number of loans issued for each day, before (excl) 930907, ordered by date in descending order.

SELECT date, count(loan_id) AS 'number of loans'
FROM loan
GROUP BY date
having date < 930907
ORDER BY date desc;

-- In the loan table, for each day in December 1997, count the number of loans issued for each unique loan duration, ordered by date and duration, both in ascending order. You can ignore days without any loans in your output.

SELECT date, count(loan_id), distinct duration
FROM loan
GROUP BY date
Having date >= 35795 AND <= 35765
ORDER BY date, duration asc;


-- date
select date from loan;