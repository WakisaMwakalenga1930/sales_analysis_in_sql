--Exploring the dataset to check the field contained in the table
SELECT * FROM sales_analysis
LIMIT 10;

--data cleaning

--checking for null values
SELECT * FROM sales_analysis 
WHERE 
	transactions_id IS NULL OR
	sale_date IS NULL OR 
	sale_time IS NULL OR
	customer_id IS NULL OR
	gender IS NULL OR 
	age IS NULL OR 
	category IS NULL OR
	quantiy IS NULL OR
	price_per_unit IS NULL OR 
	cogs IS NULL OR
	total_sale IS NULL;
	
--deleting null values

DELETE FROM sales_analysis
WHERE 
	transactions_id IS NULL OR
	sale_date IS NULL OR 
	sale_time IS NULL OR
	customer_id IS NULL OR
	gender IS NULL OR 
	age IS NULL OR 
	category IS NULL OR
	quantiy IS NULL OR
	price_per_unit IS NULL OR 
	cogs IS NULL OR
	total_sale IS NULL;
	



--count number of rows
SELECT COUNT(*) FROM sales_analysis;

--data exploration 

--how many sales do we have
SELECT COUNT(transactions_id) AS number_of_sales
FROM sales_analysis;

--how many categories we have 
SELECT COUNT()

--SEE how many customers we have
SELECT COUNT( DISTINCT (customer_id)) AS number_of_customers
FROM sales_analysis;

--How many categories do we have
SELECT COUNT(DISTINCT (category)) AS Number_of_categories
FROM sales_analysis ;

--main data analysis and business questions and answers 

--list all sales which were made on 2022-11-05
SELECT * FROM sales_analysis
WHERE sale_date = '2022-11-05';

--list all sales where the category is clothing, and the quantity sold
--is more than or equal to 4 in the month of november 2022
SELECT *
FROM sales_analysis
WHERE 
	category = 'Clothing' AND
	quantiy >= 4 AND 
	TO_CHAR(sale_date, 'YYYY-MM') = '2022-11';

--calculate total sales for each category
SELECT category, SUM(total_sale) AS total_sales_for_each_category
FROM sales_analysis
GROUP BY category;

--find the average age of customers who purchased from the beauty category
SELECT ROUND(AVG(age),1) AS average_age_of_beauty_customers
FROM sales_analysis
WHERE category = 'Beauty';

--list all sales where the total sale is greater than 100

SELECT *
FROM sales_analysis 
WHERE
	total_sale > 100;

--find the number of transactions made by each gender in each category
SELECT gender, category, COUNT(transactions_id) AS number_of_transactions
FROM sales_analysis
GROUP BY gender, category
ORDER BY 1;

--calculate the average sale for each month find out the best selling month for each year
SELECT TO_CHAR(sale_date, 'MM') AS Months, AVG(COUNT(transactions_id)) AS average_sale_for_each_month, 
TO_CHAR(sale_date, 'YYYY') AS years, MAX(total_price) AS best_selling_month
FROM sales_analysis 
GROUP BY years, best_selling_month;
--i failed the above query i guess i still need to learn some other few concepts 

--find the top  5 customers based on the total sale 
SELECT customer_id, SUM(total_sale) AS customers_purchases
FROM sales_analysis 
GROUP BY customer_id
ORDER BY 2 DESC
LIMIT 5;

--FIND THE NUMBER of unique customers who purchased items from each category
SELECT category, COUNT(DISTINCT(customer_id)) AS unique_customers_per_category
FROM sales_analysis
GROUP BY category;

--create a shift and number of oerder per shift 
--i didnt manage this one again i need to learn some more concepts

--end of project

