import 'package:todo_app/domain/entities/todo.dart';

class TodoModel extends Todo {
  TodoModel({
    String title,
    bool isCompleted,
  }) : super(
          title: title,
          isCompleted: isCompleted,
        );
}
