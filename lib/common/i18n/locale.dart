import 'dart:ui';

abstract class AppLocale {
  static const englishCode = 'en';
  static const english = Locale(englishCode);
  
  static const indonesianCode = 'id';
  static const indonesian = Locale(indonesianCode);

  static const supported = [
    english,
    indonesian,
  ];
}
