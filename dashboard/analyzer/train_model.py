import os
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.linear_model import SGDClassifier
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score
import joblib

def train_model():
    # Load your dataset
    data = pd.read_csv('../IMDB Dataset.csv')

    # Prepare your data
    x = data['review']
    y = data['sentiment']
    y = y.map({'positive': 1, 'negative': 0})

    # Split data into train and test sets
    x_train, x_test, y_train, y_test = train_test_split(x, y, test_size=0.2, random_state=42)

    # Vectorize text data
    vectorizer = TfidfVectorizer(stop_words='english', max_features=5000)
    x_train_tfidf = vectorizer.fit_transform(x_train)
    x_test_tfidf = vectorizer.transform(x_test)

    # Train the model iteratively
    model = SGDClassifier(max_iter=1, tol=None, warm_start=True)

    train_accuracies = []
    test_accuracies = []

    for _ in range(10):  # Number of epochs
        model.fit(x_train_tfidf, y_train)
        train_accuracy = accuracy_score(y_train, model.predict(x_train_tfidf))
        test_accuracy = accuracy_score(y_test, model.predict(x_test_tfidf))
        train_accuracies.append(train_accuracy)
        test_accuracies.append(test_accuracy)
        print(f'Epoch {_+1} - Train Accuracy: {train_accuracy}, Test Accuracy: {test_accuracy}')

    # Save the model and vectorizer
    joblib.dump({'vectorizer': vectorizer, 'model': model}, 'sentiment_model.pkl')

    # Plot accuracy over epochs
    plt.figure()
    plt.plot(range(1, 11), train_accuracies, marker='o', label='Train Accuracy')
    plt.plot(range(1, 11), test_accuracies, marker='o', label='Test Accuracy')
    plt.title('Model Accuracy Over Epochs')
    plt.xlabel('Epoch')
    plt.ylabel('Accuracy')
    plt.ylim(0, 1)
    plt.legend()
    plt.show()

if __name__ == "__main__":
    train_model()
