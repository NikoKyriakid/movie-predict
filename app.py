from flask import Flask, current_app, jsonify
import json
import os

from src.movies import get_recommendations
print('Model Loaded!')


app = Flask(__name__, static_url_path='')


@app.route('/')
def index():
    return current_app.send_static_file('index.html')

@app.route('/predict/<name>')
def get_prediction(name):
    res = get_recommendations(str(name)).head(10).to_json(orient="split")
    return res


if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0')