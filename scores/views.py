# scores/views.py
from rest_framework import generics
from rest_framework.permissions import AllowAny
from django.shortcuts import render
from . import models
from .serializers import ScoreSerializer

# API 엔드포인트: GET(목록조회), POST(생성)
class ScoreListCreateAPIView(generics.ListCreateAPIView):
    queryset = models.Score.objects.all().order_by('-created_at')
    serializer_class = ScoreSerializer
    permission_classes = [AllowAny]  # 로그인 인증 없이도 접근 허용

# HTML 템플릿을 위한 뷰 (최근 10개 점수 조회)
def scoreboard(request):
    game_type = request.GET.get('gameType', 'grid')
    scores = models.Score.objects.filter(gameType=game_type).order_by('-created_at')[:10]
    return render(request, 'scores.html', {'scores': scores, 'gameType': game_type})