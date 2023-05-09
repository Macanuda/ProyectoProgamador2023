from django.db import models


class Veterinaria(models.Model):
    nombre_veterinaria = models.CharField(max_length=100)
    usuario = models.CharField(max_length=50)
    email = models.EmailField()
    clave = models.CharField(max_length=50)
    pais = models.CharField(max_length=60)
    provincia = models.CharField(max_length=255)
    localidad = models.CharField(max_length=255)
    calle = models.CharField(max_length=200)
    numero = models.IntegerField()
    productos = models.CharField(max_length=200)
    servicios = models.CharField(max_length=200)


class PeluqueriaCanina(models.Model):
    nombre_peluqueria = models.CharField(max_length=100)
    usuario = models.CharField(max_length=50)
    email = models.EmailField()
    clave = models.CharField(max_length=50)
    pais = models.CharField(max_length=60)
    provincia = models.CharField(max_length=255)
    localidad = models.CharField(max_length=255)
    calle = models.CharField(max_length=200)
    numero = models.IntegerField()
    productos = models.CharField(max_length=200)
    servicios = models.CharField(max_length=200)


class Paseador(models.Model):
    nombre = models.CharField(max_length=100)
    usuario = models.CharField(max_length=50)
    email = models.EmailField()
    clave = models.CharField(max_length=50)
    pais = models.CharField(max_length=60)
    provincia = models.CharField(max_length=255)
    localidad = models.CharField(max_length=255)
    calle = models.CharField(max_length=200)
    numero = models.IntegerField()
    servicios = models.CharField(max_length=200)


# ---------- Servicios ----------
class Servicio(models.Model):
    servicio = models.CharField(max_length=100)
    a_domicilio = models.CharField(max_length=100)
    cercanas = models.CharField(max_length=100)
    de_guardia = models.CharField(max_length=100)


class PaseadorServicio(models.Model):
    pass


class VeterinariaServicio(models.Model):
    pass


class PeluqueriaCaninaServicio(models.Model):
    pass


class DuenoMascotaServicio(models.Model):
    pass


class Producto(models.Model):
    producto = models.CharField(max_length=255)
    descripcion = models.TextField(max_length=500)
    precio = models.IntegerField()
    id_categoria = models.IntegerField()
    id_fabricante = models.IntegerField()
    stock_disponible = models.IntegerField()
    imagen = models.ImageField()


class Factura(models.Model):
    fecha = models.DateTimeField()
    fecha_vencimiento = models.DateField()
    total = models.IntegerField()
    tipo = models.IntegerField()
    forma_pago = models.CharField(max_length=100)
