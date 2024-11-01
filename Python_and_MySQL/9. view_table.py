if connection:  # Check if connection was successful
    q2 = "SELECT  FROM orders"  # Example query
    results = read_query(connection, q1)
    
    if results:  # Check if results were retrieved
        for result in results:
            print(result)
    else:
        print("No results returned from the query.")
else:
    print("Failed to connect to the database.")
