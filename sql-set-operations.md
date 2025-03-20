# SQL Set Operations: UNION, INTERSECT, EXCEPT, and MERGE

## SQL Set Operations

These operations allow you to combine or compare results from multiple queries:

### UNION
Combines the results of two or more SELECT statements, removing duplicates by default.
- Returns all distinct rows from both queries
- Column names and data types must match across queries
- Use UNION ALL to keep duplicates

### INTERSECT
Returns only rows that appear in both result sets.
- Returns only common rows between two queries
- Column names and data types must match across queries

### EXCEPT (or MINUS in Oracle)
Returns rows from the first query that don't appear in the second query.
- Returns rows unique to the first query
- Column names and data types must match across queries

### MERGE
A more complex operation that can perform INSERT, UPDATE, and DELETE operations in a single statement based on a join condition.
- Used for data integration and synchronization
- Efficiently handles "upsert" operations (update if exists, insert if not)

## Example with Tables and Data

Let's create two sample tables and demonstrate each operation:

```sql
-- Create and populate the 'employees' table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50)
);

INSERT INTO employees VALUES
(1, 'John', 'Smith', 'Sales'),
(2, 'Mary', 'Johnson', 'Marketing'),
(3, 'Robert', 'Brown', 'IT'),
(4, 'Susan', 'Davis', 'HR'),
(5, 'Michael', 'Wilson', 'Sales');

-- Create and populate the 'new_hires' table
CREATE TABLE new_hires (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50)
);

INSERT INTO new_hires VALUES
(4, 'Susan', 'Davis', 'HR'),
(5, 'Michael', 'Wilson', 'Sales'),
(6, 'Jennifer', 'Lee', 'Marketing'),
(7, 'David', 'Thomas', 'IT');
```

### UNION Example
Get a complete list of all employees from both tables without duplicates:

```sql
SELECT employee_id, first_name, last_name, department FROM employees
UNION
SELECT employee_id, first_name, last_name, department FROM new_hires;
```

Result:
```
employee_id | first_name | last_name | department
-----------+------------+-----------+------------
1          | John       | Smith     | Sales
2          | Mary       | Johnson   | Marketing
3          | Robert     | Brown     | IT
4          | Susan      | Davis     | HR
5          | Michael    | Wilson    | Sales
6          | Jennifer   | Lee       | Marketing
7          | David      | Thomas    | IT
```

### INTERSECT Example
Find employees who appear in both tables (existing employees who are also in new_hires):

```sql
SELECT employee_id, first_name, last_name, department FROM employees
INTERSECT
SELECT employee_id, first_name, last_name, department FROM new_hires;
```

Result:
```
employee_id | first_name | last_name | department
-----------+------------+-----------+------------
4          | Susan      | Davis     | HR
5          | Michael    | Wilson    | Sales
```

### EXCEPT Example
Find employees in the employees table who are not in the new_hires table:

```sql
SELECT employee_id, first_name, last_name, department FROM employees
EXCEPT
SELECT employee_id, first_name, last_name, department FROM new_hires;
```

Result:
```
employee_id | first_name | last_name | department
-----------+------------+-----------+------------
1          | John       | Smith     | Sales
2          | Mary       | Johnson   | Marketing
3          | Robert     | Brown     | IT
```

### MERGE Example
Update existing employees and insert new hires in a single operation:

```sql
MERGE INTO employees AS target
USING new_hires AS source
ON (target.employee_id = source.employee_id)
WHEN MATCHED THEN
    UPDATE SET 
        target.department = source.department
WHEN NOT MATCHED THEN
    INSERT (employee_id, first_name, last_name, department)
    VALUES (source.employee_id, source.first_name, source.last_name, source.department);
```

This MERGE operation:
1. Updates departments for employees 4 and 5 if they've changed
2. Inserts employees 6 and 7 from new_hires into the employees table

After the MERGE, the employees table would contain all 7 employees with the most up-to-date department information.

Each of these operations serves a specific purpose in data manipulation and analysis, allowing you to efficiently combine, compare, and synchronize data sets in SQL.
