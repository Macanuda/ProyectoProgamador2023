import { ComponentFixture, TestBed } from '@angular/core/testing';

import { VetItemGuardiaComponent } from './vet-item-guardia.component';

describe('VetItemGuardiaComponent', () => {
  let component: VetItemGuardiaComponent;
  let fixture: ComponentFixture<VetItemGuardiaComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ VetItemGuardiaComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(VetItemGuardiaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
