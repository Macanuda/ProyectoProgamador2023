from django.contrib.auth import authenticate, login, logout

from rest_framework import status, generics, authentication, permissions, viewsets, status
from rest_framework.generics import GenericAPIView
from rest_framework.permissions import IsAdminUser, AllowAny, IsAuthenticated
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.authtoken.models import Token
from rest_framework.authtoken.views import ObtainAuthToken

from .models import Producto, CustomUser, Veterinaria
from .serializers import ProductoSerializer, AuthTokenSerializer, SignUpSerializer, UserSerializer, VeterinariaSerializer

from knox.models import AuthToken
from knox.views import LoginView as KnoxLoginView

import mercadopago
import json

#### Login ####
class LoginView(KnoxLoginView):
    permission_classes = (permissions.AllowAny,)

    def post(self, request, format=None):
        serializer = AuthTokenSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        user = serializer.validated_data['user']
        login(request, user)
        return super(LoginView, self).post(request, format=None)

#### Logout ####
class LogoutView(APIView):
    def post(self, request):
        # Borramos de la request la información de sesión
        logout(request)
        return Response(status=status.HTTP_200_OK)
    

class SignUpView(GenericAPIView):
    serializer_class = SignUpSerializer
    
    def post(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)

        serializer.is_valid(raise_exception=True)
        user = serializer.save()
        return Response({
            'user': UserSerializer(user, context=self.get_serializer_context()).data,
            'token': AuthToken.objects.create(user[1])
        })



#### Obtener y actualizar el perfil ####
class ProfileView(generics.RetrieveUpdateAPIView):
    permission_classes = [IsAuthenticated]
    serializer_class = UserSerializer
    http_method_names = ['get', 'patch']
    def get_object(self):
        if self.request.user.is_authenticated:
            return self.request.user
        
########################################################################################################################################
#### Obtener veterinarias ####
class VeterinariasView(APIView):
    permission_classes = (permissions.AllowAny,)

    def get(self, request):
        veterinarias = Veterinaria.objects.all()
        serializer = VeterinariaSerializer(veterinarias, many=True)   
        return Response(serializer.data, status=status.HTTP_200_OK)

#### Obtener productos ####
class ProductosView(APIView):
    def get(self, request):
        # Lógica para obtener productos
        return Response("Obteniendo productos", status=status.HTTP_200_OK)

#### Ver productos ####
class VerProductosView(viewsets.ModelViewSet):
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
