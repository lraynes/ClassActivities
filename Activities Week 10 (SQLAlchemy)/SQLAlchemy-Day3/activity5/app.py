# 1. import Flask
from flask import Flask, render_template, redirect

# 2. Create an app, being sure to pass __name__
app = Flask(__name__)


# 3. Define what to do when a user hits the index route
@app.route("/")
def home():
    print("Server received request for 'Home' page...")
    return render_template("index.html")


# 4. Define what to do when a user hits the /about route
@app.route("/about")
def about():
    print("Server received request for 'About' page...")
    return "My name is Laura and I am in class right now."

@app.route("/contact")
def contact():
    print("Server received request for 'Contact' page...")
    return "You can email me at fake@phony.com"


if __name__ == "__main__":
    app.run(debug=True)