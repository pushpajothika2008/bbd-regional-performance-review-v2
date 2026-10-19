-- Region and month report for completed orders
-- INNER JOIN ensures only actual buyers are counted; COUNT(DISTINCT) avoids duplicates per month.
SELECT 
    c.region,
    o.order_month,
    COUNT(o.order_id) AS number_of_orders,
    COUNT(DISTINCT c.customer_id) AS number_of_customers,
    SUM(o.amount) AS total_revenue,
    AVG(o.amount) AS average_revenue
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.status = 'completed'
GROUP BY c.region, o.order_month
ORDER BY c.region ASC, o.order_month ASC;
