from django.urls import path
from .views import LoginView, LogOutView

urlpatterns = [
    path('auth/login/', LoginView.as_view() , name='auth_login'),
    path('auth/logout/', LogOutView.as_view(), name='auth_logout'),
]