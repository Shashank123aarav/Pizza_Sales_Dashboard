-- to fetch database - 

USE pizza_db;



-- total revenue/sales

select sum(total_price) as total_sales
from pizza_sales; 

-- avg sales

select sum(total_price) / count (distinct order_id) as avg_sales
from pizza_sales; 

-- total pizza sold

select sum(quantity) as total_quantity_sold
from pizza_sales; 

-- total orders placed

select count(distinct order_id) as total_orders
from pizza_sales; 

-- avg pizza per order

select cast ( cast (sum(quantity) as decimal(10,2))  / 
cast ( count(distinct order_id) as decimal(10,2))  as decimal(10,2))
from pizza_sales; 

-- daily trends for orders

select  DATENAME(DW,order_date) as order_day, count(distinct order_id) as total_orders
from pizza_sales
group by DATENAME(DW,order_date) 

-- monthly trends

select  DATENAME(MONTH,order_date) as Month_Name, count(distinct order_id) as total_orders
from pizza_sales
group by DATENAME(MONTH,order_date) 
order by total_orders desc 

-- percentage of sales by pizza category

select pizza_category, sum(total_price) as total_sales ,sum(total_price) * 100  /  
(select sum(total_price) from pizza_sales where month(order_date) = 1) as PCT
from pizza_sales 
where month(order_date) = 1
group by pizza_category 

-- percentage of sales by pizza size

select pizza_size, cast (sum(total_price) as decimal(10,2)) as total_sales ,cast ( sum(total_price) * 100  /  
(select sum(total_price) from pizza_sales )  as decimal(10,2)) as PCT
from pizza_sales 
group by pizza_size
order by PCT desc 

-- max ( top 5 )

select top 5 pizza_name, cast ( sum(total_price) as decimal (10,2)) as total_rev
from pizza_sales
group by pizza_name
order by total_rev desc 

-- min ( bottom 5)

select top 5 pizza_name, cast ( sum(total_price) as decimal (10,2)) as total_rev
from pizza_sales
group by pizza_name
order by total_rev asc 

-- max ( top 5) by quantity

select top 5 pizza_name, cast ( sum(quantity) as decimal (10,2)) as total_quantity
from pizza_sales
group by pizza_name
order by total_quantity desc 

-- min ( bottom 5) by quantity

select top 5 pizza_name, cast ( sum(quantity) as decimal (10,2)) as total_quantity
from pizza_sales
group by pizza_name
order by total_quantity asc 

-- max ( top 5) by orders

select top 5 pizza_name, count(distinct order_id) as total_orders
from pizza_sales
group by pizza_name
order by total_orders desc 

-- min ( bottom 5) by orders

select top 5 pizza_name, count(distinct order_id) as total_orders
from pizza_sales
group by pizza_name
order by total_orders asc 


















