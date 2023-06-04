import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { GoogleMapsModule } from '@angular/google-maps'
import { AppComponent } from './app.component';
import { LayoutModule } from './layout/layout.module';
import { DatePipe } from '@angular/common';
import { HttpClientModule } from '@angular/common/http';
// import { PagesModule } from './pages/pages.module';

@NgModule({
  declarations: [
    AppComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    LayoutModule,
    GoogleMapsModule,
    HttpClientModule
    // PagesModule
  ],
  providers: [DatePipe],
  bootstrap: [AppComponent]
})
export class AppModule { }
