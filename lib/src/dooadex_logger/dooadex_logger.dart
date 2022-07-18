import 'package:http/http.dart' as http;

import './dooadex_logger_factory.dart';

class DdxLogger {
  factory DdxLogger(dynamic message) = DefaultDooadexLogger;

  factory DdxLogger.exception(Exception exception, {int? errorMethodCount}) = ExceptionLogger;

  factory DdxLogger.error(Error error, {int? methodCount}) = ErrorLogger;

  factory DdxLogger.log(dynamic message) = LogLogger;

  factory DdxLogger.info(dynamic message) = InformationLogger;

  factory DdxLogger.debug(dynamic message) = DebuggingLogger;

  factory DdxLogger.warning(dynamic message) = WarningLogger;

  factory DdxLogger.build(dynamic message) = BuildLogger;

  factory DdxLogger.httpRequest({required http.Request httpRequest}) = HttpRequestLogger;

  factory DdxLogger.multipartRequest({required http.MultipartRequest multipartRequest}) = MultipartRequestLogger;

  factory DdxLogger.httpResponse({required http.Response httpResponse, bool printHeaders}) = HttpResponseLogger;

  factory DdxLogger.htmlRequest(
      {required String method,
      required Map<String, String> headers,
      required Uri uri,
      String? body,
      int? methodCount}) = HtmlRequestLogger;

  factory DdxLogger.htmlResponse(
      {Map<String, String>? printHeaders,
      required int statusCode,
      required String body,
      int? methodCount}) = HtmlResponseLogger;
}
