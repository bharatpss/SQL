use hr;
-- 1 fetch the first name and hiring date of employees who were hired between 1998 and 2000
select * from employees;
select first_name, hire_date from employees where year(hire_date ) between 1998 and 2000;

-- 2 Fetch the length of first name of employees whose last name ends with a or z.
select first_name, length(first_name), last_name from employees where last_name regexp "[a-z]$";

-- 3 Fetch records of employee names beginning with ae or containing ly.
select first_name from employees where first_name regexp '^ae|ly';
select first_name from employees where first_name regexp '^ae' or '^ly';
select first_name from employees where first_name regexp '^ae|ly$';

-- 4 Fetch details of departments in which the maximum salary is more than 10000.
select * from departments ;
select * from employees;

select * from departments where department_id in (select department_id from employees where salary > 10000)  group by department_name;

-- 5 Write a  query to display the  employee id, salary & salary range of employees as 
-- 'Tier1', 'Tier2' or 'Tier3' as per the range <5000, 5000-10000, >10000 respectively,ordering the output by those tiers.

select employee_id, salary, case
when salary < 5000 then "Tier1"
when salary between 5000 and 10000 then "Tier2"
when salary > 10000 then "Tier3"
else salary
end "Tiers"
from employees;

-- 6 Fetch the name of the city of the employees whose ID's are 130 and 140
-- subqueries
select city from locations where location_id in (select location_id from departments where department_id in (
select department_id from employees where employee_id in (130,140)));

-- using joins
select e.first_name, e.last_name, l.city from employees e inner join departments d inner join locations l
on e.department_id = d.department_id and d.location_id = l.location_id
where employee_id in (130,140);

-- using function
select e.first_name, e.last_name, l.city from employees e inner join departments d using(department_id) inner join locations l
 using(location_id)
where employee_id in (130,140);

-- 7 Display employee fname and lname if the employee joined before his/her manager.(30 rows)
select e1.first_name, e1.last_name from employees e1 join employees e2
on e1.employee_id = e2.manager_id and e1.hire_date < e2.hire_date
group by  first_name, last_name;

-- 8 Fetch the names of all managers, their department names and the city they are in
-- using joins
select * from employees;
select e.first_name, e.last_name, d.department_name, l.city from employees e inner join departments d inner join locations l
on e.department_id = d.department_id and d.location_id = l.location_id  group by e.manager_id;

-- 9 Fetch details of departments managed by david / smith 
select e.employee_id, e.first_name, e.last_name, d.department_id, d.department_name, d.location_id, d.manager_id from departments d inner join employees e
on d.department_id = e.department_id where e.first_name regexp 'david|smith';

select e.employee_id, e.first_name, e.last_name, d.department_id, d.department_name, d.location_id, d.manager_id from departments d inner join employees e
on d.department_id = e.department_id where e.first_name regexp 'John|Alexander';

-- 10 Fetch records of all employees whose salary is more than the overall average salary
select employee_id , case 
when avg(salary) < salary then 'True'
else 'False'
end avg_salary from employees;

-- subqueries
select * from employees where salary > (select avg(salary) from employees);

select salary from employees order by salary desc;


select max(salary) from employees where salary < (select max(salary) from employees);

select max(salary) from employees where salary not in (select max(salary) from employees);

SELECT Salary
FROM Employees e
WHERE 2=(SELECT COUNT(DISTINCT Salary) FROM Employees p
WHERE e.Salary<=p.Salary)




SELECT Salary FROM (SELECT Salary FROM Employees ORDER BY salary DESC LIMIT 2) AS Emp order by Salary LIMIT 1;