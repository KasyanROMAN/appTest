from django.urls import path
from .views import index, add_comment
from rest_framework_simplejwt.views import (
    TokenObtainPairView,
    TokenRefreshView,
)


urlpatterns = [
    path('', index, name='index'),
    path('comment/', add_comment, name='add_comment'),  
    path('comment/<int:parent_id>/', add_comment, name='add_comment_reply'),  
    path('api/token/', TokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('api/token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
]
