# AutomotiveSales

## About the Project

This project aims to analyze sales data for a vehicle dealership for the year 2017. The goal is to understand sales trends, identify top-selling makes and models, analyze profit margins, and optimize inventory management.

## Dataset Source
The dataset was collected from the dealership's records for the year 2017.

## Dataset Description
The dataset includes information about various vehicles sold by the dealership, including their make, model, color, purchase details, sale details, and profit margins. The dataset contains 20 columns and 97 rows.

## Data Columns

Column	Description	Data Type
Year	Year of the vehicle	int
Make	Make of the vehicle	object
Model	Model of the vehicle	object
Color	Color of the vehicle	object
Body_Style	Body style of the vehicle	object
OEM	Original Equipment Manufacturer	object
Mileage	Mileage of the vehicle	int
Purchase_Date	Date when the vehicle was purchased	object
Purchased_From	Source from where the vehicle was purchased	object
Floor_Plan	Financing plan for the vehicle	object
Vin_Number	Vehicle Identification Number	object
Total_Cost	Total cost of the vehicle	object
Repairs_Expenses	Expenses for repairs	object
Sale_Price	Sale price of the vehicle	object
TTL	Tax, Title, and License fee	int
Sale_Price_With_TTL	Sale price including TTL	int
Profit	Profit from the sale	int
Sale_Date	Date of sale	object
Time_On_Lot	Number of days the vehicle was on the lot	int
Percentage_Of_Return	Percentage of return on investment	object



## Analysis Goals

1. Sales Analysis: Calculate total sales, total profit, and the number of vehicles sold.
2. Product Analysis: Identify top-selling makes and models.
3. Profit Analysis: Determine the correlation between vehicle color and average profit.
4. Inventory Management: Analyze trends in the time vehicles spend on the lot.
5. Profit Margins: Calculate average profit margins per vehicle sold.



## Approach

1. Data Wrangling: Clean the data, handle missing values, and ensure data integrity.
2. Feature Engineering: Create new columns if needed to enhance analysis.
3. Exploratory Data Analysis (EDA): Answer key business questions using SQL queries.


## Key Business Questions

1. What was the total sales and profit for the dealership in 2017?
2. How many vehicles were sold in 2017?
3. What are the top-selling makes and models?
4. Is there a correlation between vehicle color and average profit?
5. Which body style tends to have the highest profit margins?
6. Are there any trends in the time vehicles spend on the lot before being sold?
7. What is the average profit margin per vehicle sold?

You can find the code for this project [HERE](https://github.com/Dilan-GitHub/AutomotiveSales/blob/main/RND2017.sql)
