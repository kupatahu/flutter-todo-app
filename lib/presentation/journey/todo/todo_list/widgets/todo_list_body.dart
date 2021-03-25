import 'package:flutter/material.dart';
import 'package:todo_app/domain/entities/todo.dart';
import 'package:todo_app/presentation/journey/todo/todo_list/todo_list_constant.dart';
import 'package:todo_app/presentation/journey/todo/todo_list/widgets/todo_item.dart';

class TodoListBody extends StatelessWidget {
  final List<Todo> todos;
  final Function(Todo todo) onItemPressed;

  const TodoListBody({
    Key key,
    this.todos,
    this.onItemPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: TodoListConstant.bodyKey,
      child: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return TodoItem(
            todo: todos[index],
            index: index,
            onPressed: onItemPressed,
          );
        },
      ),
    );
  }
}
