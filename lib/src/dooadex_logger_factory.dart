import 'package:http/http.dart' as http;

import 'package:logger/logger.dart';

import 'dooadex_logger.dart';

class DefaultDooadexLogger implements DooadexLogger {
  DefaultDooadexLogger(String message, {int? methodCount}) {
    Logger(printer: PrettyPrinter(methodCount: methodCount ?? 0)).v(message);
  }
}

class ExceptionLogger implements DooadexLogger {
  ExceptionLogger(Exception exception, {int? methodCount}) {
    Logger(printer: PrettyPrinter(methodCount: methodCount ?? 15)).e(exception);
  }
}

class ErrorLogger implements DooadexLogger {
  ErrorLogger(Error error, {int? methodCount}) {
    Logger(printer: PrettyPrinter(methodCount: methodCount ?? 0)).e(error);
  }
}

class HttpRequestLogger implements DooadexLogger {
  HttpRequestLogger({required http.Request httpRequest}) {
    Logger(printer: PrettyPrinter(methodCount: 0)).d(
        "Http Request ${DateTime.now()}\nURI: ${httpRequest.url}\nMethod: ${httpRequest.method}\nheaders: ${httpRequest.headers}\nBody: ${httpRequest.body}");
  }
}

class HttpResponseLogger implements DooadexLogger {
  HttpResponseLogger({required http.Response httpResponse, bool headers = false}) {
    headers == false
        ? Logger(printer: PrettyPrinter(methodCount: 0))
            .d("Http Response ${DateTime.now()}\nStatus Code: ${httpResponse.statusCode}\nBody: ${httpResponse.body}")
        : Logger(printer: PrettyPrinter(methodCount: 0)).d(
            "Http Response ${DateTime.now()}\nStatus Code: ${httpResponse.statusCode}\nHeaders ${httpResponse.headers}\nBody: ${httpResponse.body}");
  }
}

class HtmlRequestLogger implements DooadexLogger {
  HtmlRequestLogger(
      {required String method,
      required Map<String, String> headers,
      required Uri uri,
      String? body,
      int? methodCount}) {
    Logger(printer: PrettyPrinter(methodCount: methodCount ?? 0))
        .d("Request ${DateTime.now()}\nURI: $uri\nMethod: $method\nheaders: $headers\nBody: $body");
  }
}

class HtmlResponseLogger implements DooadexLogger {
  HtmlResponseLogger({Map<String, String>? headers, required int statusCode, required String body, int? methodCount}) {
    headers == null
        ? Logger(printer: PrettyPrinter(methodCount: methodCount ?? 0))
            .d("${DateTime.now()}\nResponse\nStatus Code: $statusCode\nBody: $body")
        : Logger(printer: PrettyPrinter(methodCount: 0))
            .d("${DateTime.now()}\nResponse\nStatus Code: $statusCode\nHeaders $headers\nBody: $body");
  }
}