import { ComponentFixture, TestBed } from '@angular/core/testing';

import { VetItemComponent } from './vet-item.component';

describe('VetItemComponent', () => {
  let component: VetItemComponent;
  let fixture: ComponentFixture<VetItemComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ VetItemComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(VetItemComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
