# SUPERUSER: 
# root
# 123456

from django.contrib import admin
from .models import *

class ComunidadAdmin(admin.ModelAdmin):
    list_display = ('nombre',)

class PosteoAdmin(admin.ModelAdmin):
    list_display = ('titulo','contenido','imagen','url','comentario','fecha','fk_comunidad')

class GrupoAdmin(admin.ModelAdmin):
    list_display = ('nombre_grupo','contenido','imagen','imagen_url','comentarios','fecha')

class AvatarAdmin(admin.ModelAdmin):
    list_display = ('avatar','fk_peluqueria','fk_veterinaria','fk_paseador','fk_dueno_mascota')

class PaseadorAdmin(admin.ModelAdmin):
    list_display = ('nombre','usuario','email','clave','pais','provincia','localidad','calle','numero','servicios','fk_posteo','fk_comunidad')


# PELUQUERIA CANINA




admin.site.register(Comunidad,ComunidadAdmin)
admin.site.register(Posteo, PosteoAdmin)
admin.site.register(Grupo, GrupoAdmin)
admin.site.register(Avatar, AvatarAdmin)
admin.site.register(Paseador, PaseadorAdmin)

