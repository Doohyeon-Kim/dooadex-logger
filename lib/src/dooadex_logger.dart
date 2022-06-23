import 'package:http/http.dart' as http;

import 'dooadex_logger_factory.dart';

class DooadexLogger {
  factory DooadexLogger(String message) = DefaultDooadexLogger;

  factory DooadexLogger.exception(Exception exception,
      {int? errorMethodCount}) = ExceptionLogger;

  factory DooadexLogger.httpRequest({required http.Request httpRequest}) =
      HttpRequestLogger;

  factory DooadexLogger.multipartRequest(
          {required http.MultipartRequest multipartRequest}) =
      MultipartRequestLogger;

  factory DooadexLogger.httpResponse(
      {required http.Response httpResponse, bool headers}) = HttpResponseLogger;

  factory DooadexLogger.error(Error error, {int? methodCount}) = ErrorLogger;

  factory DooadexLogger.htmlRequest(
      {required String method,
      required Map<String, String> headers,
      required Uri uri,
      String? body,
      int? methodCount}) = HtmlRequestLogger;

  factory DooadexLogger.htmlResponse(
      {Map<String, String>? headers,
      required int statusCode,
      required String body,
      int? methodCount}) = HtmlResponseLogger;
}
