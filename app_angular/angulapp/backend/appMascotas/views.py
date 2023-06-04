from django.shortcuts import render
from django.http import HttpResponse
from django.contrib.auth import authenticate, login, logout
from rest_framework import status, generics
from rest_framework.response import Response
from rest_framework.views import APIView
from .serializers import UserSerializer
from .models import Categoria, Producto, CustomUser
from rest_framework.permissions import IsAdminUser, AllowAny, IsAuthenticated
from .serializers import ProductoSerializer, CategoriaSerializer
from rest_framework import viewsets

#### Inicio ####
def InicioView(request):
    return HttpResponse('Funciona el inicio')
    # return render(request, '', {})

#### Login ####
class LoginView(APIView):
    def post(self, request):
        email = request.data.get('email', None)
        password = request.data.get('password', None)
        user = authenticate(email=email, password=password)

        if user:
            login(request, user)
            return Response(UserSerializer(user).data, status=status.HTTP_200_OK)
        return Response(status=status.HTTP_404_NOT_FOUND)

#### Logout ####
class LogoutView(APIView):
    def post(self, request):
        logout(request)
        return Response(status=status.HTTP_200_OK)
    
#### Sign up ####
class SignUpView(generics.CreateAPIView):
    serializer_class = UserSerializer

#### Obtener productos ####
class ProductosView(APIView):
    def get(self, request):
        # Lógica para obtener productos
        return Response("Obteniendo productos", status=status.HTTP_200_OK)

#### Obtener y actualizar el perfil ####
class ProfileView(APIView):
    def get(self, request):
        # Lógica para obtener el perfil
        return Response("Obteniendo perfil", status=status.HTTP_200_OK)

    def patch(self, request):
        # Lógica para actualizar el perfil
        return Response("Actualizando perfil", status=status.HTTP_200_OK)

#### Ver productos y categorías ####
class verProductos(viewsets.ReadOnlyModelViewSet):
    permission_classes = [AllowAny] 
    queryset = Producto.objects.all()
    serializer_class = ProductoSerializer

class verCategorias(viewsets.ReadOnlyModelViewSet):
    permission_classes = [AllowAny]
    queryset = Categoria.objects.all()
    serializer_class = CategoriaSerializer

#### Agregar producto ####
class agregarProducto(APIView):
    permission_classes = [IsAdminUser]
    def post(self, request, format=None):
        serializer = ProductoSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

#### Listar usuarios ####
class ListarUsuarios(generics.ListCreateAPIView):
    queryset = CustomUser.objects.all()
    serializer_class = UserSerializer
    http_method_names = ['get']
    permission_classes = [IsAdminUser]

    def list(self, request):
        queryset = self.get_queryset()
        serializer = UserSerializer(queryset, many=True)
        return Response(serializer.data)