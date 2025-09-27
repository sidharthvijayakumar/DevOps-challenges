from flask import Flask
app = Flask(__name__)

@app.route("/")
def hello_world():
    return "Simple hello world program!"

@app.route("/health")
def health_check():
    return "I am alive and kicking!"