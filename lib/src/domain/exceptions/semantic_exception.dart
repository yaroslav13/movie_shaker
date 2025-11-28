part of 'app_exception.dart';

base class SemanticException extends AppException {
  SemanticException([this.cause]) : super(cause?.message);

  final InfrastructureException? cause;
}
