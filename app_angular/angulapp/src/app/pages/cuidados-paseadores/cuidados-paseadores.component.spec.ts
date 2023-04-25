import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CuidadosPaseadoresComponent } from './cuidados-paseadores.component';

describe('CuidadosPaseadoresComponent', () => {
  let component: CuidadosPaseadoresComponent;
  let fixture: ComponentFixture<CuidadosPaseadoresComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ CuidadosPaseadoresComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(CuidadosPaseadoresComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
