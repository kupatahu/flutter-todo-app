import 'package:todo_app/data/models/__mocks__/mock_todo_model.dart';
import 'package:todo_app/data/models/todo_model.dart';
import 'package:todo_app/domain/entities/todo.dart';
import 'package:todo_app/domain/repositories/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  List<TodoModel> todoModels = mockTodoModelList;

  @override
  Future<List<TodoModel>> getAll() async {
    return todoModels;
  }

  @override
  Future<void> update(Todo updatedTodo) async {
    final updatedTodoModel = TodoModel.fromEntity(updatedTodo);

    todoModels = todoModels.map((todoModel) {
      if (updatedTodoModel.id == todoModel.id) {
        return updatedTodoModel;
      }

      return todoModel;
    }).toList();
  }
}
