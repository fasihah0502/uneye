from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib import messages
from django.contrib.auth.models import User
from .forms import EditProfileForm
from django.contrib.auth.forms import AuthenticationForm
from django.contrib.auth.decorators import login_required
from django.contrib.auth.forms import PasswordChangeForm

def edit_profile(request):
    if request.method == 'POST':
        user_form = EditProfileForm(request.POST, instance=request.user)
        password_form = PasswordChangeForm(request.user, request.POST)
        if user_form.is_valid() and password_form.is_valid():
            user_form.save()
            password_form.save()
            # Redirect to profile page or wherever you want
            return redirect('profile')
    else:
        user_form = EditProfileForm(instance=request.user)
        password_form = PasswordChangeForm(request.user)
    return render(request, 'edit_profile.html', {'user_form': user_form, 'password_form': password_form})

def login_user(request):
    if request.method == 'POST':
        form = AuthenticationForm(request, data=request.POST)
        if form.is_valid():
            username = form.cleaned_data.get('username')
            password = form.cleaned_data.get('password')
            user = authenticate(username=username, password=password)
            if user is not None:
                login(request, user)
                return redirect('../dashboard')  # Replace 'dashboard' with the name of your dashboard view
            else:
                messages.error(request, "Invalid username or password.")
        else:
            messages.error(request, "Invalid username or password.")
    else:
        form = AuthenticationForm()
    return render(request, 'login.html', {'form': form})

@login_required
def dashboard(request):
    return render(request, 'dashboard.html')

def logout_user(request):
    logout(request)
    return redirect('login')
