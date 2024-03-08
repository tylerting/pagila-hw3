/*
 * Write a SQL query that lists the title of all movies where at least 2 actors were also in 'AMERICAN CIRCUS'.
*/
select f.title
from film f
join film_actor fi using (actor_id)
join film_actor fi2 using (film_id)
join film f2 on fi.film_id = f2.film_id
where f2.title = 'AMERICAN CIRCUS'
group by 1
having count(*) >= 2
order by 1;
