/*
 * List all actors with Bacall Number 2;
 * That is, list all actors that have appeared in a film with an actor that has appeared in a film with 'RUSSELL BACALL',
 * but do not include actors that have Bacall Number < 2.
 */
with b1 as (
    select distinct first_name || ' ' || last_name as "Actor Name"
    from actor
    join film_actor using (actor_id)
    join film using (film_id)
    where title in (
        select title
        from film
        join film_actor using (film_id)
        join actor using (actor_id)
        where first_name || ' ' || last_name = 'RUSSELL BACALL'
  )
 ),
b2 as (
    select distinct first_name || ' ' || last_name as "Actor Name"
    from actor
    join film_actor using (actor_id)
    join film using (film_id)
    where title in (select title from film where film_id in (select film_id from b1))
    and actor_id not in (
        select actor_id
        from film_actor
        where film_id in (
            select film_id
            from film_actor
            where actor_id in (
                select actor_id
                from actor
                where first_name = 'RUSSELL' and last_name = 'BACALL'
           )
      )
  )

  AND first_name || ' ' || last_name <> 'RUSSELL BACALL'
)
select "Actor Name" from b2
order by "Actor Name";
