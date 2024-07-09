-- Retrieve the total number of orders placed.
SELECT Count(*)
FROM orders
-- 21,350 orders were placed in total

--  -- Calculate the total revenue generated from pizza sales.
SELECT ROUND(CAST(sum(ord_total) AS NUMERIC), 2)
FROM (
	SELECT order_details.order_id
		,SUM(order_details.quantity * pizzas.price) AS ord_total
	FROM order_details
	JOIN orders ON orders.order_id = order_details.order_id
	JOIN pizzas ON order_details.pizza_id = pizzas.pizza_id
	GROUP BY 1
	ORDER BY 1
	) t1

-- Identify the highest-priced pizza.
SELECT name
	,price
FROM pizza_types
JOIN pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
ORDER BY 2 DESC Limit 1

-- Identify the most common pizza size ordered
SELECT pizzas.size
	,COUNT(o.order_details_id)
FROM order_details o
JOIN pizzas ON o.pizza_id = pizzas.pizza_id
GROUP BY 1
ORDER BY 2 DESC LIMIT 1

-- List the top 5 most ordered pizza types along with their quantities
SELECT pt.pizza_type_id
	,name
	,SUM(o.quantity)
FROM order_details o
JOIN pizzas p ON o.pizza_id = p.pizza_id
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY 1
	,2
ORDER BY 3 DESC Limit 5

-- Join the necessary tables to find the total quantity of each pizza category ordered.
SELECT category
	,SUM(o.quantity)
FROM order_details o
JOIN pizzas p ON o.pizza_id = p.pizza_id
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY 1
ORDER BY 2 DESC

-- Determine the distribution of orders by hour of the day.
SELECT DATE_PART('hour', o.order_time)
	,COUNT(*)
FROM orders o
GROUP BY 1
ORDER BY 1

-- Join relevant tables to find the category-wise distribution of pizzas.
SELECT category
	,COUNT(name)
FROM pizza_types
GROUP BY 1

-- Group the orders by date and calculate the average number of pizzas ordered per day.
SELECT AVG(piz_qty)
FROM (
	SELECT o.order_date
		,SUM(od.quantity) AS piz_qty
	FROM orders o
	JOIN order_details od ON o.order_id = od.order_id
	GROUP BY 1
	ORDER BY 1
	) t1

-- Determine the top 3 most ordered pizza types based on revenue.
SELECT pizza_type_id
	,SUm(rev_pizza) AS tot_rev
FROM (
	SELECT order_details_id
		,order_id
		,p.pizza_type_id
		,od.pizza_id
		,quantity * price rev_pizza
	FROM order_details od
	JOIN pizzas p ON od.pizza_id = p.pizza_id
	) t1
GROUP BY 1
ORDER BY 2 DESC

-- Calculate the percentage contribution of each pizza type to total revenue.
SELECT category
	,ROUND(CAST(sum(quantity * price) / (
				SELECT ROUND(CAST(sum(quantity * price) AS NUMERIC), 2)
				FROM order_details
				JOIN pizzas ON order_details.pizza_id = pizzas.pizza_id
				) AS NUMERIC), 2)
FROM order_details
JOIN pizzas ON order_details.pizza_id = pizzas.pizza_id
JOIN pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
GROUP BY 1
ORDER BY 2 DESC

--Analyze the cumulative revenue generated over time.
SELECT order_date
	,SUM(SUM(quantity * price)) OVER (
		ORDER BY order_date
		)
FROM orders
JOIN order_details ON orders.order_id = order_details.order_id
JOIN pizzas ON order_details.pizza_id = pizzas.pizza_id
GROUP BY 1
ORDER BY 1

-- Determine the top 3 most ordered pizza types based on revenue for each pizza category.
SELECT category
	,name
FROM (
	SELECT pt.category
		,pt.name
		,sum(od.quantity * p.price) AS tot_rev
		,Row_number() OVER (
			PARTITION BY pt.category ORDER BY sum(od.quantity * p.price) DESC
			) AS rn
	FROM order_details od
	JOIN pizzas p ON p.pizza_id = od.pizza_id
	JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
	GROUP BY 1
		,2
	ORDER BY 1
		,4
	) t1
WHERE rn < 4
ORDER BY 1
	,rn