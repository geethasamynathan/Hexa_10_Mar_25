/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [CustomerId]
      ,[FirstName]
      ,[LastName]
      ,[AadharNumber]
      ,[PhoneNumber]
      ,[EmailId]
      ,[Password]
      ,[Gender]
  FROM [HotelDb].[dbo].[Customers]

  select concat(firstname+SPACE(1),lastname) from Customers