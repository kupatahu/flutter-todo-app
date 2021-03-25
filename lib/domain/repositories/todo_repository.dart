import 'package:todo_app/domain/entities/todo.dart';

abstract class TodoRepository {
  Future<List<Todo>> getAll();
}
