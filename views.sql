-- Create a view to join data from both `sql_intro.products` and `classic_intro.products`
CREATE VIEW combined_products AS
SELECT 
    s.productcode AS sql_productcode,
    s.productname AS sql_productname,
    c.productcode AS classic_productcode,
    c.productname AS classic_productname
FROM 
    sql_intro.products AS s
INNER JOIN 
    classic_intro.products AS c
ON 
    s.productcode = c.productcode;

SELECT * FROM combined_products;
