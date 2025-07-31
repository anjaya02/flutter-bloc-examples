import 'package:equatable/equatable.dart';

/// Abstract base class for all Counter states
/// Using Equatable to compare states for equality
abstract class CounterState extends Equatable {
  const CounterState();

  @override
  List<Object> get props => [];
}

/// Initial state of the counter
class CounterInitial extends CounterState {
  const CounterInitial();
}

/// State when counter value changes
class CounterValue extends CounterState {
  final int value;
  final bool isEven;
  final String status;

  const CounterValue({
    required this.value,
    required this.isEven,
    required this.status,
  });

  @override
  List<Object> get props => [value, isEven, status];

  /// Helper method to create a new state with updated values
  CounterValue copyWith({int? value, bool? isEven, String? status}) {
    return CounterValue(
      value: value ?? this.value,
      isEven: isEven ?? this.isEven,
      status: status ?? this.status,
    );
  }
}

/// State when an error occurs
class CounterError extends CounterState {
  final String message;

  const CounterError(this.message);

  @override
  List<Object> get props => [message];
}

/// State when counter is loading (for async operations)
class CounterLoading extends CounterState {
  const CounterLoading();
}
