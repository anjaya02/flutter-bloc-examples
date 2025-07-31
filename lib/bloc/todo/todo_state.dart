import 'package:equatable/equatable.dart';
import 'todo_model.dart';
import 'todo_event.dart';

/// Abstract base class for all Todo states
abstract class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

/// Initial state
class TodoInitial extends TodoState {
  const TodoInitial();
}

/// Loading state
class TodoLoading extends TodoState {
  const TodoLoading();
}

/// State when todos are successfully loaded/managed
class TodoLoaded extends TodoState {
  final List<Todo> todos;
  final List<Todo> filteredTodos;
  final TodoFilterType currentFilter;
  final int completedCount;
  final int pendingCount;

  const TodoLoaded({
    required this.todos,
    required this.filteredTodos,
    required this.currentFilter,
    required this.completedCount,
    required this.pendingCount,
  });

  @override
  List<Object> get props => [
    todos,
    filteredTodos,
    currentFilter,
    completedCount,
    pendingCount,
  ];

  /// Helper method to create a copy with updated fields
  TodoLoaded copyWith({
    List<Todo>? todos,
    List<Todo>? filteredTodos,
    TodoFilterType? currentFilter,
    int? completedCount,
    int? pendingCount,
  }) {
    return TodoLoaded(
      todos: todos ?? this.todos,
      filteredTodos: filteredTodos ?? this.filteredTodos,
      currentFilter: currentFilter ?? this.currentFilter,
      completedCount: completedCount ?? this.completedCount,
      pendingCount: pendingCount ?? this.pendingCount,
    );
  }
}

/// Error state
class TodoError extends TodoState {
  final String message;

  const TodoError(this.message);

  @override
  List<Object> get props => [message];
}
