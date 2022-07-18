import 'package:dooadex_logger/dooadex_logger.dart';
import 'package:dooadex_palette/dooadex_palette.dart';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dooadex Package Test App',
      theme: ThemeData(
        primarySwatch:
            MaterialColor(DooadexColor.primaryMaterialColor.colorHex, DooadexColor.primaryMaterialColor.swatch),
      ),
      home: const MyHomePage(title: 'Dooadex Home Page'),
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
            DdxLogger("Default Logger");
            DdxLogger("You can user this for even Object ${_TestObjectPrint()}");
            DdxLogger.warning("Warning");
            DdxLogger.info("Info");
            DdxLogger.debug("Debugging");
            DdxLogger.log("log1\nlog2\nlog3\nlog4\nlog5");
            DdxLogger.build("build start\nbuilding...\nbuilding...\nbuilding...\nbuild done");
            DdxFunLogger.heart("I Love You.");
            DdxFunLogger.poop("Shit Code");

            DdxLogger.exception(_DdxException("Exception Message"));
            DdxLogger.error(DdxError.example());

            http.Request request = http.Request("GET", _generateUri());
            request.headers.addAll({'Content-Type': 'application/json'});

            DdxLogger.httpRequest(httpRequest: request);
            http.Response response = await _httpRequest(request: request);
            DdxLogger.httpResponse(httpResponse: response);
            DdxLogger.httpResponse(httpResponse: response, printHeaders: true);
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

class _DdxException implements Exception {
  _DdxException(this.message);

  final String? message;

  @override
  String toString() {
    return "DooadexException: $message";
  }
}

class DdxError implements Error {
  final String? type;
  final String? message;
  final String? title;
  final String? detail;

  DdxError({this.type, this.message, this.title, this.detail});

  @override
  String toString() {
    return "$type\n$message\n$title\n$detail";
  }

  @override
  StackTrace? get stackTrace => throw UnimplementedError();

  factory DdxError.example({String? type, String? message, String? title, String? detail}) = _Example;
}

class _Example extends DdxError {
  _Example({String? type, String? message, String? title, String? detail})
      : super(
            type: type ?? "TEST_ERROR",
            message: message ?? 'Error occurred',
            title: title ?? 'Error Title',
            detail: detail ?? 'Error Message');
}
