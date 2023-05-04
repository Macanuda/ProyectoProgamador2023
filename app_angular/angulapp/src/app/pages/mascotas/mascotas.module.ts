import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { MascotasRoutingModule } from './mascotas-routing.module';
import { InformacionMascotasComponent } from './informacion-mascotas/informacion-mascotas.component';
import { AlimentacionComponent } from './alimentacion/alimentacion.component';
import { VacunasComponent } from './vacunas/vacunas.component';
import { CuidadosGeneralesComponent } from './cuidados-generales/cuidados-generales.component';


@NgModule({
  declarations: [
    InformacionMascotasComponent,
    AlimentacionComponent,
    VacunasComponent,
    CuidadosGeneralesComponent
  ],
  imports: [
    CommonModule,
    MascotasRoutingModule
  ]
})
export class MascotasModule { }
