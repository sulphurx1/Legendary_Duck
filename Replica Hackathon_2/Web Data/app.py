from flask import Flask, render_template
import psycopg2 as psy

app = Flask(__name__)

@app.route("/")
def index():
    # Connect to the database
    connection = psy.connect('dbname=hackathon user=postgres password=test host=localhost')
    cursor = connection.cursor()

    # Execute a query to retrieve data
    cursor.execute("SELECT * FROM news")

    # Fetch the results
    results = cursor.fetchall()

    # Close the database connection
    cursor.close()
    connection.close()

    # Render the HTML template with the results
    return render_template('index.html', results=results)

if __name__ == '__main__':
    app.run()