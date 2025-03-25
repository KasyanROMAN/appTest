from django.urls import path
from .views import index, add_post
from rest_framework_simplejwt.views import (
    TokenObtainPairView,
    TokenRefreshView,
)


urlpatterns = [
    path('', index, name='index'),
    path('add/', add_post, name='add_post'),  
    path('add/<int:parent_id>/', add_post, name='add_post_reply'),  
    path('api/token/', TokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('api/token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
]
