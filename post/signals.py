from django.db.models.signals import post_save
from django.dispatch import receiver
from .models import Comment

@receiver(post_save, sender=Comment)
def new_comment_notification(sender, instance, created, **kwargs):
    if created:
        print(f"Новый комментарий от {instance.user_name}: {instance.text}")
