import pandas as pd
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.model_selection import train_test_split
from sklearn.naive_bayes import MultinomialNB
from sklearn.metrics import classification_report, accuracy_score
import joblib
import chardet

# Function to load additional word lists with encoding detection
def load_word_list(file_path):
    with open(file_path, 'rb') as file:
        raw_data = file.read()
        result = chardet.detect(raw_data)
        encoding = result['encoding']
    with open(file_path, 'r', encoding=encoding) as file:
        words = file.read().splitlines()
    return words

# Load dataset
data = pd.read_csv('../IMDB Dataset.csv')

# Preprocess dataset
data['sentiment'] = data['sentiment'].map({'positive': 1, 'negative': 0})
X = data['review']
y = data['sentiment']

# Load additional positive and negative word lists
positive_words = load_word_list('../positive-words.csv')
negative_words = load_word_list('../negative-words.csv')

# Create data for additional word lists
additional_X = positive_words + negative_words
additional_y = [1] * len(positive_words) + [0] * len(negative_words)

# Combine original data with additional word lists
X_combined = X.tolist() + additional_X
y_combined = y.tolist() + additional_y

# Split combined dataset
X_train, X_test, y_train, y_test = train_test_split(X_combined, y_combined, test_size=0.6, random_state=42)

# Vectorize text data
vectorizer = TfidfVectorizer(stop_words='english', max_features=5000)
X_train_tfidf = vectorizer.fit_transform(X_train)
X_test_tfidf = vectorizer.transform(X_test)

# Train Naive Bayes model
model = MultinomialNB()
model.fit(X_train_tfidf, y_train)

# Predict and evaluate
y_pred = model.predict(X_test_tfidf)
accuracy = accuracy_score(y_test, y_pred)
report = classification_report(y_test, y_pred, target_names=['negative', 'positive'])

print(f'Accuracy: {accuracy}')
print('Classification Report:')
print(report)

# Save the model and vectorizer
joblib.dump({'vectorizer': vectorizer, 'model': model}, 'nb_sentiment_model.pkl')
