import pandas as pd
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.model_selection import train_test_split
from sklearn.naive_bayes import MultinomialNB
from sklearn.metrics import classification_report, accuracy_score
import joblib
import nltk
from nltk.corpus import stopwords
import string
import re

# Function to preprocess text data
def preprocess_text(text):
    # Convert text to lowercase
    text = text.lower()
    # Remove numbers
    text = re.sub(r'\d+', '', text)
    # Remove punctuation
    text = text.translate(str.maketrans('', '', string.punctuation))
    # Remove whitespace
    text = text.strip()
    return text

# Load dataset (assuming CSV format with 'review' and 'sentiment' columns)
data = pd.read_csv('../IMDB Dataset.csv')

# Preprocess dataset
data['review'] = data['review'].apply(preprocess_text)
data['sentiment'] = data['sentiment'].map({'positive': 1, 'negative': 0})

# Separate features and target
X = data['review']
y = data['sentiment']

# Split dataset into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.6, random_state=42)

# Initialize stop words
stop_words = 'english'

# Vectorize text data
vectorizer = TfidfVectorizer(stop_words=stop_words, max_features=5000)
X_train_tfidf = vectorizer.fit_transform(X_train)
X_test_tfidf = vectorizer.transform(X_test)

# Train Naive Bayes model
model = MultinomialNB()
model.fit(X_train_tfidf, y_train)

# Predict using the trained model
y_pred = model.predict(X_test_tfidf)

# Evaluate the model
accuracy = accuracy_score(y_test, y_pred)
report = classification_report(y_test, y_pred, target_names=['negative', 'positive'])

# Print evaluation metrics
print(f'Accuracy: {accuracy:.4f}')
print('Classification Report:')
print(report)

# Save the model and vectorizer for future use
joblib.dump({'vectorizer': vectorizer, 'model': model}, 'nb_sentiment_model.pkl')
