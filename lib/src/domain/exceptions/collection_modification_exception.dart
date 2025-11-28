import 'package:movie_shaker/src/domain/exceptions/app_exception.dart';

sealed class CollectionModificationException extends SemanticException {
  CollectionModificationException([super.cause]);
}

final class CollectionCreationException
    extends CollectionModificationException {
  CollectionCreationException([super.cause]);
}

final class CollectionRemovalException extends CollectionModificationException {
  CollectionRemovalException([super.cause]);
}
