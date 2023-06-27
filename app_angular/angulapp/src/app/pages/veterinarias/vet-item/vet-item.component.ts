import { Component } from '@angular/core';
import { DataService } from 'src/app/data.service';
import { Router } from '@angular/router'

@Component({
  selector: 'app-vet-item',
  templateUrl: './vet-item.component.html',
  styleUrls: ['./vet-item.component.css'],
  host: {'class': 'row'}
})
export class VetItemComponent {
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
        
        console.log(data)
        console.log("veterinarias encontradas")
        this.veterinarias = data;
        console.log(this.veterinarias)
        let index = 0

        if (this.rutaActiva.url == "/veterinarias/de-guardia"){
          for (let k of this.veterinarias) {
            console.log("chekeando")
            console.log(k)
            if(k.open==2) {
              console.log("borrando")
              console.log(this.veterinarias[index])
              this.veterinarias.splice(index,1);              
            }
            index++
          }


          console.log("de guardia")
          this.veterinarias.forEach((value:any,index:any)=>{
            
            
          });
        }

        if (this.rutaActiva.url == "/veterinarias/a-domicilio"){
          console.log("a domicilio")
          this.veterinarias.forEach((value:any,index:any)=>{
            console.log("checking")
            if(value.Adomicilio==0) this.veterinarias.splice(index,1);
          });
        }

       
        console.log(this.veterinarias)
      },
      error: (errorData) => {
        console.error(errorData);
      }

    });
  }


}
