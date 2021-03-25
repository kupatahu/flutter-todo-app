import 'package:flutter/material.dart';

class TodoListAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TodoListAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('My To-do'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
