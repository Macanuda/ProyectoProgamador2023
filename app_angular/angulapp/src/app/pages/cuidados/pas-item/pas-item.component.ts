import { Component } from '@angular/core';
import { DataService } from 'src/app/data.service';

@Component({
  selector: 'app-pas-item',
  templateUrl: './pas-item.component.html',
  styleUrls: ['./pas-item.component.css'],
  host: {'class': 'col-lg-4 col-12 col-md-6'}
})
export class PasItemComponent {
  paseadores:any;

  constructor(private data:DataService){
    this.data.obtenerDatos().subscribe({

      next: (data) => {
        this.paseadores = data;
      },
      error: (errorData) => {
        console.error(errorData);
      }

    });
  }

}
