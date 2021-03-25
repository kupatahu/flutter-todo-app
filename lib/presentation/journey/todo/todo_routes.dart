import 'package:flutter/material.dart';
import 'package:todo_app/presentation/journey/todo/create_todo/create_todo_screen.dart';
import 'package:todo_app/presentation/journey/todo/todo_list/todo_list_screen.dart';

abstract class TodoRoutes {
  static const todoList = '/todos';
  static const createTodo = '/todos/create';

  static final Map<String, WidgetBuilder> routes = {
    todoList: (context) => TodoListScreen(),
    createTodo: (context) => CreateTodoScreen(),
  };
}
