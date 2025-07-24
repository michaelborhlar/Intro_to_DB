import mysql.connector

def create_database():
    connection = None
    try:
        # Connect to MySQL server (not to a specific database)
        connection = mysql.connector.connect(
            host='localhost',
            user='your_username',        # Replace with your MySQL username
            password='your_password'     # Replace with your MySQL password
        )

        if connection.is_connected():
            cursor = connection.cursor()
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
            print("Database 'alx_book_store' created successfully!")
            cursor.close()

    except mysql.connector.Error as err:
        print("Error: Could not connect to the MySQL server.")
        print(f"MySQL Error: {err}")

    finally:
        if connection and connection.is_connected():
            connection.close()

if __name__ == "__main__":
    create_database()
