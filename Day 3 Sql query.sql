select 10+30 as Addition

select 50-30 as  subtraction

select 10* 30 as Multiplcation

select 100/2 as Division

select 17%3 as Modulo


select value,
ABS(value) As Absolute_values
From (VALUES(-15.72),(22.3),(0)) AS TestDate(value)

Select CEILING(15.2) -- Returns 16
Select CEILING(-15.2) -- Returns -15

Select FLOOR(15.2) -- Returns 15
Select FLOOR(-15.2) -- Returns -16

Select POWER(2,3) -- Returns 8

Select RAND(1) 

select Rand()


Declare @Counter INT   --int counter
Set @Counter = 1		-- counter=1
While(@Counter <= 10)
Begin					--{
 Print FLOOR(RAND() * 100) 
 Set @Counter = @Counter + 1
End						--}



Declare @Number int
Set @Number = 65
While(@Number <= 90)
Begin
 Print CHAR(@Number)
 Set @Number = @Number + 1
End
go

Declare @Number int
Set @Number = 65
While(@Number <= 90)
Begin
 Print LOWER(CHAR(@Number))
 Set @Number = @Number + 1
End
go

Select LOWER('CONVERT This String Into Lower Case')


select * from Production.products

select 
--AVG(list_price) as actual_avg_price,
ABS(list_price) as Price_Deviation
From Production.products 


-- Date  functions


select GETDATE() AS CurrentDateTime


SELECT CURRENT_TIMESTAMP AS CURRENTTIME;

SELECT SYSDATETIME() AS SYSTEMDATETIME

--DATE PART EXTRACTION
SELECT YEAR('2020-3-18') AS YEARVALUE
SELECT MONTH('2020-3-18') AS MONTHVALUE
SELECT DAY('2020-3-18') AS DAYVALUE

SELECT DATEPART(QUARTER,'2020-09-18') AS QUARTERVALUE

SELECT DATENAME(MONTH,'2025-03-18') AS MONTHNAME


SELECT DATEADD(DAY,30,'2025-03-18') AS DATEPLUS30DAYS

SELECT DATEDIFF(DAY,'2025-03-18','2025-09-28') AS DATEDIFFERENCE

SELECT EOMONTH('2025-05-18') AS LASTDAYOFMONTH

SELECT GETDATE()

SELECT CONVERT(VARCHAR,GETDATE()) AS FORMATTEDDATE


SELECT FORMAT(GETDATE(),'yyyy-MM-dd')

select ISDATE('2025-03-45') as IsvalidDate