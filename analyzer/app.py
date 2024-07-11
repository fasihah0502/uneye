from flask import Flask, request, jsonify
import joblib
import pandas as pd

app = Flask(__name__)

# Load the model and vectorizer
model_data = joblib.load('sentiment_model.pkl')
model = model_data['model']
vectorizer = model_data['vectorizer']

@app.route('/predict', methods=['POST'])
def predict():
    data = request.json
    review = data['review']
    review_tfidf = vectorizer.transform([review])
    prediction = model.predict(review_tfidf)
    sentiment = 'positive' if prediction[0] == 1 else 'negative'
    return jsonify({'sentiment': sentiment})

if __name__ == "__main__":
    app.run(debug=True)
