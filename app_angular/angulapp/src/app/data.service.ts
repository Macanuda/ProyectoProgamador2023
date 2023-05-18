import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class DataService {
  url:string='http://localhost:3000/paseadores'

  constructor(private http:HttpClient) { }

  obtenerDatos(): Observable <any>{
    return this.http.get(this.url);
  }
}