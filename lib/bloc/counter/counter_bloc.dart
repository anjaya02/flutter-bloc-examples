import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_event.dart';
import 'counter_state.dart';

/// Counter BLoC that manages counter state and business logic
///
/// This BLoC demonstrates:
/// - Handling different types of events
/// - Managing state transitions
/// - Business logic separation from UI
/// - State validation and error handling
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  static const int maxValue = 100;
  static const int minValue = -100;

  CounterBloc() : super(const CounterInitial()) {
    // Register event handlers
    on<CounterIncrement>(_onIncrement);
    on<CounterDecrement>(_onDecrement);
    on<CounterReset>(_onReset);
    on<CounterSetValue>(_onSetValue);
  }

  /// Handle increment event
  void _onIncrement(CounterIncrement event, Emitter<CounterState> emit) async {
    final currentValue = _getCurrentValue();

    if (currentValue >= maxValue) {
      emit(CounterError('Cannot increment beyond $maxValue'));
      return;
    }

    // Simulate some business logic with a small delay
    emit(const CounterLoading());
    await Future.delayed(const Duration(milliseconds: 300));

    final newValue = currentValue + 1;
    emit(_createCounterValue(newValue));
  }

  /// Handle decrement event
  void _onDecrement(CounterDecrement event, Emitter<CounterState> emit) async {
    final currentValue = _getCurrentValue();

    if (currentValue <= minValue) {
      emit(CounterError('Cannot decrement below $minValue'));
      return;
    }

    // Simulate some business logic with a small delay
    emit(const CounterLoading());
    await Future.delayed(const Duration(milliseconds: 300));

    final newValue = currentValue - 1;
    emit(_createCounterValue(newValue));
  }

  /// Handle reset event
  void _onReset(CounterReset event, Emitter<CounterState> emit) {
    emit(_createCounterValue(0));
  }

  /// Handle set value event
  void _onSetValue(CounterSetValue event, Emitter<CounterState> emit) {
    if (event.value < minValue || event.value > maxValue) {
      emit(CounterError('Value must be between $minValue and $maxValue'));
      return;
    }

    emit(_createCounterValue(event.value));
  }

  /// Helper method to get current counter value
  int _getCurrentValue() {
    final currentState = state;
    if (currentState is CounterValue) {
      return currentState.value;
    }
    return 0; // Default value
  }

  /// Helper method to create CounterValue state with business logic
  CounterValue _createCounterValue(int value) {
    final isEven = value % 2 == 0;
    final status = _getStatus(value);

    return CounterValue(value: value, isEven: isEven, status: status);
  }

  /// Business logic to determine status based on value
  String _getStatus(int value) {
    if (value == 0) return 'Zero';
    if (value > 0 && value <= 10) return 'Low';
    if (value > 10 && value <= 50) return 'Medium';
    if (value > 50) return 'High';
    if (value < 0 && value >= -10) return 'Negative Low';
    if (value < -10 && value >= -50) return 'Negative Medium';
    return 'Negative High';
  }
}
