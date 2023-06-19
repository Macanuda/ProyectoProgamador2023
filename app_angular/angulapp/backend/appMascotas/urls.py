from django.urls import path, include
from appMascotas.views import LoginView, LogoutView, SignUpView, ProductosView, ProfileView, VerProductosView, AgregarProductoView, ListarUsuariosView, CreateTokenView, UpdateUserView, MercadoPagoView, PagoExitosoView
from rest_framework import routers
from knox import views as knox_views



router = routers.DefaultRouter()
router.register(r'productos', VerProductosView)


urlpatterns = [
    
    path('', include(router.urls)),

    # Sign up - login - logout
    path('login/', LoginView.as_view(), name='auth_login'),
    path('logout/', knox_views.LogoutView.as_view(), name='auth_logout'),
    path('signup/', SignUpView.as_view(), name='auth_signup'),
    path('update-user/', UpdateUserView.as_view(), name='update_user'),

    # Token
    path('create-token/', CreateTokenView.as_view(), name='create_token' ),

    # Usuarios
    path('usuarios/listar/', ListarUsuariosView.as_view(), name='listar_usuarios'),
    path('user/profile/', ProfileView.as_view(), name='profile'),

    # Productos
    path('productos/', ProductosView.as_view(), name='productos'),
    path('productos/ver/', VerProductosView.as_view({'get': 'list'}), name='ver_productos'),
    path('productos/agregar/', AgregarProductoView.as_view(), name='agregar_producto'),

    # MercadoPago
    path('mercadopago/', MercadoPagoView.as_view(), name='mercadopago'),
    path('pago-exitoso/', PagoExitosoView.as_view(), name='pago_exitoso'),
]

