CREATE DATABASE Hexa_Mar_25

USE Hexa_Mar_25

CREATE TABLE  Employee
(
Id int,
Name varchar(30),
Gender varchar(10),
Location varchar(100),
Email varchar(max)
)
GO

INSERT INTO Employee VALUES(1,'PalaniVasan','Male','Chennai','palanivasan@mail.com')

SELECT * FROM Employee


ALTER TABLE Employee
ALTER COLUMN Id int not null

ALTER TABLE Employee
ADD CONSTRAINT pk_emp PRIMARY KEY(Id) --error as already we have an duplicate values in the table


delete from Employee where  id=1

SELECT * FROM Employee

ALTER TABLE Employee
ADD CONSTRAINT pk_emp PRIMARY KEY(Id)

INSERT INTO Employee VALUES(1,'PalaniVasan','Male','Chennai','palanivasan@mail.com')

insert into Employee (Name,Gender,Email,Location) values
('Thrisha','Female','Banglore','thrisha@mail.com') -- error  as we are passing null values in id column


ALTER TABLE Employee
DROP CONSTRAINT pk_emp


--How to insert multiple rows at a time

INSERT INTO Employee 
VALUES
(2,'Harrish','Male','Delhi','harrish@mail.com'),
(3,'Saravanapriya','Female','Chennai','Saravanapriya@mail.com'),
(4,'Saranya','Female','Chennai','Saranya@mail.com'),
(5,'Gokul','Male','Chennai','Gokul@mail.com'),
(6,'Ahil','Male','Mumbai','ahil@mail.com')

select * from Employee


--partial insertion

insert into employee(Id,Name,Gender) values
(7,'Jerome','Male')

update employee set Location='Hyderabad',Email='jerome@mail.com' WHERE id=7

DDL ==>Data definition Language

CREATE,ALTER,DROP,RENAME,TRUNCATE

DML - INSERT,UPDATE,DELETE

DQL - SELECT

DCL ==> GRANT,REVOKE

TCL - COMMIT, ROLLBACK,

ALTER TABLE Employee
Add  salary money

select * from Employee

update employee set salary=34000 

CREATE TABLE Department
(DepartmentId int,
Name varchar(50)
constraint pk_deptid PRIMARY KEY(DepartmentId)
)


Create table tblDepartment
(DepartmentId int primary key,
Name varchar(50)
)


select * from Employee

update Employee set salary=36000 where Id in(1,3,5,7)

--where clause
--projection

select Name,Gender from Employee

-- Filter records based on condition

select * from Employee where location='Chennai'


--operators
>=,<= ,!= , is null , is not null, in operator,not in operator, between , not between


select * from Employee where id=1

select * from Employee where id in (1,4,6,7)

select * from Employee where id not in (1,4,6,7)

select * from Employee where id between 2 and 5

select * from Employee where id not between 2 and 5


insert into Employee (id,Name,location) values (8,'Prathiba','Bangalore')

select * from Employee where email is null

select * from Employee where email is not null

  -- like operator
select * from Employee where name like '%a'

select * from Employee where name like 'S___n%'

select * from Employee where name like'A%'

select * from Employee where gender='Male' and Salary>=36000

--Group by
--Aggregate function 
Count,Avg,sum, min,max

select Location,Count(*) as No_of_Employee_citywise  from Employee group by Location

select gender,sum(salary) from Employee group by gender


select location,sum(salary) from Employee where gender ='Male' group by location

-- having clause ==> s used to check the condition. having clause we are going to use after group by

select location,sum(salary) from Employee 
where gender='Male' group by location having Location='Chennai'


-- constraints

--1.primary key
--2.Foreign Key
-- 3. Unique
-- 4.Check
-- 5.Default
-- 6. not null

Create table Products
(
Id int primary key IDENTITY(101,1),
Name varchar(50),
Price decimal
)

--IDENTITY(101,2) ==> 101,103, 105,107

--IDENTITY ==> 1,2,3,4,5

select * from Products

insert into Products values('Laptop',56000)

insert into Products values('Keyboard',2300)

insert into Products values ('Printer','dfgdg')

insert into Products values ('Printer','7800')

insert into Products (id,Name,Price)values (103,'Mouse',300)

SET IDENTITY_INSERT Products  ON

insert into Products (id,Name,Price)values (103,'Mouse',300)

SET IDENTITY_INSERT Products  OFF
INSERT INTO PRODUCTS Values ('Touchpad',4500)


drop table tblDepartment

--Foreign Key Constraint
create table tblDepartment
(
Dept_Id int primary key Identity,
Name varchar(40),
Location varchar(250)
)


create table tblEmployee
(
Emp_Id int primary key identity,
Name varchar(100),
Gender varchar(10),
City varchar(100),
DepartmentId int,
Constraint fk_deptid Foreign Key (DepartmentId) references tblDepartment(Dept_Id)
)

insert into tblDepartment values ('IT','London')

select * from tblDepartment
select * from tblEmployee

insert into tblEmployee values ('sudeepika','female','chennai',4) -- error

insert into tblEmployee values ('sudeepika','female','chennai',1)
insert into tblEmployee values ('Harini','female','Hyderbad',1)

insert into tblDepartment values ('Admin','NewJersy')

insert into tblEmployee values ('Deekshika','female','Hyderabad',2)
insert into tblEmployee values ('Guru Selevam','Male','chennai',2)

delete from tblDepartment where Dept_Id=2

drop table tblEmployee
drop table tblDepartment
-- on delete cascade
create table tblDepartment
(
Dept_Id int primary key Identity,
Name varchar(40),
Location varchar(250)
)


create table tblEmployee
(
Emp_Id int primary key identity,
Name varchar(100),
Gender varchar(10),
City varchar(100),
DepartmentId int,
Constraint fk_deptid Foreign Key (DepartmentId) references tblDepartment(Dept_Id)
ON DELETE CASCADE
)

insert into tblDepartment values ('IT','London')

select * from tblDepartment
select * from tblEmployee

insert into tblEmployee values ('sudeepika','female','chennai',4) -- error

insert into tblEmployee values ('sudeepika','female','chennai',1)
insert into tblEmployee values ('Harini','female','Hyderbad',1)

insert into tblDepartment values ('Admin','NewJersy')

insert into tblEmployee values ('Deekshika','female','Hyderabad',2)
insert into tblEmployee values ('Guru Selevam','Male','chennai',2)

delete from tblDepartment where Dept_Id=2
select * from tblDepartment
select * from tblEmployee


--ON DELETE SET NULL

DROP TABLE tblEmployee
DROP TABLE tblDepartment
create table tblDepartment
(
Dept_Id int primary key Identity,
Name varchar(40),
Location varchar(250)
)


create table tblEmployee
(
Emp_Id int primary key identity,
Name varchar(100),
Gender varchar(10),
City varchar(100),
DepartmentId int,
Constraint fk_deptid Foreign Key (DepartmentId) references tblDepartment(Dept_Id)
ON DELETE SET NULL
)

insert into tblDepartment values ('IT','London')

select * from tblDepartment
select * from tblEmployee

insert into tblEmployee values ('sudeepika','female','chennai',4) -- error

insert into tblEmployee values ('sudeepika','female','chennai',1)
insert into tblEmployee values ('Harini','female','Hyderbad',1)

insert into tblDepartment values ('Admin','NewJersy')

insert into tblEmployee values ('Deekshika','female','Hyderabad',2)
insert into tblEmployee values ('Guru Selevam','Male','chennai',2)

delete from tblDepartment where Dept_Id=2
select * from tblDepartment
select * from tblEmployee