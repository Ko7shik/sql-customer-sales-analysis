-- Total revenue
SELECT
    SUM(o.quantity * p.price) AS total_revenue
FROM orders o
JOIN products p ON o.product_id = p.product_id;

-- Revenue by customer
SELECT
    c.name,
    SUM(o.quantity * p.price) AS revenue
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON o.product_id = p.product_id
GROUP BY c.name
ORDER BY revenue DESC;

-- Revenue by region
SELECT
    c.region,
    SUM(o.quantity * p.price) AS regional_revenue
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON o.product_id = p.product_id
GROUP BY c.region
ORDER BY regional_revenue DESC;

-- Top products by revenue
SELECT
    p.product_name,
    SUM(o.quantity * p.price) AS product_revenue
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY product_revenue DESC;
