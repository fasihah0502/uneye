from django.urls import path
from . import views

urlpatterns=[
    path("",views.display, name="dashboard-index"),
    path("predict",views.brand_analysis_view, name="dashboard-index")

]