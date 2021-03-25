import 'package:todo_app/domain/entities/todo.dart';

abstract class TodoState {
  final List<Todo> todos;

  TodoState({this.todos = const []});
}

class TodoInitial extends TodoState {}

class TodoLoaded extends TodoState {
  TodoLoaded({List<Todo> todos}) : super(todos: todos);
}

class TodoUpdated extends TodoLoaded {
  TodoUpdated({List<Todo> todos}) : super(todos: todos);
}
