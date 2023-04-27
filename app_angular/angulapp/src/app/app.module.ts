import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { LayoutModule } from './layout/layout.module';
import { PagesModule } from './pages/pages.module';
import { PaseadoresComponent } from './cuidados/paseadores/paseadores.component';
import { PeluqueriasCaninasComponent } from './cuidados/peluquerias-caninas/peluquerias-caninas.component';

@NgModule({
  declarations: [
    AppComponent,
    PaseadoresComponent,
    PeluqueriasCaninasComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    LayoutModule,
    PagesModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
