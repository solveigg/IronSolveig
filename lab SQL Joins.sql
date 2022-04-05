
-- Labwork for 05 April 

use sakila;
-- 1. Which actor has appeared in the most films?
select a.actor_id, a.FIRST_NAME, a.LAST_NAME, count(f.film_id) as freq
from sakila.actor as a
right join sakila.film_actor as f 
using(actor_id)
group by actor_id
order by freq desc
limit 1;

-- 
-- 2. Most active custcomer (the customer that has rented the most number of films)

select c.customer_id, c.FIRST_NAME, c.LAST_NAME, count(rental_id) as freq
from sakila.customer as c
right join sakila.rental AS r
using(customer_id)
group by customer_id
order by freq desc
limit 1;

-- 3. List number of films per category.
SELECT c.name, count(fc.film_id) as freq
FROM sakila.category AS c
INNER JOIN sakila.film_category AS fc
using(category_id)
group by c.name
ORDER by freq DESC;

-- 4. Display the first and last names, as well as the address, of each staff member.
select s.FIRST_NAME, s.LAST_NAME, s.address_id,  a.address, a.district
FROM sakila.STAFF AS s
LEFT JOIN sakila.address AS a
using (address_id);

-- 5. Display the amount rung up by each staff member in August of 2005.
Select s.FIRST_NAME, sum(p.amount) AS total 
FROM sakila.STAFF AS s
Right JOIN sakila.payment AS p
using(staff_id)
WHERE payment_date BETWEEN '2005-08-01' AND '2005-08-31'
GROUP BY s.FIRST_NAME;
-- 6. List each film and the number of actors who are listed for that film.
SELECT f.title, count(a.actor_id)
FROM sakila.film AS f
JOIN sakila.film_actor AS a
using(film_id)
GROUP BY f.title
ORDER BY count(a.actor_id) DESC;


-- 7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.

SELECT c.last_name, sum(p.amount)
FROM sakila.payment AS p
JOIN sakila.customer as c
USING(customer_id)
GROUP BY c.last_name
ORDER BY c.last_name;

