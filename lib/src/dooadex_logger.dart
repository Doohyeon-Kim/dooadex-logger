import 'package:http/http.dart' as http;

import 'dooadex_logger_factory.dart';

class DdxLogger {
  factory DdxLogger(dynamic message) = DefaultDooadexLogger;

  factory DdxLogger.exception(Exception exception, {int? errorMethodCount}) =
      ExceptionLogger;

  factory DdxLogger.error(Error error, {int? methodCount}) = ErrorLogger;

  factory DdxLogger.log(dynamic message) = LogLogger;

  factory DdxLogger.info(dynamic message) = InformationLogger;

  factory DdxLogger.warning(dynamic message) = WarningLogger;

  factory DdxLogger.httpRequest({required http.Request httpRequest}) =
      HttpRequestLogger;

  factory DdxLogger.multipartRequest(
          {required http.MultipartRequest multipartRequest}) =
      MultipartRequestLogger;

  factory DdxLogger.httpResponse(
      {required http.Response httpResponse, bool headers}) = HttpResponseLogger;

  factory DdxLogger.htmlRequest(
      {required String method,
      required Map<String, String> headers,
      required Uri uri,
      String? body,
      int? methodCount}) = HtmlRequestLogger;

  factory DdxLogger.htmlResponse(
      {Map<String, String>? headers,
      required int statusCode,
      required String body,
      int? methodCount}) = HtmlResponseLogger;

  factory DdxLogger.heart(dynamic message) = HeartLogger;

  factory DdxLogger.poop(dynamic message) = PoopLogger;
}
