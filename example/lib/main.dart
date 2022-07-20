import 'package:gazua_logger/gazua_logger.dart';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:twostrings_palette/twostrings_palette.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Two Strings Package Test App',
      theme: ThemeData(
        primarySwatch:
            MaterialColor(TwoStringsColor.primaryMaterialColor.colorHex, TwoStringsColor.primaryMaterialColor.swatch),
      ),
      home: const MyHomePage(title: 'Two Strings Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Uri _generateUri() {
    return Uri(scheme: "https", host: "api.agify.io", path: null, queryParameters: null, query: "name=dhkim");
  }

  Future<http.Response> _httpRequest({required http.Request request}) async {
    final streamedResponse = await request.send();
    return await http.Response.fromStream(streamedResponse);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            GzLogger("Default Logger");
            GzLogger("You can user this for even Object ${_TestObjectPrint()}");
            GzLogger.warning("Warning");
            GzLogger.info("Info");
            GzLogger.debug("Debugging");
            GzLogger.log("log1\nlog2\nlog3\nlog4\nlog5");
            GzLogger.build("build start\nbuilding...\nbuilding...\nbuilding...\nbuild done");
            GzFunLogger.heart("I Love You.");
            GzFunLogger.poop("Shit Code");

            GzLogger.exception(_GzException("Exception Message"));
            GzLogger.error(GzError.example());

            http.Request request = http.Request("GET", _generateUri());
            request.headers.addAll({'Content-Type': 'application/json'});

            GzLogger.httpRequest(httpRequest: request);
            http.Response response = await _httpRequest(request: request);
            GzLogger.httpResponse(httpResponse: response);
            GzLogger.httpResponse(httpResponse: response, printHeaders: true);
          },
          child: const Text("Test"),
        ),
      ),
    );
  }
}

class _TestObjectPrint {
  final String str = "Instance";
  final int integer = 3;
}

class _GzException implements Exception {
  _GzException(this.message);

  final String? message;

  @override
  String toString() {
    return "GzException: $message";
  }
}

class GzError implements Error {
  final String? type;
  final String? message;
  final String? title;
  final String? detail;

  GzError({this.type, this.message, this.title, this.detail});

  @override
  String toString() {
    return "$type\n$message\n$title\n$detail";
  }

  @override
  StackTrace? get stackTrace => throw UnimplementedError();

  factory GzError.example({String? type, String? message, String? title, String? detail}) = _Example;
}

class _Example extends GzError {
  _Example({String? type, String? message, String? title, String? detail})
      : super(
            type: type ?? "TEST_ERROR",
            message: message ?? 'Error occurred',
            title: title ?? 'Error Title',
            detail: detail ?? 'Error Message');
}
