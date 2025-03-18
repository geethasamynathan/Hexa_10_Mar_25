# String Functions in MS SQL Server with BikeStores DB Examples

I'll provide examples of common string functions in MS SQL Server using the BikeStores database schema. The BikeStores database typically contains tables like customers, products, orders, etc.

## Basic String Functions

### 1. LEN - Returns the length of a string
```sql
SELECT product_name, LEN(product_name) AS name_length
FROM production.products
WHERE LEN(product_name) > 30;
```

### 2. LEFT - Returns a specified number of characters from the left
```sql
SELECT first_name, LEFT(first_name, 3) AS first_three_chars
FROM sales.customers;
```

### 3. RIGHT - Returns a specified number of characters from the right
```sql
SELECT phone, RIGHT(phone, 4) AS last_four_digits
FROM sales.customers;
```

### 4. SUBSTRING - Returns part of a string
```sql
SELECT email, SUBSTRING(email, CHARINDEX('@', email) + 1, LEN(email)) AS domain
FROM sales.customers;
```

### 5. CHARINDEX - Returns the position of a substring
```sql
SELECT email, CHARINDEX('@', email) AS at_symbol_position
FROM sales.customers
WHERE CHARINDEX('@', email) > 0;
```

## Conversion Functions

### 6. UPPER - Converts to uppercase
```sql
SELECT product_name, UPPER(product_name) AS uppercase_name
FROM production.products
WHERE category_id = 1;
```

### 7. LOWER - Converts to lowercase
```sql
SELECT product_name, LOWER(product_name) AS lowercase_name
FROM production.products
WHERE category_id = 2;
```

## Trimming Functions

### 8. LTRIM - Removes leading spaces
```sql
SELECT LTRIM('    BikeStores') AS trimmed_text;
```

### 9. RTRIM - Removes trailing spaces
```sql
SELECT RTRIM('BikeStores    ') AS trimmed_text;
```

### 10. TRIM - Removes both leading and trailing spaces
```sql
SELECT TRIM('    BikeStores    ') AS trimmed_text;
```

## Modification Functions

### 11. REPLACE - Replaces occurrences of a substring
```sql
SELECT product_name, REPLACE(product_name, 'Road', 'Street') AS modified_name
FROM production.products
WHERE product_name LIKE '%Road%';
```

### 12. STUFF - Deletes and inserts strings
```sql
SELECT order_id, STUFF(order_id, 1, 2, 'ORD') AS modified_order_id
FROM sales.orders
WHERE order_id < 10;
```

### 13. CONCAT - Combines strings
```sql
SELECT first_name, last_name, CONCAT(first_name, ' ', last_name) AS full_name
FROM sales.customers;
```

### 14. CONCAT_WS - Combines strings with a separator
```sql
SELECT CONCAT_WS(' - ', brand_name, category_name, product_name) AS product_info
FROM production.products p
JOIN production.brands b ON p.brand_id = b.brand_id
JOIN production.categories c ON p.category_id = c.category_id;
```

### 15. SPACE - Returns a string of spaces
```sql
SELECT first_name, last_name, CONCAT(first_name, SPACE(5), last_name) AS spaced_name
FROM sales.staffs;
```

## Formatting Functions

### 16. FORMAT - Formats a value with specified format
```sql
SELECT order_date, FORMAT(order_date, 'yyyy-MM-dd') AS formatted_date
FROM sales.orders;
```

### 17. STRING_SPLIT - Splits a string by delimiter
```sql
SELECT value
FROM STRING_SPLIT('Mountain,Road,Cruiser,BMX', ',');
```

### 18. STRING_AGG - Aggregates strings with a separator
```sql
SELECT category_id, STRING_AGG(product_name, ', ') AS products_list
FROM production.products
GROUP BY category_id;
```

### 19. QUOTENAME - Returns a Unicode string with delimiters
```sql
SELECT QUOTENAME(product_name) AS quoted_name
FROM production.products
WHERE product_id < 10;
```

### 20. PATINDEX - Returns the position of a pattern
```sql
SELECT product_name, PATINDEX('%[0-9]%', product_name) AS first_digit_position
FROM production.products
WHERE PATINDEX('%[0-9]%', product_name) > 0;
```
