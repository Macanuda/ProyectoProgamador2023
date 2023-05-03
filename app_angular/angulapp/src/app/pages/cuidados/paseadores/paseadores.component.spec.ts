import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PaseadoresComponent } from './paseadores.component';

describe('PaseadoresComponent', () => {
  let component: PaseadoresComponent;
  let fixture: ComponentFixture<PaseadoresComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ PaseadoresComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(PaseadoresComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
