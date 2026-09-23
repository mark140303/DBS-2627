SELECT p.category,
       ROUND(AVG(o.discount), 2) AS priemerna_zlava
FROM orders o
INNER JOIN products p ON o.product_id = p.product_id
GROUP BY p.category
ORDER BY priemerna_zlava DESC; 