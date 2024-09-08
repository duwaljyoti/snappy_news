from django.urls import path
# from ../.snappy_app.news.views impor
from snappy_app.news.test import student_show

urlpatterns = [
    path('', student_show, name = 'student_show')
]
