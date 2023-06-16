from django.shortcuts import render, get_object_or_404
from django.contrib.auth import authenticate, login, logout, get_user_model
from rest_framework import status, generics, authentication, permissions
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.authtoken.views import ObtainAuthToken
from rest_framework.authtoken.models import Token
from .serializers import UserSerializer
from .models import Producto, CustomUser
from rest_framework.permissions import IsAdminUser, AllowAny, IsAuthenticated
from rest_framework.authentication import BasicAuthentication
from .serializers import ProductoSerializer, AuthTokenSerializer
from rest_framework import viewsets
from rest_framework.decorators import api_view
import mercadopago
import json

#### Login ####
class LoginView(APIView):
    def post(self, request):
        # Recuperamos las credenciales y autenticamos al usuario
        email = request.data.get('email', None)
        password = request.data.get('password', None)
        user = authenticate(email=email, password=password)

        # Si es correcto, añadimos a la request la información de sesión
        if user:
            login(request, user)
            return Response(UserSerializer(user).data, status=status.HTTP_200_OK)
        
        # Si no es correcto, devolvemos un error
        return Response(status=status.HTTP_404_NOT_FOUND)

#### Logout ####
class LogoutView(APIView):
    def post(self, request):
        # Borramos de la request la información de sesión
        logout(request)
        return Response(status=status.HTTP_200_OK)
    
#### Sign up ####
class SignUpView(generics.CreateAPIView):
    User = get_user_model()
    serializer_class = UserSerializer
    queryset = User.objects.all()
    def perform_create(self, serializer):
        user = serializer.save()
        token, created = Token.objects.get_or_create(user=user)


#### Obtener y actualizar el perfil ####
class ProfileView(generics.RetrieveUpdateAPIView):
    permission_classes = [IsAuthenticated]
    serializer_class = UserSerializer
    http_method_names = ['get', 'patch']
    def get_object(self):
        if self.request.user.is_authenticated:
            return self.request.user
        
########################################################################################################################################
#### Obtener productos ####
class ProductosView(APIView):
    def get(self, request):
        # Lógica para obtener productos
        return Response("Obteniendo productos", status=status.HTTP_200_OK)

#### Ver productos y categorías ####
class VerProductosView(viewsets.ReadOnlyModelViewSet):
    permission_classes = [AllowAny] 
    queryset = Producto.objects.all()
    serializer_class = ProductoSerializer

#### Agregar producto ####
class AgregarProductoView(APIView):
    permission_classes = [IsAdminUser]
    def post(self, request, format=None):
        serializer = ProductoSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

#### Listar usuarios ####
class ListarUsuariosView(generics.ListCreateAPIView):
    queryset = CustomUser.objects.all()
    serializer_class = UserSerializer
    http_method_names = ['get']
    permission_classes = [IsAdminUser]

    def list(self, request):
        queryset = self.get_queryset()
        serializer = UserSerializer(queryset, many=True)
        return Response(serializer.data)


#### Los usuarios pueden ver su perfil ####
class ProfileView(generics.RetrieveUpdateAPIView):
    permission_classes = [IsAuthenticated]
    serializer_class = UserSerializer
    http_method_names = ['get', 'patch']
    def get_object(self):
        if self.request.user.is_authenticated:
            return self.request.user

#### Para editar su perfil, debe estar autenticado ####
class UpdateUserView(generics.RetrieveUpdateAPIView):
    serializer_class = UserSerializer
    authentication_classes = [authentication.TokenAuthentication]
    permission_classes = [permissions.IsAuthenticated]
    def get_object(self):
        return self.request.user


class CreateTokenView(ObtainAuthToken):
    serializer_class = AuthTokenSerializer
    def post(self,request):
        email = request.data.get('email')
        password = request.data.get('password')

        # Realizar la lógica de autenticación y generación de token
        user = authenticate(request, email=email, password=password)
        if user is not None:
            token, created = Token.objects.get_or_create(user=user)
            return Response({'token': token.key}, status=200)
        else:
            return Response({'error': 'Credenciales inválidas'}, status=400)


#############################################################################################################################################
######## MercadoPago ########
class MercadoPagoView(APIView):
    def post(self, request):
        try:
            request_values = json.loads(request.body)
            payment_data = {
                "transaction_amount": float(request_values("transaction_amount")),
                "token": request_values["token"],
                # "description": request.POST.get("description"),
                "installments": int(request_values["installments"]),
                "payment_method_id": request_values["payment_method_id"],
                "payer": {
                    "email": request_values["payer"]["email"],
                    "identification": {
                        "type": request_values["payer"]["identification"]["type"],
                        "number": request_values["payer"]["identification"]["number"],
                    },
                },
            }
            
            sdk = mercadopago.SDK("")

            # Crea el PAYMENT_RESPONSE
            payment_response = sdk.payment().create(payment_data)
            payment = payment_response["response"]
            status = {
                "id" : payment["id"],
                "status": payment["status"],
                "status_detail": payment["status_detail"]
            }

            # Retorna el PAYMENT_RESPONSE
            return Response(data={"body":status, "statusCode": payment_response["status"]}, status=201)

        except Exception as e:
            return Response(data={"body":payment_response}, status=201)


# Le devolvemos al usuario que el pago fue exitoso mediante un JSON
class PagoExitosoView(APIView):
    def get(self, request):
        return Response({"pago":"aprobado"})
