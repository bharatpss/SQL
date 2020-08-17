use hr;


create table Hired(
Emp_id integer primary key,
Emp_name varchar(20) not null,
State varchar(20));
insert into Hired values(01,'Edwin','TN'),(02,'Perk','OR'),(03,'Abhi','AP'),(04,'Arshad','KA');
select * from Hired;

create table Department(
Dept_id integer ,
Emp_id integer references Hired(Emp_id),
primary key(Dept_id,Emp_id));
insert into Department values (02,02),(01,01),(01,03);
select * from department;

create table Salary(
Emp_id integer references Hired(Emp_id),
Dept_id integer references Department(Dept_id),Salary integer);
insert into Salary values
(01,01,25000),
(02,02,30000),
(03,01,50000),
(04,Null,Null);
select * from Salary;

create table product(
P_Id varchar(10) primary key, 
P_Name varchar(20),
price integer);
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

create table orders(
S_id integer references sales(S_id),
C_id integer references customer(C_id),
P_Id varchar(10) references product(P_id),
O_quantity integer, O_Status varchar(20));
insert into orders values
(02,101,'P02',100,'Shipped'),
(01,102,'P01',130,'shipped'),
(01,103,'P03',25,'cancelled'),
(02,104,'P01',50,'cancelled');
select * from orders;
drop table orders;

create table customer(
C_id integer,
F_name varchar(20),
L_name varchar(20),
S_id integer references sales(S_id));
insert into customer values
(101,'Harry','Dany',02),
(102,'Tom','Adein',01),
(103,'Marina','Paul',01),
(104,'Peter','Kevin',02),
(105,'David','Warner',Null);
select * from customer;

-- Question 1
select s.dept_id,h.emp_name,h.state,s.salary
from salary s left join hired h 
on s.emp_id=h.emp_id
where dept_id is not null;

select s.dept_id,h.emp_name,h.state,s.salary
from department d left join hired h
on d.emp_id=h.emp_id
join salary s
on d.emp_id=s.emp_id;

-- Question 2
select h.emp_name,s.salary,s.dept_id
from salary s join hired h 
on s.emp_id=h.emp_id;

-- Question 3
select d.dept_id,d.emp_id,h.emp_name
from department d inner join hired h
on d.emp_id=h.emp_id;

-- Question 4
select d.dept_id, d.emp_id,h.emp_name
from department d inner join hired h
on d.emp_id=h.emp_id;

-- Question 5
select h.emp_name, h.emp_id, h.state,d.dept_id
from hired h left join department d
on h.emp_id=d.emp_id;

-- Question 6
select h.emp_id,h.emp_name,s.salary,h.state
from hired h join salary s
on h.emp_id = s.emp_id
where salary >20000 and state='AP';

-- Question 7
select h.emp_id,h.emp_name,s.salary,h.state
from hired h join salary s
on h.emp_id = s.emp_id
where salary between 10000 and 30000 and state in('TN','OR');

-- Question 8
select o.c_id, concat(c.f_name,' ',c.l_name)as "full name",o.o_quantity,o.s_id,o.o_status
from orders o join customer c 
on o.c_id=c.c_id
where o.s_id>1 and o_status='cancelled';

-- Question 9
select o.c_id,concat(c.f_name,' ',c.l_name)as "full name",o.o_quantity*p.price
from orders o join customer c
on o.c_id=c.c_id
join product p
on o.p_id=p.p_id
where o.o_quantity*p.price > 1000;

-- Question 10
select o.c_id, concat(c.f_name,' ',c.l_name) as "full name",o.s_id,p.p_name, o.o_status
from orders o join customer c 
on o.c_id=c.c_id
join product p
on o.p_id=p.p_id
where p_name not in('Bread','Butter');

 



