import requests
import json

r = requests.get('https://newsdata.io/api/1/news?apikey=pub_18376a701dfc2ce56259f7b1ccc11e41718e2&q=sport&country=gb,us&language=en&category=business,entertainment,health,politics,sports')
data = json.loads(r.content)
results = data['results']
length = len(results)
title, creator, description, content, pubDate, image_url = ([], [], [], [], [], [])
for index in range(length - 1):
    title.append(results[index]['title'])
    creator.append(results[index]['creator'])
    description.append(results[index]['description'])
    content.append(results[index]['content'])
    pubDate.append(results[index]['pubDate'])
    image_url.append(results[index]['image_url'])

my_dictionary = {
    'title': title,
    'creator': creator,
    'description': description,
    'content': content,
    'pubDate': pubDate,
    'image_url': image_url
}

