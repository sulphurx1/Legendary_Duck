from django.urls import path
from . import views

urlpatterns=[
    path('', views.index, name='index'),
    path('register/',views.register, name='register'),
    path('customer_register/',views.customer_register.as_view(), name='customer_register'),
    path('staff_register/',views.staff_register.as_view(), name='staff_register'),
    path('login/', views.login_request, name='login'),
    path('logout/', views.logout_view, name='logout'),
]