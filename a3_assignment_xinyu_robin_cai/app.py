# flask --app app run

from flask import Flask, render_template, request
from dotenv import load_dotenv
import mysql.connector
import os


app = Flask(__name__)

# Set the configuration from environment variables
app.config['MYSQL_HOST'] = os.getenv('MYSQL_HOST')
app.config['MYSQL_USER'] = os.getenv('MYSQL_USER')
app.config['MYSQL_PASSWORD'] = os.getenv('MYSQL_PASSWORD')
app.config['MYSQL_DB'] = os.getenv('MYSQL_DB')

conn = mysql.connector.connect(
host=app.config['MYSQL_HOST'],
user=app.config['MYSQL_USER'],
password=app.config['MYSQL_PASSWORD'],
database=app.config['MYSQL_DB']
)

cursor = conn.cursor()



@app.route("/")
def index():
    return render_template("form.html")


@app.route("/submit-form", methods = "POST")
def submit_form():

    fname = request.form.get('fname')
    lname = request.form.get('lname')
    dob = request.form.get('dob')


    cursor.execute('''
    INSERT INTO `Person` (personid, fname, lname, DOB)
    VALUES (%s, %s, %s, %s)
    ''', ('NULL',fname, lname, dob))

    conn.commit()



    data = {
        "fname": fname,
        "lname": lname,
        "dob": dob,
    }


    return render_template("submit-form.html", **data)


