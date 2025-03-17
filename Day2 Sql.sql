create table Customer
(
CustomerId int primary key identity,
Name varchar(200),
Mobile bigint unique)

insert into Customer values ('Joy1',9876543210)
insert into Customer (Name) values ('Joy1')
insert into Customer (Name) values ('John')
select * from Customer

create table Customer1
(
CustomerId int primary key identity,
Name varchar(200),
Mobile bigint )


alter table customer1 
Add constraint unique_mobileno UNIQUE (Mobile)


--Check constraint

Drop table Customer

create table Customer
(
CustomerId int primary key identity,
Name varchar(200),
Mobile bigint unique,
Location varchar(100) ,
constraint ch_location check (Location in('Hyderabad','Chennai','Bangalore'))
)


insert into Customer values ('Peter',9876543210,'Hyderabad')

insert into Customer values ('Peter1',9876543211,'Mumbai')


Drop table Customer

create table Customer
(
CustomerId int primary key identity,
Name varchar(200),
Mobile bigint unique,
Location varchar(100) ,
constraint ch_location check (Location in('Hyderabad','Chennai','Bangalore')),
constraint ch_mobile check (Mobile like '[6-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
)


insert into Customer values ('Lalitha','7123454665','Hyderabad')
insert into Customer values ('Yuva','7123454665','Chennai')



--Default constraint
Drop table Customer

create table Customer
(
CustomerId int primary key identity,
Name varchar(200),
Mobile bigint unique,
Location varchar(100) default 'Coimbatore',
constraint ch_location check (Location in('Hyderabad','Chennai','Bangalore','Coimbatore')),
constraint ch_mobile check (Mobile like '[6-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
)

select * from Customer

insert into Customer (Name,Mobile) values ('Yazhini','9434757524')
insert into Customer (Name,Mobile,Location) values ('Yazhini','9434757524','')

insert into Customer values ('Uma','9456547347','Chennai')


create table Customer
(
CustomerId int primary key identity,
Name varchar(200),
Mobile bigint unique,
Location varchar(100) ,
constraint ch_location check (Location in('Hyderabad','Chennai','Bangalore','Coimbatore')),
constraint ch_mobile check (Mobile like '[6-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
)

ALTER TABLE Customer
ADD CONSTRAINT d_location DEFAULT 'Chennai' for Location



-- composite Primary key

Create table Student 
(
StudentId int identity,
Name varchar(100),
DOB DateTime,
Course Varchar(200),
Constraint pk_namedob PRIMARY KEY (Name,DOB)
)

insert into Student values ('Deepa','2002-2-2','MERN')
insert into Student values ('Vaishali','2002-2-2','MERN')

insert into Student values ('Deepa','2002-2-2','MERN')


select * from sales.customers

select city from sales.customers order by city desc

SELECT DISTINCT city FROM SALES.customers ORDER BY CITY
SELECT DISTINCT state  FROM SALES.customers ORDER BY state

select city,state from sales.customers where state ='CA' 

select city,state from sales.customers where state ='CA' order by city desc

select distinct city,state from sales.customers 

select distinct city,state from sales.customers order by state asc,city desc
select distinct state,city from sales.customers order by state asc,city desc

SELECT  CITY,STATE FROM SALES.CUSTOMERS ORDER BY STATE ASC,CITY desc

SELECT  CITY,STATE FROM SALES.CUSTOMERS ORDER BY  STATE ASC,CITY DESC 


/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [Id]
      ,[Name]
      ,[Gender]
      ,[Location]
      ,[Email]
      ,[salary]
  FROM [Hexa_Mar_25].[dbo].[Employee]


  select * from Employee order by Name

  select * from employee order by Location
 select * from employee order by Location,name 

 select * from Employee order by email

 select distinct email from employee order by email

 --Top
 select top 5 product_name,list_price from production.products
 order by list_price desc


 select count(*) from production.products 


  select top 1 percent product_name,list_price from production.products
 order by list_price desc


 select top 3 product_name,list_price from production.products order by list_price desc

  select top 3 WITH TIES  product_name,list_price from production.products order by list_price desc