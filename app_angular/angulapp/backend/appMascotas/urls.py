from django.urls import path
from appMascotas.views import LoginView, LogoutView, SignUpView, InicioView, ProductosView, ProfileView, verProductos, verCategorias, agregarProducto, ListarUsuarios
from django.views.generic import RedirectView

urlpatterns = [
    path('api/auth/login/', LoginView.as_view(), name='auth_login'),
    path('api/auth/logout/', LogoutView.as_view(), name='auth_logout'),
    path('api/auth/signup/', SignUpView.as_view(), name='auth_signup'),
    path('api/inicio/', InicioView, name='inicio'),
    path('api/productos/', ProductosView.as_view(), name='productos'),
    path('api/user/profile/', ProfileView.as_view(), name='profile'),
    path('api/productos/ver/', verProductos.as_view({'get': 'list'}), name='ver_productos'),
    path('api/categorias/ver/', verCategorias.as_view({'get': 'list'}), name='ver_categorias'),
    path('api/productos/agregar/', agregarProducto.as_view(), name='agregar_producto'),
    path('api/usuarios/listar/', ListarUsuarios.as_view(), name='listar_usuarios'),
    path('api/', RedirectView.as_view(pattern_name='inicio', permanent=False)),
]