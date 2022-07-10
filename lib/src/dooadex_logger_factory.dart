import 'package:http/http.dart' as http;

import 'package:logger/logger.dart';

import 'dooadex_logger.dart';
import 'dooadex_logger_util.dart';

class DefaultDooadexLogger implements DdxLogger {
  DefaultDooadexLogger(dynamic message) {
    DdxLoggerUtil.createLogger(DdxLoggerUtil.emojis.ddx, message);
  }
}

class ExceptionLogger implements DdxLogger {
  ExceptionLogger(Exception exception, {int? errorMethodCount}) {
    Logger(printer: PrettyPrinter(errorMethodCount: errorMethodCount ?? 15))
        .e(exception);
  }
}

class ErrorLogger implements DdxLogger {
  ErrorLogger(Error error, {int? methodCount}) {
    Logger(printer: PrettyPrinter(methodCount: methodCount ?? 0)).e(error);
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

class HttpRequestLogger implements DdxLogger {
  HttpRequestLogger({required http.Request httpRequest}) {
    Logger(printer: PrettyPrinter(methodCount: 0)).d(
        "Http Request ${DateTime.now()}\nURI: ${httpRequest.url}\nMethod: ${httpRequest.method}\nheaders: ${httpRequest.headers}\nBody: ${httpRequest.body}");
  }
}

class MultipartRequestLogger implements DdxLogger {
  MultipartRequestLogger({required http.MultipartRequest multipartRequest}) {
    Logger(printer: PrettyPrinter(methodCount: 0)).d(
        "Http Request ${DateTime.now()}\nURI: ${multipartRequest.url}\nMethod: ${multipartRequest.method}\nheaders: ${multipartRequest.headers}\nfiles: ${multipartRequest.files}");
  }
}

class HttpResponseLogger implements DdxLogger {
  HttpResponseLogger(
      {required http.Response httpResponse, bool headers = false}) {
    headers == false
        ? Logger(printer: PrettyPrinter(methodCount: 0)).d(
            "Http Response ${DateTime.now()}\nStatus Code: ${httpResponse.statusCode}\nBody: ${httpResponse.body}")
        : Logger(printer: PrettyPrinter(methodCount: 0)).d(
            "Http Response ${DateTime.now()}\nStatus Code: ${httpResponse.statusCode}\nHeaders ${httpResponse.headers}\nBody: ${httpResponse.body}");
  }
}

class HtmlRequestLogger implements DdxLogger {
  HtmlRequestLogger(
      {required String method,
      required Map<String, String> headers,
      required Uri uri,
      String? body,
      int? methodCount}) {
    Logger(printer: PrettyPrinter(methodCount: methodCount ?? 0)).d(
        "Request ${DateTime.now()}\nURI: $uri\nMethod: $method\nheaders: $headers\nBody: $body");
  }
}

class HtmlResponseLogger implements DdxLogger {
  HtmlResponseLogger(
      {Map<String, String>? headers,
      required int statusCode,
      required String body,
      int? methodCount}) {
    headers == null
        ? Logger(printer: PrettyPrinter(methodCount: methodCount ?? 0)).d(
            "${DateTime.now()}\nResponse\nStatus Code: $statusCode\nBody: $body")
        : Logger(printer: PrettyPrinter(methodCount: 0)).d(
            "${DateTime.now()}\nResponse\nStatus Code: $statusCode\nHeaders $headers\nBody: $body");
  }
}

class HeartLogger implements DdxLogger {
  HeartLogger(dynamic message) {
    DdxLoggerUtil.createLogger(DdxLoggerUtil.emojis.heart, message);
  }
}

class PoopLogger implements DdxLogger {
  PoopLogger(dynamic message) {
    DdxLoggerUtil.createLogger(DdxLoggerUtil.emojis.poop, message);
  }
}
