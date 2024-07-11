from django import forms
from django.contrib.auth.forms import UserChangeForm
from django.contrib.auth.models import User

class EditProfileForm(UserChangeForm):
    password = None  # We don't want to display password fields in the form

    class Meta:
        model = User
        fields = ['username', 'email']