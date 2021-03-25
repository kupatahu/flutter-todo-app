import 'package:todo_app/domain/entities/todo.dart';

abstract class TodoEvent {}

class FetchTodo extends TodoEvent {}

class ToggleTodo extends TodoEvent {
  final Todo todo;

  ToggleTodo(this.todo);
}
