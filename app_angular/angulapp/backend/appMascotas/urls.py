from django.urls import path
from appMascotas.views import LoginView, LogoutView, SignUpView, ProductosView, ProfileView, verProductos, agregarProducto, ListarUsuarios, CreateTokenView, UpdateUserView, MercadoPagoView, PagoExitosoView

urlpatterns = [

    # Sign up - login - logout
    path('api/auth/login/', LoginView.as_view(), name='auth_login'),
    path('api/auth/logout/', LogoutView.as_view(), name='auth_logout'),
    path('api/auth/signup/', SignUpView.as_view(), name='auth_signup'),
    path('api/update-user/', UpdateUserView.as_view(), name='update_user'),

    # Token
    path('api/create-token/', CreateTokenView.as_view(), name='create_token' ),

    # Usuarios
    path('api/usuarios/listar/', ListarUsuarios.as_view(), name='listar_usuarios'),
    path('api/user/profile/', ProfileView.as_view(), name='profile'),

    # Productos
    path('api/productos/', ProductosView.as_view(), name='productos'),
    path('api/productos/ver/', verProductos.as_view({'get': 'list'}), name='ver_productos'),
    path('api/productos/agregar/', agregarProducto.as_view(), name='agregar_producto'),

    # MercadoPago
    path('api/mercadopago/', MercadoPagoView.as_view(), name='mercadopago'),
    path('api/pago-exitoso/', PagoExitosoView.as_view(), name='pago_exitoso'),
]