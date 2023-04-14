from django.contrib.auth.models import AbstractUser
from django.db import models

class User(AbstractUser):
    is_customer = models.BooleanField(default=False)
    is_staff = models.BooleanField(default=False)
    is_administrative = models.BooleanField(default=False)

class Customer(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, primary_key=True)
    first_name = models.CharField(max_length=60)
    second_name = models.CharField(max_length=70)
    email = models.EmailField(max_length=254)
    
class Staff(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, primary_key=True)
    first_name = models.CharField(max_length=60)
    second_name = models.CharField(max_length=70)
    email = models.EmailField(max_length=254)

class Administrative(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, primary_key=True)
    first_name = models.CharField(max_length=60)
    second_name = models.CharField(max_length=70)
    email = models.EmailField(max_length=254)
    