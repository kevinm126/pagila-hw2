/*
 * Management wants to send coupons to customers who have previously rented one of the top-5 most profitable movies.
 * Your task is to list these customers.
 *
 * HINT:
 * In problem 16 of pagila-hw1, you ordered the films by most profitable.
 * Modify this query so that it returns only the film_id of the top 5 most profitable films.
 * This will be your subquery.
 * 
 * Next, join the film, inventory, rental, and customer tables.
 * Use a where clause to restrict results to the subquery.
 */
select customer_id from customer 
inner join rental using (customer_id) inner join inventory using (inventory_id) inner join film using (film_id)
where film_id In 
( select film_id from film inner join inventory using (film_id) inner join rental using (inventory_id) inner join payment using(rental_id) group by film_id order by sum(payment.amount)desc limit 5) group by customer_id order by customer_id;
