import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { DashboardComponent } from './dashboard/dashboard.component';
import { HomeComponent } from './home/home.component';
import { ContactoComponent } from './contacto/contacto.component';
import { CuidadosPaseadoresComponent } from './cuidados-paseadores/cuidados-paseadores.component';
import { CuidadosPeluqueriaComponent } from './cuidados-peluqueria/cuidados-peluqueria.component';
import { MascotasComponent } from './mascotas/mascotas.component';
import { PaseadorComponent } from './paseador/paseador.component';
import { UserComponent } from './user/user.component';
import { VeterinariaComponent } from './veterinaria/veterinaria.component';
import { Veterinaria2Component } from './veterinaria2/veterinaria2.component';
import { VeterinariasComponent } from './veterinarias/veterinarias.component';
import { VeterinariasGuardiaComponent } from './veterinarias-guardia/veterinarias-guardia.component';



@NgModule({
  declarations: [
    DashboardComponent,
    HomeComponent,
    ContactoComponent,
    CuidadosPaseadoresComponent,
    CuidadosPeluqueriaComponent,
    MascotasComponent,
    PaseadorComponent,
    UserComponent,
    VeterinariaComponent,
    Veterinaria2Component,
    VeterinariasComponent,
    VeterinariasGuardiaComponent
  ],
  imports: [
    CommonModule
  ],
  exports: [
    DashboardComponent
  ]
})
export class PagesModule { }
