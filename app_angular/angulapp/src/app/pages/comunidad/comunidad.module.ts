import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ComunidadRoutingModule } from './comunidad-routing.module';
import { FeedComponent } from './feed/feed.component';


@NgModule({
  declarations: [
    FeedComponent
  ],
  imports: [
    CommonModule,
    ComunidadRoutingModule
  ]
})
export class ComunidadModule { }
