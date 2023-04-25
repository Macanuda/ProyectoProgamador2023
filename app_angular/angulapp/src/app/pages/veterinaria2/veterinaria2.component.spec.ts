import { ComponentFixture, TestBed } from '@angular/core/testing';

import { Veterinaria2Component } from './veterinaria2.component';

describe('Veterinaria2Component', () => {
  let component: Veterinaria2Component;
  let fixture: ComponentFixture<Veterinaria2Component>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ Veterinaria2Component ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(Veterinaria2Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
