from django.urls import path
from . import views

urlpatterns=[
    path("",views.login_user, name="login.html"),
    path("editprofile",views.edit_profile, name="edit_profile.html"),
]