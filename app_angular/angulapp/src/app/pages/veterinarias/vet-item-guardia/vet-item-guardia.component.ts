import { Component } from '@angular/core';
import { DataService } from 'src/app/data.service';
import { Router } from '@angular/router'

@Component({
  selector: 'app-vet-item-guardia',
  templateUrl: './vet-item-guardia.component.html',
  styleUrls: ['./vet-item-guardia.component.css']
})
export class VetItemGuardiaComponent {
  veterinarias:any;

  veterinaria: {id: string};

  constructor(private rutaActiva: Router, private data:DataService){
    const now = new Date();
    let current_day = now.getDay();


    this.data.obtenerDatosVeterinaria().subscribe({
      
      next: (data) => {
        for (let k of data) {

          const [day, month, year] = now.toLocaleDateString().split('/');
          const [hoursF, minutesF] = k.horario[current_day].from.split(':');
          const [hoursT, minutesT] = k.horario[current_day].to.split(':');
          const date_from = new Date(+year, +month-1, +day, +hoursF, +minutesF, +"00");
          const date_to = new Date(+year, +month-1, +day, +hoursT, +minutesT, +"00");

          if (k.horario[current_day].from == "cerrado" || k.horario[current_day].to == "cerrado" 
                || now < date_from || now > date_to) {
            k.open = 2
          } else {
             k.open = 1
          }
          
        }       
        this.veterinarias = data
        console.log(this.veterinarias)
      },
      error: (errorData) => {
        console.error(errorData);
      }

    });
  }

}
