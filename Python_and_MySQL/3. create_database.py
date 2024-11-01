def create_database(connection, query):
    cursor = connection.cursor()
    try:
        cursor.execute(query)
        print("Database created successfully")
    except Error as err:
        print(f"Error: '{err}'")
create_database_query = "Create database python_and_mysql"
create_database(connection, create_database_query)
