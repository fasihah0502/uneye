import os
import joblib

# Define the path to the model and vectorizer
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
MODEL_PATH = os.path.join(BASE_DIR, 'analyzer', 'sentiment_model.pkl')
VECTORIZER_PATH = os.path.join(BASE_DIR, 'analyzer', 'vectorizer.pkl')

# Load the model and vectorizer
model = joblib.load(MODEL_PATH)
vectorizer = joblib.load(VECTORIZER_PATH)
