import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DeGuardiaComponent } from './de-guardia.component';

describe('DeGuardiaComponent', () => {
  let component: DeGuardiaComponent;
  let fixture: ComponentFixture<DeGuardiaComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ DeGuardiaComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(DeGuardiaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
