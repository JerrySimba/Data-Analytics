create_orders_table = """
    CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    product_name VARCHAR(255) NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    order_date DATE NOT NULL
);
"""
connection = create_db_connection("localhost", "root", pw, db)
execute_query(connection, create_orders_table)
