from django.db import models

class Score(models.Model):
    username = models.CharField(max_length=100)
    score = models.IntegerField()
    created_at = models.DateTimeField(auto_now_add=True)
    gameType = models.CharField(max_length=10, choices=[('grid', 'Grid'), ('track', 'Track')], default='grid')

    class Meta:
        ordering = ['-created_at']