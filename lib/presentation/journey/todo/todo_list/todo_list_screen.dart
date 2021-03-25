import 'package:flutter/material.dart';
import 'package:todo_app/data/models/__mocks__/mock_todo_model.dart';
import 'package:todo_app/presentation/journey/todo/todo_list/widgets/todo_list_app_bar.dart';
import 'package:todo_app/presentation/journey/todo/todo_list/widgets/todo_list_body.dart';

class TodoListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TodoListAppBar(),
      body: TodoListBody(
        todos: mockTodoModelList,
      ),
    );
  }
}
