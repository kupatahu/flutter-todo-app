import 'package:flutter/material.dart';
import 'package:todo_app/presentation/routes.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.initial,
      routes: Routes.routes,
    );
  }
}