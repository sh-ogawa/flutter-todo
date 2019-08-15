import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'ja': {
      'appName': 'TODOアプリ',
      'todoList': 'タスク一覧',
      'taskName': 'タスク名'
    },
    'en': {
      'appName': 'TODO Application',
      'todoList': 'TODO List',
      'taskName': 'Task Name'
    }
  };

  String get appName {
    return _localizedValues[locale.languageCode]['appName'];
  }
  String get todoList {
    return _localizedValues[locale.languageCode]['todoList'];
  }
  String get taskName {
    return _localizedValues[locale.languageCode]['taskName'];
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['ja', 'en'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
