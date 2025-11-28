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

  @override
  String get home => 'Home';

  @override
  String get collections => 'Collections';

  @override
  String get favorites => 'Favorites';

  @override
  String get profile => 'Profile';

  @override
  String get needsMoreBlockbusters => 'Needs more blockbusters!';

  @override
  String get tapTheHeart => 'Tap the heart icon on a movie to save it here.';

  @override
  String get itSeemsSomebodyStoleAllMovies =>
      'It seems somebody stole the movies.';

  @override
  String get noCluesFound => 'No clues found. Try a different keyword.';

  @override
  String get doNotLetYourFavoritesGatherDust =>
      'Don\'t let your favorites gather dust.';

  @override
  String get startCuratingMustWatchLists =>
      'Start curating your must-watch lists.';

  @override
  String moviesCount(Object count) {
    return '$count Movies';
  }

  @override
  String get newCollection => 'New collection';

  @override
  String get collectionName => 'Collection name';

  @override
  String get buildANewListForMoviesYouWantToTrack =>
      'Build a new list for movies you want to track.';

  @override
  String get create => 'Create';

  @override
  String get yourCollectionDisappeared =>
      'Oooops, your collection disappeared!';

  @override
  String get remove => 'Remove';

  @override
  String get yourCollectionDoNotWantToDisappear =>
      'Ooooops, your collection doesn\'t want to disappear.';
}
