

from flask import Flask , render_template,request,session ,redirect
from flask_sqlalchemy import SQLAlchemy
from werkzeug.utils import secure_filename
from werkzeug.datastructures import FileStorage
# from flask_mail import Mail
from datetime import datetime
import os

import json

with open('config.json','r') as c:
    params = json.load(c)['params']
local_server = True

app = Flask(__name__)      
app.secret_key = 'the rohit string'


                           # if installed xampp without password then username - "root" and password - ""
                            # 'mysql://username:password@localhost/db_name'
if (local_server):
    app.config['SQLALCHEMY_DATABASE_URI'] = params["local_uri"] # username password of Xammp for connecting our database and also writing the database name in the last
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params["prod_uri"] # username password of Xammp for connecting our database and also writing the database name in the last

db = SQLAlchemy(app)

class Contact(db.Model):  # class defines the database table
    # name  email phone_number mes SNo.
    SNo = db.Column(db.Integer, primary_key=True, nullable=False)
    email = db.Column(db.String(80), unique=False, nullable=False)
    phone_number = db.Column(db.String(12), unique=False, nullable=False)
    mes = db.Column(db.String(120), unique=False, nullable=False)
    name= db.Column(db.String(120), unique=False, nullable=False)



class Posts(db.Model):  # class defines the database table
    # name  email phone_number mes SNo.
    SNo = db.Column(db.Integer, primary_key=True,nullable=False )
    title = db.Column(db.String(80), unique=False,  nullable=False)
    slug = db.Column(db.String(21), nullable=False , unique=False)
    content = db.Column(db.String(120),  unique=False ,nullable=False)
    date= db.Column(db.String(120), unique=False ,nullable=False)
    img_file= db.Column(db.String(120), unique=False , nullable=False)

# ----------------------------------------------------------------
# @app.route("/")
# def Home():
#     return "<p>Hello,</p>"

@app.route("/")
def home():
    posts = Posts.query.filter_by().all()[0:params['no_of_posts']]
    return render_template("index.html",params =params ,posts = posts )


@app.route("/about")
def about():
    return render_template("about.html",params =params )


@app.route("/dashboard" , methods=['GET' , 'POST'] )
def dashboard():
    if ("user" in session and session["user"]== params["admin_user"]):
        posts = Posts.query.all()
        return render_template("dashboard.html" , params = params , posts = posts)
    if request.method == "POST":
        username = request.form.get('uname')
        userpass = request.form.get('pass')
        if (username == params["admin_user"]and (userpass == params["admin_password"])):
            # session variable
            session["user"] = username
            posts = Posts.query.all()
            return render_template("dashboard.html",params =params , posts = posts )
        return render_template("login.html",params =params )
        
    else:
        return render_template("login.html",params =params )
        # redirect to admin panel




     

@app.route("/edit/<string:SNo>" , methods=['GET' , 'POST'] )
def edit(SNo):
    if ("user" in session) and (session["user"]== params["admin_user"]):
        if (request.method == 'POST'):
            box_title = request.form.get('title')
            slug = request.form.get('slug')
            content = request.form.get('content')
            img_file = request.form.get('img_file')
            date = datetime.now()

            if SNo == '0':
                final = Posts(title = box_title  , slug = slug , content = content , img_file = img_file , date =date)
                db.session.add(final)
                db.session.commit()
        # return render_template("edit.html",params =params , SNo = SNo)
        

    return render_template("edit.html",params =params , SNo = SNo)
        

@app.route("/delete/<string:SNo>" , methods=['GET' , 'POST'] )
def delete(SNo):
    if ("user" in session) and (session["user"]== params["admin_user"]):
        post = Posts.query.filter_by(SNo = SNo).first()
        db.session.delete(post)
        db.session.commit()
    return redirect('/dashboard')





@app.route("/uploader", methods = ['GET' , 'POST'])
def def_uploader():
    if ("user" in session) and (session["user"]== params["admin_user"]):
        if request.method == 'POST':
            f= request.files['file1']
            f.save(os.path.join(app.config['UPLOAD_FOLDER'] , secure_filename(f.filename)))
            return "<p>uploaded successfully</p>"



@app.route("/logout")
def logout():
    session.pop('user')
    return redirect('/dashboard')


@app.route("/post/<string:post_slug>",methods=['GET'])
def post_route(post_slug):
    post = Posts.query.filter_by(slug=post_slug).first()
    return render_template("post.html",params =params ,post = post)





@app.route("/contact", methods = ['GET' , 'POST'])
def contact():
    if(request.method == 'POST'):
        ''' add entry to the data base '''
        name=request.form.get('name')
        email=request.form.get('email')
        phone =request.form.get('phone')
        message=request.form.get('message')

        entry = Contact(name = name , phone_number = phone  , mes = message , email = email )
        db.session.add(entry)
        db.session.commit()
        # mail.send_message("new message from " + name,
        #                      sender=email,
        #                      recipients=[params["gmail-user"]],
        #                      body= message +"\n"+ phone
        #                      )
    

       # name  email phone_number mes SNo.
  


    return render_template("contact.html",params =params)

# @app.route("/post")
# def post():
#     return render_template("post.html",params =params)




# ------------------------------------------------------------------------------
app.run(debug=True)

