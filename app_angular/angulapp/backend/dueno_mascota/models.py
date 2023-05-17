from django.db import models

class DuenoMascota(models.Model):
    nombre = models.CharField(max_length=100)
    usuario = models.CharField(max_length=50)
    email = models.EmailField()
    clave = models.CharField(max_length=50)
    pais = models.CharField(max_length=60)
    provincia = models.CharField(max_length=255)
    localidad = models.CharField(max_length=255)
    calle = models.CharField(max_length=200)
    numero = models.IntegerField()
