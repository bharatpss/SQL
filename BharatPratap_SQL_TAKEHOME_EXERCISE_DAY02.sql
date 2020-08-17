 use hr;
 
 -- takehome 2
 
 select * from departments;
 -- question 1
 select * from departments where department_name like 'IT%' and manager_id is null;
 
 select * from employees;
 -- question 2
 select concat("This is to certify that ",first_name," ",last_name," with employee id ",employee_id," is working as ",job_id," in dept. ",department_id) as "bonafide certificate"
 from employees where employee_id = 123;
 
 select * from employees;
 -- question 3
 select employee_id, salary, (salary < 5000) "Tier1", (salary between 5000 and 10000) "Tier2",(salary >10000) as "Tier3" from employees;
 
 select employee_id, salary, case when salary< 5000 then 'tier1'
 when salary between 5000 and 10000 then 'tier2'
 when salary > 10000 then 'tier3'
 else salary
 end Tiers   from employees;
  
 select * from employees;
 -- question 4
 select department_id, job_id, sum(salary) as "total salaries" 
 from employees group by department_id, job_id having sum(salary) > 25000;
 
 -- question 5
 select concat(first_name,' ',last_name) as "name" from employees
 where substring(first_name,-1,1) in ('a','e','i','o','u') and substring(last_name,-1,1) in ('a','e','i','o','u');
 
 select * from jobs;
 -- question 6
 select (max_salary - min_salary)as "Avg salary" from jobs group by job_title like '%Manager' or job_title like '%Clerk';
 
  select * from locations;
-- question 7
select location_id, city from locations where city like 'S%' and city not like 'south%' and country_id in ('US', 'UK');

 
 use orders;
 
 -- question 8
 select * from  online_customer
 where CUSTOMER_CREATION_DATE < date_format(str_to_date('12-Jan-2006','%d-%b-%Y'),'%Y-%m-%d') and CUSTOMER_USERNAME like "dave%" and 
 (CUSTOMER_EMAIL like '%gmail%' or CUSTOMER_EMAIL like '%yahoo%');
 
 -- question 9
select PRODUCT_ID, PRODUCT_DESC, (PRODUCT_PRICE * PRODUCT_QUANTITY_AVAIL)as "total worth" from product;

select * from online_customer;
-- question 10
select concat(CUSTOMER_FNAME,' ',CUSTOMER_LNAME,' (',CUSTOMER_USERNAME,')',' created on ',CUSTOMER_CREATION_DATE,'.',' Contact Phone: ',CUSTOMER_PHONE,' E-mail: ',CUSTOMER_EMAIL)
from online_customer where CUSTOMER_EMAIL like "%gmail%" and CUSTOMER_PHONE like "%77%";
 
use hr;
select * from locations;
-- question 11
select country_id, count(city) from locations where country_id not in ('US','UK') group by country_id having count(city) > 1; 

 
 
 
 
 