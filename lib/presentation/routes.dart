import 'package:flutter/material.dart';
import 'package:todo_app/presentation/journey/settings/settings_routes.dart';
import 'package:todo_app/presentation/journey/todo/todo_routes.dart';

abstract class Routes {
  static const initial = TodoRoutes.todoList;

  static final Map<String, WidgetBuilder> routes = {
    ...TodoRoutes.routes,
    ...SettingsRoutes.routes,
  };
}
