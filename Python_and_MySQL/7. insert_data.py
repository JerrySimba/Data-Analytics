data_orders = """
INSERT INTO orders (customer_id, product_name, quantity, price, order_date) VALUES
        (101, 'Laptop', 1, 1000.00, '2023-01-01'),
        (102, 'Smartphone', 2, 500.00, '2023-01-02'),
        (103, 'Headphones', 1, 150.00, '2023-01-03'),
        (104, 'Monitor', 1, 200.00, '2023-01-04'),
        (105,'Keyboard', 3, 30.00, '2023-01-05');
        """
connection = create_db_connection("localhost", "root", pw, db)
execute_query(connection, data_orders)
