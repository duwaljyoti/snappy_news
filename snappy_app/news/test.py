from django.shortcuts import render
from django.http import HttpResponse
from django.db import connection
import django

def student_show(request):
    test_response = "<h1>DataFlair Django </h1>The Digits updated are {0}"
    return HttpResponse(test_response)
