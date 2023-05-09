from django.db import models


class Reserva(models.Model):
    titulo = models.CharField(max_length=100)
    fecha = models.DateTimeField()
