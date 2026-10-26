WITH RECURSIVE date_range AS (
    SELECT 
        MIN(sale_date) AS current_date,
        MAX(sale_date) AS max_date
    FROM 
        flourmills_sales

    UNION ALL

    SELECT 
        (current_date + INTERVAL '1 day')::date,
        max_date
    FROM 
        date_range
    WHERE 
        current_date < max_date
)
SELECT 
    current_date AS sale_date
FROM 
    date_range
ORDER BY 
    sale_date ASC;