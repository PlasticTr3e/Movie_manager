import mysql.connector

def get_db_connection():
    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="mysql",
        database="movie_manager"
    )

def fetch_query(query, params=None):
    try:
        connection = get_db_connection()
        cursor = connection.cursor(dictionary=True)
        cursor.execute(query, params)
        results = cursor.fetchall()
        cursor.close()
        connection.close()
        return results
    except Exception as e:
        print(f"Error fetching query: {e}")
        return None

def execute_query(query, params=None):
    try:
        connection = get_db_connection()
        cursor = connection.cursor()
        cursor.execute(query, params)
        connection.commit()
        cursor.close()
        connection.close()
    except Exception as e:
        print(f"Error executing query: {e}")
