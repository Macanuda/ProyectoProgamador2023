import { ComponentFixture, TestBed } from '@angular/core/testing';

import { VetItemAdomicilioComponent } from './vet-item-adomicilio.component';

describe('VetItemAdomicilioComponent', () => {
  let component: VetItemAdomicilioComponent;
  let fixture: ComponentFixture<VetItemAdomicilioComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ VetItemAdomicilioComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(VetItemAdomicilioComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
