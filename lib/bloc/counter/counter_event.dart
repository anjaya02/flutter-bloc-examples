import 'package:equatable/equatable.dart';

/// Abstract base class for all Counter events
/// Using Equatable to compare events for equality
abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

/// Event to increment the counter
class CounterIncrement extends CounterEvent {
  const CounterIncrement();
}

/// Event to decrement the counter
class CounterDecrement extends CounterEvent {
  const CounterDecrement();
}

/// Event to reset the counter to zero
class CounterReset extends CounterEvent {
  const CounterReset();
}

/// Event to set the counter to a specific value
class CounterSetValue extends CounterEvent {
  final int value;

  const CounterSetValue(this.value);

  @override
  List<Object> get props => [value];
}
