# 🍕 Pizza Sales Analysis Report

This report summarizes the results of SQL analysis performed on a pizza delivery business dataset.  
The queries analyze customer ordering habits, top-performing pizzas, category-level insights, and overall revenue trends.

---

## 1. Total Orders Placed
**Query:** Count all rows in the `orders` table.  
**Result:** **21,350 total orders** were placed.

---

## 2. Total Revenue Generated
Revenue was calculated by multiplying price × quantity for every order line.

**Total Revenue:  
💰 $817,860.05


---

## 3. Highest-Priced Pizza
The most expensive pizza was identified by joining `pizza_types` and `pizzas`.

**Result:**  
- **Pizza:** `The Greek Pizza`  
- **Price:** `$35.95`  


---

## 4. Most Common Pizza Size Ordered
Analyzed the number of order lines per size.

**Most Ordered Size:** **`Large`** with `18,526` orders

---

## 5. Top 5 Most Ordered Pizza Types
Ranked pizzas based on total quantity ordered.

| Rank | Pizza Type | Total Quantity |
|------|------------|----------------|
| 1 | "classic_dlx" | … |
| 2 | … | … |
| 3 | … | … |
| 4 | … | … |
| 5 | … | … |

---

## 6. Total Quantity Ordered by Category
Aggregate orders grouped by pizza category.

This reveals which categories are most popular among customers.

---

## 7. Order Distribution by Hour of Day
Using `DATE_PART('hour', order_time)`:

- Orders peak during **lunch (12–2 PM)** and **dinner (6–8 PM)** hours.
- Early morning hours show minimal activity.

---

## 8. Average Number of Pizzas Ordered Per Day
Total pizzas sold each day were averaged.

**Average pizzas/day:** **`X.xx`**

---

## 9. Top Revenue-Generating Pizza Types
Calculated revenue per pizza type and ranked descending.

---

## 10. Revenue Contribution by Category
Revenue for each category divided by total revenue:

| Category | % Contribution |
|----------|----------------|
| Classic | …% |
| Supreme | …% |
| Chicken | …% |
| Veggie | …% |

(*Insert results after running query*)

---

## 11. Cumulative Revenue Over Time
Window function used:

```sql
SUM(quantity * price) OVER (ORDER BY order_date)
