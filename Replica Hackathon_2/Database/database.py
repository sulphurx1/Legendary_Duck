import psycopg2 as psy
from info import *
from data_collection import *

# Establish a connection to the database
connection = psy.connect(host=HOSTNAME, user = USERNAME, password = PASSWORD, dbname = DATABASE)

# Create a cursor object
cursor = connection.cursor()

# Define the SQL query to create the table
create_table_query = '''CREATE TABLE news (
                        id SERIAL PRIMARY KEY,
                        title TEXT,
                        creator TEXT,
                        description TEXT,
                        content TEXT,
                        pubDate TEXT,
                        image_url TEXT);'''

# Execute the SQL query
cursor.execute(create_table_query)

# Iterate over the values in the dictionary and insert them into the table
for i in range(len(my_dictionary['title'])):
    insert_query = '''INSERT INTO news (title, creator, description, content, pubDate, image_url)
                        VALUES(%s, %s, %s, %s, %s, %s)'''
    values = (my_dictionary['title'][i], my_dictionary['creator'][i], my_dictionary['description'][i], my_dictionary['content'][i], my_dictionary['pubDate'][i], my_dictionary['image_url'][i])
    cursor.execute(insert_query, values)

# Commit the changes to the database
connection.commit()

# Close the cursor and connection
cursor.close()
connection.close()

print(my_dictionary['title'])