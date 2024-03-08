/*
 * You love the acting in the movie 'AMERICAN CIRCUS' and want to watch other movies with the same actors.
 *
 * Write a SQL query that lists the title of all movies that share at least 1 actor with 'AMERICAN CIRCUS'.
 *
 * HINT:
 * This can be solved with a self join on the film_actor table.
 */
select f1.title
from film f1
join film_actor fa1  using (film_id)
join film_actor fa2 using (actor_id)
join film f2 using (film_id)
where f2.title = 'AMERICAN CIRCUS'
order by 1;
