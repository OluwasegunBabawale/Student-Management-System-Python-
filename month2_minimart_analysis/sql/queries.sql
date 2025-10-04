-- SQL queries for retrieving insights
--- Basic Queries

--- Use SELECT to retrieve all customers or all products.
SELECT * FROM products;


--- Use WHERE to filter products by category (e.g., "Drinks").
SELECT * FROM products 
WHERE category = 'Drinks';


--- Use ORDER BY to list recent orders by date.
SELECT * FROM orders
ORDER BY order_date DESC;



--- Aggregation

--- Use COUNT() to find the number of total orders.

SELECT COUNT(*) AS total_orders FROM orders;


--- Use SUM() to calculate revenue per product (price × quantity).
SELECT p.product_name, SUM(p.price * o.quantity) AS total_revenue
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.product_name
Order by total_revenue Desc;



--- Use AVG() to find the average product price.

SELECT ROUND(AVG(price),2) AS average_price FROM products;




--- Joins

-- Use INNER JOIN to get detailed order information (with customer and product details).

SELECT * FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN products p ON o.product_id = p.product_id
ORDER BY o.order_date DESC;

-- Use LEFT JOIN to list all customers and include their orders (if any).

SELECT * FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
LEFT JOIN products p ON o.product_id = p.product_id
ORDER BY c.customer_id;

-- Use LEFT JOIN to show products even if they haven’t been ordered.

SELECT * FROM products p
LEFT JOIN orders o ON p.product_id = o.product_id
LEFT JOIN customers c ON o.customer_id = c.customer_id
ORDER BY p.product_id;


