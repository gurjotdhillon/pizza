# PIZZA SALES

The project analyzes pizza sales and tries to identify top trends, and gives insight into daily and monthly sales, top earners in terms of size, category, and also analyzes the sales based on quantity.


## About Data

The data set was obtained from Kaggle and it contains 4 tables - Orders_details, Orders, Pizzas, and Pizzas_types. 
 1.  orders: it contains 3 columns: 
   - order_id, 
   -  order_date, 
   -  order_time
 2.  order_details: it contains 4 columns: 
  -  order_details_id	
 - order_id	
 - pizza_id	
 -  quantity
 3. pizzas_types: it contains 4 columns: 
   - pizza_type_id,	
   - name,	
   - category,	
   - ingredients,
 4.  pizzas: it contains 
   - pizza_id	
   - pizza_type_id	
   - size	
   - price




## Objectives:
Our goal is to answer the following questions regarding pizza sales:
- Retrieve the total number of orders placed.

- Calculate the total revenue generated from pizza sales.

- Identify the highest-priced pizza.

- Identify the most common pizza size ordered.

- List the top 5 most ordered pizza types along with their quantities.

- Join the necessary tables to find the total quantity of each pizza category ordered.

- Determine the distribution of orders by hour of the day.

- Join relevant tables to find the category-wise distribution of pizzas.

- Group the orders by date and calculate the average number of daily pizzas.

- Determine the top 3 most ordered pizza types based on revenue.

- Calculate the percentage contribution of each pizza type to total revenue.

- Analyze the cumulative revenue generated over time.

- Determine the top 3 most ordered pizza types based on revenue for each pizza category.
## Methodology
I have analyzed the project using Postgres SQL and used the following SQL tools:
 - Joins- inner and Outer
 - Aggregations - SUM, COUNT, Average, Date
 - Window Functions - Row number, Sum(sum)
 - Sub Queries

 
 
## Dependencies
- PgAdmin
