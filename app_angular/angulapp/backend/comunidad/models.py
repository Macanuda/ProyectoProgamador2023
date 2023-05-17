from django.db import models


class Posteo(models.Model):
    titulo = models.CharField(max_length=100)
    contenido = models.TextField(max_length=5000)
    imagen = models.ImageField()
    url = models.URLField()
    comentario = models.TextField(max_length=3000)
    fecha = models.DateTimeField()



class Grupos(models.Model):
    nombre_grupo = models.CharField(max_length=100)
    