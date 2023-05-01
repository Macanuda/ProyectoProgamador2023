import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ADomicilioComponent } from './a-domicilio.component';

describe('ADomicilioComponent', () => {
  let component: ADomicilioComponent;
  let fixture: ComponentFixture<ADomicilioComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ADomicilioComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ADomicilioComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
