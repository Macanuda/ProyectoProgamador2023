import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { CuidadosRoutingModule } from './cuidados-routing.module';
import { PaseadoresComponent } from './paseadores/paseadores.component';
import { PeluqueriasCaninasComponent } from './peluquerias-caninas/peluquerias-caninas.component';
import { CuidadosComponent } from './cuidados/cuidados.component';
import { PaseadorComponent } from './paseador/paseador.component';
import { PasItemComponent } from './pas-item/pas-item.component';
import { PelItemComponent } from './pel-item/pel-item.component';
import { PeluqueriaComponent } from './peluqueria/peluqueria.component';


@NgModule({
  declarations: [
    PaseadoresComponent,
    PeluqueriasCaninasComponent,
    PaseadorComponent,
    CuidadosComponent,
    PasItemComponent,
    PelItemComponent,
    PeluqueriaComponent
  ],
  imports: [
    CommonModule,
    CuidadosRoutingModule
  ]
})
export class CuidadosModule { }
