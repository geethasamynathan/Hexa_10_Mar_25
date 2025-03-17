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
