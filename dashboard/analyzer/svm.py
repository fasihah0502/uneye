import pandas as pd
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.model_selection import train_test_split
from sklearn.svm import SVC
from sklearn.metrics import classification_report, accuracy_score
import joblib

# Load dataset
data = pd.read_csv('../IMDB Dataset.csv')

# Preprocess dataset
data['sentiment'] = data['sentiment'].map({'positive': 1, 'negative': 0})
X = data['review']
y = data['sentiment']

# Split dataset
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Vectorize text data
vectorizer = TfidfVectorizer(stop_words='english', max_features=5000)
X_train_tfidf = vectorizer.fit_transform(X_train)
X_test_tfidf = vectorizer.transform(X_test)

# Train SVM model
model = SVC(kernel='linear')
model.fit(X_train_tfidf, y_train)

# Predict and evaluate
y_pred = model.predict(X_test_tfidf)
accuracy = accuracy_score(y_test, y_pred)
report = classification_report(y_test, y_pred, target_names=['negative', 'positive'])

print(f'Accuracy: {accuracy}')
print('Classification Report:')
print(report)

# Save the model and vectorizer
joblib.dump({'vectorizer': vectorizer, 'model': model}, 'svm_sentiment_model.pkl')
