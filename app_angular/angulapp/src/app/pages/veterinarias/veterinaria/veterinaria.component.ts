import { Component } from '@angular/core';
import { DataService } from 'src/app/data.service';
import { ActivatedRoute, Params } from '@angular/router';

@Component({
  selector: 'app-veterinaria',
  templateUrl: './veterinaria.component.html',
  styleUrls: ['./veterinaria.component.css']
})
export class VeterinariaComponent {
  veterinariaInfo:any;

  newData:any;

  veterinaria: {id: string};

  

  constructor(private rutaActiva: ActivatedRoute,  private data:DataService) {

    const now = new Date();
    let current_day = now.getDay();

    this.data.obtenerDatosVeterinaria().subscribe({

      next: (data) => {
        for (let k of data) {
          if (k.nombre == this.veterinaria) {

            const [day, month, year] = now.toLocaleDateString().split('/');
            const [hoursF, minutesF] = k.horario[current_day].from.split(':');
            const [hoursT, minutesT] = k.horario[current_day].to.split(':');
            const date_from = new Date(+year, +month-1, +day, +hoursF, +minutesF, +"00");
            const date_to = new Date(+year, +month-1, +day, +hoursT, +minutesT, +"00");

            this.veterinariaInfo = k;
            if (k.horario[current_day].from == "cerrado" || k.horario[current_day].to == "cerrado" 
                || now < date_from || now > date_to) {
              k.open = 2
              console.log("cerrado")
            } else {
               k.open = 1
               console.log("abierto")
            }
          }
        }
        
      },
      error: (errorData) => {
        console.error(errorData);
      }

    });
   }

  ngOnInit() {
    this.veterinaria = {
      id: this.rutaActiva.snapshot.params["id"],
    };

    this.rutaActiva.params.subscribe (

      (params: Params) => {
        this.veterinaria = params["id"];
      }
    )
  }

}
