from django.db import models


class Mascota(models.Model):
    especie_animal = models.CharField(max_length=100)
    raza = models.CharField(max_length=100)
    peso_recomendado = models.DecimalField(decimal_places=2)
    actividad_fisica = models.CharField(max_length=255)
    clima_recomendado = models.CharField(max_length=200)
    alimentacion = models.TextField(max_length=1000)
    esperanza_vida = models.CharField(max_length=200)
    numero = models.CharField(max_length=200)
    patologia = models.CharField(max_length=200)
    vacunas = models.CharField(max_length=255)



