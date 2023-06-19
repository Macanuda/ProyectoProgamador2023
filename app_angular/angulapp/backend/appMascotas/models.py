from django.db import models
from django.contrib.auth.models import AbstractUser, AbstractBaseUser
from django.utils.timezone import now

# -------------- ABSTRACT USER --------------
class CustomUser(AbstractUser):
    email = models.EmailField(max_length=150, unique=True)
    password = models.CharField(max_length=150)
    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['username','password']

    def __str__(self):
        return self.email


# ---------------- COMUNIDAD ----------------
class Comunidad(models.Model):
    id_comunidad = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=100)

    class Meta:
        db_table = 'Comunidad'
        verbose_name = 'Comunidad'
        verbose_name_plural = 'Comunidades'
    def __str__(self):
        return self.nombre


class Posteo(models.Model):
    id_posteo = models.AutoField(primary_key=True)
    titulo = models.CharField(max_length=100, blank=False)
    contenido = models.TextField(max_length=5000, blank=False)
    imagen = models.ImageField(upload_to='img-posteo')
    url = models.URLField(null=True)
    comentario = models.TextField(max_length=3000)
    fecha = models.DateTimeField(default=now, editable=False)

    fk_comunidad = models.ForeignKey(Comunidad, on_delete=models.CASCADE, null=True)

    class Meta:
        db_table = 'Posteo'
        verbose_name = 'Posteo en comunidad'
        verbose_name_plural = 'Posteos en comunidad'
    def __str__(self):
        return self.titulo


class Grupo(models.Model):
    id_grupo = models.AutoField(primary_key=True)
    nombre_grupo = models.CharField(max_length=100, blank=False)
    contenido = models.TextField(null=True)
    imagen = models.BooleanField(null=True)
    imagen_url = models.URLField(null=True)
    comentarios = models.TextField(max_length=1000, null=True)
    fecha = models.DateField(default=now, editable=False)

    fk_comunidad = models.ForeignKey(Comunidad, on_delete=models.CASCADE, null=True)
    fk_veterinaria =  models.ManyToManyField('Veterinaria')
    fk_peluqueria = models.ManyToManyField('PeluqueriaCanina')
    fk_paseador = models.ManyToManyField('Paseador')
    fk_dueno_mascota = models.ManyToManyField('DuenoMascota')

    class Meta:
        db_table = 'Grupo'
        verbose_name = 'Grupo de la comunidad'
        verbose_name_plural = 'Grupos de la comunidad'
    def __str__(self):
        return self.nombre_grupo


class Avatar(models.Model):
    id_avatar = models.AutoField(primary_key=True)
    avatar = models.ImageField(upload_to='avatars', default='avatars/default.jpg')

    fk_peluqueria = models.ForeignKey('PeluqueriaCanina', on_delete=models.SET_NULL, null=True, default=None)
    fk_veterinaria = models.ForeignKey('Veterinaria', on_delete=models.SET_NULL, null=True, default=None)
    fk_paseador = models.ForeignKey('Paseador', on_delete=models.SET_NULL, null=True, default=None)
    fk_dueno_mascota = models.ForeignKey('DuenoMascota', on_delete=models.SET_NULL, null=True, default=None)

    class Meta:
        db_table = 'Avatar'
        verbose_name = 'Avatar del usuario'
        verbose_name_plural = 'Avatars de los usuarios'
    def __str__(self):
        return self.avatar

# ---------------- PASEADORES ----------------
class Paseador(models.Model):
    id_paseador = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=100, blank=False)
    usuario = models.CharField(max_length=50, blank=False)
    email = models.EmailField(blank=False)
    clave = models.CharField(max_length=50, blank=False)
    pais = models.CharField(max_length=60, blank=False)
    provincia = models.CharField(max_length=255, blank=False)
    localidad = models.CharField(max_length=255, blank=False)
    calle = models.CharField(max_length=200, blank=False)
    numero = models.IntegerField(blank=False)
    servicios = models.CharField(max_length=200, blank=False)

    fk_posteo = models.ForeignKey(Posteo, on_delete=models.CASCADE, null=False)
    fk_comunidad = models.ForeignKey(Comunidad, on_delete=models.CASCADE, null=True)
    fk_customUser = models.OneToOneField(CustomUser, on_delete=models.CASCADE, null=False)

    class Meta:
        db_table = 'Paseador'
        verbose_name = 'Paseador de perros'
        verbose_name_plural = 'Paseadores de perros'
    def __str__(self):
        return self.nombre


# ---------------- PELUQUERIAS CANINAS ----------------
class PeluqueriaCanina(models.Model):
    id_peluqueria = models.AutoField(primary_key=True)
    nombre_peluqueria = models.CharField(max_length=100, blank=False)
    usuario = models.CharField(max_length=50, blank=False)
    email = models.EmailField(blank=False)
    clave = models.CharField(max_length=50, blank=False)
    pais = models.CharField(max_length=60, blank=False)
    provincia = models.CharField(max_length=255, blank=False)
    localidad = models.CharField(max_length=255, blank=False)
    calle = models.CharField(max_length=200, blank=False)
    numero = models.IntegerField(blank=False)
    productos = models.CharField(max_length=200, blank=True)
    servicios = models.CharField(max_length=200, blank=True)

    fk_comunidad = models.ForeignKey(Comunidad, on_delete=models.CASCADE, null=True)
    fk_factura = models.ForeignKey('Factura', on_delete=models.CASCADE, null=True)
    fk_customUser = models.OneToOneField(CustomUser, on_delete=models.CASCADE, null=False)

    class Meta:
        db_table = 'PeluqueriaCanina'
        verbose_name = 'Peluqueria canina'
        verbose_name_plural = 'Peluquerias caninas'
    def __str__(self):
        return self.nombre_peluqueria

    # ---------------- VETERINARIAS ----------------
class Veterinaria(models.Model):
    id_veterinaria = models.AutoField(primary_key=True)
    nombre_veterinaria = models.CharField(max_length=100, blank=False)
    usuario = models.CharField(max_length=50, blank=False)
    email = models.EmailField(blank=False)
    clave = models.CharField(max_length=50, blank=False)
    pais = models.CharField(max_length=60, blank=False)
    provincia = models.CharField(max_length=255, blank=False)
    localidad = models.CharField(max_length=255, blank=False)
    calle = models.CharField(max_length=200, blank=False)
    numero = models.IntegerField(blank=False)
    productos = models.CharField(max_length=200, blank=True)
    servicios = models.CharField(max_length=200, blank=True)

    fk_comunidad = models.ForeignKey(Posteo, on_delete=models.CASCADE, null=True)
    fk_customUser = models.OneToOneField(CustomUser, on_delete=models.CASCADE, null=False)

    class Meta:
        db_table = 'Veterinaria'
        verbose_name = 'Veterinaria'
        verbose_name_plural = 'Veterinarias'
    def __str__(self):
        return self.nombre_veterinaria

# ---------------- DUEÑOS DE MASCOTAS ----------------
class DuenoMascota(models.Model):
    id_dueno_mascota = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=100, blank=False)
    usuario = models.CharField(max_length=50, blank=False)
    email = models.EmailField(blank=False)
    clave = models.CharField(max_length=50, blank=False)
    pais = models.CharField(max_length=60, blank=False)
    provincia = models.CharField(max_length=255, blank=False)
    localidad = models.CharField(max_length=255, blank=False)
    calle = models.CharField(max_length=200, blank=True)
    numero = models.IntegerField(blank=True)

    fk_veterinaria = models.ForeignKey(Veterinaria, on_delete=models.CASCADE, null=False)
    fk_peluqueria = models.ForeignKey(PeluqueriaCanina, on_delete=models.CASCADE, null=False)
    fk_paseador = models.ForeignKey(Paseador, on_delete=models.CASCADE, null=False)
    fk_comunidad = models.ForeignKey(Comunidad, on_delete=models.SET_NULL, null=True, default=None)
    fk_customUser = models.OneToOneField(CustomUser, on_delete=models.CASCADE, null=False)

    class Meta:
        db_table = 'DuenoMascota'
        verbose_name = 'Dueño de mascota'
        verbose_name_plural = 'Dueños de mascotas'
    def __str__(self):
        return self.nombre_grupo
    
    
# ---------------- FACTURA ----------------
class Factura(models.Model):
    id_factura = models.AutoField(primary_key=True)
    fecha = models.DateTimeField(default=now, editable=False, blank=False)
    fecha_vencimiento = models.DateField(blank=True)
    total = models.IntegerField(blank=False)
    tipo = models.IntegerField(blank=True)
    forma_pago = models.CharField(max_length=100, blank=True)

    fk_dueno_mascota = models.ForeignKey(DuenoMascota, on_delete=models.CASCADE, null=False)
    fk_veterinaria = models.ForeignKey(Veterinaria, on_delete=models.CASCADE, null=False)
    fk_peluquerias = models.ForeignKey(PeluqueriaCanina, on_delete=models.SET_NULL, null=True, default=None)

    class Meta:
        db_table = 'Factura'
        verbose_name = 'Factura de la compra'
        verbose_name_plural = 'Facturas de las compras'
    def __str__(self):
        return self.fecha


# ---------------- PRODUCTO ----------------
class Producto(models.Model):
    codigo_barra = models.IntegerField(primary_key=True, blank=False)
    producto = models.CharField(max_length=255, blank=False)
    descripcion = models.TextField(max_length=500, blank=True)
    precio = models.IntegerField(blank=False)
    id_categoria = models.IntegerField(blank=False)
    id_fabricante = models.IntegerField(blank=False)
    stock_disponible = models.IntegerField(blank=False)
    imagen = models.ImageField(upload_to='img-producto', default='img-producto/default.jpg')

    fk_veterinaria = models.ForeignKey(Veterinaria, on_delete=models.CASCADE, null=False)

    class Meta:
        db_table = 'Proucto'
        verbose_name = 'Producto'
        verbose_name_plural = 'Productos'
    def __str__(self):
        return self.producto

# ---------------- RESERVAS ----------------
class Reserva(models.Model):
    id_reserva = models.AutoField(primary_key=True)
    titulo = models.CharField(max_length=100, blank=False)
    fecha = models.DateTimeField(blank=False, default=now, editable=False)

    fk_dueno_mascota = models.ForeignKey(DuenoMascota, on_delete=models.CASCADE)
    fk_veterinaria = models.ForeignKey(Veterinaria, on_delete=models.CASCADE)
    fk_peluqueria = models.ForeignKey(PeluqueriaCanina, on_delete=models.CASCADE)
    fk_paseador = models.ForeignKey(Paseador, on_delete=models.CASCADE)

    class Meta:
        db_table = 'Reserva'
        verbose_name = 'Reserva del servicio'
        verbose_name_plural = 'Reservas de los servicios'
    def __str__(self):
        return self.titulo


# ---------------- REGISTRO DE MASCOTAS ----------------
class RegistroMascota(models.Model):
    id_registro_mascota = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=100, blank=False)
    nacimiento = models.DateField(blank=True)
    especie_animal = models.CharField(max_length=200, blank=False)
    raza = models.CharField(max_length=200, blank=True)
    peso = models.DecimalField(decimal_places=2, max_digits=5, blank=True)
    altura = models.DecimalField(decimal_places=2, max_digits=3, blank=True)
    patologia = models.CharField(max_length=255, blank=True)

    class Meta:
        db_table = 'RegistroMascota'
        verbose_name = 'Registro de la mascota'
        verbose_name_plural = 'Registro de las mascotas'
    def __str__(self):
        return self.nombre
    

# ---------------- MASCOTAS ----------------
class Mascota(models.Model):
    id_mascota = models.AutoField(primary_key=True)
    especie_animal = models.CharField(max_length=100, blank=False)
    raza = models.CharField(max_length=100, blank=False)
    peso_recomendado = models.DecimalField(decimal_places=2, max_digits=5, blank=False)
    actividad_fisica = models.CharField(max_length=255, blank=False)
    clima_recomendado = models.CharField(max_length=200, blank=False)
    alimentacion = models.TextField(max_length=1000, blank=False)
    esperanza_vida = models.CharField(max_length=200, blank=False)
    numero = models.CharField(max_length=200, blank=False)
    patologia = models.CharField(max_length=200, blank=False)
    vacunas = models.CharField(max_length=255, blank=False)

    fk_registro_mascota = models.ForeignKey(RegistroMascota, on_delete=models.CASCADE, null=False)
    fk_dueno_mascota = models.ForeignKey(DuenoMascota, on_delete=models.CASCADE, null=False)
    fk_veterinaria = models.ForeignKey(Veterinaria, on_delete=models.CASCADE, null=False)
    fk_peluqueria = models.ForeignKey(PeluqueriaCanina, on_delete=models.CASCADE, null=False)
    fk_paseador = models.ForeignKey(Paseador, on_delete=models.CASCADE, null=False)

    class Meta:
        db_table = 'Mascota'
        verbose_name = 'Mascota'
        verbose_name_plural = 'Mascotas'
    def __str__(self):
        return self.especie_animal


# ---------------- SERVICIOS ----------------
class Servicio(models.Model):
    id_servicio = models.AutoField(primary_key=True)
    servicio = models.CharField(max_length=150, blank=False)
    a_domicilio = models.BooleanField(default=False)
    cercanas = models.BooleanField(default=False)
    de_guardia = models.BooleanField(default=False)

    fk_dueno_mascota = models.ForeignKey(DuenoMascota, on_delete=models.CASCADE, null=False)
    fk_veterinaria = models.ManyToManyField(Veterinaria)
    fk_paseador = models.ManyToManyField(Paseador)
    fk_peluqueria = models.ManyToManyField(PeluqueriaCanina)

    class Meta:
        db_table = 'Servicio'
        verbose_name = 'Servicio'
        verbose_name_plural = 'Servicios'
    def __str__(self):
        return self.servicio
