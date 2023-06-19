import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ProductoComponent } from './producto/producto.component';
import { ShopComponent } from './shop.component';
import { CheckoutComponent } from './checkout/checkout.component';

const routes: Routes = [
  {
    path:'shop', 
    children:[
      {path:'', component: ShopComponent},
      {path:'producto/:id', component: ProductoComponent},
      {path:'checkout/:id', component: CheckoutComponent},
    ]
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ShopRoutingModule { }
