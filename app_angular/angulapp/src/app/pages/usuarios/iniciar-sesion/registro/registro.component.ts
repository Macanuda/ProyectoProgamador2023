import { Component } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { UsuarioService, Usuario } from 'src/app/services/usuario.service';

@Component({
  selector: 'app-registro',
  templateUrl: './registro.component.html',
  styleUrls: ['./registro.component.css']
})
export class RegistroComponent {
  
  form:FormGroup;
  usuario:Usuario = new Usuario();

  constructor(private formBuilder:FormBuilder, enrutador:Router, private usuarioService:UsuarioService){

    this.form= this.formBuilder.group({
    nombreUsuario:['', [Validators.required]],
    email:['', [Validators.required, Validators.email]],
    nombre:['', Validators.required],
    apellido:['', [Validators.required]],
    password:['', [Validators.required, Validators.minLength(8)]],
    password2:['', [Validators.required, Validators.minLength(8)]]
    })

  };

  onEnviar(event:Event, usuario:Usuario):void{

    event.preventDefault;

    if(this.form.valid){
      console.log('Enviando al servidor...');
      alert('Usuario creado con éxito')
      console.log(usuario);
      this.usuarioService.onCrearUsuario(usuario).subscribe(
        data => {
          console.log(data);
          if(data){
            alert('Registro exitoso. A continuación, inicie sesión.');
          }
        }
      )
    }else{
      this.form.markAllAsTouched();
    }

  };

  get Password(){
    return this.form.get('password1');
  }

  get Password2(){
    return this.form.get('password2');
  }

  get Email(){
    return this.form.get('email');
  }

  get Nombre(){
    return this.form.get('nombre');
  }

  get Apellido(){
    return this.form.get('apellido');
  }

  get NombreUsuario(){
    return this.form.get('nombreUsuario');
  }

  get EmailValid(){
    return this.Email?.touched && !this.Email?.valid;
  }

  get NombreValid(){
    return this.Nombre?.touched && !this.Nombre?.valid;
  }

  get ApellidoValid(){
    return this.Apellido?.touched && !this.Apellido?.valid;
  }

  get PasswordValid(){
    return this.Password?.touched && !this.Password?.valid;
  }

  get Password2Valid(){
    return this.Password2?.touched && !this.Password2?.valid;
  }

  get NombreUsuarioValid(){
    return this.NombreUsuario?.touched && !this.NombreUsuario?.valid;
  }

}