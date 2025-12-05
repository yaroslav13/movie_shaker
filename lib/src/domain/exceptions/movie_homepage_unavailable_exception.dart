import 'package:movie_shaker/src/domain/exceptions/app_exception.dart';

final class MovieHomepageUnavailableException extends SemanticException {
  MovieHomepageUnavailableException([super.cause]);
}
