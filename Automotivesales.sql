-- Sales Performance

-- What is the total number of cars sold?

SELECT COUNT(vin)
  FROM rnd

-- What is the total revenue generated from sales?
SELECT SUM(profit)
FROM rnd  

-- Monthly/Quarterly Sales Trends

-- Monthly Sales Trends
SELECT 
    YEAR(CONVERT(DATE, Sale_Date, 101)) AS year,
    MONTH(CONVERT(DATE, Sale_Date, 101)) AS month,
    COUNT(*) AS cars_sold,
    SUM(CAST(Sale_Price AS DECIMAL(10, 2))) AS total_sales
FROM 
    rnd
GROUP BY 
    YEAR(CONVERT(DATE, Sale_Date, 101)), 
    MONTH(CONVERT(DATE, Sale_Date, 101))
ORDER BY 
    year, 
    month;

-- Quarterly Sales Trends
SELECT 
    YEAR(CONVERT(DATE, Sale_Date, 101)) AS year,
    DATEPART(QUARTER, CONVERT(DATE, Sale_Date, 101)) AS quarter,
    COUNT(*) AS cars_sold,
    SUM(CAST(Sale_Price AS DECIMAL(10, 2))) AS total_sales
FROM 
    rnd
GROUP BY 
    YEAR(CONVERT(DATE, Sale_Date, 101)), 
    DATEPART(QUARTER, CONVERT(DATE, Sale_Date, 101))
ORDER BY 
    year, 
    quarter;

-- Sales by Car Models and Makes

-- Best Selling Car Models and Makes
SELECT TOP 10
    Make,
    Model,
    COUNT(*) AS cars_sold,
    SUM(CAST(REPLACE(Sale_Price, ',', '') AS DECIMAL(10, 2))) AS total_sales
FROM 
    rnd
GROUP BY 
    Make, 
    Model
ORDER BY 
    cars_sold DESC;

-- Lowest Selling Car Models and Makes
SELECT TOP 10
    Make,
    Model,
    COUNT(*) AS cars_sold,
    SUM(CAST(REPLACE(Sale_Price, ',', '') AS DECIMAL(10, 2))) AS total_sales
FROM 
    rnd
GROUP BY 
    Make, 
    Model
ORDER BY 
    cars_sold ASC;

-- Sales Breakdown by Body Style
SELECT 
    body,
    COUNT(*) AS cars_sold,
    SUM(CAST(REPLACE(Sale_Price, ',', '') AS DECIMAL(10, 2))) AS total_sales
FROM 
    rnd
GROUP BY 
    body
ORDER BY 
    cars_sold DESC;

-- Financial Analysis

-- Profit Margins for Each Car Make and Model
SELECT make, model, profit, total_cost, 
       ROUND((profit / CAST(total_cost AS FLOAT)) * 100, 1) AS profit_margin_percentage
FROM rnd 
ORDER BY profit_margin_percentage DESC;

-- Inventory Management
-- Inventory turnover by make
SELECT make, AVG(time_on_lot) AS avg_time_to_sell
FROM rnd
group by make
order by avg(time_on_lot) DESC

-- Inventory turnover by model
SELECT model, AVG(time_on_lot) AS avg_time_to_sell
FROM rnd
group by model
order by avg(time_on_lot) ASC

-- Marketing and SAles Channels

-- Which marketing campaigns or channels (e.g., purchased from) generated the most sales?
SELECT 
    purchased_from AS sales_channel, 
    COUNT(*) AS total_sales,
    SUM(profit) AS total_profit,
    AVG(profit) AS average_profit
FROM 
    rnd
GROUP BY 
    purchased_from
ORDER BY 
    total_sales DESC;

-- Sales forcasting for next year
-- Step 1: Calculate Monthly Sales for Last Year
SELECT 
    DATEPART(MONTH, sale_date) AS sale_month, 
    COUNT(*) AS monthly_sales
FROM 
    rnd
WHERE 
    DATEPART(YEAR, sale_date) = 2017
GROUP BY 
    DATEPART(MONTH, sale_date)
ORDER BY 
    sale_month;

-- Step 2: Calculate Average Monthly Sales
WITH monthly_sales AS (
    SELECT 
        DATEPART(MONTH, sale_date) AS sale_month, 
        COUNT(*) AS monthly_sales
    FROM 
        rnd
    WHERE 
        DATEPART(YEAR, sale_date) = 2017
    GROUP BY 
        DATEPART(MONTH, sale_date)
)
SELECT 
    AVG(monthly_sales) AS average_monthly_sales
FROM 
    monthly_sales;

-- Step 3: Project Sales for the Coming Year
WITH monthly_sales AS (
    SELECT 
        DATEPART(MONTH, sale_date) AS sale_month, 
        COUNT(*) AS monthly_sales
    FROM 
        rnd
    WHERE 
        DATEPART(YEAR, sale_date) = 2017
    GROUP BY 
        DATEPART(MONTH, sale_date)
),
average_sales AS (
    SELECT 
        AVG(monthly_sales) AS average_monthly_sales
    FROM 
        monthly_sales
)
SELECT 
    average_monthly_sales * 12 AS projected_annual_sales
FROM 
    average_sales;

-- What should be the inventory strategy for the next year based on past sales trends?

-- Calculate average, max, and min monthly sales
WITH monthly_sales AS (
    SELECT 
        DATEPART(MONTH, sale_date) AS sale_month, 
        COUNT(*) AS monthly_sales
    FROM 
        rnd
    WHERE 
        DATEPART(YEAR, sale_date) = 2017
    GROUP BY 
        DATEPART(MONTH, sale_date)
),
sales_stats AS (
    SELECT 
        AVG(monthly_sales) AS average_monthly_sales,
        MAX(monthly_sales) AS max_monthly_sales,
        MIN(monthly_sales) AS min_monthly_sales
    FROM 
        monthly_sales
)
SELECT 
    average_monthly_sales AS projected_monthly_sales,
    max_monthly_sales AS safety_stock_level,
    average_monthly_sales * 2 AS reorder_point -- Assuming a lead time of 2 months
FROM 
    sales_stats;


-- Our maximum monthly sales last year were 20 cars
-- We should keep at least 20 cars as safety stock.
-- This ensures that even if you have a month with unusually high sales, you can meet the demand without running out of inventory.
-- Our average monthly sales are 10 cars, and the lead time to restock inventory is 2 months, Our reorder point would be 20 cars.
-- This means we should place a new order when our inventory level drops to 20 cars.

-- Unusual Patterns

-- Calculate average and standard deviation of monthly sales for 2017
WITH monthly_sales AS (
    SELECT 
        DATEPART(MONTH, sale_date) AS sale_month, 
        COUNT(*) AS monthly_sales
    FROM 
        rnd
    WHERE 
        DATEPART(YEAR, sale_date) = 2017
    GROUP BY 
        DATEPART(MONTH, sale_date)
),
sales_stats AS (
    SELECT 
        AVG(monthly_sales) AS avg_sales,
        STDEV(monthly_sales) AS std_dev_sales
    FROM 
        monthly_sales
)
SELECT 
    ms.sale_month,
    ms.monthly_sales,
    ss.avg_sales,
    ss.std_dev_sales,
    CASE 
        WHEN ms.monthly_sales > ss.avg_sales + 2 * ss.std_dev_sales THEN 'High Anomaly'
        WHEN ms.monthly_sales < ss.avg_sales - 2 * ss.std_dev_sales THEN 'Low Anomaly'
        ELSE 'Normal'
    END AS sales_anomaly
FROM 
    monthly_sales ms, sales_stats ss
ORDER BY 
    ms.sale_month;

-- We sold what would be considered a unusual amount of vehicles in the month of march. This could be explained by the fact that it is tax season
-- There are more buyers during this time of year as we are seeing similar results for the months of april and may (tax season)
