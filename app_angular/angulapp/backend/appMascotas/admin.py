# SUPERUSER: 
# root
# 123456

from django.contrib import admin
from .models import *

#COMUNIDAD
class ComunidadAdmin(admin.ModelAdmin):
    list_display = ('nombre',)
#POSTEO
class PosteoAdmin(admin.ModelAdmin):
    list_display = ('titulo','contenido','imagen','url','comentario','fecha','fk_comunidad')
#GRUPO
class GrupoAdmin(admin.ModelAdmin):
    list_display = ('nombre_grupo','contenido','imagen','imagen_url','comentarios','fecha')
#AVATAR
class AvatarAdmin(admin.ModelAdmin):
    list_display = ('avatar','fk_peluqueria','fk_veterinaria','fk_paseador','fk_dueno_mascota')
#PASEADOR
class PaseadorAdmin(admin.ModelAdmin):
    list_display = ('nombre','usuario','email','clave','pais','provincia','localidad','calle','numero','servicios','fk_posteo','fk_comunidad')
# PELUQUERIA CANINA
class PeluqueriaCaninaAdmin(admin.ModelAdmin):
    list_display = (
        'nombre_peluqueria', 'usuario', 'email', 'clave', 'pais', 'provincia', 'localidad', 'calle', 'numero',
        'productos', 'servicios', 'fk_comunidad', 'fk_factura'
    )
# VETERINARIA
class VeterinariaAdmin(admin.ModelAdmin):
    list_display = (
        'nombre_veterinaria', 'usuario', 'email', 'clave', 'pais', 'provincia', 'localidad', 'calle', 'numero',
        'productos', 'servicios', 'fk_comunidad'
    )
# DUENO MASCOTA
class DuenoMascotaAdmin(admin.ModelAdmin):
    list_display = (
        'nombre', 'usuario', 'email', 'clave', 'pais', 'provincia', 'localidad', 'calle', 'numero', 'fk_veterinaria',
        'fk_peluqueria', 'fk_paseador', 'fk_comunidad'
    )
# FACTURA
class FacturaAdmin(admin.ModelAdmin):
    list_display = ('fecha', 'fecha_vencimiento', 'total', 'tipo', 'forma_pago', 'fk_dueno_mascota', 'fk_veterinaria',
                    'fk_peluquerias')
# PRODUCTO
class ProductoAdmin(admin.ModelAdmin):
    list_display = (
        'codigo_barra', 'producto', 'descripcion', 'precio', 'id_categoria', 'id_fabricante', 'stock_disponible',
        'imagen', 'fk_veterinaria'
    )
# RESERVA
class ReservaAdmin(admin.ModelAdmin):
    list_display = ('titulo', 'fecha', 'fk_dueno_mascota', 'fk_veterinaria', 'fk_peluqueria', 'fk_paseador')
# REGISTRO MASCOTA
class RegistroMascotaAdmin(admin.ModelAdmin):
    list_display = ('nombre', 'nacimiento', 'especie_animal', 'raza', 'peso', 'altura', 'patologia')
# MASCOTA
class MascotaAdmin(admin.ModelAdmin):
    list_display = (
        'especie_animal', 'raza', 'peso_recomendado', 'actividad_fisica', 'clima_recomendado', 'alimentacion',
        'esperanza_vida', 'numero', 'patologia', 'vacunas', 'fk_registro_mascota', 'fk_dueno')

#REGISTROS
admin.site.register(Comunidad,ComunidadAdmin)
admin.site.register(Posteo, PosteoAdmin)
admin.site.register(Grupo, GrupoAdmin)
admin.site.register(Avatar, AvatarAdmin)
admin.site.register(Paseador, PaseadorAdmin)
admin.site.register(PeluqueriaCanina, PeluqueriaCaninaAdmin)
admin.site.register(Veterinaria, VeterinariaAdmin)
admin.site.register(DuenoMascota, DuenoMascotaAdmin)
admin.site.register(Factura, FacturaAdmin)
admin.site.register(Producto, ProductoAdmin)
admin.site.register(Reserva, ReservaAdmin)
admin.site.register(RegistroMascota, RegistroMascotaAdmin)
admin.site.register(Mascota, MascotaAdmin)
admin.site.register(Servicio)

