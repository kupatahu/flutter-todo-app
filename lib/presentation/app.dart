import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:todo_app/common/i18n/i18n.dart';
import 'package:todo_app/common/i18n/locale.dart';
import 'package:todo_app/common/i18n/translations/translations.dart';
import 'package:todo_app/presentation/routes.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.initial,
      routes: Routes.routes,
      localizationsDelegates: [
        const SDelegate(
          supportedLocales: AppLocale.supported,
          translations: translations,
        ),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocale.supported,
      locale: AppLocale.indonesian,
    );
  }
}
