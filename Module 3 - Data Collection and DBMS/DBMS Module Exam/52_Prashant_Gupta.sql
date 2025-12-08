use shopdb;
-- --------------------------Section 1----------------------------------------
-- 1 
create table department(
	dept_id int primary key auto_increment,
    dept_name varchar(60) unique not null
);

-- 2 
-- (a)

insert into department(dept_name)
value('R&D');
insert into department(dept_name)
value('Operations');

select * from department;

-- (b) 
update department set dept_name='Ops' where dept_name='Operations';

 -- 3 Retrieve all department details where dept_name starts with the letter 'O'.
 select * from department
 where dept_name like 'O%';


-- --------------------------Section 2----------------------------------------

-- 1
alter table products
add column discount_pct decimal(5,2) not null default 0.00;

desc products;

update products
set discount_pct=10.00 where category='Stationery';

select * from products;

-- 2
desc customers;
select * from customers;

ALTER TABLE customers 
CHANGE COLUMN full_name name VARCHAR(120) NOT NULL ;

update customers
set city=upper(city) where city='Mumbai';

-- 3 

select * from orders;

select o.order_id,c.name,o.order_date, sum(oi.quantity) as sum_of_quantities, sum(oi.quantity)*oi.unit_price as total_value
from customers c join orders o
on c.customer_id=o.customer_id
join order_items oi
on o.order_id=oi.order_id
where month(o.order_date)=9 and year(o.order_date)=2025
group by o.order_id,c.name,oi.unit_price
order by total_value desc;

-- 4 
select * from products;
select p.product_id,p.name,sum(quantity*unit_price) as total_revenue
from products p join order_items o
on p.product_id=o.product_id
group by p.product_id,p.name
order by total_revenue desc
limit 2;

select * from order_items;

-- 5 

delimiter $$
create trigger before_insert_products
before insert on products
for each row
begin
	if new.price=0 or new.price<0 then
    set new.price=0.01;
    end if;
end;;
$$
delimiter ;

insert into products value(6,'Joystick','Electronics',0,10,current_timestamp,0.00);
select * from products;

-- 6 

delimiter $$
create procedure get_customer_orders(in p_customer_id INT)
deterministic
begin
	select order_id, order_date, status, total_amount from orders where customer_id=p_customer_id
    order by order_date desc;
end;;
$$
delimiter ;


call get_customer_orders(1);

-- 7 

delimiter $$
create function fn_order_total()
returns decimal(12,2)
deterministic
begin
	declare sum_total decimal(12,2);
    select order_id,sum(quantity*unit_price) into sum_total
    from order_items group by order_id;
    return sum_total;
end;;
$$
delimiter ;

select fn_order_total();

-- 8 
with rank_sal as(
select emp_id,emp_name,dept_id,salary, 
dense_rank() over (partition by dept_id order by salary desc) as salary_rank from employees)

select * from rank_sal;

-- 9 

select o.order_id,o.order_date,c.name as customer_name, count(distinct(oi.product_id)) as no_of_distinct_products
from customers c join orders o 
on c.customer_id=o.customer_id
join order_items oi 
on o.order_id-oi.order_id
group by o.order_id
having count(oi.product_id)>1
order by o.order_date desc;



