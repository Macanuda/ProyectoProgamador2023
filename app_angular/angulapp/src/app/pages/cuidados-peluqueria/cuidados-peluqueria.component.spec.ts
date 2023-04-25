import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CuidadosPeluqueriaComponent } from './cuidados-peluqueria.component';

describe('CuidadosPeluqueriaComponent', () => {
  let component: CuidadosPeluqueriaComponent;
  let fixture: ComponentFixture<CuidadosPeluqueriaComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ CuidadosPeluqueriaComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(CuidadosPeluqueriaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
