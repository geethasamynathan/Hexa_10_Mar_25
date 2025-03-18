# SQL Server String Functions with Real-World Examples

## 1. LEN() – Find Length of a String
**Use Case:** Checking the length of customer names.

```sql
SELECT LEN('John Doe') AS NameLength;
```

**Output:**
| NameLength |
|------------|
| 8          |

---

## 2. LEFT() – Extract Left Part of a String
**Use Case:** Extracting product categories from product codes.

```sql
SELECT LEFT('PRD12345', 3) AS ProductCategory;
```

**Output:**
| ProductCategory |
|----------------|
| PRD            |

---

## 3. RIGHT() – Extract Right Part of a String
**Use Case:** Extracting the last four digits of a credit card.

```sql
SELECT RIGHT('9876543212345678', 4) AS LastFourDigits;
```

**Output:**
| LastFourDigits |
|---------------|
| 5678          |

---

## 4. SUBSTRING() – Extract a Substring
**Use Case:** Extracting the domain from an email.

```sql
SELECT SUBSTRING('john.doe@gmail.com', 10, 10) AS EmailDomain;
```

**Output:**
| EmailDomain |
|------------|
| gmail.com  |

---

## 5. CHARINDEX() – Find Position of a Substring
**Use Case:** Finding '@' in an email address.

```sql
SELECT CHARINDEX('@', 'john.doe@gmail.com') AS AtPosition;
```

**Output:**
| AtPosition |
|-----------|
| 9         |

---

## 6. PATINDEX() – Pattern Matching in Strings
**Use Case:** Checking if an address contains 'Street'.

```sql
SELECT PATINDEX('%Street%', '123 Main Street, NY') AS Position;
```

**Output:**
| Position |
|---------|
| 9       |

---

## 7. REPLACE() – Replace a Substring
**Use Case:** Updating company names.

```sql
SELECT REPLACE('Tech Solutions Inc.', 'Inc.', 'LLC') AS UpdatedCompany;
```

**Output:**
| UpdatedCompany      |
|--------------------|
| Tech Solutions LLC |

---

## 8. STUFF() – Insert a String
**Use Case:** Correcting a name.

```sql
SELECT STUFF('Jon Doe', 1, 3, 'John') AS CorrectedName;
```

**Output:**
| CorrectedName |
|--------------|
| John Doe     |

---

## 9. REPLICATE() – Repeat a String
**Use Case:** Creating a separator.

```sql
SELECT REPLICATE('-', 20) AS SeparatorLine;
```

**Output:**
| SeparatorLine        |
|----------------------|
| -------------------- |

---

## 10. CONCAT() – Concatenating Strings
**Use Case:** Creating full names.

```sql
SELECT CONCAT('John', ' ', 'Doe') AS FullName;
```

**Output:**
| FullName |
|---------|
| John Doe |

---

## 11. CONCAT_WS() – Concatenate with a Separator
**Use Case:** Formatting addresses.

```sql
SELECT CONCAT_WS(', ', '123 Main St', 'New York', 'NY', '10001') AS FullAddress;
```

**Output:**
| FullAddress                  |
|------------------------------|
| 123 Main St, New York, NY, 10001 |

---

## 12. UPPER() – Convert to Uppercase
**Use Case:** Formatting names.

```sql
SELECT UPPER('john doe') AS UppercaseName;
```

**Output:**
| UppercaseName |
|--------------|
| JOHN DOE     |

---

## 13. LOWER() – Convert to Lowercase
**Use Case:** Standardizing email storage.

```sql
SELECT LOWER('John.Doe@Email.COM') AS StandardizedEmail;
```

**Output:**
| StandardizedEmail      |
|-----------------------|
| john.doe@email.com |

---

## 14. LTRIM() – Remove Leading Spaces
**Use Case:** Cleaning up input.

```sql
SELECT LTRIM('   John Doe') AS TrimmedName;
```

**Output:**
| TrimmedName |
|------------|
| John Doe   |

---

## 15. RTRIM() – Remove Trailing Spaces
**Use Case:** Ensuring data consistency.

```sql
SELECT RTRIM('John Doe   ') AS TrimmedName;
```

**Output:**
| TrimmedName |
|------------|
| John Doe   |

---

## 16. FORMAT() – Formatting Strings
**Use Case:** Formatting phone numbers.

```sql
SELECT FORMAT(1234567890, '(###) ###-####') AS PhoneNumber;
```

**Output:**
| PhoneNumber |
|------------|
| (123) 456-7890 |

---

## 17. TRANSLATE() – Replace Multiple Characters
**Use Case:** Standardizing text.

```sql
SELECT TRANSLATE('john_doe@example.com', '@_.', '-#') AS UpdatedEmail;
```

**Output:**
| UpdatedEmail       |
|-------------------|
| john-doe#example-com |

---

## 18. STRING_AGG() – Aggregate Strings
**Use Case:** Listing employee names.

```sql
SELECT STRING_AGG(EmployeeName, ', ') AS EmployeeList 
FROM (VALUES ('John'), ('Jane'), ('Doe')) AS Employees(EmployeeName);
```

**Output:**
| EmployeeList      |
|------------------|
| John, Jane, Doe |

---

This document provides **SQL Server string functions** with **real-world applications**.
