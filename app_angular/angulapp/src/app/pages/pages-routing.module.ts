import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './home/home.component';
import { ContactoComponent } from './contacto/contacto.component';
import { CuidadosPaseadoresComponent } from './cuidados-paseadores/cuidados-paseadores.component';
import { CuidadosPeluqueriaComponent } from './cuidados-peluqueria/cuidados-peluqueria.component';

const routes: Routes = [

];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class PagesRoutingModule { }
