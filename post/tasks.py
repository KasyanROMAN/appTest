from celery import shared_task
from .models import Post

@shared_task
def process_new_post(post_id):
    post = Post.objects.get(id=post_id)
    post.title = f"Processed: {post.title}"
    post.save()
