import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

export class Usuario{
  nombreUsuario:string="";
  email:string="";
  nombre:string="";
  apellido:string="";
  password:string="";
}

@Injectable({
  providedIn: 'root'
})
export class UsuarioService {

  url="http://localhost:8000/api/auth/signup";

  constructor(private http:HttpClient) { 
    console.log('Servicio Usuarios está corriendo');
  }

  onCrearUsuario(usuario:Usuario):Observable<Usuario>{
    return this.http.post<Usuario>(this.url, usuario)
  }
}
