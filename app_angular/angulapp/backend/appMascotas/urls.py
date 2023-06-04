from django.urls import path
from appMascotas.views import LoginView, LogoutView, SignUpView, InicioView, ProductosView, ProfileView, verProductos, agregarProducto, ListarUsuarios, CreateTokenView, UpdateUserView
from django.views.generic import RedirectView
from . import views

urlpatterns = [
    path('api/auth/login/', LoginView.as_view(), name='auth_login'),
    path('api/auth/logout/', LogoutView.as_view(), name='auth_logout'),
    path('api/auth/signup/', SignUpView.as_view(), name='auth_signup'),
    path('api/create/', CreateTokenView.as_view(), name='create_token' ),
    path('api/update/', UpdateUserView.as_view(), name='update_user' ),

    path('api/usuarios/listar/', ListarUsuarios.as_view(), name='listar_usuarios'),
    path('api/user/profile/', ProfileView.as_view(), name='profile'),


    path('api/productos/', ProductosView.as_view(), name='productos'),
    path('api/productos/ver/', verProductos.as_view({'get': 'list'}), name='ver_productos'),
    path('api/productos/agregar/', agregarProducto.as_view(), name='agregar_producto'),


    path('inicio/', views.InicioView , name='inicio'),
    path('', RedirectView.as_view(pattern_name='inicio', permanent=False)),
]