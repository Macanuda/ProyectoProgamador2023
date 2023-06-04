import { Component } from '@angular/core';
import { DataService } from 'src/app/data.service';

@Component({
  selector: 'app-pel-item',
  templateUrl: './pel-item.component.html',
  styleUrls: ['./pel-item.component.css'],
  host: {'class': 'row'}
})
export class PelItemComponent {
  peluquerias:any;

  constructor(private data:DataService){
    this.data.obtenerDatosPeluquerias().subscribe({

      next: (data) => {
        this.peluquerias = data;
      },
      error: (errorData) => {
        console.error(errorData);
      }

    });
  }

}
