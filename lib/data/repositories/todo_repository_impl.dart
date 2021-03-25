import 'package:todo_app/data/models/__mocks__/mock_todo_model.dart';
import 'package:todo_app/data/models/todo_model.dart';
import 'package:todo_app/domain/repositories/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  @override
  Future<List<TodoModel>> getAll() async {
    return mockTodoModelList;
  }
}
