import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:movie_shaker/src/domain/exceptions/app_exception.dart';

@immutable
final class ErrorInterceptor extends Interceptor {
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
    final statusCode = response?.statusCode;
    final data = response?.data as Map<String, dynamic>?;
    final message = data?['Error'] as String?;

    switch (statusCode) {
      case 400:
        return BadRequestException(message);
      case 401:
      case 403:
        return UnauthorizedException(message);
      case 404:
        return NotFoundException(message);
      case 500:
      case 502:
        return InternalServerErrorException(message);
      default:
        return const UnknownNetworkException();
    }
  }
}
