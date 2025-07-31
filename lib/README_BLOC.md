# BLoC Pattern Examples

This Flutter project demonstrates comprehensive examples of the BLoC (Business Logic Component) pattern for state management.

## 🏗️ Project Structure

```
lib/
├── bloc/                   # BLoC implementations
│   ├── counter/           # Counter BLoC example
│   │   ├── counter_bloc.dart
│   │   ├── counter_event.dart
│   │   ├── counter_state.dart
│   │   └── counter.dart
│   └── todo/              # Todo BLoC example
│       ├── todo_bloc.dart
│       ├── todo_event.dart
│       ├── todo_state.dart
│       ├── todo_model.dart
│       └── todo.dart
├── pages/                 # UI pages
│   ├── home_page.dart
│   ├── counter_page.dart
│   └── todo_page.dart
└── main.dart
```

## 📚 Examples Included

### 1. Counter BLoC (Basic Example)

- **Purpose**: Demonstrates fundamental BLoC concepts
- **Features**:
  - Simple increment/decrement operations
  - Value validation (min/max limits)
  - Error handling
  - Loading states
  - Business logic (even/odd detection, status calculation)

**Key Concepts Demonstrated**:

- Event handling
- State transitions
- Business logic separation
- Error state management
- Loading state management

### 2. Todo BLoC (Advanced Example)

- **Purpose**: Shows complex state management with real-world scenarios
- **Features**:
  - CRUD operations (Create, Read, Update, Delete)
  - List filtering (All, Pending, Completed)
  - Form validation
  - Complex state calculations
  - Multiple data relationships

**Key Concepts Demonstrated**:

- Managing lists of complex objects
- Multiple event types
- State derivation and calculations
- Form integration with BLoC
- Complex business logic

## 🔑 Key BLoC Concepts Explained

### Events

Events represent actions that can happen in your application:

```dart
abstract class CounterEvent extends Equatable {
  const CounterEvent();
  @override
  List<Object> get props => [];
}

class CounterIncrement extends CounterEvent {
  const CounterIncrement();
}
```

### States

States represent the current condition of your application:

```dart
abstract class CounterState extends Equatable {
  const CounterState();
  @override
  List<Object> get props => [];
}

class CounterValue extends CounterState {
  final int value;
  final bool isEven;
  final String status;

  const CounterValue({
    required this.value,
    required this.isEven,
    required this.status,
  });
}
```

### BLoC

The BLoC class contains business logic and handles state transitions:

```dart
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterInitial()) {
    on<CounterIncrement>(_onIncrement);
    on<CounterDecrement>(_onDecrement);
  }

  void _onIncrement(CounterIncrement event, Emitter<CounterState> emit) {
    // Business logic here
    final newValue = getCurrentValue() + 1;
    emit(CounterValue(value: newValue, ...));
  }
}
```

### UI Integration

Using BLoC in widgets:

```dart
// 1. Provide BLoC to widget tree
BlocProvider(
  create: (context) => CounterBloc(),
  child: CounterView(),
)

// 2. Listen to state changes
BlocBuilder<CounterBloc, CounterState>(
  builder: (context, state) {
    if (state is CounterValue) {
      return Text('${state.value}');
    }
    return CircularProgressIndicator();
  },
)

// 3. Dispatch events
context.read<CounterBloc>().add(CounterIncrement());
```

## 🛠️ Dependencies Used

- **flutter_bloc**: Core BLoC library for Flutter
- **equatable**: For comparing events and states efficiently

## 🚀 Getting Started

1. **Install dependencies**:

   ```bash
   flutter pub get
   ```

2. **Run the app**:

   ```bash
   flutter run
   ```

3. **Explore the examples**:
   - Start with the Counter example for basic concepts
   - Move to the Todo example for advanced patterns

## 📱 How to Use the Examples

### Counter Example

1. Tap the increment/decrement buttons
2. Try the advanced controls to set specific values
3. Notice error handling when exceeding limits
4. Observe loading states during operations

### Todo Example

1. Add new todos using the floating action button
2. Toggle completion status by tapping checkboxes
3. Use filters to view different todo categories
4. Edit or delete todos using the menu options
5. Notice real-time statistics updates

## 🎯 Learning Objectives

After exploring these examples, you should understand:

1. **Separation of Concerns**: How BLoC separates business logic from UI
2. **Reactive Programming**: How events and states create reactive flows
3. **Testing**: How BLoC makes business logic easily testable
4. **Scalability**: How BLoC patterns scale with application complexity
5. **State Management**: Different approaches to managing application state

## 🔧 Best Practices Demonstrated

1. **Event Naming**: Use descriptive, action-oriented names
2. **State Immutability**: Always create new state instances
3. **Error Handling**: Dedicated error states for robust apps
4. **Loading States**: Show progress during async operations
5. **Business Logic**: Keep complex logic in BLoC, not UI
6. **Testing**: Structure code for easy unit testing

## 📖 Additional Resources

- [BLoC Library Documentation](https://bloclibrary.dev/)
- [Flutter BLoC Package](https://pub.dev/packages/flutter_bloc)
- [BLoC Pattern Guide](https://bloclibrary.dev/bloc-concepts/)

## 🤝 Contributing

Feel free to enhance these examples by:

- Adding more complex scenarios
- Improving error handling
- Adding unit tests
- Enhancing UI/UX

---

Happy coding with BLoC! 🚀
