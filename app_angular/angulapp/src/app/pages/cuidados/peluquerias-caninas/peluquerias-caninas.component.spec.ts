import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PeluqueriasCaninasComponent } from './peluquerias-caninas.component';

describe('PeluqueriasCaninasComponent', () => {
  let component: PeluqueriasCaninasComponent;
  let fixture: ComponentFixture<PeluqueriasCaninasComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ PeluqueriasCaninasComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(PeluqueriasCaninasComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
