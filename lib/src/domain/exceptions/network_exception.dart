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
  const BadResponseException(super.message);
}

final class UnauthorizedException extends BadResponseException {
  const UnauthorizedException(super.message);
}

final class BadRequestException extends BadResponseException {
  const BadRequestException(super.message);
}

final class NotFoundException extends BadResponseException {
  const NotFoundException(super.message);
}

final class InternalServerErrorException extends BadResponseException {
  const InternalServerErrorException(super.message);
}
