import 'package:flutter/material.dart';
import 'package:todo_app/presentation/journey/settings/general_settings/general_settings_screen.dart';

abstract class SettingsRoutes {
  static const generalSettings = '/general-settings';

  static final Map<String, WidgetBuilder> routes = {
    generalSettings: (context) => GeneralSettingsScreen(),
  };
}
