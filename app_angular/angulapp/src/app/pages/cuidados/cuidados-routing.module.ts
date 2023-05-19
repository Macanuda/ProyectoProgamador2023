import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { PaseadorComponent } from './paseador/paseador.component';
import { PaseadoresComponent } from './paseadores/paseadores.component';
import { PeluqueriasCaninasComponent } from './peluquerias-caninas/peluquerias-caninas.component';
import { CuidadosComponent } from './cuidados/cuidados.component';

const routes: Routes = [
  {path:'cuidados',
  children:[
    {path:'cuidados', component: CuidadosComponent},
    {path:'paseadores',component:PaseadoresComponent},
    {path:'peluquerias-caninas',component:PeluqueriasCaninasComponent},
    {path:'paseador/:id',component:PaseadorComponent},
  ]
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class CuidadosRoutingModule { }
