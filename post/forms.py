from django import forms
from .models import Comment
from captcha.fields import CaptchaField
from django.utils.html import strip_tags

class CommentForm(forms.ModelForm):
    captcha = CaptchaField()

    class Meta:
        model = Comment
        fields = ['user_name', 'email', 'home_page', 'text', 'captcha',]

    def clean_text(self):
        text = self.cleaned_data['text']
    
        cleaned_text = strip_tags(text)  
        return cleaned_text
