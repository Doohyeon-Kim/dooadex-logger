import 'package:http/http.dart' as http;

import '../dooadex_logger_util.dart';
import 'dooadex_logger.dart';

class DefaultDooadexLogger implements DdxLogger {
  DefaultDooadexLogger(dynamic message) {
    DdxLoggerUtil.createLogger(DdxLoggerUtil.emojis.ddx, message);
  }
}

class ExceptionLogger implements DdxLogger {
  ExceptionLogger(Exception exception, {int? errorMethodCount}) {
    DdxLoggerUtil.createLogger(DdxLoggerUtil.emojis.exception, exception, methodCount: errorMethodCount ??= 10);
  }
}

class ErrorLogger implements DdxLogger {
  ErrorLogger(Error error, {int? methodCount}) {
    DdxLoggerUtil.createLogger(DdxLoggerUtil.emojis.error, error, methodCount: methodCount);
  }
}

class WarningLogger implements DdxLogger {
  WarningLogger(dynamic message) {
    DdxLoggerUtil.createLogger(DdxLoggerUtil.emojis.warning, message);
  }
}

class LogLogger implements DdxLogger {
  LogLogger(dynamic message) {
    DdxLoggerUtil.createLogger(DdxLoggerUtil.emojis.robot, message);
  }
}

class InformationLogger implements DdxLogger {
  InformationLogger(dynamic message) {
    DdxLoggerUtil.createLogger(DdxLoggerUtil.emojis.info, message);
  }
}

class BuildLogger implements DdxLogger {
  BuildLogger(dynamic message) {
    DdxLoggerUtil.createLogger(DdxLoggerUtil.emojis.build, message);
  }
}

class HttpRequestLogger implements DdxLogger {
  HttpRequestLogger({required http.Request httpRequest}) {
    String logMessage =
        "Http Request ${DateTime.now()}\nURI: ${httpRequest.url}\nMethod: ${httpRequest.method}\nheaders: ${httpRequest.headers}\nBody: ${httpRequest.body}";
    DdxLoggerUtil.createLogger(DdxLoggerUtil.emojis.robot, logMessage);
  }
}

class MultipartRequestLogger implements DdxLogger {
  MultipartRequestLogger({required http.MultipartRequest multipartRequest}) {
    String logMessage =
        "Http Request ${DateTime.now()}\nURI: ${multipartRequest.url}\nMethod: ${multipartRequest.method}\nheaders: ${multipartRequest.headers}\nfiles: ${multipartRequest.files}";
    DdxLoggerUtil.createLogger(DdxLoggerUtil.emojis.robot, logMessage);
  }
}

class HttpResponseLogger implements DdxLogger {
  HttpResponseLogger({required http.Response httpResponse, bool printHeaders = false}) {
    late String logMessage;
    printHeaders == false
        ? logMessage =
            "Http Response ${DateTime.now()}\nStatus Code: ${httpResponse.statusCode}\nBody: ${httpResponse.body}"
        : logMessage =
            "Http Response ${DateTime.now()}\nStatus Code: ${httpResponse.statusCode}\nHeaders ${httpResponse.headers}\nBody: ${httpResponse.body}";
    DdxLoggerUtil.createLogger(DdxLoggerUtil.emojis.robot, logMessage);
  }
}

class HtmlRequestLogger implements DdxLogger {
  HtmlRequestLogger(
      {required String method,
      required Map<String, String> headers,
      required Uri uri,
      String? body,
      int? methodCount}) {
    late String logMessage = "Request ${DateTime.now()}\nURI: $uri\nMethod: $method\nheaders: $headers\nBody: $body";
    DdxLoggerUtil.createLogger(DdxLoggerUtil.emojis.robot, logMessage);
  }
}

class HtmlResponseLogger implements DdxLogger {
  HtmlResponseLogger(
      {Map<String, String>? printHeaders, required int statusCode, required String body, int? methodCount}) {
    late String logMessage;
    printHeaders == null
        ? logMessage = "${DateTime.now()}\nResponse\nStatus Code: $statusCode\nBody: $body"
        : logMessage = "${DateTime.now()}\nResponse\nStatus Code: $statusCode\nHeaders $printHeaders\nBody: $body";
    DdxLoggerUtil.createLogger(DdxLoggerUtil.emojis.robot, logMessage);
  }
}
