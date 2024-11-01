if connection:  # Check if connection was successful
    q2 = "SELECT product_name, price FROM orders"  
    results = read_query(connection, q2)
    
    if results:  # Check if results were retrieved
        for result in results:
            # Convert Decimal to float
            product_name, price = result
            print(f"{product_name}: {float(price):.2f}")  # Format to 2 decimal places
    else:
        print("No results returned from the query.")
else:
    print("Failed to connect to the database.")
