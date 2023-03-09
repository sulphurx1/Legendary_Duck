from django.shortcuts import render
from name_of_app.models import News

def my_view(request):
    my_data = News.objects.all()
    context = {'my_data': my_data}
    return render(request, 'new.html', context)

#
