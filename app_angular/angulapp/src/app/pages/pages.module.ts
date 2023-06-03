import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { DashboardComponent } from './dashboard/dashboard.component';
import { HomeComponent } from './home/home.component';
import { ContactoComponent } from './contacto/contacto.component';
import { MascotasComponent } from './mascotas/mascotas.component';
import { VeterinariaComponent } from './veterinarias/veterinaria/veterinaria.component';
import { Veterinaria2Component } from './veterinarias/veterinaria2/veterinaria2.component';
import { VeterinariasComponent } from './veterinarias/veterinarias.component';
import { PagesRoutingModule } from './pages-routing.module';
import { RegistroComponent } from './usuarios/iniciar-sesion/registro/registro.component';
import { IniciarSesionComponent } from './usuarios/iniciar-sesion/iniciar-sesion.component';
import { PaseadoresComponent } from './cuidados/paseadores/paseadores.component';
import { PeluqueriasCaninasComponent } from './cuidados/peluquerias-caninas/peluquerias-caninas.component';
import { AlimentacionComponent } from './mascotas/alimentacion/alimentacion.component';
import { CuidadosGeneralesComponent } from './mascotas/cuidados-generales/cuidados-generales.component';
import { InformacionMascotasComponent } from './mascotas/informacion-mascotas/informacion-mascotas.component';
import { VacunasComponent } from './mascotas/vacunas/vacunas.component';
import { ADomicilioComponent } from './veterinarias/a-domicilio/a-domicilio.component';
import { DeGuardiaComponent } from './veterinarias/de-guardia/de-guardia.component';
import { MasCercanasComponent } from './veterinarias/mas-cercanas/mas-cercanas.component';

@NgModule({
  declarations: [
    DashboardComponent,
    HomeComponent,
    ContactoComponent,
    RegistroComponent,
    IniciarSesionComponent,
    AlimentacionComponent,
    CuidadosGeneralesComponent,
    InformacionMascotasComponent,
    VacunasComponent,
    MascotasComponent,
    Veterinaria2Component,
    VeterinariasComponent,
    DeGuardiaComponent,
    MasCercanasComponent,
  ],
  imports: [
    CommonModule,
    PagesRoutingModule,
  ],
  exports: [
    DashboardComponent
  ]
})
export class PagesModule { }
