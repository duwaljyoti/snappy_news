from django.urls import include, path

app_name = 'v1-apis'

urlpatterns = [
    path('news/', include('snappy_app.news.api.v1.urls', namespace='news')),
]
