from django.db import models

class News(models.Model):
    title = models.CharField(max_length=10000)
    description = models.CharField(max_length=10000)
    image_url = models.CharField(max_length=10000)
