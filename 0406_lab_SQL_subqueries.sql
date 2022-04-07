-- Instructions
use sakila;
-- 1. How many copies of the film Hunchback Impossible exist in the inventory system?
SELECT film_id, film.title, count(inventory_id) from sakila.film AS film 
JOIN sakila.inventory AS inventory 
using(film_id)
GROUP BY film_id
HAVING film.title LIKE '%Hunchback Impossible%';


select c.customer_id, c.FIRST_NAME, c.LAST_NAME, count(rental_id) as freq
from sakila.customer as c
right join sakila.rental AS r
using(customer_id)
group by customer_id
order by freq desc
limit 1;

-- 2. List all films whose length is longer than the average of all the films.
-- SELECT avg(`length`) from sakila.film;
Select title from sakila.film
where `length` > ( SELECT avg(`length`) from sakila.film); 

-- 3. Use subqueries to display all actors who appear in the film Alone Trip.

SELECT first_name, last_name from sakila.actor
	JOIN sakila.film_actor 
			using(actor_id)
	JOIN sakila.film
			using(film_id)
WHERE title LIKE '%Alone Trip%';

-- NELSON
SELECT first_name, last_name from sakila.actor
		WHERE actor_id in (SELECT actor_id from sakila.film_actor
		WHERE film_id = (SELECT film_id from sakila.film 
		where title LIKE '%Alone Trip%'));

-- 4 . Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as family films.
SELECT c.name,f.title
FROM sakila.category AS c
JOIN sakila.film_category AS fc
using(category_id)
JOIN sakila.film as f
using(film_id)
Where c.name LIKE 'fam%'; 


-- 5. Get name and email from customers from Canada using subqueries. Do the same with joins. 
	-- Note that to create a join, you will have to identify the correct tables with 
    -- their primary keys and foreign keys, that will help you get the relevant information.

SELECT c.first_name, c.last_name, c.email, country.country 
FROM sakila.customer AS c
	INNER JOIN sakila.address as Address
		using(address_id)
	INNER JOIN sakila.city AS city
		USING(city_id)
	INNER JOIN sakila.country AS country
		USING(country_id)
Having country.country LIKE 'Can%';


SELECT c.first_name, c.last_name, c.email
FROM sakila.customer AS c
WHERE city_id = (select city_id from sakila.address) 

Select 

	WHERE INNER JOIN sakila.address as Address
		using(address_id)
	INNER JOIN sakila.city AS city
		USING(city_id)
	INNER JOIN sakila.country AS country
		USING(country_id)
Having country.country LIKE 'Can%';

 SELECT first_name, last_name from sakila.actor
		WHERE actor_id in (SELECT actor_id from sakila.film_actor
		WHERE film_id = (SELECT film_id from sakila.film 
		where title LIKE '%Alone Trip%'));
   
    
    
