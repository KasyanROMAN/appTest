from django.db import models
from django.core.cache import cache
from django_redis import get_redis_connection

class Post(models.Model):
    user_name = models.CharField(max_length=50, db_index=True)
    email = models.EmailField(db_index=True)
    home_page = models.URLField(blank=True, null=True)
    text = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True, db_index=True)
    parent = models.ForeignKey('self', null=True, blank=True, on_delete=models.CASCADE, related_name='replies')

    class Meta:
        ordering = ['-created_at']

    def save(self, *args, **kwargs):
        super().save(*args, **kwargs)
        cache.delete('comments_list')

    @classmethod
    def get_cached_comments(cls):
        comments = cache.get('comments_list')
        if not comments:

            comments = list(cls.objects.filter(parent__isnull=True).order_by('-created_at'))
            cache.set('comments_list', comments, timeout=60)  
        return comments

