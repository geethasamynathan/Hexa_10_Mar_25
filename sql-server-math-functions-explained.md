# Real-world Examples of SQL Server Mathematical Functions with Explanations

## Basic Mathematical Functions

### 1. ABS() - Absolute Value
Returns the absolute (positive) value of a number.

```sql
-- Calculate the absolute deviation from target sales
SELECT 
    ProductName,
    TargetSales,
    ActualSales,
    ABS(ActualSales - TargetSales) AS SalesDeviation
FROM SalesData;
```

**Explanation:** In sales analysis, this function helps measure how far actual sales deviate from targets, regardless of whether sales exceeded or fell short of targets. By using ABS(), managers can see the magnitude of deviation without worrying about the direction.

### 2. CEILING() - Round Up
Rounds a number up to the nearest integer.

```sql
-- Calculate how many packages are needed to ship items
-- Each package can hold 10 items
SELECT 
    OrderID,
    ItemCount,
    CEILING(ItemCount / 10.0) AS PackagesNeeded
FROM Orders;
```

**Explanation:** When planning logistics, CEILING() is useful for determining resource needs. In this example, even if an order has just 1 item, you need 1 package. Similarly, 11 items would require 2 packages. The function ensures you never underestimate required resources.

### 3. FLOOR() - Round Down
Rounds a number down to the nearest integer.

```sql
-- Calculate completed work hours (ignoring partial hours)
SELECT 
    ProjectName,
    HoursWorked,
    FLOOR(HoursWorked) AS CompletedHours
FROM ProjectTracking;
```

**Explanation:** FLOOR() is helpful when you need to discard fractional parts. In time tracking, companies might only count fully completed hours for billing or reporting purposes. For instance, 7.8 hours worked would be counted as 7 complete hours.

### 4. POWER() - Exponentiation
Raises a number to the specified power.

```sql
-- Calculate compound interest on investments
SELECT 
    InvestmentID,
    Principal,
    InterestRate,
    Years,
    Principal * POWER(1 + InterestRate, Years) AS FutureValue
FROM Investments;
```

**Explanation:** POWER() is essential for financial calculations. This example shows the standard compound interest formula where the initial investment (Principal) grows exponentially over time. The function allows precise calculation of how money grows when interest compounds.

### 5. ROUND() - Rounding
Rounds a number to a specified precision.

```sql
-- Round product prices to nearest dollar for a promotion
SELECT 
    ProductName,
    Price,
    ROUND(Price, 0) AS RoundedPrice
FROM Products;
```

**Explanation:** ROUND() provides flexibility in controlling numerical precision. In retail, this function can simplify pricing for marketing campaigns. For example, $24.75 becomes $25, making prices easier for customers to process. The second parameter (0) specifies rounding to the nearest whole number.

### 6. SIGN() - Sign of Number
Returns the sign of a number: 1 (positive), -1 (negative), or 0.

```sql
-- Categorize inventory changes (increase, decrease, or no change)
SELECT 
    ProductID,
    QuantityChange,
    CASE SIGN(QuantityChange)
        WHEN 1 THEN 'Increase'
        WHEN -1 THEN 'Decrease'
        ELSE 'No Change'
    END AS InventoryStatus
FROM InventoryChanges;
```

**Explanation:** SIGN() is useful for categorizing directional changes. In inventory management, this function quickly identifies if stock levels are rising, falling, or staying the same, allowing for automated alerts or reporting based on the direction of change rather than the magnitude.

### 7. SQRT() - Square Root
Returns the square root of a number.

```sql
-- Calculate the distance between warehouse and delivery locations
SELECT 
    DeliveryID,
    SQRT(POWER(DeliveryX - WarehouseX, 2) + POWER(DeliveryY - WarehouseY, 2)) AS DeliveryDistance
FROM Deliveries;
```

**Explanation:** This example uses the Pythagorean theorem to calculate straight-line distance between locations. SQRT() is crucial in any distance calculation, enabling logistics teams to determine the most efficient delivery routes or estimate travel times.

### 8. SQUARE() - Square of a Number
Returns the square of a number.

```sql
-- Calculate area of square rooms in square feet
SELECT 
    RoomID,
    Length,
    SQUARE(Length) AS AreaInSquareFeet
FROM Rooms
WHERE Shape = 'Square';
```

**Explanation:** SQUARE() provides a shorthand for calculating the area of square spaces. In real estate or facilities management, this function simplifies area calculations for space planning, helping to determine capacity or maintenance costs.

## Trigonometric Functions

### 9. SIN(), COS(), TAN() - Sine, Cosine, Tangent
Calculate sine, cosine, and tangent of an angle in radians.

```sql
-- Calculate coordinates on a circular path for animation frames
SELECT 
    FrameID,
    Radius * COS(Angle * PI() / 180) AS X_Position,
    Radius * SIN(Angle * PI() / 180) AS Y_Position
FROM AnimationFrames;
```

**Explanation:** These functions convert angles to coordinates, useful in plotting circular paths. The example shows how to calculate points on a circle for animation frames, converting from degrees to radians (PI()/180) before applying the trigonometric functions. SIN() and COS() work together to transform polar coordinates to Cartesian coordinates.

### 10. ASIN(), ACOS(), ATAN() - Inverse Trigonometric Functions
Calculate the arcsine, arccosine, and arctangent of a number.

```sql
-- Calculate the angle of elevation needed for a drone camera
SELECT 
    DroneHeight,
    TargetDistance,
    DEGREES(ATAN(DroneHeight / TargetDistance)) AS ElevationAngle
FROM DroneOperations;
```

**Explanation:** Inverse trigonometric functions help determine angles from ratios. In drone operations, ATAN() calculates the vertical angle needed to point a camera at a target, converting from a height-to-distance ratio to an angle in degrees with the DEGREES() function.

### 11. ATN2() - Arc Tangent of Two Numbers
Returns the angle in radians between the positive x-axis and the ray to the point (y, x).

```sql
-- Calculate the direction (angle) from headquarters to each store location
SELECT 
    StoreID,
    StoreName,
    DEGREES(ATN2(StoreLatitude - HQLatitude, StoreLongitude - HQLongitude)) AS DirectionAngle
FROM StoreLocations
CROSS JOIN HeadquartersLocation;
```

**Explanation:** ATN2() is superior to ATAN() because it handles all quadrants correctly. In geographic applications, this function helps determine the compass direction from one location to another, providing navigational guidance or helping visualize the spatial relationship between locations.

## Advanced Mathematical Functions

### 12. LOG() - Natural Logarithm
Returns the natural logarithm of a number.

```sql
-- Calculate time needed for bacterial population to double
SELECT 
    ExperimentID,
    GrowthRate,
    LOG(2) / GrowthRate AS DoublingTimeHours
FROM BacteriaExperiments;
```

**Explanation:** LOG() is key in exponential growth calculations. This example uses the formula for doubling time in exponential growth, common in scientific research. The natural logarithm of 2 divided by the growth rate gives the time required for a population to double, helping researchers predict bacterial growth patterns.

### 13. LOG10() - Base-10 Logarithm
Returns the base-10 logarithm of a number.

```sql
-- Create a logarithmic scale for earthquake magnitudes
SELECT 
    EarthquakeID,
    Magnitude,
    POWER(10, Magnitude) AS RelativeEnergy
FROM EarthquakeData;
```

**Explanation:** LOG10() is useful for working with logarithmic scales. The example shows the relationship between earthquake magnitude and energy release, where each unit increase in magnitude represents a 10-fold increase in energy. This function helps convert between linear and logarithmic scales commonly used in scientific measurements.

### 14. EXP() - Exponential Value
Returns e raised to the specified power.

```sql
-- Calculate radioactive decay over time
SELECT 
    ElementID,
    DecayConstant,
    TimeInYears,
    InitialAmount * EXP(-DecayConstant * TimeInYears) AS RemainingAmount
FROM RadioactiveElements;
```

**Explanation:** EXP() is essential for exponential decay calculations. This example implements the standard radioactive decay formula, where the amount of a radioactive substance decreases exponentially over time. The function allows scientists to predict how much of a substance remains after a given period.

### 15. PI() - Pi Constant
Returns the constant value of pi.

```sql
-- Calculate the volume of cylindrical storage tanks
SELECT 
    TankID,
    Radius,
    Height,
    PI() * SQUARE(Radius) * Height AS VolumeInCubicMeters
FROM StorageTanks;
```

**Explanation:** PI() provides the mathematical constant π (approximately 3.14159). In this example, it's used in the formula for calculating the volume of a cylinder (πr²h). This helps in inventory management, determining storage capacity, or calculating fluid volumes in manufacturing processes.

## Rounding and Truncation Functions

### 16. CEILING() vs FLOOR() vs ROUND()
Different ways to handle decimal values.

```sql
-- Different pricing strategies based on rounding methods
SELECT 
    ProductID,
    BasePrice,
    CEILING(BasePrice) AS PremiumPrice,
    ROUND(BasePrice, 0) AS StandardPrice,
    FLOOR(BasePrice) AS DiscountPrice
FROM Products;
```

**Explanation:** This example demonstrates different pricing strategies using various rounding functions. CEILING() always rounds up (potentially maximizing revenue), FLOOR() always rounds down (offering customer discounts), and ROUND() finds the nearest value (balanced approach). These functions give businesses flexibility in pricing models.

### 17. RAND() - Random Number
Returns a random float value between 0 and 1.

```sql
-- Select random customers for a satisfaction survey
SELECT TOP 100
    CustomerID,
    CustomerName,
    EmailAddress
FROM Customers
ORDER BY RAND();
```

**Explanation:** RAND() generates random values useful for sampling. In this example, it creates a random order for selecting customers to participate in a survey, ensuring an unbiased sample. This approach is common in market research, quality control testing, or any scenario requiring random selection.

## Number Conversion Functions

### 18. CAST() and CONVERT()
Convert numbers between different data types.

```sql
-- Calculate daily budget from monthly budget
SELECT 
    CampaignID,
    MonthlyBudget,
    CAST(MonthlyBudget / 30.0 AS DECIMAL(10,2)) AS DailyBudget
FROM MarketingCampaigns;
```

**Explanation:** CAST() ensures precise control over data type conversion. In this example, dividing a monthly budget by 30 days might produce a decimal result. CAST() ensures the result is formatted as a decimal with 2 decimal places, maintaining financial precision for daily budget allocations.

## Statistical Functions

### 19. DEGREES() and RADIANS()
Convert between degrees and radians.

```sql
-- Convert compass bearings to radians for calculations
SELECT 
    RouteID,
    CompassBearing,
    RADIANS(CompassBearing) AS BearingInRadians
FROM NavigationRoutes;
```

**Explanation:** These functions convert between different angle measurement systems. Most SQL trigonometric functions require radians, but humans typically work with degrees. This example converts compass bearings (0-360 degrees) to radians for use in navigation calculations, bridging the gap between human-readable and computation-friendly formats.

### 20. PERCENT_RANK() and PERCENTILE_CONT()
Statistical ranking functions.

```sql
-- Calculate percentile rankings for student scores
SELECT 
    StudentID,
    Score,
    PERCENT_RANK() OVER (ORDER BY Score) AS PercentileRank,
    FORMAT(PERCENT_RANK() OVER (ORDER BY Score), 'P2') AS PercentileDisplay
FROM TestResults;
```

**Explanation:** PERCENT_RANK() is a window function that calculates the relative position of a value within a dataset. In educational settings, this helps determine a student's standing relative to peers. The function returns values from 0 to 1, representing the percentage of scores below the current value, which is then formatted as a percentage for easier interpretation.

## Modulo and Remainder

### 21. % and MOD - Modulo/Remainder
Returns the remainder of a division operation.

```sql
-- Assign customers to one of 4 sales representatives in a round-robin fashion
SELECT 
    CustomerID,
    CustomerName,
    'SalesRep' + CAST((CustomerID % 4) + 1 AS VARCHAR) AS AssignedRepresentative
FROM Customers;
```

**Explanation:** The modulo operator (%) finds the remainder after division. This example uses it to evenly distribute customers among four sales representatives in a round-robin fashion. CustomerID % 4 will always return 0, 1, 2, or 3, and adding 1 creates values 1-4 for assignment, ensuring balanced workloads across the team.

## String/Numeric Conversions

### 22. PARSE() - Parse String to Number
Converts a string to a specified numeric type.

```sql
-- Convert string-based measurements to numeric values for calculation
SELECT 
    ProductID,
    Dimensions,
    TRY_PARSE(SUBSTRING(Dimensions, 1, CHARINDEX('x', Dimensions) - 1) AS DECIMAL(10,2)) AS Width,
    TRY_PARSE(SUBSTRING(Dimensions, CHARINDEX('x', Dimensions) + 1, LEN(Dimensions)) AS DECIMAL(10,2)) AS Height
FROM Products;
```

**Explanation:** PARSE() and TRY_PARSE() convert string representations of numbers to actual numeric values. In this example, product dimensions stored as "10x20" are split and converted to numeric values for width and height, allowing for area calculations or filtering based on size. TRY_PARSE() is safer as it returns NULL instead of an error if conversion fails.

## Advanced Applications

### 23. Haversine Formula
Calculate distance between two geographic points.

```sql
-- Calculate the distance between customers and nearest store
SELECT 
    C.CustomerID,
    C.CustomerName,
    S.StoreID,
    S.StoreName,
    12742 * ASIN(SQRT(
        POWER(SIN(RADIANS(S.Latitude - C.Latitude) / 2), 2) + 
        COS(RADIANS(C.Latitude)) * COS(RADIANS(S.Latitude)) * 
        POWER(SIN(RADIANS(S.Longitude - C.Longitude) / 2), 2)
    )) AS DistanceInKM
FROM Customers C
CROSS APPLY (
    SELECT TOP 1 *
    FROM Stores S
    ORDER BY 12742 * ASIN(SQRT(
        POWER(SIN(RADIANS(S.Latitude - C.Latitude) / 2), 2) + 
        COS(RADIANS(C.Latitude)) * COS(RADIANS(S.Latitude)) * 
        POWER(SIN(RADIANS(S.Longitude - C.Longitude) / 2), 2)
    ))
) S;
```

**Explanation:** This complex example combines multiple mathematical functions to implement the Haversine formula, which calculates the great-circle distance between two points on a sphere using their latitude and longitude. The formula accounts for the Earth's curvature, providing accurate distances between geographic locations. This is useful for proximity analysis in retail, logistics, or service area planning, allowing businesses to identify the nearest location for each customer.
