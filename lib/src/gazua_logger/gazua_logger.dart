import 'package:http/http.dart' as http;

import './gazua_logger_factory.dart';

class GzLogger {
  factory GzLogger(dynamic message) = DefaultGzLogger;

  factory GzLogger.exception(Exception exception, {int? errorMethodCount}) = ExceptionLogger;

  factory GzLogger.error(Error error, {int? methodCount}) = ErrorLogger;

  factory GzLogger.log(dynamic message) = LogLogger;

  factory GzLogger.info(dynamic message) = InformationLogger;

  factory GzLogger.debug(dynamic message) = DebuggingLogger;

  factory GzLogger.warning(dynamic message) = WarningLogger;

  factory GzLogger.build(dynamic message) = BuildLogger;

  factory GzLogger.httpRequest({required http.Request httpRequest}) = HttpRequestLogger;

  factory GzLogger.multipartRequest({required http.MultipartRequest multipartRequest}) = MultipartRequestLogger;

  factory GzLogger.httpResponse({required http.Response httpResponse, bool printHeaders}) = HttpResponseLogger;

  factory GzLogger.htmlRequest(
      {required String method,
      required Map<String, String> headers,
      required Uri uri,
      String? body,
      int? methodCount}) = HtmlRequestLogger;

  factory GzLogger.htmlResponse(
      {Map<String, String>? printHeaders,
      required int statusCode,
      required String body,
      int? methodCount}) = HtmlResponseLogger;
}
