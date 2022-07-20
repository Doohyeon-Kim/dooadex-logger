import 'package:logger/logger.dart';

class GzLoggerUtil {
  GzLoggerUtil._();

  static createLogger(String emoji, dynamic message, {int? methodCount}) {
    message = message.toString();
    List<String> buffer = [];
    for (String messageLine in message.split('\n')) {
      buffer.add("$emoji $messageLine");
    }
    Logger(printer: PrettyPrinter(methodCount: methodCount ??= 0, printEmojis: false)).d(buffer.join("\n"));
  }

  static _Emojis emojis = _Emojis();
}

class _Emojis {
  String gazua = '🦥';
  String info = '💡';
  String debug = '🐛';
  String warning = '⚠️';
  String error = '🛑';
  String exception = '🚫';
  String build = '🏗';
  String robot = '🤖';
  String heart = '❤️';
  String poop = '💩️';
}
