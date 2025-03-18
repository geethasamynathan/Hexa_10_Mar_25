# MS SQL Server Mathematical Functions with Examples and Outputs

This document shows examples of all mathematical functions available in Microsoft SQL Server with sample data, queries, and their outputs.

## Basic Arithmetic Functions

### 1. Addition (+)

```sql
SELECT 10 + 5 AS Addition;
```

**Output:**
| Addition |
|----------|
| 15       |

### 2. Subtraction (-)

```sql
SELECT 20 - 8 AS Subtraction;
```

**Output:**
| Subtraction |
|-------------|
| 12          |

### 3. Multiplication (*)

```sql
SELECT 6 * 4 AS Multiplication;
```

**Output:**
| Multiplication |
|----------------|
| 24             |

### 4. Division (/)

```sql
SELECT 100 / 20 AS Division;
```

**Output:**
| Division |
|----------|
| 5        |

### 5. Modulo (%)

```sql
SELECT 17 % 5 AS Remainder;
```

**Output:**
| Remainder |
|-----------|
| 2         |

## Advanced Mathematical Functions

### 6. ABS - Returns the absolute value

```sql
SELECT 
    value,
    ABS(value) AS Absolute_Value
FROM (VALUES (-15.7), (22.3), (-5), (0)) AS TestData(value);
```

**Output:**
| value | Absolute_Value |
|-------|----------------|
| -15.7 | 15.7           |
| 22.3  | 22.3           |
| -5    | 5              |
| 0     | 0       