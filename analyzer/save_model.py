import pandas as pd
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.naive_bayes import MultinomialNB
from sklearn.pipeline import make_pipeline
import joblib
import chardet

# Read your original dataset
data = pd.read_csv('../IMDB Dataset.csv')

# Read positive and negative CSV files
with open('../positive-words.csv','rb') as f:
    encoding = chardet.detect(f.read())['encoding']
positive_data = pd.read_csv('../positive-words.csv', encoding=encoding)
with open('../negative-words.csv','rb') as f:
    encoding = chardet.detect(f.read())['encoding']
negative_data = pd.read_csv('../negative-words.csv', encoding=encoding)

# Convert all positive and negative words to single lists
all_positive_words = positive_data.values.flatten().tolist()
all_negative_words = negative_data.values.flatten().tolist()

# Concatenate positive and negative words
all_words = all_positive_words + all_negative_words
y = [1] * len(all_positive_words) + [0] * len(all_negative_words)

# Create and train the vectorizer
vectorizer = TfidfVectorizer()
X = vectorizer.fit_transform(all_words)

# Train the Naive Bayes model
model = MultinomialNB()
model.fit(X, y)

# Save the vectorizer and the model in a single file
joblib.dump({'vectorizer': vectorizer, 'model': model}, 'sentiment_model.pkl')
