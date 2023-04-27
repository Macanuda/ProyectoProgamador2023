import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MasCercanasComponent } from './mas-cercanas.component';

describe('MasCercanasComponent', () => {
  let component: MasCercanasComponent;
  let fixture: ComponentFixture<MasCercanasComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ MasCercanasComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(MasCercanasComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
