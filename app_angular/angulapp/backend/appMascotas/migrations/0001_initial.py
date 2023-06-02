# Generated by Django 4.1.7 on 2023-05-17 21:48

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Avatar',
            fields=[
                ('id_avatar', models.AutoField(primary_key=True, serialize=False)),
                ('avatar', models.ImageField(default='avatars/default.jpg', upload_to='avatars')),
            ],
            options={
                'verbose_name': 'Avatar del usuario',
                'verbose_name_plural': 'Avatars de los usuarios',
                'db_table': 'Avatar',
            },
        ),
        migrations.CreateModel(
            name='DuenoMascota',
            fields=[
                ('id_dueno_mascota', models.AutoField(primary_key=True, serialize=False)),
                ('nombre', models.CharField(max_length=100)),
                ('usuario', models.CharField(max_length=50)),
                ('email', models.EmailField(max_length=254)),
                ('clave', models.CharField(max_length=50)),
                ('pais', models.CharField(max_length=60)),
                ('provincia', models.CharField(max_length=255)),
                ('localidad', models.CharField(max_length=255)),
                ('calle', models.CharField(max_length=200)),
                ('numero', models.IntegerField()),
            ],
            options={
                'verbose_name': 'Dueño de mascota',
                'verbose_name_plural': 'Dueños de mascotas',
                'db_table': 'DuenoMascota',
            },
        ),
        migrations.CreateModel(
            name='Factura',
            fields=[
                ('id_factura', models.AutoField(primary_key=True, serialize=False)),
                ('fecha', models.DateTimeField()),
                ('fecha_vencimiento', models.DateField()),
                ('total', models.IntegerField()),
                ('tipo', models.IntegerField()),
                ('forma_pago', models.CharField(max_length=100)),
                ('id_dueno_mascota', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='appMascotas.duenomascota')),
            ],
            options={
                'verbose_name': 'Factura de la compra',
                'verbose_name_plural': 'Facturas de las compras',
                'db_table': 'Factura',
            },
        ),
        migrations.CreateModel(
            name='Grupo',
            fields=[
                ('id_grupo', models.AutoField(primary_key=True, serialize=False)),
                ('nombre_grupo', models.CharField(max_length=100)),
            ],
            options={
                'verbose_name': 'Grupo de la comunidad',
                'verbose_name_plural': 'Grupos de la comunidad',
                'db_table': 'Grupo',
            },
        ),
        migrations.CreateModel(
            name='Paseador',
            fields=[
                ('id_paseador', models.AutoField(primary_key=True, serialize=False)),
                ('nombre', models.CharField(max_length=100)),
                ('usuario', models.CharField(max_length=50)),
                ('email', models.EmailField(max_length=254)),
                ('clave', models.CharField(max_length=50)),
                ('pais', models.CharField(max_length=60)),
                ('provincia', models.CharField(max_length=255)),
                ('localidad', models.CharField(max_length=255)),
                ('calle', models.CharField(max_length=200)),
                ('numero', models.IntegerField()),
                ('servicios', models.CharField(max_length=200)),
            ],
            options={
                'verbose_name': 'Paseador de perros',
                'verbose_name_plural': 'Paseadores de perros',
                'db_table': 'Paseador',
            },
        ),
        migrations.CreateModel(
            name='PeluqueriaCanina',
            fields=[
                ('id_peluqueria', models.AutoField(primary_key=True, serialize=False)),
                ('nombre_peluqueria', models.CharField(max_length=100)),
                ('usuario', models.CharField(max_length=50)),
                ('email', models.EmailField(max_length=254)),
                ('clave', models.CharField(max_length=50)),
                ('pais', models.CharField(max_length=60)),
                ('provincia', models.CharField(max_length=255)),
                ('localidad', models.CharField(max_length=255)),
                ('calle', models.CharField(max_length=200)),
                ('numero', models.IntegerField()),
                ('productos', models.CharField(max_length=200)),
                ('servicios', models.CharField(max_length=200)),
            ],
            options={
                'verbose_name': 'Peluqueria canina',
                'verbose_name_plural': 'Peluquerias caninas',
                'db_table': 'PeluqueriaCanina',
            },
        ),
        migrations.CreateModel(
            name='Posteo',
            fields=[
                ('id_posteo', models.AutoField(primary_key=True, serialize=False)),
                ('titulo', models.CharField(max_length=100)),
                ('contenido', models.TextField(max_length=5000)),
                ('imagen', models.ImageField(upload_to='img-posteo')),
                ('url', models.URLField()),
                ('comentario', models.TextField(max_length=3000)),
                ('fecha', models.DateTimeField()),
            ],
            options={
                'verbose_name': 'Posteo en comunidad',
                'verbose_name_plural': 'Posteos en comunidad',
                'db_table': 'Posteo',
            },
        ),
        migrations.CreateModel(
            name='RegistroMascota',
            fields=[
                ('id_registro_mascota', models.AutoField(primary_key=True, serialize=False)),
                ('nombre', models.CharField(max_length=100)),
                ('nacimiento', models.DateField()),
                ('especie_animal', models.CharField(max_length=200)),
                ('raza', models.CharField(max_length=200)),
                ('peso', models.DecimalField(decimal_places=2, max_digits=5)),
                ('altura', models.DecimalField(decimal_places=2, max_digits=3)),
                ('patologia', models.CharField(max_length=255)),
            ],
            options={
                'verbose_name': 'Registro de la mascota',
                'verbose_name_plural': 'Registro de las mascotas',
                'db_table': 'RegistroMascota',
            },
        ),
        migrations.CreateModel(
            name='Veterinaria',
            fields=[
                ('id_veterinaria', models.AutoField(primary_key=True, serialize=False)),
                ('nombre_veterinaria', models.CharField(max_length=100)),
                ('usuario', models.CharField(max_length=50)),
                ('email', models.EmailField(max_length=254)),
                ('clave', models.CharField(max_length=50)),
                ('pais', models.CharField(max_length=60)),
                ('provincia', models.CharField(max_length=255)),
                ('localidad', models.CharField(max_length=255)),
                ('calle', models.CharField(max_length=200)),
                ('numero', models.IntegerField()),
                ('productos', models.CharField(max_length=200)),
                ('servicios', models.CharField(max_length=200)),
                ('id_comunidad', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='appMascotas.posteo')),
                ('id_factura', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='appMascotas.factura')),
            ],
            options={
                'verbose_name': 'Veterinaria',
                'verbose_name_plural': 'Veterinarias',
                'db_table': 'Veterinaria',
            },
        ),
        migrations.CreateModel(
            name='Servicio',
            fields=[
                ('id_servicio', models.AutoField(primary_key=True, serialize=False)),
                ('servicio', models.CharField(max_length=150)),
                ('a_domicilio', models.CharField(max_length=150)),
                ('cercanas', models.CharField(max_length=150)),
                ('de_guardia', models.CharField(max_length=150)),
                ('id_dueno_mascota', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='appMascotas.duenomascota')),
                ('id_paseador', models.ManyToManyField(to='appMascotas.paseador')),
                ('id_peluqueria', models.ManyToManyField(to='appMascotas.peluqueriacanina')),
                ('id_veterinaria', models.ManyToManyField(to='appMascotas.veterinaria')),
            ],
            options={
                'verbose_name': 'Servicio',
                'verbose_name_plural': 'Servicios',
                'db_table': 'Servicio',
            },
        ),
        migrations.CreateModel(
            name='Reserva',
            fields=[
                ('id_reserva', models.AutoField(primary_key=True, serialize=False)),
                ('titulo', models.CharField(max_length=100)),
                ('fecha', models.DateTimeField()),
                ('id_dueno_mascota', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='appMascotas.duenomascota')),
                ('id_paseador', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='appMascotas.paseador')),
                ('id_peluqueria', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='appMascotas.peluqueriacanina')),
                ('id_veterinaria', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='appMascotas.veterinaria')),
            ],
            options={
                'verbose_name': 'Reserva del servicio',
                'verbose_name_plural': 'Reservas de los servicios',
                'db_table': 'Reserva',
            },
        ),
        migrations.CreateModel(
            name='Producto',
            fields=[
                ('codigo_barra', models.IntegerField(primary_key=True, serialize=False)),
                ('producto', models.CharField(max_length=255)),
                ('descripcion', models.TextField(max_length=500)),
                ('precio', models.IntegerField()),
                ('id_categoria', models.IntegerField()),
                ('id_fabricante', models.IntegerField()),
                ('stock_disponible', models.IntegerField()),
                ('imagen', models.ImageField(upload_to='img-producto')),
                ('id_veterinaria', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='appMascotas.veterinaria')),
            ],
            options={
                'verbose_name': 'Producto',
                'verbose_name_plural': 'Productos',
                'db_table': 'Proucto',
            },
        ),
        migrations.AddField(
            model_name='peluqueriacanina',
            name='id_comunidad',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='appMascotas.posteo'),
        ),
        migrations.AddField(
            model_name='paseador',
            name='id_comunidad',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='appMascotas.posteo'),
        ),
        migrations.CreateModel(
            name='Mascota',
            fields=[
                ('id_mascota', models.AutoField(primary_key=True, serialize=False)),
                ('especie_animal', models.CharField(max_length=100)),
                ('raza', models.CharField(max_length=100)),
                ('peso_recomendado', models.DecimalField(decimal_places=2, max_digits=5)),
                ('actividad_fisica', models.CharField(max_length=255)),
                ('clima_recomendado', models.CharField(max_length=200)),
                ('alimentacion', models.TextField(max_length=1000)),
                ('esperanza_vida', models.CharField(max_length=200)),
                ('numero', models.CharField(max_length=200)),
                ('patologia', models.CharField(max_length=200)),
                ('vacunas', models.CharField(max_length=255)),
                ('id_dueno_mascota', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='appMascotas.duenomascota')),
                ('id_paseador', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='appMascotas.paseador')),
                ('id_peluqueria', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='appMascotas.peluqueriacanina')),
                ('id_registro_mascota', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='appMascotas.registromascota')),
                ('id_veterinaria', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='appMascotas.veterinaria')),
            ],
            options={
                'verbose_name': 'Mascota',
                'verbose_name_plural': 'Mascotas',
                'db_table': 'Mascota',
            },
        ),
        migrations.AddField(
            model_name='factura',
            name='id_veterinaria',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='appMascotas.veterinaria'),
        ),
        migrations.AddField(
            model_name='duenomascota',
            name='id_comunidad',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='appMascotas.posteo'),
        ),
        migrations.AddField(
            model_name='duenomascota',
            name='id_factura',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='appMascotas.factura'),
        ),
        migrations.AddField(
            model_name='duenomascota',
            name='id_paseador',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='appMascotas.paseador'),
        ),
        migrations.AddField(
            model_name='duenomascota',
            name='id_peluqueria',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='appMascotas.peluqueriacanina'),
        ),
        migrations.AddField(
            model_name='duenomascota',
            name='id_veterinaria',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='appMascotas.veterinaria'),
        ),
    ]
