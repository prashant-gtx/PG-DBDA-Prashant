-- Q.1
with emp_cte as (
    select 
        employee_id,
        concat(coalesce(first_name,''), ' ', last_name) as full_name,
        job_id,
        department_id,
        salary
    from employees
)
select * from emp_cte;


-- Q.2
with dept_emp_count as (
    select 
        department_id,
        count(*) as headcount
    from employees
    group by department_id
)
select 
    d.department_id,
    d.department_name,
    coalesce(c.headcount,0) as headcount
from departments d
left join dept_emp_count c 
       on d.department_id = c.department_id
order by d.department_id;


-- Q.3
with job_salary as (
    select 
        job_id,
        count(*) as emp_count,
        round(avg(salary),2) as avg_salary
    from employees
    group by job_id
)
select 
    j.job_id,
    j.job_title,
    s.emp_count,
    s.avg_salary
from job_salary s
join jobs j on s.job_id = j.job_id
order by s.avg_salary desc;


-- Q.4
with emp_cte as (
    select 
        employee_id,
        concat(coalesce(first_name,''), ' ', last_name) as emp_name,
        manager_id
    from employees
)
select 
    e.employee_id,
    e.emp_name as employee_name,
    e.manager_id,
    m.emp_name as manager_name
from emp_cte e
left join emp_cte m on e.manager_id = m.employee_id;


-- Q.5
with emp_cte as (
    select 
        employee_id,
        concat(coalesce(first_name,''), ' ', last_name) as full_name,
        job_id,
        department_id
    from employees
    where department_id is null or department_id = 0
)
select * from emp_cte;


-- Q.6
with emp_depts as (
    select distinct department_id
    from employees
)
select 
    d.department_id,
    d.department_name
from departments d
left join emp_depts e 
       on d.department_id = e.department_id
where e.department_id is null;


-- Q.7
with emp_region as (
    select 
        e.employee_id,
        concat(coalesce(e.first_name,''), ' ', e.last_name) as full_name,
        d.department_name,
        l.city,
        c.country_name,
        trim(replace(r.region_name, '\r','')) as region_name
    from employees e
    left join departments d on e.department_id = d.department_id
    left join locations l   on d.location_id = l.location_id
    left join countries c   on l.country_id = c.country_id
    left join regions r     on c.region_id = r.region_id
)
select * from emp_region;


-- Q.8
with pay_band as (
    select 
        e.employee_id,
        concat(coalesce(first_name,''),' ',last_name) as full_name,
        j.job_title,
        e.salary,
        j.min_salary,
        j.max_salary
    from employees e
    join jobs j on e.job_id = j.job_id
)
select * 
from pay_band
where salary < min_salary or salary > max_salary;


-- Q.9
with earners as (
    select 
        employee_id,
        concat(coalesce(first_name,''),' ',last_name) as full_name,
        salary
    from employees
)
select *
from earners
order by salary desc
limit 5;


-- Q.10
with dept_jobs as (
    select 
        department_id,
        job_id,
        count(*) as employees_in_role
    from employees
    group by department_id, job_id
)
select 
    d.department_name,
    j.job_title,
    dj.employees_in_role
from dept_jobs dj
join departments d on dj.department_id = d.department_id
join jobs j        on dj.job_id = j.job_id;


-- Q.11
with emp_region as (
    select 
        e.employee_id,
        trim(replace(r.region_name,'\r','')) as region_name
    from employees e
    left join departments d on e.department_id = d.department_id
    left join locations l   on d.location_id = l.location_id
    left join countries c   on l.country_id = c.country_id
    left join regions r     on c.region_id = r.region_id
)
select 
    coalesce(region_name,'unknown') as region_name,
    count(*) as headcount
from emp_region
group by coalesce(region_name,'unknown');


-- Q.12
with comm_cte as (
    select 
        employee_id,
        case when commission_pct > 0 then 1 else 0 end as has_commission
    from employees
)
select 
    has_commission,
    count(*) as headcount
from comm_cte
group by has_commission;


-- Q.13
with hist_emp as (
    select distinct employee_id
    from job_history
    where employee_id <> 0
)
select 
    e.employee_id,
    concat(coalesce(e.first_name,''),' ',e.last_name) as full_name,
    count(jh.employee_id) as history_row_count
from hist_emp h
join employees e on e.employee_id = h.employee_id
join job_history jh on jh.employee_id = h.employee_id
group by e.employee_id, full_name;


-- Q.14
with clean_hist as (
    select *
    from job_history
    where employee_id <> 0
      and start_date <> '0000-00-00'
      and end_date   <> '0000-00-00'
),
ranked_hist as (
    select *,
           row_number() over (
               partition by employee_id
               order by end_date desc, start_date desc
           ) as rn
    from clean_hist
)
select 
    employee_id,
    job_id as last_hist_job_id,
    department_id as last_hist_department_id,
    end_date as last_hist_end_date
from ranked_hist
where rn = 1;


-- Q.15
with loc_count as (
    select country_id, count(*) as location_count
    from locations
    group by country_id
)
select 
    lc.country_id,
    coalesce(c.country_name,'unknown') as country_name,
    lc.location_count
from loc_count lc
left join countries c on lc.country_id = c.country_id;
