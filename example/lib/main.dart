// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'package:dooadex_logger/dooadex_logger.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              DooadexLogger.exception(_DooadexException("Exception Message"));
              DooadexLogger.error(DooadexError.example());

              http.Request request = http.Request("GET", _generateUri());
              request.headers.addAll({'Content-Type': 'application/json'});

              DooadexLogger.httpRequest(httpRequest: request);
              http.Response response = await _httpRequest(request: request);
              DooadexLogger.httpResponse(httpResponse: response);
              DooadexLogger.httpResponse(httpResponse: response, headers: true);
            },
            child: const Text("Test"),
          ),
        ),
      ),
    );
  }
}

class _DooadexException implements Exception {
  _DooadexException(this.message);

  final String? message;

  @override
  String toString() {
    return "DooadexException: $message";
  }
}

class DooadexError implements Error {
  final String? type;
  final String? message;
  final String? title;
  final String? detail;

  DooadexError({this.type, this.message, this.title, this.detail});

  @override
  String toString() {
    return "$type\n$message\n$title\n$detail";
  }

  @override
  // TODO: implement stackTrace
  StackTrace? get stackTrace => throw UnimplementedError();

  // factory DooadexError({String? type, String? message, String? title, String? detail}) = _DooadexError;
  factory DooadexError.example({String? type, String? message, String? title, String? detail}) = _Example;
}

class _Example extends DooadexError {
  _Example({String? type, String? message, String? title, String? detail})
      : super(
            type: type ?? "TEST_ERROR",
            message: message ?? 'Error occurred',
            title: title ?? 'Error Title',
            detail: detail ?? 'Error Message');
}
