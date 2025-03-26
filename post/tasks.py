# tasks.py
from celery import shared_task
from django.core.mail import send_mail
from .models import Comment

@shared_task
def process_new_comment(comment_id):
    comment = Comment.objects.get(id=comment_id)
    send_mail(
        subject=f"Новый комментарий от {comment.user_name}",
        message=comment.text,
        from_email='from@example.com',
        recipient_list=['admin@example.com']
    )
