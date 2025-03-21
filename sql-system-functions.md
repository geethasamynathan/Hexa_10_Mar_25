# SQL System Functions

SQL Server provides a wide range of built-in system functions that help developers and database administrators perform various operations. Here's an overview of the most commonly used system functions categorized by their purpose:

## Date and Time Functions

- **GETDATE()**: Returns the current date and time from the database server
  ```sql
  SELECT GETDATE() AS CurrentDateTime;
  ```

- **DATEADD(unit, value, date)**: Adds a specified time interval to a date
  ```sql
  SELECT DATEADD(day, 7, GETDATE()) AS OneWeekFromNow;
  ```

- **DATEDIFF(unit, start_date, end_date)**: Returns the difference between dates
  ```sql
  SELECT DATEDIFF(year, '2000-01-01', GETDATE()) AS YearsSince2000;
  ```

- **DATEPART(unit, date)**: Returns a specified part of a date (like month, day)
  ```sql
  SELECT DATEPART(month, GETDATE()) AS CurrentMonth;
  ```

- **YEAR(date)**, **MONTH(date)**, **DAY(date)**: Extract specific parts of a date
  ```sql
  SELECT YEAR(GETDATE()) AS CurrentYear;
  ```

## String Functions

- **LEN(string)**: Returns the number of characters in a string
  ```sql
  SELECT LEN('Hello World') AS StringLength;
  ```

- **LEFT(string, n)**: Returns the leftmost n characters
  ```sql
  SELECT LEFT('SQL Server', 3) AS LeftChars; -- Returns 'SQL'
  ```

- **RIGHT(string, n)**: Returns the rightmost n characters
  ```sql
  SELECT RIGHT('SQL Server', 6) AS RightChars; -- Returns 'Server'
  ```

- **SUBSTRING(string, start, length)**: Returns a part of a string
  ```sql
  SELECT SUBSTRING('SQL Server', 5, 6) AS SubString; -- Returns 'Server'
  ```

- **CHARINDEX(substring, string, [start_position])**: Returns the position of a substring
  ```sql
  SELECT CHARINDEX('Server', 'SQL Server') AS Position;
  ```

- **REPLACE(string, old_substring, new_substring)**: Replaces occurrences of a substring
  ```sql
  SELECT REPLACE('SQL Server', 'Server', 'Database') AS ReplacedString;
  ```

## Mathematical Functions

- **ABS(number)**: Returns the absolute value
  ```sql
  SELECT ABS(-15) AS AbsoluteValue;
  ```

- **CEILING(number)**: Rounds up to the nearest integer
  ```sql
  SELECT CEILING(15.2) AS CeilingValue; -- Returns 16
  ```

- **FLOOR(number)**: Rounds down to the nearest integer
  ```sql
  SELECT FLOOR(15.8) AS FloorValue; -- Returns 15
  ```

- **ROUND(number, precision)**: Rounds a number to a specified precision
  ```sql
  SELECT ROUND(15.456, 1) AS RoundedValue; -- Returns 15.5
  ```

- **POWER(number, power)**: Raises a number to the specified power
  ```sql
  SELECT POWER(2, 3) AS PowerValue; -- Returns 8
  ```

## Conversion Functions

- **CAST(expression AS datatype)**: Converts one data type to another
  ```sql
  SELECT CAST(25.65 AS INT) AS CastToInt; -- Returns 25
  ```

- **CONVERT(datatype, expression, [style])**: Converts with optional formatting
  ```sql
  SELECT CONVERT(VARCHAR, GETDATE(), 101) AS FormattedDate; -- Returns 'MM/DD/YYYY'
  ```

- **TRY_CAST(expression AS datatype)**: Safe conversion that returns NULL on failure
  ```sql
  SELECT TRY_CAST('abc' AS INT) AS SafeCast; -- Returns NULL
  ```

## System Information Functions

- **@@VERSION**: Returns the version of SQL Server
  ```sql
  SELECT @@VERSION AS SQLServerVersion;
  ```

- **@@IDENTITY**: Returns the last identity value inserted into an identity column
  ```sql
  SELECT @@IDENTITY AS LastIdentity;
  ```

- **@@ROWCOUNT**: Returns the number of rows affected by the last statement
  ```sql
  SELECT @@ROWCOUNT AS RowsAffected;
  ```

- **USER_NAME()**: Returns the database user name
  ```sql
  SELECT USER_NAME() AS CurrentUser;
  ```

- **DB_NAME()**: Returns the current database name
  ```sql
  SELECT DB_NAME() AS CurrentDatabase;
  ```

## Aggregate Functions

- **SUM(expression)**: Returns the sum of values
  ```sql
  SELECT SUM(Quantity) AS TotalQuantity FROM OrderDetails;
  ```

- **AVG(expression)**: Returns the average of values
  ```sql
  SELECT AVG(Price) AS AveragePrice FROM Products;
  ```

- **MIN(expression)** and **MAX(expression)**: Return minimum/maximum values
  ```sql
  SELECT MIN(Price) AS MinPrice, MAX(Price) AS MaxPrice FROM Products;
  ```

- **COUNT(expression)**: Returns the count of non-NULL values
  ```sql
  SELECT COUNT(CustomerID) AS CustomerCount FROM Customers;
  ```

## Logical Functions

- **ISNULL(check_expression, replacement_value)**: Replaces NULL with specified value
  ```sql
  SELECT ISNULL(Phone, 'No Phone') AS PhoneNumber FROM Customers;
  ```

- **COALESCE(expr1, expr2, ..., exprn)**: Returns first non-NULL expression
  ```sql
  SELECT COALESCE(NULL, NULL, 'Third', 'Fourth') AS FirstNonNull; -- Returns 'Third'
  ```

- **NULLIF(expr1, expr2)**: Returns NULL if expressions are equal, otherwise expr1
  ```sql
  SELECT NULLIF(10, 10) AS Result1, NULLIF(10, 5) AS Result2;
  ```

- **IIF(condition, true_value, false_value)**: Returns one of two values based on a condition
  ```sql
  SELECT IIF(Price > 50, 'Expensive', 'Affordable') AS PriceCategory FROM Products;
  ```

## JSON Functions (SQL Server 2016+)

- **JSON_VALUE(json_string, path)**: Extracts a scalar value from JSON text
  ```sql
  SELECT JSON_VALUE('{"name":"John", "age":30}', '$.name') AS Name;
  ```

- **JSON_QUERY(json_string, path)**: Extracts an object or array from JSON text
  ```sql
  SELECT JSON_QUERY('{"person":{"name":"John", "age":30}}', '$.person') AS Person;
  ```

These functions form a fundamental part of SQL programming and are essential for data manipulation, reporting, and analysis in SQL Server databases.
