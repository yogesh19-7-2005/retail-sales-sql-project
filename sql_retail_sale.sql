create database Retail_sale;
use Retail_sale;
create table retail_sales (
transactions_id int,
	sale_date date,
	sale_time time,
	customer_id int,
	gender varchar(10),
	age int,
	category varchar(50),
	quantiy int,
	price_per_unit float,
	cogs float,
	total_sale float );
    select*from retail_sales;
    select count(*) as total_rows from retail_sales;
    select * from retail_sales
    WHERE 
         transactions_id is Null
         OR
         sale_date is null
         OR
         sale_time is null
         OR
         cogs is null
         or
         gender is null
         or
         age is null
         or
         category is null
         or
         quantiy is null
         or
         price_per_unit is null
         or 
         total_sale is null;
-- How many sales we have ?
select count(*) as total_sales from retail_sales;
         
-- How many unique customers  we have ?
select count(distinct customer_id) as total_customers from retail_sales;
            
-- How many categoriees we have ?
select distinct category as categories from retail_sales;

-- Data Analysis and buisiness key problem 
-- My Analysis & Findings
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)


 -- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05'
  select * from retail_sales
  where  sale_date = '2022-11-05';
  
  -- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
SELECT *
FROM retail_sales
WHERE category = 'Clothing'
  AND quantiy >= 4
  AND sale_date BETWEEN '2022-11-01' AND '2022-11-30';

-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
select 
     category,
     sum(total_sale) as total_sales
     from retail_sales
     group by category;
     
-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
select 
     round(avg(age),2)
     from retail_sales
     where  category = 'Beauty';
         
-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
select 
    *
   from retail_sales
   where total_sale > '1000';
   
   -- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
select 
     category,gender,
    count(*) as total_trans
from retail_sales
     group by category,
     gender;
      
-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
SELECT 
    YEAR(sale_date) AS year,
    MONTH(sale_date) AS month,
   round( AVG(total_sale),2) AS avg_monthly_sale
FROM retail_sales
GROUP BY YEAR(sale_date), MONTH(sale_date)
order by 1 , 3 desc;


-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
select 
  customer_id,
  sum(total_sale) as total_sales
  from retail_sales
  group by customer_id 
  order by total_sales desc
  limit  5 ;
  
  -- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
SELECT 
    category,
    COUNT(DISTINCT customer_id) AS unique_customers
FROM retail_sales
GROUP BY category;

-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)
SELECT
  CASE
    WHEN HOUR(sale_time) <= 12 THEN 'Morning'
    WHEN HOUR(sale_time) BETWEEN 13 AND 17 THEN 'Afternoon'
    ELSE 'Evening'
  END AS shift,
  COUNT(transactions_id) AS number_of_orders
FROM retail_sales
GROUP BY shift;


            
            
            
         
         
         
         
    