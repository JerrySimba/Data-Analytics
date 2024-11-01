def create_server_connection(host_name, user_name, user_password):
    connection = None
    try:
      connection = mysql.connector.connect(
          host = host_name,
          user = user_name,
          passwd = user_password
      )
      print("Mysql connection successful")
    except Error as err:
      print(f"Error: '{err}'")
    return connection
#Mysql terminal password
pw ="(password)"
#Database name
db = "python_and_mysql"
connection = create_server_connection("localhost", "root", pw)
