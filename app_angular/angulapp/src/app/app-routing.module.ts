import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './pages/home/home.component';

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

  // { path: '**', redirectTo: 'registro' },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
