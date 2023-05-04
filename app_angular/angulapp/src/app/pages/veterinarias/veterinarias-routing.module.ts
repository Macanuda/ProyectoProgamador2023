import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ADomicilioComponent } from './a-domicilio/a-domicilio.component';
import { DeGuardiaComponent } from './de-guardia/de-guardia.component';
import { MasCercanasComponent } from './mas-cercanas/mas-cercanas.component';
import { VeterinariaComponent } from './veterinaria/veterinaria.component';
import { VeterinariasComponent } from './veterinarias/veterinarias.component';
// import { Veterinaria2Component } from './veterinaria2/veterinaria2.component';

const routes: Routes = [
  {
    path:'veterinarias',
    children:[
      {path:'inicio-veterinarias', component: VeterinariasComponent},
      {path:'a-domicilio', component:ADomicilioComponent},
      {path:'de-guardia', component:DeGuardiaComponent},
      {path:'mas-cercanas', component:MasCercanasComponent},
      {path:'veterinaria', component:VeterinariaComponent},
      // {path:'veterinaria2', component:Veterinaria2Component},
    ]
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class VeterinariasRoutingModule { }
