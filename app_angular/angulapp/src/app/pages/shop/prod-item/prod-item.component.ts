import { Component } from '@angular/core';
import { DataService } from 'src/app/data.service';

@Component({
  selector: 'app-prod-item',
  templateUrl: './prod-item.component.html',
  styleUrls: ['./prod-item.component.css'],
  host: {'class': 'row'}
})
export class ProdItemComponent {
  productos:any;

  constructor(private data:DataService){
    this.data.obtenerDatosProductos().subscribe({

      next: (data) => {
        this.productos = data;
      },
      error: (errorData) => {
        console.error(errorData);
      }

    });
  }
}
