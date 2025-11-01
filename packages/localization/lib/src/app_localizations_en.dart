// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get movieShaker => 'Movie Shaker';

  @override
  String get aChillingBooo => 'A chilling “Booo!”';

  @override
  String get tryAgain => 'Try Again… If You Dare';

  @override
  String get search => 'Search';

  @override
  String get movieDetails => 'Movie Details';

  @override
  String get overview => 'Overview';

  @override
  String get rating => 'Rating';

  @override
  String get releaseYear => 'Release Year';

  @override
  String get genres => 'Genres';

  @override
  String get runtime => 'Runtime';

  @override
  String get popularity => 'Popularity';

  @override
  String get time => 'Time';

  @override
  String durationFormatMinutes(int minutes) {
    return '${minutes}m';
  }

  @override
  String durationFormatHoursMinutes(int hours, int minutes) {
    return '${hours}h ${minutes}m';
  }

  @override
  String durationFormatHours(int hours) {
    return '${hours}h';
  }
}
