import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'src/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

  /// No description provided for @movieShaker.
  ///
  /// In en, this message translates to:
  /// **'Movie Shaker'**
  String get movieShaker;

  /// No description provided for @aChillingBooo.
  ///
  /// In en, this message translates to:
  /// **'A chilling “Booo!”'**
  String get aChillingBooo;

  /// No description provided for @tryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try Again… If You Dare'**
  String get tryAgain;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @movieDetails.
  ///
  /// In en, this message translates to:
  /// **'Movie Details'**
  String get movieDetails;

  /// No description provided for @overview.
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get overview;

  /// No description provided for @rating.
  ///
  /// In en, this message translates to:
  /// **'Rating'**
  String get rating;

  /// No description provided for @releaseYear.
  ///
  /// In en, this message translates to:
  /// **'Release Year'**
  String get releaseYear;

  /// No description provided for @genres.
  ///
  /// In en, this message translates to:
  /// **'Genres'**
  String get genres;

  /// No description provided for @runtime.
  ///
  /// In en, this message translates to:
  /// **'Runtime'**
  String get runtime;

  /// No description provided for @popularity.
  ///
  /// In en, this message translates to:
  /// **'Popularity'**
  String get popularity;

  /// No description provided for @time.
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get time;

  /// Duration format for minutes only, e.g., 45m
  ///
  /// In en, this message translates to:
  /// **'{minutes}m'**
  String durationFormatMinutes(int minutes);

  /// Duration format for hours and minutes, e.g., 1h 45m
  ///
  /// In en, this message translates to:
  /// **'{hours}h {minutes}m'**
  String durationFormatHoursMinutes(int hours, int minutes);

  /// Duration format for hours only, e.g., 2h
  ///
  /// In en, this message translates to:
  /// **'{hours}h'**
  String durationFormatHours(int hours);

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @collections.
  ///
  /// In en, this message translates to:
  /// **'Collections'**
  String get collections;

  /// No description provided for @favorites.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favorites;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @needsMoreBlockbusters.
  ///
  /// In en, this message translates to:
  /// **'Needs more blockbusters!'**
  String get needsMoreBlockbusters;

  /// No description provided for @tapTheHeart.
  ///
  /// In en, this message translates to:
  /// **'Tap the heart icon on a movie to save it here.'**
  String get tapTheHeart;

  /// No description provided for @itSeemsSomebodyStoleAllMovies.
  ///
  /// In en, this message translates to:
  /// **'It seems somebody stole the movies.'**
  String get itSeemsSomebodyStoleAllMovies;

  /// No description provided for @noCluesFound.
  ///
  /// In en, this message translates to:
  /// **'No clues found. Try a different keyword.'**
  String get noCluesFound;

  /// No description provided for @doNotLetYourFavoritesGatherDust.
  ///
  /// In en, this message translates to:
  /// **'Don\'t let your favorites gather dust.'**
  String get doNotLetYourFavoritesGatherDust;

  /// No description provided for @startCuratingMustWatchLists.
  ///
  /// In en, this message translates to:
  /// **'Start curating your must-watch lists.'**
  String get startCuratingMustWatchLists;

  /// No description provided for @moviesCount.
  ///
  /// In en, this message translates to:
  /// **'{count} Movies'**
  String moviesCount(Object count);

  /// No description provided for @newCollection.
  ///
  /// In en, this message translates to:
  /// **'New collection'**
  String get newCollection;

  /// No description provided for @collectionName.
  ///
  /// In en, this message translates to:
  /// **'Collection name'**
  String get collectionName;

  /// No description provided for @buildANewListForMoviesYouWantToTrack.
  ///
  /// In en, this message translates to:
  /// **'Build a new list for movies you want to track.'**
  String get buildANewListForMoviesYouWantToTrack;

  /// No description provided for @create.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get create;

  /// No description provided for @yourCollectionDisappeared.
  ///
  /// In en, this message translates to:
  /// **'Oooops, your collection disappeared!'**
  String get yourCollectionDisappeared;

  /// No description provided for @remove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get remove;

  /// No description provided for @yourCollectionDoNotWantToDisappear.
  ///
  /// In en, this message translates to:
  /// **'Oooops, your collection doesn\'t want to disappear.'**
  String get yourCollectionDoNotWantToDisappear;

  /// No description provided for @itSeemsWeDoNotHaveAChoice.
  ///
  /// In en, this message translates to:
  /// **'It seems we don\'t have a choice.'**
  String get itSeemsWeDoNotHaveAChoice;

  /// No description provided for @createACollectionToSaveMovies.
  ///
  /// In en, this message translates to:
  /// **'Create a collection to save movies.'**
  String get createACollectionToSaveMovies;

  /// No description provided for @thisCollectionIsAGhostTown.
  ///
  /// In en, this message translates to:
  /// **'This collection is a ghost town.'**
  String get thisCollectionIsAGhostTown;

  /// No description provided for @addSomeMoviesToKeepItAlive.
  ///
  /// In en, this message translates to:
  /// **'Add some movies to keep it alive.'**
  String get addSomeMoviesToKeepItAlive;

  /// No description provided for @watchNow.
  ///
  /// In en, this message translates to:
  /// **'Watch Now'**
  String get watchNow;

  /// No description provided for @imdb.
  ///
  /// In en, this message translates to:
  /// **'IMDB'**
  String get imdb;

  /// No description provided for @trending.
  ///
  /// In en, this message translates to:
  /// **'Trending'**
  String get trending;

  /// No description provided for @popularityViralLabel.
  ///
  /// In en, this message translates to:
  /// **'Viral'**
  String get popularityViralLabel;

  /// No description provided for @popularityHighLabel.
  ///
  /// In en, this message translates to:
  /// **'High'**
  String get popularityHighLabel;

  /// No description provided for @popularityMediumLabel.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get popularityMediumLabel;

  /// No description provided for @popularityLowLabel.
  ///
  /// In en, this message translates to:
  /// **'Low'**
  String get popularityLowLabel;

  /// No description provided for @popularityNoneLabel.
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get popularityNoneLabel;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
