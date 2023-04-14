from django.shortcuts import render
from django.shortcuts import redirect
from .models import Customer, Staff, Administrative, User
from django.views.generic import CreateView
from .forms import CustomerSignUpForm, StaffSignUpForm, AdministrativeSignUpForm

def home_page(request):
    return render(request, 'home_page.html')

class CustomerSignUpView(CreateView):
    model = User
    form_class = CustomerSignUpForm
    template_name = 'singup_page.html'

    def get_context_data(self, **kwargs):
        kwargs['user_type'] = 'customer'
        return super().get_context_data(**kwargs)
    
    def form_valid(self, form):
        user = form.save()
        login(self.request, user)
        return redirect('home_page')
    

class StaffSignUpView(CreateView):
    model = User
    form_class = StaffSignUpForm
    template_name = 'singup_page.html'

    def get_context_data(self, **kwargs):
        kwargs['user_type'] = 'staff'
        return super().get_context_data(**kwargs)
    
    def form_valid(self, form):
        user = form.save()
        login(self.request, user)
        return redirect('home_page')


class AdministrativeSignUpView(CreateView):
    model = User
    form_class = AdministrativeSignUpForm
    template_name = 'singup_page.html'

    def get_context_data(self, **kwargs):
        kwargs['user_type'] = 'administrative'
        return super().get_context_data(**kwargs)
    
    def form_valid(self, form):
        user = form.save()
        login(self.request, user)
        return redirect('home_page')