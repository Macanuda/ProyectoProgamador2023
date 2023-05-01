import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { VeterinariasRoutingModule } from './veterinarias-routing.module';
import { MasCercanasComponent } from './mas-cercanas/mas-cercanas.component';
import { ADomicilioComponent } from './a-domicilio/a-domicilio.component';
import { DeGuardiaComponent } from './de-guardia/de-guardia.component';
import { VeterinariaComponent } from './veterinaria/veterinaria.component';
import { VeterinariasComponent } from './veterinarias/veterinarias.component';


@NgModule({
  declarations: [
    MasCercanasComponent,
    ADomicilioComponent,
    DeGuardiaComponent,
    VeterinariaComponent,
    VeterinariasComponent
  ],
  imports: [
    CommonModule,
    VeterinariasRoutingModule
  ]
})
export class VeterinariasModule { }
