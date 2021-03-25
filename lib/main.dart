import 'package:flutter/material.dart';
import 'package:todo_app/common/injector/injector_config.dart';
import 'package:todo_app/presentation/app.dart';


void main() {
  InjectorConfig.setup();

  runApp(App());
}
