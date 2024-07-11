from django.urls import path
from . import views

urlpatterns = [
    path('analyze/', views.index, name='sentiment.html'),
    path('train/', views.train_model, name='train_model'),
    path('', views.sentiment_analysis, name='sentiment_analysis'),
    path('upload/', views.upload_file_view, name='upload_file'),
    path('history/', views.display_csv_table, name='history')

]
