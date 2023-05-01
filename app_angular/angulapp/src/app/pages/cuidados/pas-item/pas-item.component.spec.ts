import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PasItemComponent } from './pas-item.component';

describe('PasItemComponent', () => {
  let component: PasItemComponent;
  let fixture: ComponentFixture<PasItemComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ PasItemComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(PasItemComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
