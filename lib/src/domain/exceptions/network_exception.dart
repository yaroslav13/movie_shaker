part of 'app_exception.dart';

sealed class NetworkException extends AppException {
  const NetworkException([super.message]);
}

final class NetworkTimeoutException extends NetworkException {
  const NetworkTimeoutException();
}

final class NoInternetConnectionException extends NetworkException {
  const NoInternetConnectionException();
}

final class RequestCancelledException extends NetworkException {
  const RequestCancelledException();
}

final class BadCertificateException extends NetworkException {
  const BadCertificateException();
}

final class UnknownNetworkException extends NetworkException {
  const UnknownNetworkException();
}

sealed class BadResponseException extends NetworkException {
  const BadResponseException();
}

final class InvalidServiceException extends BadResponseException {
  const InvalidServiceException();
}

final class UnauthorizedException extends BadResponseException {
  const UnauthorizedException();
}

final class InvalidFormatException extends BadResponseException {
  const InvalidFormatException();
}

final class InvalidApiKeyException extends BadResponseException {
  const InvalidApiKeyException();
}

final class SuspendedApiKeyException extends BadResponseException {
  const SuspendedApiKeyException();
}

final class DuplicateEntryException extends BadResponseException {
  const DuplicateEntryException();
}

final class ServiceUnavailableException extends BadResponseException {
  const ServiceUnavailableException();
}

final class InvalidAcceptHeaderException extends BadResponseException {
  const InvalidAcceptHeaderException();
}

final class BadRequestException extends BadResponseException {
  const BadRequestException();
}

final class NotFoundException extends BadResponseException {
  const NotFoundException();
}

final class RequestValidationException extends BadResponseException {
  const RequestValidationException();
}

final class RateLimitExceededException extends BadResponseException {
  const RateLimitExceededException();
}

final class InternalServerErrorException extends BadResponseException {
  const InternalServerErrorException();
}

final class RequestTimedOutException extends BadResponseException {
  const RequestTimedOutException();
}
