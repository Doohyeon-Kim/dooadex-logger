import 'package:http/http.dart' as http;

import '../gazua_logger_util.dart';
import 'gazua_logger.dart';

class DefaultGzLogger implements GzLogger {
  DefaultGzLogger(dynamic message) {
    GzLoggerUtil.createLogger(GzLoggerUtil.emojis.gazua, message);
  }
}

class DebuggingLogger implements GzLogger {
  DebuggingLogger(dynamic message) {
    GzLoggerUtil.createLogger(GzLoggerUtil.emojis.debug, message);
  }
}

class ExceptionLogger implements GzLogger {
  ExceptionLogger(Exception exception, {int? errorMethodCount}) {
    GzLoggerUtil.createLogger(GzLoggerUtil.emojis.exception, exception, methodCount: errorMethodCount ??= 10);
  }
}

class ErrorLogger implements GzLogger {
  ErrorLogger(Error error, {int? methodCount}) {
    GzLoggerUtil.createLogger(GzLoggerUtil.emojis.error, error, methodCount: methodCount);
  }
}

class WarningLogger implements GzLogger {
  WarningLogger(dynamic message) {
    GzLoggerUtil.createLogger(GzLoggerUtil.emojis.warning, message);
  }
}

class LogLogger implements GzLogger {
  LogLogger(dynamic message) {
    GzLoggerUtil.createLogger(GzLoggerUtil.emojis.robot, message);
  }
}

class InformationLogger implements GzLogger {
  InformationLogger(dynamic message) {
    GzLoggerUtil.createLogger(GzLoggerUtil.emojis.info, message);
  }
}

class BuildLogger implements GzLogger {
  BuildLogger(dynamic message) {
    GzLoggerUtil.createLogger(GzLoggerUtil.emojis.build, message);
  }
}

class HttpRequestLogger implements GzLogger {
  HttpRequestLogger({required http.Request httpRequest}) {
    String logMessage =
        "Http Request ${DateTime.now()}\nURI: ${httpRequest.url}\nMethod: ${httpRequest.method}\nheaders: ${httpRequest.headers}\nBody: ${httpRequest.body}";
    GzLoggerUtil.createLogger(GzLoggerUtil.emojis.robot, logMessage);
  }
}

class MultipartRequestLogger implements GzLogger {
  MultipartRequestLogger({required http.MultipartRequest multipartRequest}) {
    String logMessage =
        "Http Request ${DateTime.now()}\nURI: ${multipartRequest.url}\nMethod: ${multipartRequest.method}\nheaders: ${multipartRequest.headers}\nfiles: ${multipartRequest.files}";
    GzLoggerUtil.createLogger(GzLoggerUtil.emojis.robot, logMessage);
  }
}

class HttpResponseLogger implements GzLogger {
  HttpResponseLogger({required http.Response httpResponse, bool printHeaders = false}) {
    late String logMessage;
    printHeaders == false
        ? logMessage =
            "Http Response ${DateTime.now()}\nStatus Code: ${httpResponse.statusCode}\nBody: ${httpResponse.body}"
        : logMessage =
            "Http Response ${DateTime.now()}\nStatus Code: ${httpResponse.statusCode}\nHeaders ${httpResponse.headers}\nBody: ${httpResponse.body}";
    GzLoggerUtil.createLogger(GzLoggerUtil.emojis.robot, logMessage);
  }
}

class HtmlRequestLogger implements GzLogger {
  HtmlRequestLogger(
      {required String method,
      required Map<String, String> headers,
      required Uri uri,
      String? body,
      int? methodCount}) {
    late String logMessage = "Request ${DateTime.now()}\nURI: $uri\nMethod: $method\nheaders: $headers\nBody: $body";
    GzLoggerUtil.createLogger(GzLoggerUtil.emojis.robot, logMessage);
  }
}

class HtmlResponseLogger implements GzLogger {
  HtmlResponseLogger(
      {Map<String, String>? printHeaders, required int statusCode, required String body, int? methodCount}) {
    late String logMessage;
    printHeaders == null
        ? logMessage = "${DateTime.now()}\nResponse\nStatus Code: $statusCode\nBody: $body"
        : logMessage = "${DateTime.now()}\nResponse\nStatus Code: $statusCode\nHeaders $printHeaders\nBody: $body";
    GzLoggerUtil.createLogger(GzLoggerUtil.emojis.robot, logMessage);
  }
}
