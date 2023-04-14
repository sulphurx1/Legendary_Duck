from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.db import transaction
from .models import Customer, Staff, Administrative, User

class CustomerSignUpForm(UserCreationForm):
    first_name = forms.CharField(required=True)
    second_name = forms.CharField(required=True)
    email = forms.EmailField(required=True)

    class Meta(UserCreationForm.Meta):
        model = User
    
    @transaction.atomic
    def save(self):
        user = super().save(commit=False)

        user.is_customer = True
        user.save()
        customer = Customer.objects.create(user=user)
        
        customer.save()

        return customer
    

class StaffSignUpForm(UserCreationForm):
    first_name = forms.CharField(required=True)
    second_name = forms.CharField(required=True)
    email = forms.EmailField(required=True)

    class Meta(UserCreationForm.Meta):
        model = User

    @transaction.atomic
    def save(self):
        user = super().save(commit=False)

        user.is_staff = True
        user.save()
        staff = Staff.objects.create(user=user)

        staff.save()

        return staff
    

class AdministrativeSignUpForm(UserCreationForm):
    first_name = forms.CharField(required=True)
    second_name = forms.CharField(required=True)
    email = forms.EmailField(required=True)

    class Meta(UserCreationForm.Meta):
        model = User

    @transaction.atomic
    def save(self):
        user = super().save(commit=False)

        user.is_administrative = True
        user.save()
        administrative = Administrative.objects.create(user=user)

        administrative.save()

        return administrative