# MS SQL Server Date Functions with Examples

Here are the most commonly used date functions in Microsoft SQL Server with real-world examples and explanations:

## Date/Time Getting Functions

### GETDATE()
Returns the current database system timestamp as a datetime value.
```sql
SELECT GETDATE() AS CurrentDateTime;
-- Result: 2025-03-18 10:45:23.123
```
**Real-world use**: Tracking when records are inserted or modified in a database.

### CURRENT_TIMESTAMP
Returns the current database system datetime (ANSI SQL equivalent of GETDATE()).
```sql
SELECT CURRENT_TIMESTAMP AS CurrentDateTime;
-- Result: 2025-03-18 10:45:23.123
```
**Real-world use**: Setting default values for timestamp columns in tables.

### SYSDATETIME()
Returns the date and time of the computer on which the SQL Server instance is running (higher precision than GETDATE()).
```sql
SELECT SYSDATETIME() AS SystemDateTime;
-- Result: 2025-03-18 10:45:23.1234567
```
**Real-world use**: When you need microsecond precision for scientific applications or high-frequency trading systems.

### GETUTCDATE()
Returns the current UTC time.
```sql
SELECT GETUTCDATE() AS CurrentUTCDateTime;
-- Result: 2025-03-18 17:45:23.123 (assuming you're in EDT)
```
**Real-world use**: Global applications where you need a standard time reference regardless of server location.

### SYSUTCDATETIME()
Returns the date and time of the computer on which SQL Server is running (higher precision, UTC).
```sql
SELECT SYSUTCDATETIME() AS SystemUTCDateTime;
-- Result: 2025-03-18 17:45:23.1234567
```
**Real-world use**: Logging system events across distributed systems.

## Date Part Extraction

### YEAR()
Extracts the year from a date.
```sql
SELECT YEAR('2025-03-18') AS YearValue;
-- Result: 2025
```
**Real-world use**: Grouping sales data by year for annual reporting.

### MONTH()
Extracts the month number from a date.
```sql
SELECT MONTH('2025-03-18') AS MonthValue;
-- Result: 3
```
**Real-world use**: Calculating monthly expenses or revenue.

### DAY()
Extracts the day from a date.
```sql
SELECT DAY('2025-03-18') AS DayValue;
-- Result: 18
```
**Real-world use**: Identifying transactions that occurred on specific days of the month.

### DATEPART()
Returns an integer that represents the specified datepart of the specified date.
```sql
SELECT DATEPART(quarter, '2025-03-18') AS QuarterValue;
-- Result: 1
```
**Real-world use**: Generating quarterly financial reports.

### DATENAME()
Returns a character string that represents the specified datepart of the specified date.
```sql
SELECT DATENAME(month, '2025-03-18') AS MonthName;
-- Result: March
```
**Real-world use**: Displaying month names in reports instead of numbers.

## Date Calculation Functions

### DATEADD()
Adds a specified number interval to a date.
```sql
SELECT DATEADD(day, 30, '2025-03-18') AS DatePlus30Days;
-- Result: 2025-04-17
```
**Real-world use**: Calculating subscription expiry dates or payment due dates.

### DATEDIFF()
Returns the count of the specified datepart boundaries crossed between two dates.
```sql
SELECT DATEDIFF(day, '2025-01-01', '2025-03-18') AS DaysDifference;
-- Result: 76
```
**Real-world use**: Calculating age, service duration, or days remaining in a contract.

### EOMONTH()
Returns the last day of the month containing a specified date.
```sql
SELECT EOMONTH('2025-03-18') AS LastDayOfMonth;
-- Result: 2025-03-31
```
**Real-world use**: Finding billing cycle end dates or month-end reporting dates.

## Date Formatting and Conversion

### CONVERT()
Converts a date to a specific format.
```sql
SELECT CONVERT(varchar, GETDATE(), 101) AS FormattedDate;
-- Result: 03/18/2025 (MM/DD/YYYY format)
```
**Real-world use**: Formatting dates for region-specific display in reports.

### FORMAT()
Formats a date according to a specified format.
```sql
SELECT FORMAT(GETDATE(), 'yyyy-MM-dd') AS FormattedDate;
-- Result: 2025-03-18
```
**Real-world use**: Creating standardized date strings for file naming or reporting.

## Date Validation Functions

### ISDATE()
Determines if an expression is a valid date.
```sql
SELECT ISDATE('2025-03-18') AS IsValidDate;
-- Result: 1 (true)

SELECT ISDATE('2025-02-30') AS IsValidDate;
-- Result: 0 (false - February doesn't have 30 days)
```
**Real-world use**: Validating user date inputs before inserting into the database.

## Other Useful Date Functions

### DATEFROMPARTS()
Returns a date from specified year, month, and day values.
```sql
SELECT DATEFROMPARTS(2025, 3, 18) AS ConstructedDate;
-- Result: 2025-03-18
```
**Real-world use**: Creating dates from separate year, month, day inputs.

### DATETIME2FROMPARTS()
Returns a datetime2 value from date and time components.
```sql
SELECT DATETIME2FROMPARTS(2025, 3, 18, 10, 30, 0, 0, 0) AS ConstructedDateTime;
-- Result: 2025-03-18 10:30:00.0000000
```
**Real-world use**: Creating precise timestamps from separate components.

### DATETIMEFROMPARTS()
Returns a datetime value from separate parts.
```sql
SELECT DATETIMEFROMPARTS(2025, 3, 18, 10, 30, 0, 0) AS ConstructedDateTime;
-- Result: 2025-03-18 10:30:00.000
```
**Real-world use**: Creating datetime values in ETL processes.

### SWITCHOFFSET()
Changes the time zone offset of a datetime2 value.
```sql
SELECT SWITCHOFFSET('2025-03-18 10:30:00.0000000 -05:00', '+00:00') AS UTCTime;
-- Result: 2025-03-18 15:30:00.0000000 +00:00
```
**Real-world use**: Converting times between time zones for global applications.

### TODATETIMEOFFSET()
Converts a datetime2 value to a datetimeoffset value.
```sql
SELECT TODATETIMEOFFSET(GETDATE(), '-05:00') AS DateTimeWithOffset;
-- Result: 2025-03-18 10:30:00.0000000 -05:00
```
**Real-world use**: Adding time zone information to timestamps.

These date functions form the foundation for working with temporal data in MS SQL Server and can be combined to handle virtually any date-related requirement in business applications.
