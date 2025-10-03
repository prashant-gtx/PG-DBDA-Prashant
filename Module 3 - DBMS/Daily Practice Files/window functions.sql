-- window functions
use hr;

select first_name,department_id,salary,
	avg(salary) over (partition by department_id) as dept_avg
from employees;

use northwind;

-- row_number()
select * from products;
select product_name,category_id,
unit_price,row_number() over(order by unit_price desc) as rank_price
from products;


-- no of products in the same category

select category_id,product_name,unit_price,
row_number() over(partition by category_id order by unit_price desc) as cat_in
from products;

with rank_high as(
select category_id,product_name,unit_price,
row_number() over(partition by category_id order by unit_price desc) as cat_in
from products) 
select product_name,unit_price,cat_in as high_price_product from rank_high where cat_in=1;

select category_id,
product_name,unit_price,row_number()
over(partition by category_id order by unit_price desc) as cat_in_row_num,
rank() over (partition by category_id order by unit_price desc) as cat_by_rank,
dense_rank() over (partition by category_id order by unit_price desc) as cat_by_dense_rank
from products;

select e.employee_id,e.first_name,count(o.order_id)as total_order,rank() over (order by count(o.order_id)desc)as performance_rank
from employees e left join orders o on e.employee_id=o.employee_id group by e.employee_id,e.first_name order by performance_rank;
