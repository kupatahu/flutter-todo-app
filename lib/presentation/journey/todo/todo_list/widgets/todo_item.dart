import 'package:flutter/material.dart';
import 'package:todo_app/domain/entities/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final int index;

  const TodoItem({
    Key key,
    this.todo,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: ValueKey('todo_item_$index'),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black26,
            width: 1,
          ),
        ),
      ),
      child: Text(
        todo.title,
      ),
    );
  }
}
