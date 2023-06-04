import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { IniciarSesionComponent } from './iniciar-sesion/iniciar-sesion.component';
import { RegistroComponent } from './iniciar-sesion/registro/registro.component';

const routes: Routes = [
  {
    path:'usuario',
    children:[
      {path:'iniciar-sesion', component: IniciarSesionComponent},
      {path:'registro/crear-cuenta',component:RegistroComponent},
    ]
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class UsuariosRoutingModule { }
