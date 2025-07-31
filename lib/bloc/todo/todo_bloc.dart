import 'package:flutter_bloc/flutter_bloc.dart';
import 'todo_event.dart';
import 'todo_state.dart';
import 'todo_model.dart';

/// Todo BLoC that manages todo list state and business logic
///
/// This BLoC demonstrates:
/// - Managing lists of complex objects
/// - Filtering and searching
/// - CRUD operations
/// - Complex state management with multiple derived values
class TodoBloc extends Bloc<TodoEvent, TodoState> {
  List<Todo> _todos = [];

  TodoBloc() : super(const TodoInitial()) {
    on<TodoLoad>(_onLoad);
    on<TodoAdd>(_onAdd);
    on<TodoToggle>(_onToggle);
    on<TodoDelete>(_onDelete);
    on<TodoUpdate>(_onUpdate);
    on<TodoFilter>(_onFilter);
  }

  /// Handle load event
  void _onLoad(TodoLoad event, Emitter<TodoState> emit) async {
    emit(const TodoLoading());

    try {
      // Simulate loading from a repository/API
      await Future.delayed(const Duration(seconds: 1));

      // Initialize with some sample data
      _todos = [
        Todo(
          id: '1',
          title: 'Learn Flutter',
          description: 'Study Flutter framework and build apps',
          isCompleted: false,
          createdAt: DateTime.now().subtract(const Duration(days: 2)),
        ),
        Todo(
          id: '2',
          title: 'Understand BLoC',
          description: 'Master BLoC pattern for state management',
          isCompleted: true,
          createdAt: DateTime.now().subtract(const Duration(days: 1)),
        ),
        Todo(
          id: '3',
          title: 'Build Todo App',
          description: 'Create a todo application using BLoC',
          isCompleted: false,
          createdAt: DateTime.now(),
        ),
      ];

      emit(_createLoadedState(TodoFilterType.all));
    } catch (e) {
      emit(TodoError('Failed to load todos: ${e.toString()}'));
    }
  }

  /// Handle add event
  void _onAdd(TodoAdd event, Emitter<TodoState> emit) async {
    if (event.title.trim().isEmpty) {
      emit(const TodoError('Title cannot be empty'));
      return;
    }

    try {
      final newTodo = Todo(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: event.title.trim(),
        description: event.description.trim(),
        isCompleted: false,
        createdAt: DateTime.now(),
      );

      _todos = [..._todos, newTodo];

      final currentState = state;
      final currentFilter = currentState is TodoLoaded
          ? currentState.currentFilter
          : TodoFilterType.all;

      emit(_createLoadedState(currentFilter));
    } catch (e) {
      emit(TodoError('Failed to add todo: ${e.toString()}'));
    }
  }

  /// Handle toggle event
  void _onToggle(TodoToggle event, Emitter<TodoState> emit) {
    try {
      _todos = _todos.map((todo) {
        if (todo.id == event.todo.id) {
          return todo.copyWith(isCompleted: !todo.isCompleted);
        }
        return todo;
      }).toList();

      final currentState = state;
      final currentFilter = currentState is TodoLoaded
          ? currentState.currentFilter
          : TodoFilterType.all;

      emit(_createLoadedState(currentFilter));
    } catch (e) {
      emit(TodoError('Failed to toggle todo: ${e.toString()}'));
    }
  }

  /// Handle delete event
  void _onDelete(TodoDelete event, Emitter<TodoState> emit) {
    try {
      _todos = _todos.where((todo) => todo.id != event.todo.id).toList();

      final currentState = state;
      final currentFilter = currentState is TodoLoaded
          ? currentState.currentFilter
          : TodoFilterType.all;

      emit(_createLoadedState(currentFilter));
    } catch (e) {
      emit(TodoError('Failed to delete todo: ${e.toString()}'));
    }
  }

  /// Handle update event
  void _onUpdate(TodoUpdate event, Emitter<TodoState> emit) {
    try {
      _todos = _todos.map((todo) {
        if (todo.id == event.todo.id) {
          return todo.copyWith(
            title: event.title,
            description: event.description,
          );
        }
        return todo;
      }).toList();

      final currentState = state;
      final currentFilter = currentState is TodoLoaded
          ? currentState.currentFilter
          : TodoFilterType.all;

      emit(_createLoadedState(currentFilter));
    } catch (e) {
      emit(TodoError('Failed to update todo: ${e.toString()}'));
    }
  }

  /// Handle filter event
  void _onFilter(TodoFilter event, Emitter<TodoState> emit) {
    emit(_createLoadedState(event.filterType));
  }

  /// Helper method to create TodoLoaded state with filtered data
  TodoLoaded _createLoadedState(TodoFilterType filterType) {
    final completedCount = _todos.where((todo) => todo.isCompleted).length;
    final pendingCount = _todos.where((todo) => !todo.isCompleted).length;

    List<Todo> filteredTodos;
    switch (filterType) {
      case TodoFilterType.completed:
        filteredTodos = _todos.where((todo) => todo.isCompleted).toList();
        break;
      case TodoFilterType.pending:
        filteredTodos = _todos.where((todo) => !todo.isCompleted).toList();
        break;
      case TodoFilterType.all:
        filteredTodos = List.from(_todos);
        break;
    }

    // Sort by creation date (newest first)
    filteredTodos.sort((a, b) => b.createdAt.compareTo(a.createdAt));

    return TodoLoaded(
      todos: List.from(_todos),
      filteredTodos: filteredTodos,
      currentFilter: filterType,
      completedCount: completedCount,
      pendingCount: pendingCount,
    );
  }
}
