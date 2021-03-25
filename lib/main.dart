import 'package:flutter/material.dart';
import 'package:todo_app/common/injector/injector.dart';
import 'package:todo_app/presentation/app.dart';


void main() {
  Injector.setup();

  runApp(App());
}
