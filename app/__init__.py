from __future__ import absolute_import, unicode_literals

# Убедитесь, что все задачи Celery выполняются при старте проекта.
from .celery import app as celery_app

__all__ = ('celery_app',)
