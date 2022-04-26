from crypt import methods
from flask import Flask
from flask import Flask, flash, redirect, render_template, request, session, abort
import os
from sqlalchemy.orm import sessionmaker
from tabledef import *
engine = create_engine('sqlite:///tutorial.db', echo=True)

app = Flask(__name__)

@app.route('/')
def home():
        if not session.get('logged_in'):
                    return render_template('login.html')
        else:
              return render_template("dom.html")
        
@app.route('/dom', methods=['POST','GET'])
def command():
    if request.method == 'POST':
        # domain = request.form['domain']
        domain = request.form.get('domain')
        if domain=="gitpull-dev-talabatcom":
            # print("1")
            os.system("./shellscribt/pull-dev-talabatcom.sh")
        if domain=="gitpull-test-talabatcom":
            os.system("./shellscribt/pull-test-talabacom.sh")
        if domain=="gitpull-uat-talabatcom":
            os.system("./shellscribt/pull-uat-talabacom.sh")
        if domain=="gitpull-shogol":
            print("3")
        if domain=="gitpull-dev-shogol":
            os.system("./shellscribt/pull-dev-shogol")
        if domain=="gitpull-test-shogol":
            os.system("./shellscribt/pull-test-shogol.sh")
        if domain=="gitpull-uat-shogol":
            os.system("./shellscribt/pull-uat-shogol.sh")               
        if domain=="copy-dev-to-test":
            os.system("./shellscribt/copy-dev-to-test.sh")
        if domain=="copy-dev-to-uat":
            os.system("./shellscribt/copy-dev-to-uat.sh")                    
    
        return render_template("dom.html")
    else:    
       return render_template("dom.html")
    

@app.route('/login', methods=['POST'])
def do_admin_login():

    POST_USERNAME = str(request.form['username'])
    POST_PASSWORD = str(request.form['password'])

    Session = sessionmaker(bind=engine)
    s = Session()
    query = s.query(User).filter(User.username.in_([POST_USERNAME]), User.password.in_([POST_PASSWORD]) )
    result = query.first()
    if result:
        session['logged_in'] = True
            
    else:
         flash('wrong password!')
    return home()

@app.route("/logout")
def logout():
    session['logged_in'] = False
    return home()
    










        
if __name__ == "__main__":
    app.secret_key = os.urandom(12)
    app.run(debug=True,host='0.0.0.0', port=5000)
