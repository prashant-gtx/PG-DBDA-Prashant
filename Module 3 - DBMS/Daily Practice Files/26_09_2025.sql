use northwind;
use practice;

select count(employee_id) no_emp, sum(salary) sum_sal, min(salary) min_sal, max(salary) max_sal, avg(salary) avg_sal
from employees;

select count(order_id), order_date from northwind.orders group by order_date;

select order_date from orders group by order_date;

-- find no of employees hired for particular year suppose 1986, 1996
select * from employees;
select count(employee_id), year(hire_date) from employees where year(hire_date)= '1987' or year(hire_date)='1997' group by year(hire_date);

-- find how many orders were made in each year
select * from orders;
select count(order_id) as no_of_orders,year(order_date) as order_year from orders group by year(order_date);

select region, count(*) from customers group by region;   -- null is also grouped together using this query

select region, count(*) as no_of from customers group by region having no_of>=6 order by no_of desc;

select ship_city, count(*) as cou_all from orders group by ship_city order by cou_all;

select region, count(*) as no_of from customers where region is not null group by region having no_of>=6 order by no_of desc;

-- employees who are handling more than 30 orders
select * from orders;
select employee_id, count(order_id) cou_or from orders group by employee_id having cou_or>30;

-- find supplier who supplies for more than 3 products
select * from products;

select supplier_id, count(product_id) cou_prod from products group by supplier_id having cou_prod>3;



-- categorize product by price range and 
-- show count and average stock for each range
-- case to categorize
-- count, avg(Stock)

use northwind;
select * from products;

select 
case 
	when unit_price<10 then 'Cheap Product'
	when unit_price>10 and unit_price<50 then 'Low Budget Product'
    when unit_price>50 and unit_price<80 then 'Mid Budget Product'
    when unit_price>80 then 'High Budget Product'
end as price_cat, count(*) as prod_count, avg(units_in_stock) as avg_stock
from products
group by price_cat;

select* from order_details;

SELECT
  CASE
    when DATEDIFF(shipped_date,order_date)<3 then 'Fast Delivery'
    when DATEDIFF(shipped_date,order_date)>=3 and DATEDIFF(shipped_date, order_date)<5 then 'Regular Delivery'
    when DATEDIFF(shipped_date, order_date)>5 then 'Delayed Delivery'
  end as shipping_speed, count(order_id) as count_order
FROM orders group by shipping_speed;




