import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable, catchError, throwError } from 'rxjs';
import { map } from 'rxjs/operators';
import { Usuario } from './usuario.service';

@Injectable({
  providedIn: 'root'
})
export class LoginService {

  currentUserSubject: BehaviorSubject<Usuario>;
  currentUser: Observable<Usuario>;
  loggedIn: any;

  constructor(private http:HttpClient) {

    console.log('Servicio de autenticación está corriendo');
    
    this.currentUserSubject = new BehaviorSubject<Usuario>
(JSON.parse(localStorage.getItem('currentUser') || '{}'));

    this.currentUser = this.currentUserSubject.asObservable();

  }

  signIn(usuario:any):Observable<any>{
    return this.http.post<any>("http://localhost:8000/api/auth/login/", usuario);
  }

  login(usuario:Usuario):Observable<any>{
    return this.http.post<any>('http://localhost:8000/api/auth/login/', usuario).pipe(
      map(data => {
        localStorage.setItem('currentUser', JSON.stringify(data));
        this.currentUserSubject.next(data);
        this.loggedIn.next(true);
        return data;
      })
    )
  }

  private handleError(error:HttpErrorResponse){
    if(error.status===0){
      console.error('Se ha producido un error', error.error);
    }
    else{
      console.error('Backend retornó el código de estado', error.status, error.error);
    }
    return throwError(()=> new Error('Algo falló. Por favor, intente nuevamente.'));
  }

  logout(): void{
    localStorage.removeItem('currentUser');
    this.loggedIn.next(false);
  }

  get usuarioAutenticado(): Usuario {
    return this.currentUserSubject.value;
  }

  get estaAutenticado(): Observable<boolean>{
    return this.loggedIn.asObservable();
  }

}
export { Usuario };

