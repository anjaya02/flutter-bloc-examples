import 'package:equatable/equatable.dart';
import 'todo_model.dart';

/// Abstract base class for all Todo events
abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

/// Event to load all todos
class TodoLoad extends TodoEvent {
  const TodoLoad();
}

/// Event to add a new todo
class TodoAdd extends TodoEvent {
  final String title;
  final String description;

  const TodoAdd({required this.title, required this.description});

  @override
  List<Object> get props => [title, description];
}

/// Event to toggle todo completion status
class TodoToggle extends TodoEvent {
  final Todo todo;

  const TodoToggle(this.todo);

  @override
  List<Object> get props => [todo];
}

/// Event to delete a todo
class TodoDelete extends TodoEvent {
  final Todo todo;

  const TodoDelete(this.todo);

  @override
  List<Object> get props => [todo];
}

/// Event to update a todo
class TodoUpdate extends TodoEvent {
  final Todo todo;
  final String? title;
  final String? description;

  const TodoUpdate({required this.todo, this.title, this.description});

  @override
  List<Object> get props => [todo, title ?? '', description ?? ''];
}

/// Event to filter todos
class TodoFilter extends TodoEvent {
  final TodoFilterType filterType;

  const TodoFilter(this.filterType);

  @override
  List<Object> get props => [filterType];
}

/// Enum for different filter types
enum TodoFilterType { all, completed, pending }
