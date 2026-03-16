from flask import Flask

app = Flask (__name__)

@app.route('/')
def hello_world():
    return 'Hello, World!'

if __name == '__main':
    app.run(host='0.0.0.0', port=5000)
