select ABS(list_price) from Production.products where product_id=1
select list_price from Production.products where product_id=1


select DATEDIFF(DAY,'2025-3-19','2022-10-8')
select DATEDIFF(MONTH,'2025-3-19','2022-10-8')
select DATEDIFF(YEAR,'2025-3-19','2022-10-8')


Select REPLACE('SQL SERVER','S','MY S')
Select SUBSTRING('Nivedha Infotec',9,7)

Select charIndex('p','Sample') as position
SELECT PATINDEX('%Info%','Nivedha Infotec') as Position

SELECT STUFF('TechGenie',1,1,'IT')
SELECT STUFF('TechGenie',1,0,'IT')
SELECT STUFF('TechGenie',1,4,'IT')


SELECT Left('TechGenie',4)
SELECT Right('TechGenie',5)

select CONCAT('Test','User')

select 'Test'+SPACE(3)+'User'
select len('Test'+SPACE(3)+'User')

select concat('test'+space(1),'user')



--Subquery
 --nested query (query within the query)
 
 /*inner query will execute first inner query output will be acting as input for the outer query*/
 Create Table tblProducts
(
 [Id] int identity primary key,
 [Name] nvarchar(50),
 [Description] nvarchar(250)
)

Create Table tblProductSales
(
 Id int primary key identity,
 ProductId int foreign key references tblProducts(Id),
 UnitPrice int,
 QuantitySold int
)
Insert into tblProducts values ('TV', '52 inch black color LCD TV')
Insert into tblProducts values ('Laptop', 'Very thin black color acer laptop')
Insert into tblProducts values ('Desktop', 'HP high performance desktop')

Insert into tblProductSales values(3, 450, 5)
Insert into tblProductSales values(2, 250, 7)
Insert into tblProductSales values(3, 450, 4)
Insert into tblProductSales values(3, 450, 9)

select * from tblProducts
select * from tblProductSales


Select Id, Name, Description
from tblProducts
where Id not in (Select Distinct ProductId from tblProductSales)

Select tblProducts.[Id], [Name], [Description]
from tblProducts
left join tblProductSales
on tblProducts.Id = tblProductSales.ProductId
where tblProductSales.ProductId IS NULL

-- co-related subquery
Select [Name], (Select SUM(QuantitySold) from tblProductSales where ProductId = tblProducts.Id) as TotalQuantity
from tblProducts
order by Name

Select [Name], SUM(QuantitySold) as TotalQuantity
from tblProducts
left join tblProductSales
on tblProducts.Id = tblProductSales.ProductId
group by [Name]
order by Name


Exists
ANY
ALL

select p.Id,p.Name from 
tblProducts p
WHERE not  EXISTS(
SELECT 1 FROM tblProductSales ps
where ps.ProductId=p.id)


select p.Id,p.Name from 
tblProducts p
WHERE not  EXISTS(
SELECT ps.ProductId from tblProductSales ps
where ps.ProductId=p.id)

--Any 
SELECT p.ID,P.Name from 
tblProducts p
where p.id=Any(
SELECT ProductId from tblProductSales
where UnitPrice>=250)

--All

-- Find products where all sales have a higher unit price than the cheapest product's average sale price

SELECT p.Id, p.Name
FROM tblProducts p
WHERE p.Id IN (
    SELECT ps.ProductId
    FROM tblProductSales ps
    WHERE ps.UnitPrice > ALL (
        SELECT UnitPrice 
        FROM tblProductSales 
        WHERE ProductId = 2  -- Product ID of 'Laptop'
    )
);



