import 'package:todo_app/domain/entities/todo.dart';
import 'package:todo_app/domain/repositories/todo_repository.dart';

class TodoUsecase {
  final TodoRepository todoRepository;

  TodoUsecase({this.todoRepository});

  Future<List<Todo>> getAll() async {
    return todoRepository.getAll();
  }
}
