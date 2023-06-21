import { Component } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router'
import { LoginService, Usuario } from 'src/app/services/login.service';
import { LoginRequest } from 'src/app/services/loginRequest';

@Component({
  selector: 'app-iniciar-sesion',
  templateUrl: './iniciar-sesion.component.html',
  styleUrls: ['./iniciar-sesion.component.css']
})
export class IniciarSesionComponent {

  loginError:string='';
  loginForm:FormGroup;
  usuario: Usuario;

  constructor(private formBuilder:FormBuilder, private router:Router, private loginService:LoginService){

    this.loginForm=this.formBuilder.group({
      email:['', [Validators.required, Validators.email]],
      password:['', Validators.required]
    })


  };

  get email(){
    return this.loginForm.get('email');
  }

  get password(){
    return this.loginForm.get('password');
  }

  login(){
    if(this.loginForm.valid){
      this.loginService.login(this.loginForm.value).subscribe({
        next: (userData) => {
          console.log(userData);
        },
        error: (errorData) => {
          console.error(errorData);
          this.loginError=errorData;
        },
        complete: () => {
          console.info('Login exitoso');
          this.router.navigateByUrl('/inicio');
          this.loginForm.reset();
        }
      })
      
    }else{
      alert('Error al ingresar los datos');
      this.loginForm.markAllAsTouched();
    }
  }

  onEnviar(event:Event, usuario:Usuario): void {
    event.preventDefault;
    this.loginService.login(this.usuario).subscribe(data=>{
      console.log('DATA'+JSON.stringify(data));
      this.router.navigate(['/inicio']);
    },
    error=>{
      this.loginError = error;
    }
    );
  }

}
