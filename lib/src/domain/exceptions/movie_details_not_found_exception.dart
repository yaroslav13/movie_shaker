import 'package:movie_shaker/src/domain/exceptions/app_exception.dart';

final class MovieDetailsNotFoundException extends SemanticException {
  MovieDetailsNotFoundException([super.cause]);
}
