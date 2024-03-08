/* 
 * A new James Bond movie will be released soon, and management wants to send promotional material to "action fanatics".
 * They've decided that an action fanatic is any customer where at least 4 of their 5 most recently rented movies are action movies.
 *
 * Write a SQL query that finds all action fanatics.
 */
select customer_id, first_name, last_name
from (
select customer_id, first_name, last_name, inventory_id, RANK() OVER (PARTITION BY customer_id ORDER BY rental_date DESC) 
from customer
join rental using (customer_id)
) b
join inventory using (inventory_id)
join film using (film_id)
join film_category using (film_id)
join category using (category_id)
where rank <= 5
group by 1,2,3
having sum(case when name = 'Action' then 1 else 0 end) >= 4
order by customer_id;
