-- How much did the dealership do in sales in 2017? This will show us figures for the value of how much the dealer did in sales in 2017.

-- What is the total profit for total sales of the dealership? This will give us details of how much profit the dealership made in one year.

--How many vehicles were sold in 2017? This will give us a number of how many vehicles the dealership sold that year

SELECT 
SUM(Sale_Price) AS total_sales,
SUM(Profit) AS total_profit,
COUNT(*) AS total_vehicles_sold
FROM `rnddataset.RND.RND2017` 

--What are the top-selling makes and models? This can help identify popular brands and models, informing inventory decisions

SELECT make, COUNT(*) AS Total_sales
FROM `rnddataset.RND.RND2017` 
GROUP BY make
ORDER BY Total_sales DESC


 -- Is there a correlation between vehicle color and average profit? Understanding color preferences can influence inventory selection and pricing strategies

 SELECT Color, AVG(Profit) AS average_sales_profit
 FROM `rnddataset.RND.RND2017` 
 GROUP BY Color
 ORDER BY average_sales_profit DESC;

 -- Which body style tends to have the highest profit margins? This could inform decision on which types of vehicles to prioritize in inventory

 SELECT body_style, AVG(Profit) AS average_profit
 FROM `rnddataset.RND.RND2017` 
 GROUP BY body_style
 ORDER BY average_profit DESC;


-- Are there any trends in the time vehicles spend on the lot before being sold? Understanding how long it takes to sell different types of vehicles can help optimize inventory turnover

SELECT MAKE, MODEL, AVG(TIME_ON_LOT) AS AVERAGE_TIME_ON_LOT
FROM `rnddataset.RND.RND2017` 
GROUP BY make, model
ORDER BY average_time_on_lot DESC;


 -- What is the average profit margin per vehicle sold? This metric provides an overall view of the dealership's profitability

 SELECT make, AVG(Profit) AS average_profit_margin_per_make
 FROM `rnddataset.RND.RND2017` 
 GROUP BY make
 ORDER BY average_profit_margin_per_make DESC;
