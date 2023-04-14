from django.urls import path
from .views import *

urlpatterns = [
    path('', home_page, name='home_page'),
    path('customer', CustomerSignUpView.as_view(), name='customer_signup'),
    path('customer', StaffSignUpView.as_view(), name='staff_signup'),
    path('customer', AdministrativeSignUpView.as_view(), name='administrative_signup'),
]