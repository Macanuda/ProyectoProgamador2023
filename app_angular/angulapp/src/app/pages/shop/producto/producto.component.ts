import { Component } from '@angular/core';
import { DataService } from 'src/app/data.service';
import { ActivatedRoute, Params } from '@angular/router';

@Component({
  selector: 'app-producto',
  templateUrl: './producto.component.html',
  styleUrls: ['./producto.component.css']
})
export class ProductoComponent {
  productoInfo:any;

  newData:any;

  producto: {id: string};

  constructor(private rutaActiva: ActivatedRoute,  private data:DataService) {
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
  

}
