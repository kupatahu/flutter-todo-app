import 'package:todo_app/domain/entities/todo.dart';

class TodoModel extends Todo {
  TodoModel({
    int id,
    String title,
    bool isCompleted = false,
  }) : super(
          id: id,
          title: title,
          isCompleted: isCompleted,
        );

  TodoModel.fromEntity(Todo todo)
      : super(
          id: todo.id,
          title: todo.title,
          isCompleted: todo.isCompleted,
        );
}
