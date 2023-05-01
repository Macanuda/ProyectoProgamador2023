import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AlimentacionComponent } from './alimentacion/alimentacion.component';
import { CuidadosGeneralesComponent } from './cuidados-generales/cuidados-generales.component';
import { InformacionMascotasComponent } from './informacion-mascotas/informacion-mascotas.component';
import { VacunasComponent } from './vacunas/vacunas.component';

const routes: Routes = [
  {
    path:'mascotas',
    children:[
      {path:'alimentacion', component:AlimentacionComponent},
      {path:'cuidados-generales', component: CuidadosGeneralesComponent},
      {path:'informacion-mascotas', component: InformacionMascotasComponent},
      {path:'vacunas', component: VacunasComponent},
    ]
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class MascotasRoutingModule { }
