-- Corrected query for Scenario D1
-- Evaluates regional performance using actual schema and completed orders only
SELECT 
    r.region_name,
    SUM(o.amount) AS sales
FROM orders o
JOIN reps r ON o.rep_id = r.rep_id
WHERE o.status = 'completed'
GROUP BY r.region_name
HAVING SUM(o.amount) > 80000
ORDER BY sales DESC;
