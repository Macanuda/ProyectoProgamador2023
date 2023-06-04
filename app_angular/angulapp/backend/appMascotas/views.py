from django.shortcuts import render
from django.http import HttpResponse

from django.contrib.auth import authenticate, login, logout
from rest_framework import status, generics
from rest_framework.response import Response
from rest_framework.views import APIView
from .serializers import UserSerializer

#### Inicio ####
def InicioView(request):
    return HttpResponse('Funciona el inicio')
    # return render(request, '', {})

#### Login ####
class LoginView(APIView):
    def post(self, request):
        email = request.data.get('email',None)
        password = request.data.get('password', None)
        user = authenticate(email=email, password=password)

        if user:
            login(request, user)
            return Response(UserSerializer(user).data, status=status.HTTP_200_OK)
        return Response(status=status.HTTP_404_NOT_FOUND)

#### Logout ####
class LogOutView(APIView):
    def post(self, request):
        logout(request)
        return Response(status=status.HTTP_200_OK)
    
#### Sign up ####
class SignUpView(generics.CreateAPIView):
    serializer_class = UserSerializer
