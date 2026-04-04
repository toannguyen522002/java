create database bai3_ss5;
SELECT
    c.customer_id,
    c.customer_name,
    SUM(o.total_price) AS total_revenue,
    COUNT(o.order_id) AS order_count
FROM customers c
         JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING SUM(o.total_price) > 2000;
select * from customers;