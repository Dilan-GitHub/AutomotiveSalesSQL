# AutomotiveSales

## About the Project

This project analyzes a dataset of car sales, focusing on various aspects such as purchase and sale details, costs, and profits. The dataset includes information on different car makes, models, body types, and more. It also utilizes SQL queries to derive insights and trends from the data.

## Dataset Source
The dataset was collected from the dealership's records for the year 2017.

## Dataset Description
The dataset includes information about various vehicles sold by the dealership, including their make, model, color, purchase details, sale details, and profit margins. The dataset contains 20 columns and 97 rows.

## Data Columns

| Column                  | Description                             | Data Type      |
| :---------------------- | :-------------------------------------- | :------------- |
| Year            | Year of the vehicle             | int   |
| Make                  | Make of the vehicle         | object    |
| Model                    | Model of the vehicle              | object    |
| Color           | Color of the vehicle               | object    |
| Body                  | body style of the vehicle  | object  |
| OEM            | Original Equipment Manufacturerer       | object   |
| Mileage              | Mileage of the vehicle              | int |
| Purchase_date                | Date when the vehicle was purchased         | object            |
| Purchased_from                 | Sources from where the vehicle was purchased      | object     |
| Floorplan                   | Financing plan for the vehicle        | object  |
| Vin_number                    | vehicle identification number | object            |
| Total_cost                    | Total cost of the vehicle | object       |
| Expenses                 | Expenses for repairs                  | object  |
| Sale_Price                    | Sale price of the vehicle                    | object  |
| TTL | Tax, Title, and License fee                | int   |
|Total_price           | Sale price including TTL                           | int |
| Profit                  | Profit from the sale                                  | int    |
| Sale_date | Date of sale               | object   |
| Time_on_lot            | Number of days the vehicle was on the lot                           | int |


## Analysis Goals

1. Evaluate Sales Performance:
Determine the total number of cars sold.
Calculate the total revenue generated from sales.
2. Identify Sales Trends:
Analyze monthly and quarterly sales trends.
Recognize seasonal patterns in sales.
3. Assess Product Performance:
Identify the best-selling and lowest-selling car makes and models.
Evaluate sales by body style.
4. Analyze Financial Health:
Calculate profit margins for different car makes and models.
Determine overall profitability.
5. Optimize Inventory Management:
Assess inventory turnover rates for makes and models.
Develop an inventory strategy based on sales trends.
6. Evaluate Marketing Effectiveness:
Determine which marketing campaigns or channels generated the most sales.
Compare sales channels in terms of total sales and profitability.
7. Forecast Future Sales:
Project sales for the coming year based on historical data.
Identify inventory needs and reorder points.
8. Identify Unusual Sales Patterns:
Detect anomalies in sales data.
Understand the reasons behind unusual sales patterns.



## Approach

1. Data Aggregation:
Aggregate sales data to measure total sales and revenue.
Identify trends on a monthly and quarterly basis.
2. Segmentation Analysis:
Analyze sales by car make, model, and body style.
Identify best and worst selling categories.
3. Financial Analysis:
Calculate profit margins for different car makes and models.
4. Inventory Management:
Assess inventory turnover rates.
Forecast sales to inform inventory strategy.
5. Marketing Analysis:
Evaluate the performance of different sales channels and marketing campaigns.
6. Unusual Patterns Detection:
Identify any anomalies in sales patterns.
7. Sales Forecasting:
Calculate average, maximum, and minimum monthly sales to project future sales.
Develop inventory strategy based on projected sales.


## Key Business Questions

1. Total Sales and Revenue:
What is the total number of cars sold?
What is the total revenue generated from sales?
2. Sales Trends:
How do sales trends vary monthly and quarterly?
Are there seasonal patterns in sales?
3. Best and Worst Selling Models:
Which car makes and models are the best sellers?
Which car makes and models are the lowest sellers?
4. Financial Performance:
What are the profit margins for each car make and model?
5. Inventory Efficiency:
What is the inventory turnover rate for different makes and models?
What should be the inventory strategy for the next year based on past sales trends?
6. Marketing Effectiveness:
Which marketing campaigns or channels generated the most sales?
How do different sales channels compare in terms of total sales and profitability?
7. Sales Forecasting:
What are the projected sales for the coming year?
8. Unusual Sales Patterns:
Are there any unusual patterns or anomalies in sales data?
What could explain these anomalies?

You can find the code for this project [HERE](https://github.com/Dilan-GitHub/AutomotiveSales/blob/main/Automotivesales.sql)
