CREATE OR REPLACE PROCEDURE apply_regional_discount(
    region_name VARCHAR(20),
    discount_rate NUMERIC
)
LANGUAGE plpgsql
AS $procedure$
BEGIN
    UPDATE orders o
    SET sales = sales * (1 - discount_rate)
    FROM customers c
    WHERE o.customer_id = c.customer_id
      AND c.region = region_name;

    RAISE NOTICE 'Discount % applied to region %',
        discount_rate,
        region_name;
END;
$procedure$;

CALL apply_regional_discount('West', 0.10);