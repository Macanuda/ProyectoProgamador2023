import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CuidadosGeneralesComponent } from './cuidados-generales.component';

describe('CuidadosGeneralesComponent', () => {
  let component: CuidadosGeneralesComponent;
  let fixture: ComponentFixture<CuidadosGeneralesComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ CuidadosGeneralesComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(CuidadosGeneralesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
