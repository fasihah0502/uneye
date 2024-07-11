from django.shortcuts import render
import csv
import os
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.conf import settings
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger

@csrf_exempt
def display(request):
    data = []
    csv_files = ['android.csv', 'apple.csv', 'google.csv']
    allowed_brands = ['Android', 'Apple', 'Google', 'iPad','iPhone']  # Define allowed brands
    search_query = request.GET.get('search', '')  # Ensure search_query is always defined

    positive_count = 0
    negative_count = 0
    neutral_count = 0

    for csv_file in csv_files:
        csv_path = os.path.join(settings.BASE_DIR, csv_file)
        print(f"CSV Path: {csv_path}")  # Debug: print the CSV file path

        try:
            with open(csv_path, newline='', encoding='utf-8') as csvfile:
                reader = csv.reader(csvfile)
                for row in reader:
                    data.append(row)
                    # Assuming the sentiment is in the second column
                    if search_query.lower() in row[0].lower():
                        if len(row) > 2:
                            if 'positive' in row[2].lower():
                                positive_count += 1
                            elif 'negative' in row[2].lower():
                                negative_count += 1
                            elif 'neutral' in row[2].lower():
                                neutral_count += 1
        except FileNotFoundError:
            print(f"CSV file '{csv_file}' not found. Please check the file path.")
        except UnicodeDecodeError:
            try:
                with open(csv_path, newline='', encoding='latin-1') as csvfile:
                    reader = csv.reader(csvfile)
                    for row in reader:
                        data.append(row)
                        if search_query.lower() in row[0].lower():
                            if len(row) > 2:
                                if 'positive' in row[2].lower():
                                    positive_count += 1
                                elif 'negative' in row[2].lower():
                                    negative_count += 1
                                elif 'neutral' in row[2].lower():
                                    neutral_count += 1
            except UnicodeDecodeError:
                print(f"Encoding error while reading the CSV file '{csv_file}'. Please check the file encoding.")  # Debug: encoding error

    # Filtering data based on search_query
    if search_query:
        data = [data[0]] + [row for row in data[1:] if search_query.lower() in row[0].lower()]

    page = request.GET.get('page', 1)
    paginator = Paginator(data[1:], 8)  # Show 20 rows per page, skipping the header row
    try:
        paginated_data = paginator.page(page)
    except PageNotAnInteger:
        paginated_data = paginator.page(1)
    except EmptyPage:
        paginated_data = paginator.page(paginator.num_pages)

    context = {
        'header': data[0] if data else [],  # header row
        'paginated_data': paginated_data,  # paginated rows
        'search_query': search_query,  # Ensure search_query is passed to the context
        'brands': allowed_brands,  # Pass the allowed brands to the context
        'positive_count': positive_count,
        'negative_count': negative_count,
        'neutral_count': neutral_count,
    }

    print(f"Positive count: {positive_count}, Negative count: {negative_count}, Neutral count: {neutral_count}")  # Debug: print sentiment counts

    return render(request, 'dashboard.html', context)

BRANDS = ["Brand1", "Brand2", "Brand3", "Brand4", "Brand5"]
DATA = [
    ["Row 1 Column 1", "Row 1 Column 2", "Row 1 Column 3"],
    ["Row 2 Column 1", "Row 2 Column 2", "Row 2 Column 3"],
    ["Row 3 Column 1", "Row 3 Column 2", "Row 3 Column 3"],
    # Add more rows as needed
]
HEADER = ["Header 1", "Header 2", "Header 3"]

def brand_analysis_view(request):
    search_query = request.GET.get('search', '')
    
    # Simulate sentiment analysis data
    positive_count = 10
    negative_count = 5
    neutral_count = 8

    # Filter the data based on the search query (if needed)
    filtered_data = DATA  # Here you can filter DATA based on the search_query

    # Paginate the data
    paginator = Paginator(filtered_data, 10)  # Show 10 rows per page
    page_number = request.GET.get('page')
    paginated_data = paginator.get_page(page_number)

    context = {
        'brands': BRANDS,
        'search_query': search_query,
        'header': HEADER,
        'paginated_data': paginated_data,
        'positive_count': positive_count,
        'negative_count': negative_count,
        'neutral_count': neutral_count,
    }
    
    return render(request, 'predict.html', context)
