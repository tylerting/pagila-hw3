/*
 * Compute the country with the most customers in it. 
 */
select country
from customer
join address using (address_id)
join city using (city_id)
join country using (country_id)
group by 1
order by count(customer_id) desc
limit 1;
