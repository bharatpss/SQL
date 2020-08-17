use exam;

create table book(
Isbn varchar(8),
title varchar(15),
author_name varchar(30),
publisher_name varchar(20),
price bigint);

-- show databases

insert into book values('01','First Book', 'oskar_wilde', 'ktc', 600);
insert into book values('02','Second Book', 'e balaguruswamy', 'tmh', 800),
('03','Thired Book', 'paras sigh', 'phi', 500),
(04,'Fourth Book', 'Promode','tmh',759);
insert into book values('05','Fifth Book', 'oskar_wilde', 'tmh', 999);
insert into book values('06','Sixth Book', 'e balaguruswamy', 'tmh', 599);
insert into book values('07','Seven Book', 'bharat', 'prashant', 399);

select * from book;

-- Question 1
select title from book where author_name = 'oskar_wilde';

-- Question 2
select * from book where publisher_name in ('tmh','phi');

-- Question 3
select sum(price) from book where author_name = 'e balaguruswamy';

-- Question 4
-- select * from book where publisher_name regexp '[a-z]$';
select title, author_name from book where publisher_name regexp '^p';

-- Question 5
select concat(substring(title, 1,3),'_',substring(author_name, 1,3)) as book_code from book;



create table sandwich(
Sid varchar(8),
name varchar(15),
filling varchar(15),
Bread varchar(10),
price int);


ALTER TABLE sandwich
  MODIFY Sid varchar(8),
  MODIFY	name varchar(25),
  MODIFY filling varchar(25),
  MODIFY Bread varchar(20);


insert into sandwich values ('s1', 'san-chicken','chicken',	'White',	50),
('s2',	'san-chicken',	'chicken',	'Brown',	55),
('s3',	'san-veggie',	'mixed veg',	'Brown',	50),
('s4',	'san-veggie',	'mixed veg',	'multi grain',	55),
('s5',	'san-aloo tikki',	'potato',	'Rye',	25),
('s6',	'san-mexican veg',	'veg  mayonnaise',	'White',	45),
('s7',	'san-mixed cheese',	'cheese veg',	'White',	60);


select * from sandwich;

-- Question 1
select * from sandwich where price between 20 and 50;

-- Question 2
select upper(name) from sandwich;
select ucase(name) from sandwich;

-- Question 3
select name from sandwich where filling like '%veg%';

-- Question 4
select replace(name,'san','mac') from sandwich;

-- Question 5
select bread, avg(price)  from sandwich group by Bread;


create table Product_table(
product_id varchar(10),
product_name varchar(20),
company_name varchar(30),
unit_price int);


insert into Product_table values (101, 'Pen','classmate','100');
insert into Product_table values(102, 'classmate', 'classmate',200);
insert into Product_table values(103, 'cadbury', 'cadbury',300),(104,'choco bar','cadbury',500),(105, 'ice cream','cadbury',450);


select * from Product_table;

-- question1
select count(product_name) from Product_table where company_name = 'cadbury';

-- Question 2
select product_name, (unit_price * 12) as 'Price per Dozen' from product_table;

-- Question 3
select product_name, unit_price from Product_table group by company_name order by company_name asc;

-- Question 4
select product_name from Product_table where unit_price between 500 and 1000;

SELECT *
FROM Product_table
WHERE unit_price >= 500
AND unit_price <= 1000;

-- Question 5
select company_name, count(*) as No_of_products from Product_table where company_name = 'cadbury';


create table student(
roll int primary key,
name varchar(30),
address varchar(50),
course varchar (10),
semester int,
grade varchar(2));

insert into student values (101, 'harsh','Chennai','DEEE',1,'A+'),
(201, 'ayush','Bangalore','CSE',2,'A'),
(301, 'Bharat','Chennai','PGPDSE',3,'A+'),
(401, 'Rahul','Bangalore','msc.cs',4,'B+'),
(501, 'Seema', 'Chennai', 'PGPBABI',5,'B'),
(601, 'harsh', 'Chennai', 'DCSE',6,'A'),
(701, 'Shiv', 'Bangalore', 'MTECH',7,'A+'),
(801, 'Ravi','Chennai', 'Mcom',8 ,'C');

select * from student;

-- Question 1
select name from student where semester = 4 and course = 'msc.cs';

-- Question 2
select * from student where address = 'Bangalore';

-- Question 3
select count(*) from student where grade in ('A','A+');
select count(*) from student where grade ='A' or grade ='A+';
-- Question 4
select name from student where semester%2 = 0;


create table player_batsmen(
PlayerID varchar(10) primary key,
FirstName varchar(20) not null,
LastName varchar(20),
Country varchar(15),
MatchesPlayed int not null,
Runs bigint not null,
Strikerate float not null,
Lastmatch_played date);

INSERT INTO player_batsmen VALUES ( 1,'Steve','Smith','Australia',210,8500,'50.09','2018-03-30');
INSERT INTO player_batsmen VALUES ( 2,'David','Warner','Australia',212,9000,'50.08','2018-03-30');
INSERT INTO player_batsmen VALUES ( 3,'Virat','Kohli','India',210,10000,'50.89','2019-03-30');
INSERT INTO player_batsmen VALUES ( 4,'Rohit','Sharma','India',192,6000,'38.98','2019-03-30');
INSERT INTO player_batsmen VALUES ( 5,'Joe','Root','England',157,7500,'29.34','2019-03-01');
INSERT INTO player_batsmen VALUES ( 6,'Eion','Morgan','England',180,8500,'23.89','2019-03-01');
INSERT INTO player_batsmen VALUES ( 7,'Kane','Willamson','Newzealand',200,8700,'23','2019-04-12');
INSERT INTO player_batsmen VALUES ( 8,'Ross','Taylor','Newzealand',190,7800,'29','2019-04-12');
INSERT INTO player_batsmen VALUES ( 9,'Chris','Gayle','West Indies',210,8900,'28','2019-01-04');
INSERT INTO player_batsmen VALUES ( 10,'Shakib','Hasan','Bangalesh',130,6700,'25.5','2019-04-05');

describe player_batsmen;

select * from player_batsmen;

select current_date(), curdate(), current_time(), curtime(), current_timestamp(), current_user() from dual;
select datediff(curdate(), '2019-01-01') from dual;
-- select datediff(curdate(), '19-01-2019') from dual;
select date_add(curdate(), interval 10 day) from dual;
select adddate(curdate(), interval 1 month) from dual;
select last_day('2019-06-18') from dual;
select day(last_day(curdate())) from dual;
select month(curdate()) from dual;
select day(curdate()) from dual;
select weekday('2019-07-22') from dual;
select weekday(curdate()) from dual;
select week(current_date()) , weekofyear(curdate()) from dual;


-- Question 1 Find the no: of days since Steve smith played his last match
select datediff(curdate(),Lastmatch_played) from player_batsmen where PlayerID = 1;

select datediff(curdate(), Lastmatch_played) from player_batsmen where FirstName = 'Steve' and LastName = 'Smith';

-- Question 2 Select the first and last names of all the players who haven’t got strike rate above 50
select FirstName, LastName from player_batsmen where Strikerate <= 50;

-- Question 3 Fetch the names of the players who have played more than 150 matches and strike rate more than 40 arrange by last match played to show the most recent first.
select FirstName, LastName, Lastmatch_played from player_batsmen where Strikerate > 40 and MatchesPlayed > 150 order by Lastmatch_played desc;

-- Question 4 Fetch the names of the players who have played less than 200 matches and scored more than 5000 runs.
 select FirstName, LastName from player_batsmen where MatchesPlayed < 200 and Runs > 5000;
 
 
 CREATE TABLE Employee (
  Empid VARCHAR (5) NOT NULL primary key,
  vname VARCHAR(20),
  designation VARCHAR(20),
  emp_dept VARCHAR(20),
  emp_salary bigint
);



INSERT INTO Employee VALUES ('1053','Raju','JDS','A',2000);
INSERT INTO Employee VALUES ('1054','Prasad','JDC','A',1500);
INSERT INTO Employee VALUES ('1055','bhaskar','JDA','B',1600);
INSERT INTO Employee VALUES ('1056','Shyam','SDS','B',30000);
INSERT INTO Employee VALUES ('1057','Raghu','SDA','C',25000);
INSERT INTO Employee VALUES ('1058','Swathi','SDC','C',22000);
insert into Employee values ('1059','Bharat','SDC','D',80000);
insert into Employee values ('1060','Ayush','jDC','D',50000);
CREATE TABLE Manager (
  man_name VARCHAR(20),
  dept VARCHAR(20),
  man_salary bigint
);

INSERT INTO Manager VALUES ('Raj','A',4000);
INSERT INTO Manager VALUES ('Vikas','B',1500);
INSERT INTO Manager VALUES ('Arun','C',2000);
insert into Manager values ('Harsh','D',90000);


select * from Employee;
select * from Manager;


-- Question 1 list the names of the employees whose salary is greater than the salary of the manager of their respective departments
select e.vname from Employee e, Manager m where e.emp_dept = m.dept and e.emp_salary > m.man_salary;


-- Question 2 display the grade of the employee according to their salaries:

select *, case 
when emp_salary < 3000 then 'v'
when emp_salary between 3000 and 5000 then 'iv'
when emp_salary >5000 and  emp_salary <10000 then 'iii'
when emp_salary >10000 and emp_salary <=50000 then 'ii'
when emp_salary >50000 then 'i'
else emp_salary
end 'grade'
from Employee;

create table player_fees (
PlayerID int(9),
MatchFees int(9)
);

INSERT INTO Player_fees VALUES (1,15000);
INSERT INTO Player_fees VALUES (2,15000);
INSERT INTO Player_fees VALUES (3,42000);
INSERT INTO Player_fees VALUES (4,20000);
INSERT INTO Player_fees VALUES (5,10000);
INSERT INTO Player_fees VALUES (6,10000);
INSERT INTO Player_fees VALUES (7,8000);
INSERT INTO Player_fees VALUES (8,6500);
INSERT INTO Player_fees VALUES (9,2500);
INSERT INTO Player_fees VALUES (10,1000);

select * from player_fees;
select * from player_batsmen;

-- QUESTION 1 
select b.PlayerID, b.FirstName, b.LastName, b.Country, f.MatchFees from player_batsmen b, player_fees f where b.PlayerID = f.PlayerID;

-- Question 2 Create a table named player_details with playerid (int), age(int and not nullable), half_centuries (int), centuries (int)  and set playerid as the primary key

create table player_details(
playerid int,
age int not null,
half_centuries int,
primary key(playerid));

alter table player_details
add centuries int;

insert into player_details values(3, 34, 70, 21);
 
 -- Question 3 
 select sum(Runs) as Total_Run , avg(Runs) as AverageRuns from player_batsmen group by Country;
 
 -- Question 4 List of players with firstname, lastname, age and matchfees who have played more than 200 matches age less than 30  and have a match fees between 10000 and 20000
 select b.FirstName, b.LastName, d.age, f.MatchFees from player_batsmen b, player_fees f, player_details d where b.PlayerID = f.PlayerID and b.PlayerID = d.PlayerID
 and MatchesPlayed > 200 and age < 30 and f.MatchFees between 10000 and 20000;
 
select b.FirstName, b.LastName, d.age, f.MatchFees 
from player_batsmen b 
inner join player_fees f  
on b.PlayerID = f.PlayerID 
inner join player_details d 
on b.PlayerID = d.PlayerID
where MatchesPlayed > 200 and age < 30 and f.MatchFees between 10000 and 20000;

-- question 5 Update the match fees of those players who have scored more than 40 half centuries and 20 centuries by 6000$.

update player_fees, player_details set MatchFees = 6000
where  player_fees.PlayerID = player_details.PlayerID and player_details.half_centuries > 40 and player_details.centuries > 20;

/*create table customers(
	customer_id integer,
    firstname varcharacter(20),
    lastname varcharacter(20),
    age integer constraint age check (age >= 18),
    address varcharacter(30),
    city varcharacter(20) not null,
    salary decimal(4,2),
    constraint customer_pk PRIMARY KEY (customer_id, firstname)
    );
*/
CREATE TABLE CUSTOMERS (
  CustID Varchar (10),
  Name Varchar (50),
  Contact_no Varchar(50),
  primary key(CustID)
);
alter table CUSTOMERS
modify Contact_no varcharacter(50) ; -- LIKE REPLICATE('[0-9]', 10));

describe customers;

insert into CUSTOMERS (CustID,Name,Contact_no) values(1, 'Bharat','8892971713'),(2,'Ayush','9883079206');

CREATE TABLE MOVIE
 (
  MOVIEID Varchar (50),
  ActorName Varchar (50),
  ActressName Varchar (50),
  DirectorName varchar(50),
  ReleaseDate Date,
  CountryName varchar(50),
  primary key(MOVIEID)
);
describe MOVIE;


Create Table Screen (
ScreenID Varchar(50) not null,
Name Varchar(50),
MovieID Varchar(50),
capacity int check(capacity > 50),
Primary key(ScreenID),
FOREIGN KEY (MovieID) REFERENCES MOVIE(MovieID));


Create Table TICKETS(
TicketID Varchar (50) not null primary key,
MOVIEID	Varchar(50),
ScreenID Varchar(50),
CustID	Varchar (50),
Date Date,
Price Bigint check(Price > 0),
foreign key (MOVIEID) references MOVIE(MovieID),
foreign key (ScreenID) references Screen(ScreenID),
foreign key (CustID) references CUSTOMERS(CustID)
);