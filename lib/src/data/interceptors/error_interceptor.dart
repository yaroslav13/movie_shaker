import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:movie_shaker/src/domain/exceptions/app_exception.dart';

@immutable
final class ErrorInterceptor extends Interceptor {
  const ErrorInterceptor();

  static final _exceptionMap = {
    2: () => const InvalidServiceException(),
    3: () => const UnauthorizedException(),
    4: () => const InvalidFormatException(),
    5: () => const RequestValidationException(),
    6: () => const NotFoundException(),
    7: () => const UnauthorizedException(),
    8: () => const DuplicateEntryException(),
    9: () => const ServiceUnavailableException(),
    10: () => const UnauthorizedException(),
    11: () => const ServiceUnavailableException(),
    14: () => const UnauthorizedException(),
    15: () => const ServiceUnavailableException(),
    18: () => const RequestValidationException(),
    19: () => const InvalidAcceptHeaderException(),
    20: () => const RequestValidationException(),
    22: () => const RequestValidationException(),
    23: () => const RequestValidationException(),
    24: () => const RequestTimedOutException(),
    25: () => const RateLimitExceededException(),
    26: () => const RequestValidationException(),
    27: () => const RequestValidationException(),
    28: () => const RequestValidationException(),
    29: () => const RequestValidationException(),
    34: () => const NotFoundException(),
    43: () => const RequestTimedOutException(),
    46: () => const ServiceUnavailableException(),
  };

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final mappedException = _mapNetworkException(err);
    super.onError(err.copyWith(error: mappedException), handler);
  }

  NetworkException _mapNetworkException(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const NetworkTimeoutException();
      case DioExceptionType.badResponse:
        return _mapBadResponseException(error);
      case DioExceptionType.cancel:
        return const RequestCancelledException();
      case DioExceptionType.unknown:
        return const UnknownNetworkException();
      case DioExceptionType.badCertificate:
        return const BadCertificateException();
      case DioExceptionType.connectionError:
        return const NoInternetConnectionException();
    }
  }

  NetworkException _mapBadResponseException(DioException error) {
    final response = error.response;
    final httpStatusCode = response?.statusCode;

    final data = response?.data as Map<String, dynamic>?;
    final internalStatusCode = data?['status_code'] as int?;

    if (internalStatusCode != null &&
        _exceptionMap.containsKey(internalStatusCode)) {
      return _exceptionMap[internalStatusCode]!();
    }

    if (httpStatusCode != null && httpStatusCode >= 500) {
      return const InternalServerErrorException();
    }

    return const UnknownNetworkException();
  }
}
