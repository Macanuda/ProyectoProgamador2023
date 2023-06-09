import { Component } from '@angular/core';
import { DataService } from 'src/app/data.service';
import { ActivatedRoute, Params } from '@angular/router';

@Component({
  selector: 'app-peluqueria',
  templateUrl: './peluqueria.component.html',
  styleUrls: ['./peluqueria.component.css']
})
export class PeluqueriaComponent {

  peluqueriaInfo:any;

  newData:any;

  peluqueria: {id: string};

  

  constructor(private rutaActiva: ActivatedRoute,  private data:DataService) {
    this.data.obtenerDatosPeluquerias().subscribe({

      next: (data) => {
        for (let k of data) {
          if (k.nombre == this.peluqueria) {
            this.peluqueriaInfo = k;
          }
        }
        console.log(this.peluqueriaInfo);
        
      },
      error: (errorData) => {
        console.error(errorData);
      }

    });
   }

  ngOnInit() {
    this.peluqueria = {
      id: this.rutaActiva.snapshot.params["id"],
    };

    this.rutaActiva.params.subscribe (

      (params: Params) => {
        this.peluqueria = params["id"];
      }
    )

    console.log(this.peluqueria)
    

  }

}
