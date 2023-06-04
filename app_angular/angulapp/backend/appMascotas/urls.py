from django.urls import path
from .views import LoginView, LogOutView, SignUpView
from . import views
from django.views.generic import RedirectView

urlpatterns = [
    path('auth/login/', LoginView.as_view() , name='auth_login'),
    path('auth/logout/', LogOutView.as_view(), name='auth_logout'),
    path('auth/signup/', SignUpView.as_view(), name='auth_signup'),

    path('inicio/', views.InicioView, name='inicio'),
    path('', RedirectView.as_view(pattern_name='inicio', permanent=False)),
]