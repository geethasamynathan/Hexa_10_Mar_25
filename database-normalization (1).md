# Database Normalization Forms Explained

Database normalization is the process of organizing data to reduce redundancy and improve data integrity. Let's explore each normalization form with definitions and practical SQL Server examples.

## First Normal Form (1NF)

**Definition**: A table is in 1NF if:
- It has a primary key
- All attributes are atomic (indivisible)
- No repeating groups or arrays

**Example**: Let's start with an unnormalized table:

```sql
CREATE TABLE UnnormalizedOrders (
    OrderID INT,
    CustomerName VARCHAR(100),
    Products VARCHAR(255),
    OrderDate DATE
);

INSERT INTO UnnormalizedOrders VALUES
(1, 'John Smith', 'Laptop, Mouse, Keyboard', '2023-01-15'),
(2, 'Mary Johnson', 'Monitor, Headphones', '2023-01-20');
```

**Problems**: 
- Products column contains multiple values
- Difficult to search for specific products

**Converting to 1NF**:

```sql
CREATE TABLE Orders_1NF (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    OrderDate DATE
);

CREATE TABLE OrderItems_1NF (
    OrderItemID INT PRIMARY KEY,
    OrderID INT FOREIGN KEY REFERENCES Orders_1NF(OrderID),
    Product VARCHAR(100)
);

INSERT INTO Orders_1NF VALUES
(1, 'John Smith', '2023-01-15'),
(2, 'Mary Johnson', '2023-01-20');

INSERT INTO OrderItems_1NF VALUES
(1, 1, 'Laptop'),
(2, 1, 'Mouse'),
(3, 1, 'Keyboard'),
(4, 2, 'Monitor'),
(5, 2, 'Headphones');
```

**Explanation**: We've separated the repeating group (Products) into a separate table, making each attribute atomic. Each order now links to multiple order items through the OrderID foreign key.

## Second Normal Form (2NF)

**Definition**: A table is in 2NF if:
- It is in 1NF
- All non-key attributes are fully functionally dependent on the entire primary key

**Example**: Let's assume our previous design evolved to track product prices:

```sql
CREATE TABLE OrderItems_NotIn2NF (
    OrderID INT,
    ProductID INT,
    ProductName VARCHAR(100),
    ProductCategory VARCHAR(50),
    Quantity INT,
    UnitPrice DECIMAL(10,2),
    PRIMARY KEY (OrderID, ProductID)
);
```

**Problem**: ProductName and ProductCategory depend only on ProductID, not on the entire primary key (OrderID, ProductID).

**Converting to 2NF**:

```sql
CREATE TABLE Products_2NF (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    ProductCategory VARCHAR(50)
);

CREATE TABLE OrderItems_2NF (
    OrderID INT,
    ProductID INT FOREIGN KEY REFERENCES Products_2NF(ProductID),
    Quantity INT,
    UnitPrice DECIMAL(10,2),
    PRIMARY KEY (OrderID, ProductID)
);
```

**Explanation**: We've moved ProductName and ProductCategory to a separate Products table since they depend only on ProductID. The OrderItems table now contains only attributes that depend on the entire composite key.

## Third Normal Form (3NF)

**Definition**: A table is in 3NF if:
- It is in 2NF
- All non-key attributes are non-transitively dependent on the primary key (no non-key attribute depends on another non-key attribute)

**Example**: Let's expand our Products table:

```sql
CREATE TABLE Products_NotIn3NF (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    CategoryID INT,
    CategoryName VARCHAR(50),
    CategoryDescription VARCHAR(200)
);
```

**Problem**: CategoryName and CategoryDescription depend on CategoryID, not directly on ProductID.

**Converting to 3NF**:

```sql
CREATE TABLE Categories_3NF (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50),
    CategoryDescription VARCHAR(200)
);

CREATE TABLE Products_3NF (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    CategoryID INT FOREIGN KEY REFERENCES Categories_3NF(CategoryID)
);
```

**Explanation**: We've eliminated the transitive dependency by moving CategoryName and CategoryDescription to a separate Categories table. Now all attributes in each table depend directly on their respective primary keys.

## Boyce-Codd Normal Form (BCNF)

**Definition**: A table is in BCNF if:
- It is in 3NF
- For every functional dependency X → Y, X must be a superkey (able to uniquely identify each row)

**Example**: Consider a table tracking student enrollments in courses with multiple instructors:

```sql
CREATE TABLE CourseAssignments_NotInBCNF (
    StudentID INT,
    CourseID INT,
    InstructorID INT,
    InstructorName VARCHAR(100),
    EnrollmentDate DATE,
    PRIMARY KEY (StudentID, CourseID)
);
```

**Assumptions**:
- Each course has exactly one instructor (CourseID → InstructorID)
- Each instructor teaches multiple courses
- InstructorName depends on InstructorID

**Problem**: CourseID determines InstructorID, but CourseID is not a superkey.

**Converting to BCNF**:

```sql
CREATE TABLE Instructors_BCNF (
    InstructorID INT PRIMARY KEY,
    InstructorName VARCHAR(100)
);

CREATE TABLE Courses_BCNF (
    CourseID INT PRIMARY KEY,
    InstructorID INT FOREIGN KEY REFERENCES Instructors_BCNF(InstructorID)
);

CREATE TABLE Enrollments_BCNF (
    StudentID INT,
    CourseID INT FOREIGN KEY REFERENCES Courses_BCNF(CourseID),
    EnrollmentDate DATE,
    PRIMARY KEY (StudentID, CourseID)
);
```

**Explanation**: We've separated the data into three tables to ensure that in each table, every determinant (left side of a functional dependency) is a superkey. CourseID determines InstructorID, so we placed them in a separate table where CourseID is the primary key.

## Summary of Normalization Forms

1. **1NF**: Eliminate repeating groups; make all attributes atomic
2. **2NF**: Remove partial dependencies on the primary key
3. **3NF**: Remove transitive dependencies (non-key attributes depending on other non-key attributes)
4. **BCNF**: Ensure every determinant is a superkey

Each normalization form builds on the previous one, progressively reducing redundancy and improving data integrity.
