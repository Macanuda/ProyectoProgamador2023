import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PelItemComponent } from './pel-item.component';

describe('PelItemComponent', () => {
  let component: PelItemComponent;
  let fixture: ComponentFixture<PelItemComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ PelItemComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(PelItemComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
