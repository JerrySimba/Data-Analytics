-- get the first value of sales_amount for each emp_id partition based on the order of sales_amount
SELECT 
    emp_id,
    emp_name,
    sales_amount,
    FIRST_VALUE(sales_amount) OVER (PARTITION BY emp_id ORDER BY sales_amount DESC) AS highest_sales
FROM 
    sales;
