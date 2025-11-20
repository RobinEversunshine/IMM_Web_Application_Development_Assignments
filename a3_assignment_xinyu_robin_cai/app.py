from flask import Flask, render_template, request, session, redirect
from dotenv import load_dotenv
import mysql.connector
import os


app = Flask(__name__)

app.secret_key = os.getenv('SECRET_KEY')

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

cursor = conn.cursor(dictionary=True)





# main page
@app.route("/")
def index():

    cursor.execute('''SELECT * FROM `articles`''')
    rows = cursor.fetchall()

    cursor.execute('''SELECT * FROM `articles` WHERE `isfeature` = 1''')
    features = cursor.fetchall()

    username = 'null'
    role = 'null'
    if "username" in session:
        username = session['username']
        role = session['role']


    data = {
        "rows": rows,
        "features": features,
        "username": username,
        "role": role,
    }

    return render_template("index.html", **data)



# article page
@app.route("/article/<articleid>")
def article(articleid):
    cursor.execute('''SELECT * FROM `articles` WHERE `articleid` = %s''', (articleid, ))
    article = cursor.fetchone()
    return render_template("article.html", article = article)



# about page
@app.route("/about")
def about():
    cursor.execute('''SELECT * FROM `about`''')
    about = cursor.fetchone()

    role = 'null'
    if "username" in session:
        role = session['role']
    
    return render_template("about.html", about = about, role = role)



# edit about
@app.route("/edit-about")
def editAbout():
    cursor.execute('''SELECT * FROM `about`''')
    about = cursor.fetchone()
        
    return render_template("edit-about.html", about = about)


# confirm edit about
@app.route("/confirm-edit-about", methods=['POST'])
def confirm_edit_about():
    role = session['role']
    if(role != 1):
        return "Stop hacking"
    else:
        if request.method == 'POST':

            content = request.form.get('content')

            cursor.execute('''UPDATE `about` 
                        SET `content` = %s
                        WHERE `about`.`id` = 0;''', (content, ))
            conn.commit()

        return render_template("confirm-edit-about.html")




# contact page
@app.route("/contact")
def contact():
    return render_template("contact.html")


# view contact list page
@app.route("/view-contact")
def view_contact():
    cursor.execute('''SELECT * FROM `contacts`''')
    rows = cursor.fetchall()

    return render_template("view-contact.html", rows = rows)



# add contact information
@app.route("/process-contact", methods = ["POST"])
def submit_form():

    fname = request.form.get('fname')
    lname = request.form.get('lname')

    cursor.execute('''
    INSERT INTO `contacts` (personid, fname, lname)
    VALUES (%s, %s, %s)
    ''', ('NULL', fname, lname))

    conn.commit()

    data = {
        "fname": fname,
        "lname": lname,
    }

    return render_template("submit-form.html", **data)




# log in page
@app.route("/login")
def login():
    return render_template("login.html")


# logged in page
@app.route("/process-login", methods = ["POST"])
def process_login():

    username = request.form.get('username')
    password = request.form.get('password')

    cursor.execute('''
    SELECT * 
    FROM `users` 
    WHERE `username` = %s 
    AND `password` = %s
    ''', (username, password))

    record = cursor.fetchone()

    if(record):
        session['username'] = record['username']
        session['role'] = record['role']
        session['userid'] = record['userid']
        return redirect("/")

    else:
        return render_template("not-logged-in.html")


# logged out page
@app.route("/logout")
def process_logout():
    session.clear()
    return render_template('logout.html')





# register page
@app.route("/register")
def register():
    return render_template("register.html")


# registered page
@app.route("/process-register", methods = ["POST"])
def process_register():

    username = request.form.get('username')
    password = request.form.get('password')

    # avoid same user name
    cursor.execute('''SELECT * FROM `users` WHERE `username` = %s''', (username, ))
    if not cursor.fetchone():

        cursor.execute('''
        INSERT INTO `users` (userid, username, password)
        VALUES (%s, %s, %s)
        ''', ('NULL',username, password))

        conn.commit()

        cursor.execute('''SELECT * FROM `users` WHERE `username` = %s''', (username, ))
        record = cursor.fetchone()

        session['username'] = username
        session['role'] = 0
        session['userid'] = record['userid']

        return render_template("registered.html", username = username)
    else:
        return render_template("not-registered.html", username = username)






# add article
@app.route("/add")
def addArticle():
    return render_template("add-article.html")


# confirm add
@app.route("/confirm-add", methods=['POST'])
def confirm_add():
    role = session['role']
    if(role != 1):
        return "Stop hacking"
    else:
        if request.method == 'POST':

            # articleid = request.form.get('articleid')
            title = request.form.get('title')
            author = request.form.get('author')
            content = request.form.get('content')
            image = request.form.get('image')
            isfeature = request.form.get('isfeature')

            if not isfeature:
                isfeature = 0

            cursor.execute('''
            INSERT INTO `articles` (articleid, title, author, content, image, isfeature)
            VALUES (%s, %s, %s, %s, %s, %s)
            ''', ('NULL', title, author, content, image, isfeature))

            conn.commit()

        return render_template("confirm-add.html")



# edit article
@app.route("/edit/<articleid>")
def editArticle(articleid):
    cursor.execute('''SELECT * FROM `articles` WHERE `articleid` = %s''', (articleid, ))
    article = cursor.fetchone()
        
    return render_template("edit-article.html", articleid = articleid, article = article)


# confirm edit
@app.route("/confirm-edit", methods=['POST'])
def confirm_edit():
    role = session['role']
    if(role != 1):
        return "Stop hacking"
    else:
        if request.method == 'POST':

            articleid = request.form.get('articleid')
            title = request.form.get('title')
            author = request.form.get('author')
            content = request.form.get('content')
            image = request.form.get('image')
            isfeature = request.form.get('isfeature')

            if not isfeature:
                isfeature = 0

            cursor.execute('''UPDATE `articles` 
                        SET `title` = %s, 
                        `author` = %s, 
                        `content` = %s, 
                        `image` = %s, 
                        `isfeature` = %s 
                        WHERE `articles`.`articleid` = %s;''', (title, author, content, image, isfeature, articleid))
            conn.commit()

        return render_template("confirm-edit.html")



# delete article
@app.route("/delete/<articleid>")
def deleteArticle(articleid):
    cursor.execute('''SELECT * FROM `articles` WHERE `articleid` = %s''', (articleid, ))
    article = cursor.fetchone()

    return render_template("delete-article.html", articleid = articleid, article = article)


# confirm delete
@app.route("/confirm-delete", methods=['POST'])
def confirm_delete():
    role = session['role']
    if(role != 1):
        return "Stop hacking"
    else:
        if request.method == 'POST':

            articleid = request.form.get('articleid')
            cursor.execute('''DELETE FROM articles WHERE `articles`.`articleid` = %s''', (articleid, ))
            conn.commit()

        return render_template("confirm-delete.html")





# like article
@app.route("/like/<articleid>")
def likeArticle(articleid):
    role = session['role']
    if(role != 0):
        return "Stop hacking"
    else:
        userid = session["userid"]

        cursor.execute('''SELECT * FROM `user-article`
                    WHERE `articleid` = %s
                    AND `userid` = %s;
                    ''', (articleid, userid))
        user_article = cursor.fetchone()

        # no relation between user and article, create one
        if not user_article:
            cursor.execute('''
            INSERT INTO `user-article` (userid, articleid, liked)
            VALUES (%s, %s, 0)
            ''', (userid, articleid))

            conn.commit()

            cursor.execute('''SELECT * FROM `user-article`
                    WHERE `articleid` = %s
                    AND `userid` = %s;
                    ''', (articleid, userid))
            user_article = cursor.fetchone()

        print(user_article)
        
        cursor.execute('''SELECT * FROM `articles` WHERE `articleid` = %s''', (articleid, ))
        article = cursor.fetchone()

        if user_article["liked"] == 0:
            cursor.execute('''UPDATE `user-article` 
                        SET `liked` = %s 
                        WHERE `user-article`.`articleid` = %s
                        AND `user-article`.`userid` = %s;''', (1, articleid, userid))
            cursor.execute('''UPDATE `articles` 
                        SET `likes` = %s 
                        WHERE `articles`.`articleid` = %s;''', (article["likes"] + 1, articleid))
        elif user_article["liked"] == 1:
            cursor.execute('''UPDATE `user-article` 
                        SET `liked` = %s 
                        WHERE `user-article`.`articleid` = %s
                        AND `user-article`.`userid` = %s;''', (0, articleid, userid))
            cursor.execute('''UPDATE `articles` 
                        SET `likes` = %s 
                        WHERE `articles`.`articleid` = %s;''', (article["likes"] - 1, articleid))
        conn.commit()
        return redirect("/")

















