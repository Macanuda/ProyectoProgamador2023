import { Component, OnInit } from '@angular/core';
import { DataService } from 'src/app/data.service';
import { ActivatedRoute, Params } from '@angular/router';

@Component({
  selector: 'app-paseador',
  templateUrl: './paseador.component.html',
  styleUrls: ['./paseador.component.css']
})
export class PaseadorComponent implements OnInit {
  paseadorInfo:any;

  newData:any;

  paseador: {id: string};

  

  constructor(private rutaActiva: ActivatedRoute,  private data:DataService) {
    this.data.obtenerDatosPaseadores().subscribe({

      next: (data) => {
        for (let k of data) {
          if (k.nombre+k.apellido == this.paseador) {
            this.paseadorInfo = k;
          }
        }
        console.log(this.paseadorInfo);
        
      },
      error: (errorData) => {
        console.error(errorData);
      }

    });
   }

  ngOnInit() {
    this.paseador = {
      id: this.rutaActiva.snapshot.params["id"],
    };

    this.rutaActiva.params.subscribe (

      (params: Params) => {
        this.paseador = params["id"];
      }
    )
  }
  
}
