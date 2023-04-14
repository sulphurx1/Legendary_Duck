from django.shortcuts import render, redirect
from django.contrib.auth import login, logout, authenticate
from django.contrib import messages
from django.contrib.auth.forms import AuthenticationForm
from django.views.generic import CreateView
from .models import User
from .form import CustomerSignUpForm, StaffSignUpForm

def index(request):
    return render(request, 'index.html')

def register(request):
    return render(request, 'register.html')

class customer_register(CreateView):
    model = User
    form_class = CustomerSignUpForm
    template_name = 'customer_register.html'

    def form_valid(self, form):
        user = form.save()
        login(self.request, user)
        return redirect('/')

class staff_register(CreateView):
    model = User
    form_class = StaffSignUpForm
    template_name = 'staff_register.html'

    def form_valid(self, form):
        user = form.save()
        login(self.request, user)
        return redirect('/')
    
def login_request(request):
    if request.method == 'POST':
        form = AuthenticationForm(data=request.POST)
        if form.is_valid():
            username = form.cleaned_data.get('username')
            password = form.cleaned_data.get('password')
            user = authenticate(username=username, password=password)
            if user is not None:
                login(request, user)
                return redirect('/')
            
            else:
                messages.error(request, "Invalid username or password")

        else:
            messages.error(request, "Invalid username or password")

    return render(request, 'login.html', 
                  context={'form': AuthenticationForm()})

def logout_view(request):
    logout(request)
    
    return redirect('/')