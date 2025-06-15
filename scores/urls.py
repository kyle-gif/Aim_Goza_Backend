# scores/urls.py
from django.urls import path
from .views import ScoreListCreateAPIView, scoreboard

urlpatterns = [
    path('api/scores/', ScoreListCreateAPIView.as_view(), name='score-list-create'),
    path('scores/', scoreboard, name='scoreboard'),
]