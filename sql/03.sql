/*
 * List the total amount of money that customers from each country have payed.
 * Order the results from most to least money.
 */
select country, sum(amount) as total_payments
from customer
join address using (address_id)
join city using (city_id)
join country using (country_id)
join payment on customer.customer_id = payment.customer_id
group by 1
order by 2 desc, 1;
