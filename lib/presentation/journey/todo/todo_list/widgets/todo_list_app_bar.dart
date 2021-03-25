import 'package:flutter/material.dart';
import 'package:todo_app/common/i18n/i18n.dart';
import 'package:todo_app/presentation/journey/todo/todo_list/todo_list_constant.dart';

class TodoListAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TodoListAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        S.of(context).translate(TodoListConstant.appBarTitleTranslation),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
