# create-angular-component

Create Angular standalone component with proper typing and template.

## When to Use
- Building Angular UI
- Adding new features
- Creating reusable components

## Execution

### Step 1: Define Component
```typescript
// src/app/components/user-card.component.ts
import { Component, Input, Output, EventEmitter } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-user-card',
  standalone: true,
  imports: [CommonModule],
  template: `
    <div class="card">
      <h3>{{ user.name }}</h3>
      <p>{{ user.email }}</p>
      <button (click)="onEdit.emit(user.id)">Edit</button>
    </div>
  `,
})
export class UserCardComponent {
  @Input() user!: User;
  @Output() onEdit = new EventEmitter<string>();
}
```

### Step 2: Add Tests
```typescript
import { ComponentFixture, TestBed } from '@angular/core/testing';
import { UserCardComponent } from './user-card.component';

describe('UserCardComponent', () => {
  let component: UserCardComponent;
  let fixture: ComponentFixture<UserCardComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [UserCardComponent],
    }).compileComponents();

    fixture = TestBed.createComponent(UserCardComponent);
    component = fixture.componentInstance;
  });

  it('should display user name', () => {
    component.user = { id: '1', name: 'Test', email: 'test@test.com' };
    fixture.detectChanges();
    expect(fixture.nativeElement.textContent).toContain('Test');
  });
});
```

## Output
- Component file
- Test file
- Module registration (if not standalone)
