from django.contrib import admin
from .models import User, Customer, Staff

admin.site.register(User)
admin.site.register(Customer)
admin.site.register(Staff)