import mysql.connector

def get_db_connection():
    connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="mysql",
        database="movie_manager"
    )
    return connection

def execute_query(query, params=None):
    connection = get_db_connection()
    cursor = connection.cursor()
    cursor.execute(query, params)
    connection.commit()
    cursor.close()
    connection.close()

def fetch_query(query, params=None):
    connection = get_db_connection()
    cursor = connection.cursor(dictionary=True)
    cursor.execute(query, params)
    results = cursor.fetchall()
    cursor.close()
    connection.close()
    return results