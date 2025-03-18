# SQL Server Mathematical Functions with BikeStore Database Examples

## Basic Mathematical Functions

### 1. ABS() - Absolute Value
```sql
-- Calculate the deviation between target and actual sales for each product
SELECT 
    p.product_name,
    p.list_price AS target_price,
    AVG(oi.list_price) AS actual_avg_price,
    ABS(p.list_price - AVG(oi.list_price)) AS price_deviation
FROM production.products p
JOIN sales.order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name, p.list_price
ORDER BY price_deviation DESC;
```

### 2. CEILING() - Round Up
```sql
-- Calculate how many packages are needed for shipping bikes
-- Assuming each package can hold 3 bikes
SELECT 
    o.order_id,
    COUNT(oi.product_id) AS total_bikes,
    CEILING(COUNT(oi.product_id) / 3.0) AS packages_needed
FROM sales.orders o
JOIN sales.order_items oi ON o.order_id = oi.order_id
JOIN production.products p ON oi.product_id = p.product_id
WHERE p.category_id = 1 -- Assuming category_id 1 is for bikes
GROUP BY o.order_id;
```

### 3. FLOOR() - Round Down
```sql
-- Calculate complete years each product has been in inventory
SELECT 
    product_id,
    product_name,
    model_year,
    FLOOR(DATEDIFF(DAY, DATEFROMPARTS(model_year, 1, 1), GETDATE()) / 365.25) AS complete_years_in_inventory
FROM production.products;
```

### 4. POWER() - Exponentiation
```sql
-- Calculate compound growth of bike sales over years
SELECT 
    p.brand_id,
    b.brand_name,
    COUNT(oi.order_id) AS total_sales,
    COUNT(oi.order_id) / POWER(COUNT(DISTINCT YEAR(o.order_date)), 2) AS sales_growth_rate
FROM production.products p
JOIN production.brands b ON p.brand_id = b.brand_id
JOIN sales.order_items oi ON p.product_id = oi.product_id
JOIN sales.orders o ON oi.order_id = o.order_id
GROUP BY p.brand_id, b.brand_name;
```

### 5. ROUND() - Rounding
```sql
-- Round bike prices to nearest $50 for a promotion
SELECT 
    product_id,
    product_name,
    list_price,
    ROUND(list_price / 50, 0) * 50 AS promotional_price
FROM production.products
WHERE category_id = 1; -- Bikes category
```

### 6. SIGN() - Sign of Number
```sql
-- Classify inventory changes for bikes since last month
SELECT 
    p.product_id,
    p.product_name,
    s.store_id,
    s.quantity - LAG(s.quantity) OVER(PARTITION BY p.product_id, s.store_id ORDER BY s.updated_at) AS quantity_change,
    CASE SIGN(s.quantity - LAG(s.quantity) OVER(PARTITION BY p.product_id, s.store_id ORDER BY s.updated_at))
        WHEN 1 THEN 'Increased'
        WHEN -1 THEN 'Decreased'
        ELSE 'No Change'
    END AS inventory_status
FROM production.products p
JOIN production.stocks s ON p.product_id = s.product_id
WHERE p.category_id = 1 -- Bikes
AND s.updated_at >= DATEADD(MONTH, -1, GETDATE());
```

### 7. SQRT() - Square Root
```sql
-- Calculate the standard deviation of bike prices within each brand
SELECT 
    b.brand_id,
    b.brand_name,
    COUNT(p.product_id) AS product_count,
    AVG(p.list_price) AS avg_price,
    SQRT(
        SUM(POWER(p.list_price - AVG(p.list_price) OVER (PARTITION BY b.brand_id), 2)) / 
        COUNT(p.product_id)
    ) AS price_std_dev
FROM production.brands b
JOIN production.products p ON b.brand_id = p.brand_id
WHERE p.category_id = 1 -- Bikes
GROUP BY b.brand_id, b.brand_name;
```

### 8. SQUARE() - Square of a Number
```sql
-- Calculate area of bike boxes for shipping (assuming square boxes with length = 2 × bike length)
SELECT 
    p.product_id,
    p.product_name,
    p.list_price,
    CASE 
        WHEN p.list_price < 1000 THEN 1.2 -- Small bikes: 1.2m
        WHEN p.list_price < 2000 THEN 1.5 -- Medium bikes: 1.5m
        ELSE 1.8 -- Large bikes: 1.8m
    END AS estimated_length,
    SQUARE(
        CASE 
            WHEN p.list_price < 1000 THEN 1.2 -- Small bikes: 1.2m
            WHEN p.list_price < 2000 THEN 1.5 -- Medium bikes: 1.5m
            ELSE 1.8 -- Large bikes: 1.8m
        END
    ) AS box_area_sqm
FROM production.products p
WHERE p.category_id = 1; -- Bikes
```

## Trigonometric Functions

### 9. SIN(), COS(), TAN() - Sine, Cosine, Tangent
```sql
-- Calculate optimal store positions in a circular mall layout
-- Assuming a circular mall with radius of 100m and stores positioned evenly
WITH StoreCount AS (
    SELECT COUNT(*) AS num_stores FROM sales.stores
)
SELECT 
    s.store_id,
    s.store_name,
    ((ROW_NUMBER() OVER (ORDER BY s.store_id) - 1) * 360 / sc.num_stores) AS angle_degrees,
    100 * COS(RADIANS((ROW_NUMBER() OVER (ORDER BY s.store_id) - 1) * 360 / sc.num_stores)) AS x_position,
    100 * SIN(RADIANS((ROW_NUMBER() OVER (ORDER BY s.store_id) - 1) * 360 / sc.num_stores)) AS y_position
FROM sales.stores s
CROSS JOIN StoreCount sc;
```

### 10. ASIN(), ACOS(), ATAN() - Inverse Trigonometric Functions
```sql
-- Calculate optimal viewing angle for bike display stands
SELECT 
    product_id,
    product_name,
    list_price,
    CASE 
        WHEN list_price < 1000 THEN 15 -- Low-end bikes: 15cm height
        WHEN list_price < 3000 THEN 25 -- Mid-range bikes: 25cm height
        ELSE 35 -- High-end bikes: 35cm height
    END AS display_height,
    DEGREES(ATAN(
        CASE 
            WHEN list_price < 1000 THEN 15 -- Low-end bikes: 15cm height
            WHEN list_price < 3000 THEN 25 -- Mid-range bikes: 25cm height
            ELSE 35 -- High-end bikes: 35cm height
        END / 50.0 -- Viewer distance of 50cm
    )) AS optimal_viewing_angle
FROM production.products
WHERE category_id = 1; -- Bikes
```

## Advanced Mathematical Functions

### 11. LOG() - Natural Logarithm
```sql
-- Calculate time to clear inventory based on sales rate
SELECT 
    p.product_id,
    p.product_name,
    SUM(s.quantity) AS total_stock,
    COUNT(oi.order_id) / DATEDIFF(MONTH, MIN(o.order_date), MAX(o.order_date)) AS monthly_sales_rate,
    CASE 
        WHEN COUNT(oi.order_id) / DATEDIFF(MONTH, MIN(o.order_date), MAX(o.order_date)) > 0 
        THEN LOG(0.5) / LOG(1 - (COUNT(oi.order_id) / NULLIF(DATEDIFF(MONTH, MIN(o.order_date), MAX(o.order_date)), 0)) / NULLIF(SUM(s.quantity), 0))
        ELSE NULL
    END AS months_to_half_inventory
FROM production.products p
JOIN production.stocks s ON p.product_id = s.product_id
LEFT JOIN sales.order_items oi ON p.product_id = oi.product_id
LEFT JOIN sales.orders o ON oi.order_id = o.order_id
WHERE p.category_id = 1 -- Bikes
GROUP BY p.product_id, p.product_name
HAVING COUNT(oi.order_id) > 0 AND SUM(s.quantity) > 0;
```

### 12. LOG10() - Base-10 Logarithm
```sql
-- Create price range categories using logarithmic scale
SELECT 
    product_id,
    product_name,
    list_price,
    CEILING(LOG10(list_price) * 3) AS price_category
FROM production.products
WHERE category_id = 1 -- Bikes
ORDER BY list_price;
```

### 13. EXP() - Exponential Value
```sql
-- Predict future bike value with depreciation
SELECT 
    p.product_id,
    p.product_name,
    p.list_price AS original_price,
    p.model_year,
    YEAR(GETDATE()) - p.model_year AS age_years,
    p.list_price * EXP(-0.1 * (YEAR(GETDATE()) - p.model_year)) AS current_value
FROM production.products p
WHERE p.category_id = 1; -- Bikes
```

### 14. PI() - Pi Constant
```sql
-- Calculate wheel circumference based on bike type
SELECT 
    p.product_id,
    p.product_name,
    p.category_id,
    CASE 
        WHEN p.category_id = 1 THEN 29 -- Mountain bikes: 29 inch wheels
        WHEN p.category_id = 2 THEN 27 -- Road bikes: 27 inch wheels
        WHEN p.category_id = 3 THEN 20 -- Children bikes: 20 inch wheels
        ELSE 26 -- Default: 26 inch wheels
    END AS wheel_diameter_inches,
    PI() * 
    CASE 
        WHEN p.category_id = 1 THEN 29 -- Mountain bikes: 29 inch wheels
        WHEN p.category_id = 2 THEN 27 -- Road bikes: 27 inch wheels
        WHEN p.category_id = 3 THEN 20 -- Children bikes: 20 inch wheels
        ELSE 26 -- Default: 26 inch wheels
    END AS wheel_circumference_inches
FROM production.products p
WHERE p.category_id IN (1, 2, 3); -- Bike categories
```

## Rounding and Statistical Functions

### 15. PERCENT_RANK() - Percentile Calculation
```sql
-- Calculate price percentiles for bikes within each brand
SELECT 
    p.product_id,
    p.product_name,
    b.brand_name,
    p.list_price,
    FORMAT(PERCENT_RANK() OVER (PARTITION BY p.brand_id ORDER BY p.list_price), 'P2') AS price_percentile,
    CASE 
        WHEN PERCENT_RANK() OVER (PARTITION BY p.brand_id ORDER BY p.list_price) <= 0.25 THEN 'Budget'
        WHEN PERCENT_RANK() OVER (PARTITION BY p.brand_id ORDER BY p.list_price) <= 0.75 THEN 'Mid-range'
        ELSE 'Premium'
    END AS price_category
FROM production.products p
JOIN production.brands b ON p.brand_id = b.brand_id
WHERE p.category_id = 1; -- Bikes
```

### 16. RAND() - Random Number Generation
```sql
-- Select random bikes for a promotional display in each store
WITH RankedProducts AS (
    SELECT 
        s.store_id,
        s.store_name,
        p.product_id,
        p.product_name,
        p.list_price,
        ROW_NUMBER() OVER (PARTITION BY s.store_id ORDER BY NEWID()) AS random_rank
    FROM sales.stores s
    CROSS JOIN production.products p
    JOIN production.stocks st ON p.product_id = st.product_id AND s.store_id = st.store_id
    WHERE p.category_id = 1 -- Bikes
    AND st.quantity > 0
)
SELECT 
    store_id,
    store_name,
    product_id,
    product_name,
    list_price
FROM RankedProducts
WHERE random_rank <= 5; -- Top 5 random products per store
```

## Modulo and Date Functions

### 17. % (Modulo) - Remainder
```sql
-- Assign each product to one of 7 days for weekly promotions
SELECT 
    product_id,
    product_name,
    list_price,
    (product_id % 7) + 1 AS promotion_day_of_week,
    DATENAME(WEEKDAY, DATEADD(DAY, (product_id % 7), '2023-01-01')) AS promotion_day
FROM production.products
WHERE category_id = 1; -- Bikes
```

## Advanced Applications

### 18. Haversine Formula - Geographic Calculations
```sql
-- Calculate distance between customers and their nearest bike store
-- Assuming we have coordinates for stores and customers
WITH CustomerCoordinates AS (
    -- Simulated customer coordinates based on zip code
    SELECT 
        customer_id,
        first_name + ' ' + last_name AS customer_name,
        zip_code,
        -- Simulated coordinates (would be actual geocoding in real application)
        37.7749 + (CAST(SUBSTRING(zip_code, 1, 2) AS FLOAT) / 1000) AS latitude,
        -122.4194 + (CAST(SUBSTRING(zip_code, 3, 2) AS FLOAT) / 1000) AS longitude
    FROM sales.customers
),
StoreCoordinates AS (
    -- Simulated store coordinates
    SELECT 
        store_id,
        store_name,
        -- Simulated coordinates (would be actual store locations in real application)
        37.7749 + (store_id * 0.01) AS latitude,
        -122.4194 + (store_id * 0.015) AS longitude
    FROM sales.stores
)
SELECT 
    c.customer_id,
    c.customer_name,
    s.store_id,
    s.store_name,
    c.latitude AS customer_lat,
    c.longitude AS customer_long,
    s.latitude AS store_lat,
    s.longitude AS store_long,
    -- Haversine formula for distance calculation
    6371 * 2 * ASIN(SQRT(
        POWER(SIN(RADIANS(s.latitude - c.latitude) / 2), 2) + 
        COS(RADIANS(c.latitude)) * COS(RADIANS(s.latitude)) * 
        POWER(SIN(RADIANS(s.longitude - c.longitude) / 2), 2)
    )) AS distance_km
FROM CustomerCoordinates c
CROSS APPLY (
    SELECT TOP 1 *
    FROM StoreCoordinates s
    ORDER BY 6371 * 2 * ASIN(SQRT(
        POWER(SIN(RADIANS(s.latitude - c.latitude) / 2), 2) + 
        COS(RADIANS(c.latitude)) * COS(RADIANS(s.latitude)) * 
        POWER(SIN(RADIANS(s.longitude - c.longitude) / 2), 2)
    ))
) s;
```

### 19. Multiple Functions - Sales Analysis
```sql
-- Analyze sales efficiency across different price brackets with multiple functions
SELECT 
    p.brand_id,
    b.brand_name,
    CEILING(LOG10(p.list_price) * 2) AS price_bracket,
    COUNT(oi.order_id) AS total_sales,
    SUM(oi.quantity) AS units_sold,
    ROUND(AVG(oi.list_price), 2) AS avg_selling_price,
    ROUND(STDEV(oi.list_price), 2) AS price_std_dev,
    ROUND(SUM(oi.quantity * oi.list_price) / NULLIF(SUM(oi.quantity), 0), 2) AS revenue_per_unit,
    ROUND(SQRT(SUM(SQUARE(oi.quantity))), 2) AS quantity_magnitude,
    ROUND(SUM(oi.quantity * oi.list_price) / NULLIF(COUNT(DISTINCT o.order_id), 0), 2) AS avg_order_value
FROM production.products p
JOIN production.brands b ON p.brand_id = b.brand_id
JOIN sales.order_items oi ON p.product_id = oi.product_id
JOIN sales.orders o ON oi.order_id = o.order_id
WHERE p.category_id = 1 -- Bikes
GROUP BY p.brand_id, b.brand_name, CEILING(LOG10(p.list_price) * 2)
ORDER BY p.brand_id, price_bracket;
```

### 20. Seasonal Analysis with Trigonometric Functions
```sql
-- Analyze seasonal sales patterns using sine and cosine functions
SELECT 
    YEAR(o.order_date) AS sales_year,
    MONTH(o.order_date) AS sales_month,
    COUNT(oi.order_id) AS total_orders,
    SUM(oi.quantity * oi.list_price) AS total_revenue,
    -- Calculate seasonality score (higher in summer months for bikes)
    -- Using sine function to model seasonal pattern with peak in July
    SIN(RADIANS((MONTH(o.order_date) - 1) * 30 - 90)) + 1 AS seasonality_factor,
    -- Calculate expected vs. actual sales ratio
    SUM(oi.quantity * oi.list_price) / NULLIF(
        AVG(SUM(oi.quantity * oi.list_price)) OVER (PARTITION BY MONTH(o.order_date)) * 
        (SIN(RADIANS((MONTH(o.order_date) - 1) * 30 - 90)) + 1),
        0
    ) AS sales_vs_expected_ratio
FROM sales.orders o
JOIN sales.order_items oi ON o.order_id = oi.order_id
JOIN production.products p ON oi.product_id = p.product_id
WHERE p.category_id = 1 -- Bikes
GROUP BY YEAR(o.order_date), MONTH(o.order_date)
ORDER BY sales_year, sales_month;
```
