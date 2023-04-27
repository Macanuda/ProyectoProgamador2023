import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { VeterinariasRoutingModule } from './veterinarias-routing.module';
import { MasCercanasComponent } from './mas-cercanas/mas-cercanas.component';
import { ADomicilioComponent } from './a-domicilio/a-domicilio.component';
import { DeGuardiaComponent } from './de-guardia/de-guardia.component';


@NgModule({
  declarations: [
    MasCercanasComponent,
    ADomicilioComponent,
    DeGuardiaComponent
  ],
  imports: [
    CommonModule,
    VeterinariasRoutingModule
  ]
})
export class VeterinariasModule { }
