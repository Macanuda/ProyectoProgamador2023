import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './pages/home/home.component';
import { ContactoComponent } from './pages/contacto/contacto.component';

const routes: Routes = [
  { path: 'inicio', component: HomeComponent },
  { path: '', redirectTo: 'inicio', pathMatch: 'full' },

  {
    path: '',
    loadChildren: () => import('./pages/mascotas/mascotas.module').then(m => m.MascotasModule)
  },

  {
    path: '',
    loadChildren: () => import('./pages/veterinarias/veterinarias.module').then(m=>m.VeterinariasModule)
  },

  {
    path:'',
    loadChildren:()=>import('./pages/cuidados/cuidados.module').then(m=>m.CuidadosModule)
  },

  {
    path:'',
    loadChildren:()=>import('./pages/comunidad/comunidad.module').then(m=>m.ComunidadModule)
  },

  { path: 'contacto', component: ContactoComponent }

  // { path: '**', redirectTo: 'registro' },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
