show databases;
use greatlakes;

CREATE TABLE purchases (
  product_id INTEGER
    REFERENCES products(product_id),
  customer_id INTEGER
    REFERENCES customers(customer_id),
  quantity INTEGER NOT NULL,
  CONSTRAINT purchases_pk PRIMARY KEY (product_id, customer_id)
);


-- insert sample data into purchases table
INSERT INTO purchases ( product_id, customer_id, quantity) VALUES ( 1, 1, 1);
INSERT INTO purchases ( product_id, customer_id, quantity) VALUES ( 2, 1, 3);
INSERT INTO purchases ( product_id, customer_id, quantity) VALUES ( 1, 4, 1);
INSERT INTO purchases ( product_id, customer_id, quantity) VALUES ( 2, 2, 1);
INSERT INTO purchases ( product_id, customer_id, quantity) VALUES ( 1, 3, 1);
INSERT INTO purchases ( product_id, customer_id, quantity) VALUES ( 1, 2, 2);
INSERT INTO purchases ( product_id, customer_id, quantity) VALUES ( 2, 3, 1);
INSERT INTO purchases ( product_id, customer_id, quantity) VALUES ( 2, 4, 1);
INSERT INTO purchases ( product_id, customer_id, quantity) VALUES ( 3, 3, 1);

select * from purchases;

select * from products;

show tables;

select p.product_id, pr.name, p.customer_id, p.quantity from purchases p inner join products pr where p.product_id = pr.product_id;

select p.product_id, pr.name, p.customer_id, p.quantity from purchases p, products pr where p.product_id = pr.product_id;

use greatlakes;
select * from customers;

select p.product_id, p.customer_id, concat(c.first_name,' ',c.last_name) 'customer name', p.quantity from purchases p, customers c where p.customer_id = c.customer_id;

select p.product_id, pr.name, p.customer_id, concat(c.first_name,' ',c.last_name) 'customer name', p.quantity from purchases p, products pr,customers c where p.customer_id = c.customer_id and pr.product_id=p.product_id;

select p.product_id, pr.name, p.customer_id, concat(c.first_name,' ',c.last_name) 'customer name', p.quantity from purchases p inner join products pr inner join customers c on p.customer_id = c.customer_id and pr.product_id=p.product_id;

select p.product_id, pr.name, p.customer_id, concat(c.first_name,' ',c.last_name) 'customer name', p.quantity 
from purchases p inner join products pr
on pr.product_id=p.product_id
inner join customers c 
on p.customer_id = c.customer_id;

select p.product_id, pr.name,pt.name, p.customer_id, concat(c.first_name,' ',c.last_name) 'customer name', p.quantity 
from purchases p inner join products pr
on pr.product_id=p.product_id
inner join customers c 
on p.customer_id = c.customer_id
inner join product_types pt
on pr.product_type_id = pt.product_type_id;

-- inner join
select * from products;
select p.product_id, p.product_type_id, pt.name, p.name, p.description, p.price
from products p inner join product_types pt
on p.product_type_id = pt.product_type_id;

-- left outer join
select * from products;
select p.product_id, p.product_type_id, pt.name, p.name, p.description, p.price
from products p left outer join product_types pt
on p.product_type_id = pt.product_type_id;

-- right outer  join
select * from products;
select p.product_id, p.product_type_id, pt.name, p.name, p.description, p.price
from products p right outer join product_types pt
on p.product_type_id = pt.product_type_id;

-- full outer join not support by mysql by using union all with duplicates
select p.product_id, p.product_type_id, pt.name, p.name, p.description, p.price
from products p left outer join product_types pt
on p.product_type_id = pt.product_type_id
union all
select p.product_id, p.product_type_id, pt.name, p.name, p.description, p.price
from products p right outer join product_types pt
on p.product_type_id = pt.product_type_id;

-- full outer join not support by mysql by using union without duplicates
select p.product_id, p.product_type_id, pt.name, p.name, p.description, p.price
from products p left outer join product_types pt
on p.product_type_id = pt.product_type_id
union
select p.product_id, p.product_type_id, pt.name, p.name, p.description, p.price
from products p right outer join product_types pt
on p.product_type_id = pt.product_type_id;

use takehome;

select * from employees;

-- self join
select e.employee_id, e.first_name, e.last_name, e.manager_id, m.first_name, m.last_name
from employees e join employees m
on e.manager_id = m.employee_id;


select e.employee_id, concat(e.first_name,' ' ,e.last_name)'employee name', e.manager_id, concat(m.first_name, ' ', m.last_name) 'manager name'
from employees e inner join employees m
on e.manager_id = m.employee_id;


select e.employee_id, concat(e.first_name,' ' ,e.last_name)'employee name', e.manager_id, concat(m.first_name, ' ', m.last_name) 'manager name'
from employees e left join employees m
on e.manager_id = m.employee_id;

select e.employee_id, concat(e.first_name,' ' ,e.last_name)'employee name', e.manager_id, concat(m.first_name, ' ', m.last_name) 'manager name'
from employees e right join employees m
on e.manager_id = m.employee_id;

use greatlakes;

CREATE TABLE employees (
  employee_id INTEGER
    PRIMARY KEY,
  manager_id INTEGER,
  first_name VARCHAR(10) NOT NULL,
  last_name VARCHAR(10) NOT NULL,
  title VARCHAR(20),
  salary decimal(6, 0)
);

-- insert sample data into employees table

INSERT INTO employees (employee_id, manager_id, first_name, last_name, title, salary) VALUES( 1, NULL, 'James', 'Smith', 'CEO', 800000);
INSERT INTO employees (employee_id, manager_id, first_name, last_name, title, salary) VALUES( 2, 1, 'Ron', 'Johnson', 'Sales Manager', 600000);
INSERT INTO employees (employee_id, manager_id, first_name, last_name, title, salary) VALUES( 3, 2, 'Fred', 'Hobbs', 'Salesperson', 150000);
INSERT INTO employees (employee_id, manager_id, first_name, last_name, title, salary) VALUES( 4, 2, 'Susan', 'Jones', 'Salesperson', 500000);

select * from employees;
-- self join
select e.employee_id, e.first_name, e.last_name, m.employee_id, m.first_name, m.last_name
from employees e join employees m
on e.manager_id = m.employee_id;

-- inner join
select e.employee_id, concat(e.first_name,' ' ,e.last_name)'employee name', e.manager_id, concat(m.first_name, ' ', m.last_name) 'manager name'
from employees e inner join employees m
on e.manager_id = m.employee_id;

-- left join
select e.employee_id, concat(e.first_name,' ' ,e.last_name)'employee name', e.manager_id, concat(m.first_name, ' ', m.last_name) 'manager name'
from employees e left join employees m
on e.manager_id = m.employee_id;

select e.employee_id, concat(e.first_name,' ' ,e.last_name)'employee name', e.manager_id, concat(m.first_name, ' ', m.last_name) 'manager name'
from employees e right join employees m
on e.manager_id = m.employee_id;

create table food(
	id int,
    name varchar(20),
    price decimal(6,2));
    
insert into food (id, name, price) value (1, 'Butter Naan', 33.0);
insert into food (id, name, price) value (2, 'Chicken Briyani',50.0);
insert into food (id, name, price) value (3, 'Paneer Fried Rice',40.5);
insert into food (id, name, price) value (4, 'French Fries', 30.0);
insert into food (id, name, price) value (5, 'Gobhi Fried Rice',25.5);
insert into food (id, name, price) value (6,'Mutton Briyani',60.0);
insert into food (id, name, price) value (7,'Prawn Fries',70.0);
insert into food (id, name, price) value (8,'Milkshake',50.5);
insert into food (id, name, price) value (9,'Browine',40.5);
insert into food (id, name, price) value (10,'Ice cream',70.5);

select * from food;

-- /// 

describe food;
-- // alter commend
alter table food
modify name varchar(30) ;

describe food;

-- // update
update food set name = 'Chocolate Browine' where id = 9;
select * from food;

update food set price = 100 where id in (7,10);
update food set name = 'Fries', Price = 40 where id = 4;
update food set name = replace(name,'Briyani','Br') where name like '%Briyani';

update food set name = replace(name,'Br','Briyani') where name like '%Br';

select * from food;

alter table food
add column Quantity int;

describe food;

select * from food;

update food set Quantity = 20;

rollback;

alter table food
drop column Quantity;

describe food;

delete from food where id = 5;
select * from food;

rename table food to menu;

select * from menu;
truncate table menu;

show tables;
drop table menu;


CREATE TABLE overtime (
    employee_name VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL,
    hours INT NOT NULL,
    PRIMARY KEY (employee_name , department)
);
INSERT INTO overtime(employee_name, department, hours)
VALUES('Diane Murphy','Accounting',37),
('Mary Patterson','Accounting',74),
('Jeff Firrelli','Accounting',40),
('William Patterson','Finance',58),
('Gerard Bondur','Finance',47),
('Anthony Bow','Finance',66),
('Leslie Jennings','IT',90),
('Leslie Thompson','IT',88),
('Julie Firrelli','Sales',81),
('Steve Patterson','Sales',29),
('Foon Yue Tseng','Sales',65),
('George Vanauf','Marketing',89),
('Loui Bondur','Marketing',49),
('Gerard Hernandez','Marketing',66),
('Pamela Castillo','SCM',96),
('Larry Bott','SCM',100),
('Barry Jones','SCM',65);


select employee_name, hours from overtime;

-- first_value
select employee_name, hours,
first_value(employee_name) over (
	order by hours
    ) 'least over time' from overtime;

select employee_name, hours,
first_value(employee_name) over (
	order by hours desc
    ) 'least over time' from overtime;
    
SELECT
    employee_name,
    department,
    hours,
    FIRST_VALUE(employee_name) OVER (
        PARTITION BY department
        ORDER BY hours
    ) least_over_time
FROM
    overtime;
    
CREATE TABLE t (
    val INT
);
 
INSERT INTO t(val)
VALUES(1),(2),(2),(3),(4),(4),(5);

select  val, rank() over(
	order by val) my_rank
    from t;
    
select dense_rank() over ( order by val) my_dense_rank from t;

CREATE TABLE scores (
    name VARCHAR(20) PRIMARY KEY,
    score INT NOT NULL
);
 
INSERT INTO
 scores(name, score)
VALUES
 ('Smith',81),
 ('Jones',55),
 ('Williams',55),
 ('Taylor',62),
 ('Brown',62),
 ('Davies',84),
 ('Evans',87),
 ('Wilson',72),
 ('Thomas',72),
 ('Johnson',100);

select * from scores;

select name, score, row_number() over(order by score) 'row_number' from scores;

select name, score, row_number() over(order by score), cume_dist() over (order by score) from scores;

CREATE TABLE scores1 (
    name VARCHAR(20) PRIMARY KEY,
    score INT NOT NULL
);
 
INSERT INTO
 scores1(name, score)
VALUES
 ('Smith',81),
 ('Jones',50),
 ('Williams',55),
 ('Taylor',62),
 ('Brown',62),
 ('Davies',84),
 ('Evans',87),
 ('Wilson',72),
 ('Thomas',72),
 ('Johnson',100);

select name, score, row_number() over(order by score), cume_dist() over (order by score) from scores1;

select name, score, row_number() over(order by score), cume_dist() over (order by score) from scores;



CREATE TABLE basic_pays(
    employee_name VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL,
    salary INT NOT NULL,
    PRIMARY KEY (employee_name , department)
);
 
INSERT INTO 
 basic_pays(employee_name, 
    department, 
    salary)
VALUES
 ('Diane Murphy','Accounting',8435),
 ('Mary Patterson','Accounting',9998),
 ('Jeff Firrelli','Accounting',8992),
 ('William Patterson','Accounting',8870),
 ('Gerard Bondur','Accounting',11472),
 ('Anthony Bow','Accounting',6627),
 ('Leslie Jennings','IT',8113),
 ('Leslie Thompson','IT',5186),
 ('Julie Firrelli','Sales',9181),
 ('Steve Patterson','Sales',9441),
 ('Foon Yue Tseng','Sales',6660),
 ('George Vanauf','Sales',10563),
 ('Loui Bondur','SCM',10449),
 ('Gerard Hernandez','SCM',6949),
 ('Pamela Castillo','SCM',11303),
 ('Larry Bott','SCM',11798),
 ('Barry Jones','SCM',10586);

SELECT
    employee_name,
    salary,
    NTH_VALUE(employee_name, 2) OVER  (
        ORDER BY salary DESC
    ) second_highest_salary
FROM
    basic_pays;
    
SELECT
    employee_name,
    salary,
    NTH_VALUE(employee_name, 4) OVER  (
        ORDER BY salary DESC
    ) fourth_highest_salary
FROM
    basic_pays;
show databases;

use takehome;
describe mysqlpy;


alter table mysqlpy modify name varchar(36) not null;
select * from mysqlpy;

select * from mysqlpy where name='Ayush';

-- sub queries 
select * from products where product_type_id = (select * from product_types where name ='book');

select * from products where product_type_id = 
(select * from product_types where name ='book');

-- single row sub queries
select * from products where product_type_id = (select product_type_id from product_types where name ='book');

-- multiple row queries
select * from products where product_type_id = (select product_type_id from product_types where name in ('CD','DVD'));

select * from products where product_type_id in (select product_type_id from product_types where name in ('CD','DVD'));

-- multiple column queries
select * from products where (product_type_id, price) in (select product_type_id, min(price) from products group by product_type_id);

select * from products where (price) in (select min(price) from products group by product_type_id);

create table salary_grades(
	salary_grade_id int primary key,
	low_salary decimal(6,0),
    high_salary decimal(6,0)
    );
    
insert into salary_grades (salary_grade_id, low_salary, high_salary) values(1,1,250000);
insert into salary_grades (salary_grade_id, low_salary, high_salary) values(2,250001,500000);
insert into salary_grades (salary_grade_id, low_salary, high_salary) values(3,150000,800000);
insert into salary_grades (salary_grade_id, low_salary, high_salary) values(4,550000,700000);
select  * from salary_grades;
select * from employees;
select * from employees where salary < any (select high_salary from salary_grades);
select * from employees where salary < all (select high_salary from salary_grades);

select * from products;

select * from products where price > any (select avg(price) from products);

select * from products where price < all (select  avg(price) from products group by product_type_id);


select * from products where price < any (select  avg(price) from products group by product_type_id);

-- correlated 
select product_type_id, name, price from products o 
where price < (select avg(price) from products i 
where o.product_type_id = i.product_typepurchases_id);


select * from purchases ;
select * from products;
select * from product_types;

select count(*) from purchases where product_id in 
(select product_id from products where product_type_id = 
(select product_type_id from product_types where product_type_id = 1));

select * from purchases where product_id in (
select product_id from products where product_type_id =(
select product_type_id from product_types where name = 'book'));

select * from purchases where product_id in (
select product_id from products where product_type_id =(
select product_type_id from product_types where name = 'Video'));


-- corelation with exists
select * from employees m
where exists
(select manager_id from employees e where m.employee_id= e.manager_id);

select * from employees m
where not exists
(select manager_id from employees e where m.employee_id= e.manager_id);

select * from products;
select product_type_id, sum(price) from products group by product_type_id;

-- rollup
select * from products;
select product_type_id, sum(price) from products group by product_type_id with rollup;


select * from products where price <=15;

create view product_vw as
select * from products where price <=15;

update product_vw set price = 10 where product_id = 4;

show tables;

select * from products;
select * from product_vw;

-- nothing store in the view / price 100 is changed in the table then view query runs and made new changes in them.
update product_vw set price = 100 where product_id = 4;






