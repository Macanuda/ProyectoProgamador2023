import { Component } from '@angular/core';
import { DataService } from 'src/app/data.service';
import { ActivatedRoute, Params } from '@angular/router';
import { FormBuilder, Validators } from '@angular/forms';

@Component({
  selector: 'app-checkout',
  templateUrl: './checkout.component.html',
  styleUrls: ['./checkout.component.css'],
})
export class CheckoutComponent {

  orderPlaced: any;

  productoInfo:any;

  newData:any;

  form: any;

  producto: {id: string};

  constructor(private rutaActiva: ActivatedRoute,  private data:DataService, private formBuilder: FormBuilder) {

    this.orderPlaced = true;

    this.form = this.formBuilder.group (
      {
        nombre:['',[Validators.required]],
        direccion:['',[Validators.required]],
        email:['',[Validators.required, Validators.email]]
      }
    )

    



    this.data.obtenerDatosProductos().subscribe({

      next: (data) => {
        for (let k of data) {
          if (k.nombre == this.producto) {
            this.productoInfo = k;
          }
        }
        console.log(this.productoInfo);
        
      },
      error: (errorData) => {
        console.error(errorData);
      }

    });
   }

  ngOnInit() {
    this.producto = {
      id: this.rutaActiva.snapshot.params["id"],
    };

    this.rutaActiva.params.subscribe (

      (params: Params) => {
        this.producto = params["id"];
      }
    )
  }

  get Nombre()
    {
      return this.form.get("nombre");
    }
  get Direccion()
    {
      return this.form.get("direccion");
    }
  get Email()
    {
      return this.form.get("email");
    }
  
  onEnviar(event: Event) {
    
    event.preventDefault;

    if (this.form.valid) 
    {
      this.orderPlaced = false;
      console.log(this.Nombre)
    }
    else
    {
      this.form.markAllAsTouched();
    }


  }

}
