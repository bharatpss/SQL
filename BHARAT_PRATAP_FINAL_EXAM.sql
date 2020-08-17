-- Section A
create database sectionA;
use sectionA;

-- Question 1
create table employee(
empid int,
vname varchar(30),
dob date,
doj date,
designation varchar(30),
salary int);


insert into employee value (101, 'bharat','1996/03/06','2018/07/30','executive',54000);
insert into employee values(102,'ayush','1960/08/25','1983/08/25', 'sr. executive',200000);
insert into employee values(103,'ravi','1960/09/15','1973/08/25','sr. executive',250000);
select * from employee;

-- 1.A Display the name and years of experience for employees who are above 40 years of age. 
select vname, (year(curdate()) - year(doj)) as 'years of experience' from employee where (year(curdate()) - year(doj)) > 40;

-- 1.B Display the date of joining of the employees of the designation “executive” and “sr. executive” ordered by most recent first
select doj from employee where designation in ('executive','sr. executive') order by doj desc;

-- 1.C Find all the employees who earn more than 50,000 salary and have been serving in the company for less than 2 years.
select empid, vname from employee where salary > 50000 and (year(curdate()) - year(doj)) < 2;

-- 1.D Create an employee_code column by joining the first 3 letters of the employee name and the empid and display it
select concat(substring(vname,1,3),substring(empid,1,3)) from employee;

-- 1.E Find the aggregate salary paid grouped by designation
select designation , avg(salary) as AVG_Salary, sum(salary) as 'Total_salary' from employee group by designation;


-- Question 2

create table student(
	roll int primary key,
	name varchar(30),
	address varchar(50),
	course varchar (10),
	semester int,
	grade varchar(2));

insert into student values (101, 'harsh','Chennai','DEEE',1,'A+'),
(201, 'ayush','Bangalore','msc.cs',2,'A'),
(301, 'Bharat','Chennai','PGPDSE',3,'A+'),
(401, 'Rahul','Bangalore','CSE',8,'A'),
(501, 'Seema', 'Chennai', 'PGPBABI',5,'B'),
(601, 'harsh', 'Chennai', 'DCSE',6,'A'),
(701, 'Rahul', 'Bangalore', 'MTECH',2,'A+'),
(801, 'Ravi','Chennai', 'Mcom',7 ,'C');
-- drop table student;

select * from student;

-- 2.A List the names of the students who study in semester 2 of the course “msc.cs” 
select name from student where semester = 2 and course = 'msc.cs';

-- 2.B List the details of the students from the city of “Bangalore” and have enrolled in more than one course.
select * from student where address = 'Bangalore' group by name having  count(course) > 1;

-- 2.C List the names of the students who have enrolled in more than one course and have secured an “A” or “A+”
select name from student where grade ='A' or grade ='A+' group by name having  count(course) > 1;


-- 2.D Display the number of students enrolled by semester and the average grades.


-- 2.E List the names of the students who study in odd semesters.
select name from student where semester%2 <> 0;


-- Question 3
create table sandwich(
Sid varchar(8),
name varchar(25),
filling varchar(25),
Bread varchar(20),
dom date,
price int);

-- drop table sandwich;



insert into sandwich values ('s1', 'san-chicken','chicken',	'White',	'2019-10-12',50),
('s2',	'san-chicken',	'chicken',	'Brown',	'2019-10-21',55),
('s3',	'san-veggie',	'mixed veg',	'Brown',	'2019-10-15', 50),
('s4',	'san-veggie',	'mixed veg',	'multi grain',	'2019-10-19',55),
('s5',	'san-aloo tikki',	'potato',	'Rye',	'2019-10-21',25),
('s6',	'san-mexican veg',	'veg  mayonnaise',	'White','2019-10-28',	45),
('s7',	'san-mixed cheese',	'cheese veg',	'White',	'2019-10-29', 60);


select * from sandwich;
-- 3.A Display the details of sandwiches made with Rye bread which lies within a price range of 20 to 50 
select * from sandwich where Bread = 'Rye' and price between 20 and 50;

-- 3.B Display the names of all the sandwiches in uppercase that has been manufactured in the last 6 days
select upper(name) from sandwich where datediff(curdate(),dom) <= 6;

-- 3.C Display the names of the sandwiches where the filling contains “veg” and has been manufactured between 15th Oct and 21st Oct
select name from sandwich where filling like '%veg%' and dom between '2019-10-15' and '2019-10-21';

-- 3.D Replace the “san” of the sandwich name with “mac” and display. e.g. “san-chicken” should be displayed as “mac-chicken
select replace(name,'san','mac') from sandwich;

-- 3.E Update the price of all sandwiches that has a manufacture date more than 10 days from today in the past to 10 rupees less than the current price
update sandwich
set price = price - 10
where datediff(curdate(),dom) > 10; 

select * from sandwich;


-- Question 4
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

-- describe player_batsmen;
select * from player_batsmen; 


-- 4.A)	Find the no: of days since Steve smith played his last match(1 Marks)
select datediff(curdate(),Lastmatch_played) from player_batsmen where FirstName='Steve' and LastName='Smith';

-- 4.B)	Select the first and last names of all the players who haven’t got strike rate above 50(1 Marks)
select FirstName, LastName from player_batsmen where Strikerate <= 50;

-- 4.C)	Fetch the names of the players who have played more than 150 matches and strike rate more than 40 arrange by last match played to show the most recent first.(1 Marks)
select FirstName, LastName, Lastmatch_played from player_batsmen where Strikerate > 40 and MatchesPlayed > 150 order by Lastmatch_played desc;

-- 4.D) Calculate the average runs scored per batsmen. Calculate average runs scored as total runs divided 
-- by matches played. ( 1 Marks)
select FirstName,LastName, (Runs/MatchesPlayed) as "average runs" from player_batsmen;

-- 4.E)	Find the aggregate runs scored by batsmen of each country, arrange the lowest first( 1 Marks)
select FirstName,LastName, sum(Runs)as "Total Runs",avg(Runs) as "average_runs" from player_batsmen group by Country order by average_runs asc;




-- Section B


-- Question 5

create table Patient(
PatientID int,
Patient_Name varchar(30),
Address varchar(30),
age year,
ailment varchar(20));

create table doctor(
doc_id int,
doc_name varchar(30),
Specialization Varchar(30),
Qualification Varchar(10));

create table Admit(
Bed int,
Patient_ID int,
Doc_ID int,
Disease Varchar(50),
Dt_of_admit Date,
Dt_of_discharge date);

-- 5.A List the patients who are currently admitted in the hospital treated by doctors who have specialization in “Cardiac” in the past one month
select * from Patient p inner join  doctor d inner join admit a on p.PatientID = a.Patient_ID and a.Doc_ID = d.doc_id 
where  d.Specialization = 'Cardiac' and datediff(p.Dt_of_admit, p.Dt_of_discharge) < 31;


-- 5.B Get the name and age of the patients who have an ailment of Dengue, is treated by a general physician and has been admitted for more than 10 days.
select Patient_Name, age from Patient p inner join  doctor d inner join admit a on p.PatientID = a.Patient_ID and a.Doc_ID = d.doc_id
 where ailment = 'Dengue' and Specialization = 'general physician' and datediff(p.Dt_of_admit, p.Dt_of_discharge) > 10;


-- 5.C Display the grade of the doctor according to the number of patients treated by them
select count(a.Patient_ID) as 'patient_count', case 
when patient_count < 10 then 'v'
when patient_count between 10 and 50 then 'iv'
when patient_count >50 and  patient_count <=100 then 'iii'
when patient_count >100 and patient_count <=150 then 'ii'
else emp_salary then 'i'
end 'grade'
from Admit a inner join doctor d where a.Doc_ID = d.doc_id group by d.doc_id;


-- Question 6

-- 6.A List the number of trains with the current number of ticket bookings done between Mumbai and Delhi on 18th Dec 2019.
select t.Train_No, i.Ticket_ID from Train t join Ticket i join Journey J on t.Train_No = j.Train_No and i.Journey_id = j.Journey_id 
where t.Src = 'Mumbai' and t.Dest ='Delhi';

-- 6.B Display names of the passengers who are travelling between Bangalore and Chennai in 2AC, travelling on 12/02/2012.

select i.Pname from Ticket i join Journey J  
on i.Journey_id = j.Journey_id where t.Src = 'Bangalore' and t.Dest ='Chennai' and t.Class = '2AC' and j.Date_journey = '2012-02-12';















-- Section C
-- Question 1
create database finalexam;
use finalexam;


CREATE TABLE employees (
	emp_no int(10),
    birth_date date,
    first_name varchar(14),
    last_name varchar(16),
    gender enum('M','F'),
    hire_date date,
    primary key(emp_no)	);
    
create table salaries(
	emp_no int(10),
    salary int(11),
    from_date date,
    to_date date,
    primary key(emp_no),
    foreign key(emp_no) references employees(emp_no));
    
create table titles(
	emp_no int(10),
    title varchar(50),
    from_date date,
    to_date date,
    primary key(emp_no),
    foreign key(emp_no) references employees(emp_no));
    
create table dept_emp(
	emp_no int(10),
    dept_no char(4) primary key,
    from_date date,
    to_date date,
    foreign key(emp_no) references employees(emp_no));
    
create table dept_manager	(
	emp_no int(10),
    dept_no char(4) primary key,
    from_date date,
    to_date date,
    foreign key(emp_no) references employees(emp_no));
    
create table departments(
	dept_no char(4),
    dept_name varchar(40),
    primary key(dept_no));
    