from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login
from django.contrib import messages
from .forms import CreateUserForm

def register_view(request):
    if request.method == 'POST':
        form = CreateUserForm(request.POST)
        if form.is_valid():
            user = form.save()
            login(request, user)
            return redirect('../dashboard')
        else:
            print("Form errors:", form.errors)  # Debugging line
            messages.error(request, "There was an error with your registration. Try again...")
    else:
        form = CreateUserForm()
    print("Form instance:", form)  # Debugging line
    return render(request, 'register.html', {'form': form})
