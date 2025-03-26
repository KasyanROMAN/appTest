from django.contrib import admin
from .models import Comment

@admin.register(Comment)
class CommentAdmin(admin.ModelAdmin):
    list_display = ('user_name', 'email', 'created_at')  
    list_filter = ('created_at', 'parent')  
    search_fields = ('user_name', 'email', 'text') 
    list_per_page = 20  
    fields = ('user_name', 'email', 'home_page', 'text', 'parent')


