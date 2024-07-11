from django.http import JsonResponse, HttpResponse
from django.views.decorators.csrf import csrf_exempt
import pandas as pd
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.naive_bayes import MultinomialNB
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score
import joblib
from django.shortcuts import render
from .forms import SentimentForm, DataForm, UploadFileForm
import matplotlib.pyplot as plt
import seaborn as sns
import io
import base64
import os
import csv
from sklearn.svm import SVC
from django.conf import settings
from django.http import HttpResponseServerError

def ensure_directory_exists(file_path):
    directory = os.path.dirname(file_path)
    if not os.path.exists(directory):
        os.makedirs(directory)

def train_svm_model():
    data = pd.read_csv('../IMDB Dataset.csv')
    x = data['review']
    y = data['sentiment'].map({'positive': 1, 'negative': 0})
    vectorizer = TfidfVectorizer(stop_words='english', max_features=5000)
    x_tfidf = vectorizer.fit_transform(x)
    
    model = SVC(kernel='linear')
    model.fit(x_tfidf, y)
    
    joblib.dump({'model': model, 'vectorizer': vectorizer}, 'svm_sentiment_model.pkl')
    print("SVM model trained and saved successfully")

@csrf_exempt
def upload_file_view(request):
    if request.method == 'POST':
        form = UploadFileForm(request.POST, request.FILES)
        if form.is_valid():
            csv_file = request.FILES['file']
            df = pd.read_csv(csv_file)
            
            model_path = 'C:/Users/user/aaa/analyzer/svm_sentiment_model.pkl'
            
            if not os.path.exists(model_path):
                return HttpResponseServerError('Model file not found.')
            
            # Load the trained SVM model and vectorizer
            try:
                model_dict = joblib.load(model_path)
                model = model_dict['model']
                vectorizer = model_dict['vectorizer']
            except Exception as e:
                return HttpResponseServerError(f'Error loading model: {e}')
            
            # Transform the sentences in the CSV file
            X_input = vectorizer.transform(df['review'])
            predictions = model.predict(X_input)
            
            df['sentiment'] = predictions
            df['sentiment'] = df['sentiment'].map({1: 'positive', 0: 'negative'})
            
            # Generate pie chart
            sentiment_counts = df['sentiment'].value_counts()
            fig, ax = plt.subplots()
            ax.pie(sentiment_counts, labels=sentiment_counts.index, autopct='%1.1f%%', startangle=90)
            ax.axis('equal')
            plt.title('Sentiment Distribution')
            
            # Save the plot to a PNG image in memory
            buf = io.BytesIO()
            plt.savefig(buf, format='png')
            plt.close(fig)
            buf.seek(0)
            image_base64 = base64.b64encode(buf.getvalue()).decode('utf-8')
            
            return render(request, 'upload.html', {
                'form': form,
                'image_base64': image_base64,
                'data': df.to_html(classes='table table-striped')
            })
    else:
        form = UploadFileForm()
    
    return render(request, 'upload.html', {'form': form})

def save_to_csv(data, file_path):
    try:
        if os.path.exists(file_path) and os.path.getsize(file_path) > 0:
            df = pd.read_csv(file_path)
        else:
            df = pd.DataFrame(columns=['brand','sentence','sentiment'])
        
        new_data = pd.DataFrame([data])
        df = pd.concat([df, new_data], ignore_index=True)

        df.to_csv(file_path, index=False)
        print(f"Data saved successfully to {file_path}")
    except Exception as e:
        print(f"Error saving data to CSV: {e}")

@csrf_exempt
def sentiment_analysis(request):
    sentiment = None
    if request.method == 'POST':
        form = SentimentForm(request.POST)
        if form.is_valid():
            sentence = form.cleaned_data['sentence']
            brand = form.cleaned_data['brand']

            # Load the trained model and vectorizer from the single file
            model_path = os.path.join(os.path.dirname(__file__), 'svm_sentiment_model.pkl')

            # Check if the model file exists
            if not os.path.exists(model_path):
                return HttpResponse("Model file not found.", status=404)

            model_dict = joblib.load(model_path)
            vectorizer = model_dict['vectorizer']
            model = model_dict['model']
            
            # Transform the input sentence
            X_input = vectorizer.transform([sentence])
            
            # Predict the sentiment
            prediction = model.predict(X_input)
            sentiment = 'positive' if prediction[0] == 1 else 'negative'
            file_path = os.path.join(os.path.dirname(__file__), 'data.csv')
            data = {'brand': brand, 'sentence': sentence, 'sentiment': sentiment}
            save_to_csv(data, file_path)

            print(f"Sentiment analysis complete. Sentiment:{sentiment}")

        else:
            print("form is not valid")

    else:
        form = SentimentForm()

    return render(request, 'sentiment.html', {'form': form, 'sentiment': sentiment})

def index(request):
    return render(request, 'sentiment.html')

def display_csv_table(request):
    # Path to your CSV file
    csv_file = os.path.join(settings.BASE_DIR,'C:/Users/user/aaa/analyzer/data.csv')

    # Initialize an empty list to store rows from the CSV file
    csv_data = []

    try:
        with open(csv_file, 'r', newline='') as file:
            reader = csv.DictReader(file)
            for row in reader:
                csv_data.append(row)
    except FileNotFoundError:
        csv_data = None  # Handle the case where the file is not found

    return render(request, 'history.html', {'csv_data': csv_data})

def analyze_view(request):
    if request.method == 'POST':
        form = DataForm(request.POST)
        if form.is_valid():
            data = form.cleaned_data
            data['sentiment'] = 'unknown'
            file_path = os.path.join(os.path.dirname(__file__), 'data.csv')
            save_to_csv(data, file_path)
            return HttpResponse(f"Data saved to {file_path}")
        else:
            print("Form is not valid")
    else:
        form = DataForm()
    return render(request, 'sentiment.html', {'form': form})
@csrf_exempt
def train_model(request):
    data = pd.read_csv('../IMDB Dataset.csv')
    x = data['review']
    y = data['sentiment']
    y = y.map({'positive': 1, 'negative': 0})
    x_train, x_test, y_train, y_test = train_test_split(x, y, test_size=0.2, random_state=42)
    vectorizer = TfidfVectorizer(stop_words='english', max_features=5000)
    x_train_tfidf = vectorizer.fit_transform(x_train)
    x_test_tfidf = vectorizer.transform(x_test)
    model = MultinomialNB()
    model.fit(x_train_tfidf, y_train)
    y_pred = model.predict(x_test_tfidf)
    accuracy = accuracy_score(y_test, y_pred)
    print(f'Accuracy: {accuracy}')
    joblib.dump(model, 'sentiment_model.pkl')
    joblib.dump(vectorizer, 'vectorizer.pkl')
    return JsonResponse({'message': 'Model trained and saved successfully', 'accuracy': accuracy})

if __name__ == "__main__":
    train_model()
