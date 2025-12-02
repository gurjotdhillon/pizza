# 🍕 Pizza Sales SQL Analytics Project

This project analyzes a pizza delivery company's sales data using advanced SQL techniques.  
The dataset includes order information, pizza types, pizza sizes, categories, and prices.

Through a series of analytical SQL queries, this project answers key business questions related to:

- Total orders and revenue
- Best-selling pizzas
- Most popular pizza sizes and categories
- Revenue contribution by pizza type
- Order patterns by time of day
- Category-wise distribution and sales performance
- Cumulative revenue trends
- Top pizza types within each category

---

## 📁 Database Tables Used

The dataset includes the following tables:

| Table | Description |
|-------|-------------|
| **orders** | Order ID, order date, and order time |
| **order_details** | Line-level quantity and pizza ordered per order |
| **pizzas** | Pizza ID, size, price, and pizza type ID |
| **pizza_types** | Pizza name, category, and description |

---

## 📊 Key Questions Answered

This project uses SQL to answer:

1. **How many total orders were placed?**  
2. **How much total revenue was generated?**  
3. **Which pizza is the most expensive?**  
4. **What is the most commonly ordered pizza size?**  
5. **What are the top 5 most-ordered pizza types?**  
6. **Which pizza categories receive the most orders?**  
7. **How are orders distributed by hour of the day?**  
8. **What is the daily average number of pizzas sold?**  
9. **Which pizza types generate the most revenue?**  
10. **What percent of revenue does each category contribute?**  
11. **How does cumulative revenue grow over time?**  
12. **Top 3 revenue-generating pizza types within each category**

---

## 🧠 SQL Skills Demonstrated

This project highlights:

- Aggregations (SUM, COUNT, AVG)
- Subqueries
- CTEs
- Window Functions (`ROW_NUMBER`, cumulative `SUM OVER`)
- Date/Time functions
- Multi-table JOINs
- Ranking & revenue analysis

---

## 📄 Project Files

| File | Description |
|------|-------------|
| **pizza_sales_queries.sql** | Full SQL code used for all analysis |
| **Report.md** | Clean, written report summarizing findings |

---

## 🚀 How to Use

1. Import the dataset into PostgreSQL / MySQL.
2. Run the SQL queries in `pizza_sales_queries.sql`.
3. Review insights in the report.

---

## 📝 Author

Gurjot Dhillon 
SQL | Data Analytics | Business Intelligence
