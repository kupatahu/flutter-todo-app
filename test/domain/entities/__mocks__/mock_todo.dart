import 'package:todo_app/domain/entities/todo.dart';

final mockCompletedTodo = Todo(
  id: 0,
  title: 'completed todo',
  isCompleted: true,
);

final mockUncompletedTodo = Todo(
  id: 0,
  title: 'uncompleted todo',
  isCompleted: false,
);

final mockTodoList = [
  mockCompletedTodo,
  mockUncompletedTodo,
];
