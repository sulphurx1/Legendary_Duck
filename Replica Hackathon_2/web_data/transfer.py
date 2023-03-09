import psycopg2 as psy
from info import *

connection = psy.connect(host=HOSTNAME, user=USERNAME, password=PASSWORD, dbname=DATABASE)

cursor = connection.cursor()

cursor.execute("INSERT INTO name_of_app_news SELECT title, description, image_url FROM news")
    
connection.commit()

cursor.close()
connection.close()