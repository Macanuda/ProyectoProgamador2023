import { Component } from '@angular/core';
import { DataService } from 'src/app/data.service';

@Component({
  selector: 'app-pas-item',
  templateUrl: './pas-item.component.html',
  styleUrls: ['./pas-item.component.css'],
  host: {'class': 'row'}
})
export class PasItemComponent {
  paseadores:any;

  constructor(private data:DataService){
    this.data.obtenerDatosPaseadores().subscribe({

      next: (data) => {
        this.paseadores = data;
      },
      error: (errorData) => {
        console.error(errorData);
      }

    });
  }

}
