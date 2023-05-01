import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { CuidadosRoutingModule } from './cuidados-routing.module';
import { PaseadoresComponent } from './paseadores/paseadores.component';
import { PeluqueriasCaninasComponent } from './peluquerias-caninas/peluquerias-caninas.component';
import { CuidadosComponent } from './cuidados/cuidados.component';
import { PaseadorComponent } from './paseador/paseador.component';


@NgModule({
  declarations: [
    PaseadoresComponent,
    PeluqueriasCaninasComponent,
    PaseadorComponent,
    CuidadosComponent
  ],
  imports: [
    CommonModule,
    CuidadosRoutingModule
  ]
})
export class CuidadosModule { }
