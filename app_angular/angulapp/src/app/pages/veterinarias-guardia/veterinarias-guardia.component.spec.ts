import { ComponentFixture, TestBed } from '@angular/core/testing';

import { VeterinariasGuardiaComponent } from './veterinarias-guardia.component';

describe('VeterinariasGuardiaComponent', () => {
  let component: VeterinariasGuardiaComponent;
  let fixture: ComponentFixture<VeterinariasGuardiaComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ VeterinariasGuardiaComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(VeterinariasGuardiaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
