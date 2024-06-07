import csv
import mysql.connector


myhost = "localhost"
myuser = "root"
mypassword = "mysql"
mydatabase = "movie_manager"

csv_file = r"Movie_manager/DataScrapeMovies/modified_films_data.csv"

mydb = mysql.connector.connect(
    host=myhost, user=myuser, password=mypassword, database=mydatabase
)
mycursor = mydb.cursor()

with open(csv_file, 'r', encoding='utf-8') as csvfile:
    csv_reader = csv.reader(csvfile)
    next(csv_reader) 

    sql = "INSERT INTO movies (title, director, release_year, genre, description) VALUES (%s, %s, %s, %s ,%s)"

    for row in csv_reader:
        mycursor.execute(sql, row)

mydb.commit()

mycursor.close()
mydb.close()

print("Done a")

