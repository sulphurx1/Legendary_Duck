import psycopg2 as psy
from info import *

connection = psy.connect(host=HOSTNAME, user=USERNAME, password=PASSWORD, dbname=DATABASE)

cursor = connection.cursor()

cursor.execute("SELECT title, description, image_url FROM news")

results = cursor.fetchall()

for row in results:
    cursor.execute('''INSERT INTO name_of_app_news (title, description, image_url)
                   VALUES(%s, %s, %s)''',  (row[0], row[1], row[2]))
    
connection.commit()

cursor.close()
connection.close()