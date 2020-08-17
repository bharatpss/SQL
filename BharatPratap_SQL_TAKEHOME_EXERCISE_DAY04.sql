create database takehome4;
use takehome4;

-- question 1
select * from hired where emp_id in (select emp_id from department where dept_id = 1);

-- question 2
select dept_id, max(salary) max_salary from salary group by dept_id
having max_salary < (select avg(salary) from salary);

-- question 3
select emp_id, dept_id from salary where salary > (select salary from salary where emp_id = 2);

-- question 4
select emp_id, salary from salary where salary between 
(select min(salary) from salary) and 35000;

create table product(P_Id varchar(10) primary key, P_Name varchar(20),price integer);
insert into product values
('P01','Biscuits',10),
('P02','Chocolates',20),
('P03','Bread',15),
('P04','Butter',30);
select * from product;

create table sales(S_id integer,P_Id varchar(10) references product(P_id));
insert into sales values
(02,'P02'),
(01,'P01'),
(01,'P03');
select * from sales;

create table orders(S_id integer references sales(S_id),C_id integer references customer(C_id),P_Id varchar(10) references product(P_id),O_quantity integer, O_Status varchar(20));
insert into orders values
(02,101,'P02',100,'Shipped'),
(01,102,'P01',130,'shipped'),
(01,103,'P03',25,'cancelled'),
(02,104,'P01',50,'cancelled');
select * from orders;
-- drop table orders;

create table customer(C_id integer,F_name varchar(20),L_name varchar(20),S_id integer references sales(S_id));
insert into customer values
(101,'Harry','Dany',02),
(102,'Tom','Adein',01),
(103,'Marina','Paul',01),
(104,'Peter','Kevin',02),
(105,'David','Warner',Null);
select * from customer where S_id is null;
drop table customer;

-- question 5
select c_id, F_name, L_name, S_id from customer  
where C_id not in (select C_id from orders);

-- question 6
select c_id, F_name, L_name from customer
where c_id in (select c_id from customer where F_name like '_a%');

-- question 7
select p_id, p_name, max(price) from product
where price <  (select max(price)
 from product);
 
 
select p_id, p_name, max(price) from product
where price not in (select max(price)
 from product);
 
 -- question 8
select * from product o
where exists (select i.p_id from orders i where o.p_id = i.p_id and i.p_id != 'P01');-- i.o_status = 'shipped');

-- question 9
select p_id, O_quantity from orders where p_id in
(select p_id from orders where p_id <> 'P01' and o_status <> 'cancelled' group by p_id having sum(O_quantity) > 75);


-- question 10
select p_id, sum(o_quantity) total_quantity from orders where p_id in(
select p_id from orders where o_status <> 'cancelled' group by p_id) group by p_id;