# Flutter BLoC Pattern Examples

A comprehensive Flutter project demonstrating the BLoC (Business Logic Component) pattern for state management with practical examples.

## 📱 Screenshots

<!-- Add screenshots of your app here -->

## 🎯 Purpose

This project serves as a complete guide for developers learning the BLoC pattern in Flutter. It includes both simple and complex examples with real-world scenarios.

## 🏗️ Project Structure

```
lib/
├── bloc/                   # BLoC implementations
│   ├── counter/           # Simple counter example
│   │   ├── counter_bloc.dart
│   │   ├── counter_event.dart
│   │   ├── counter_state.dart
│   │   └── counter.dart   # Barrel file
│   └── todo/              # Complex todo list example
│       ├── todo_bloc.dart
│       ├── todo_event.dart
│       ├── todo_state.dart
│       ├── todo_model.dart
│       └── todo.dart      # Barrel file
├── pages/                 # UI implementations
│   ├── home_page.dart
│   ├── counter_page.dart
│   └── todo_page.dart
└── main.dart
```

## 📚 Examples Included

### 1. 🔢 Counter BLoC (Basic)

**Learning Objectives:**

- Basic event-state pattern
- Simple business logic
- Error handling
- Loading states
- State validation

**Features:**

- Increment/Decrement operations
- Value limits and validation
- Status calculation (even/odd, range categories)
- Error states for invalid operations

### 2. ✅ Todo BLoC (Advanced)

**Learning Objectives:**

- Complex state management
- CRUD operations
- List manipulation
- Filtering and searching
- Form integration

**Features:**

- Add, edit, delete todos
- Mark as complete/incomplete
- Filter by status (All, Pending, Completed)
- Real-time statistics
- Form validation

## 🛠️ Dependencies

```yaml
dependencies:
  flutter_bloc: ^8.1.3 # Core BLoC library
  equatable: ^2.0.5 # Object equality comparison
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (>=3.8.1)
- Dart SDK
- VS Code or Android Studio

### Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/yourusername/flutter-bloc-examples.git
   cd flutter-bloc-examples
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

## 📖 Usage Guide

1. **Start with Counter Example**: Learn basic BLoC concepts
2. **Progress to Todo Example**: Understand complex state management
3. **Study the Code**: Examine event flows and state transitions
4. **Experiment**: Modify examples to deepen understanding

## 🔑 Key Concepts Demonstrated

### Events

```dart
abstract class CounterEvent extends Equatable {
  const CounterEvent();
  @override
  List<Object> get props => [];
}

class CounterIncrement extends CounterEvent {}
```

### States

```dart
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

```dart
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterInitial()) {
    on<CounterIncrement>(_onIncrement);
  }

  void _onIncrement(CounterIncrement event, Emitter<CounterState> emit) {
    // Business logic here
  }
}
```

### UI Integration

```dart
BlocBuilder<CounterBloc, CounterState>(
  builder: (context, state) {
    if (state is CounterValue) {
      return Text('${state.value}');
    }
    return CircularProgressIndicator();
  },
)
```

## 🎓 Learning Path

1. **Understand the Theory**: Read about BLoC pattern principles
2. **Explore Counter Example**: Basic implementation
3. **Study Todo Example**: Advanced patterns
4. **Practice**: Create your own BLoC implementations
5. **Test**: Write unit tests for your BLoCs

## 🧪 Testing

The project structure supports easy testing of BLoCs:

```dart
// Example test structure
group('CounterBloc', () {
  test('initial state is CounterInitial', () {
    expect(CounterBloc().state, const CounterInitial());
  });

  test('emits CounterValue when CounterIncrement is added', () {
    // Test implementation
  });
});
```

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request. Ideas for contributions:

- Additional BLoC examples
- Unit tests
- UI improvements
- Documentation enhancements
- Performance optimizations

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 📚 Additional Resources

- [BLoC Library Documentation](https://bloclibrary.dev/)
- [Flutter BLoC Package](https://pub.dev/packages/flutter_bloc)
- [BLoC Pattern Guide](https://bloclibrary.dev/bloc-concepts/)
- [Flutter Documentation](https://flutter.dev/docs)

## 🙏 Acknowledgments

- Felix Angelov for the BLoC library
- Flutter team for the amazing framework
- Community contributors and examples

---

**Happy coding with BLoC!** 🚀

If you find this project helpful, please give it a ⭐️
