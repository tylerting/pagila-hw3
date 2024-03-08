/*
 * List the first and last names of all actors who:
 * 1. have appeared in at least one movie in the "Children" category,
 * 2. but that have never appeared in any movie in the "Horror" category.
 */
select distinct first_name, last_name
from actor a
join film_actor using (actor_id)
join film_category using (film_id)
join category c using (category_id)
where c.name = 'Children' and a.actor_id not in (
select fa.actor_id
from film_actor fa
join film_category using (film_id)
join category cg using (category_id)
where cg.name = 'Horror'
)
order by 2;
