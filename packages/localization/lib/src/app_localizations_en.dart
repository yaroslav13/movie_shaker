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
      'Oooops, your collection doesn\'t want to disappear.';

  @override
  String get itSeemsWeDoNotHaveAChoice => 'It seems we don\'t have a choice.';

  @override
  String get createACollectionToSaveMovies =>
      'Create a collection to save movies.';

  @override
  String get thisCollectionIsAGhostTown => 'This collection is a ghost town.';

  @override
  String get addSomeMoviesToKeepItAlive => 'Add some movies to keep it alive.';

  @override
  String get watchNow => 'Watch Now';

  @override
  String get imdb => 'IMDB';

  @override
  String get trending => 'Trending';

  @override
  String get popularityViralLabel => 'Viral';

  @override
  String get popularityHighLabel => 'High';

  @override
  String get popularityMediumLabel => 'Medium';

  @override
  String get popularityLowLabel => 'Low';

  @override
  String get popularityNoneLabel => 'None';

  @override
  String get cast => 'Cast';

  @override
  String get like => 'Like';

  @override
  String get unlike => 'unlike';

  @override
  String get save => 'Save';

  @override
  String get unitB => 'B';

  @override
  String get unitKB => 'KB';

  @override
  String get unitMB => 'MB';

  @override
  String get unitGB => 'GB';

  @override
  String fileSizeDisplay(Object size, Object unit) {
    return '$size $unit';
  }

  @override
  String get clearStorage => 'Clear Storage';

  @override
  String get storage => 'Storage';
}
