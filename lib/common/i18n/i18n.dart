import 'dart:ui';

import 'package:flutter/widgets.dart';

class S {
  Map<String, String> translation;

  S({this.translation});

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  String translate(String key) => translation[key] ?? key;
}

class SDelegate extends LocalizationsDelegate<S> {
  final List<Locale> supportedLocales;
  final Map<String, Map<String, String>> translations;

  const SDelegate({this.supportedLocales, this.translations});

  @override
  bool isSupported(Locale locale) {
    return supportedLocales.any(
      (Locale supportedLocale) {
        return supportedLocale.languageCode == locale.languageCode;
      },
    );
  }

  @override
  Future<S> load(Locale locale) async {
    return S(translation: translations[locale.languageCode]);
  }

  @override
  bool shouldReload(SDelegate old) {
    return false;
  }
}
