import { Component } from '@angular/core';
import { FormBuilder, Validators } from '@angular/forms';
import { Router } from '@angular/router';

@Component({
  selector: 'app-iniciar-sesion',
  templateUrl: './iniciar-sesion.component.html',
  styleUrls: ['./iniciar-sesion.component.css']
})
export class IniciarSesionComponent {

  loginForm=this.formBuilder.group({
    user:['', Validators.required],
    password:['', Validators.required]
  })

  constructor(private formBuilder:FormBuilder, private router:Router){};

  get user(){
    return this.loginForm.controls.user;
  }

  get password(){
    return this.loginForm.controls.password;
  }

  login(){
    if(this.loginForm.valid){
      this.router.navigateByUrl('/inicio');
      this.loginForm.reset();
    }else{
      alert('Error al ingresar los datos');
      this.loginForm.markAllAsTouched();
    }
  }

}
