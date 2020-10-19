/*Lab | SQL Join
In this lab, you will be using the Sakila database of movie rentals.
Instructions
	List number of films per category.
	Display the first and last names, as well as the address, of each staff member.
	Display the total amount rung up by each staff member in August of 2005.
	List each film and the number of actors who are listed for that film.
	Using the tables payment and customer and the JOIN command, list the total paid by each customer. 
		List the customers alphabetically by last name*/
        
USE sakila;

-- 1) List number of films per category.
SELECT film_category.category_id, category.name as category_name, count(film_id) as number_films 
FROM film_category
INNER JOIN category ON film_category.category_id = category.category_id
GROUP BY film_category.category_id, category_name
ORDER BY film_category.category_id, category_name;

-- 2) Display the first and last names, as well as the address, of each staff member.
SELECT concat(first_name, ' ', last_name) as full_name, address 
FROM staff
INNER JOIN address on staff.address_id = address.address_id;

-- 3) Display the total amount rung up by each staff member in August of 2005.
SELECT staff.staff_id, concat(first_name, ' ', last_name) as full_name, count(amount) as amount_august
FROM staff
INNER JOIN payment ON staff.staff_id = payment.staff_id WHERE payment_date BETWEEN 20050801 and 20050831
GROUP BY staff_id;

-- 4) List each film and the number of actors who are listed for that film.
SELECT film.film_id, title, count(actor_id) from film_actor
INNER JOIN film on film_actor.film_id = film.film_id
GROUP BY film_id, title;

-- 5) Using the tables payment and customer and the JOIN command, list the total paid by each customer.
SELECT customer.customer_id, concat(first_name, ' ', last_name) as full_name, count(amount) 
FROM customer
INNER JOIN payment ON customer.customer_id = payment.customer_id
GROUP BY customer_id, full_name;

-- 6) List the customers alphabetically by last name
SELECT customer.customer_id, first_name, last_name, count(amount) 
FROM customer
INNER JOIN payment ON customer.customer_id = payment.customer_id
GROUP BY customer_id
ORDER BY last_name;