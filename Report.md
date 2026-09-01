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
| 1 | classic_dlx | 2453|
| 2 | bbq_ckn | 2432 |
| 3 | hawaiian | 2422 |
| 4 | pepperoni | 2418 |
| 5 | thai_ckn | 2371 |

---

## 6. Total Quantity Ordered by Category
Aggregate orders grouped by pizza category.
Classic	14,888
Supreme	11,987
Veggie	11,649
Chicken	11,050

This reveals which categories are most popular among customers.

---

## 7. Order Distribution by Hour of Day
Using `DATE_PART('hour', order_time)`:

- Orders peak during **lunch (12–2 PM)** and **dinner (6–8 PM)** hours.
- Early morning hours show minimal activity.

---

## 8. Average Number of Pizzas Ordered Per Day
Average pizzas/day: 138.47

**Average pizzas/day:** **`X.xx`**

---

## 9. Top Revenue-Generating Pizza Types
Calculated revenue per pizza type and ranked descending.
1	The Thai Chicken Pizza	$43,434.25
2	The Barbecue Chicken Pizza	$42,768.00
3	The California Chicken Pizza	$41,409.50
4	The Classic Deluxe Pizza	$38,180.50
5	The Spicy Italian Pizza	$34,831.25

---

## 10. Revenue Contribution by Category
Revenue for each category divided by total revenue:

Category Revenue	     % Contribution
Classic	 $220,053.10	 26.91%
Supreme	 $208,197.00	 25.46%
Chicken	 $195,919.50	 23.96%
Veggie	 193,690.45	   23.68%
---

## 11. Cumulative Revenue Over Time
Revenue was steady across 2015, with monthly totals ranging from roughly $64,000 to $72,500 and no strong seasonal spike. First-half revenue ($413,719.75) ran about 2% ahead of second-half revenue ($404,140.30) — essentially flat growth over the year rather than a sharp upward trend.

---

## 12. Top 3 Pizza Types by Revenue, Per Category

Category	#1	#2	#3
Chicken: 1. Thai Chicken ($43,434.25)	  2. Barbecue Chicken ($42,768.00)	  3. California Chicken ($41,409.50)
Classic: 1. Classic Deluxe ($38,180.50)	2. Hawaiian ($32,273.25)          	3. Pepperoni ($30,161.75)
Supreme: 1. Spicy Italian ($34,831.25)	2. Italian Supreme ($33,476.75)	    3. Sicilian ($30,940.50)
Veggie:	 1. Four Cheese ($32,265.70)	  2. Mexicana ($26,780.75)	          3. Five Cheese ($26,066.50)

```sql
SUM(quantity * price) OVER (ORDER BY order_date)
