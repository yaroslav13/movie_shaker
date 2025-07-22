import 'package:flutter/material.dart';
import 'package:localization/src/app_localizations.dart';

extension LocalizationX on BuildContext {
  AppLocalizations get localizations {
    // ignore: avoid-non-null-assertion
    return AppLocalizations.of(this)!;
  }

  List<LocalizationsDelegate<dynamic>> get localizationsDelegates {
    return AppLocalizations.localizationsDelegates;
  }

  List<Locale> get supportedLocales {
    return AppLocalizations.supportedLocales;
  }
}
