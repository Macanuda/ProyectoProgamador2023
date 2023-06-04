import { ComponentFixture, TestBed } from '@angular/core/testing';

import { InformacionMascotasComponent } from './informacion-mascotas.component';

describe('InformacionMascotasComponent', () => {
  let component: InformacionMascotasComponent;
  let fixture: ComponentFixture<InformacionMascotasComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ InformacionMascotasComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(InformacionMascotasComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
