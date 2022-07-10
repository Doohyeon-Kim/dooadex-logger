import 'package:logger/logger.dart';

class DdxLoggerUtil {
  DdxLoggerUtil._();

  static createLogger(String emoji, dynamic message) {
    message = message.toString();
    List<String> buffer = [];
    for (String messageLine in message.split('\n')) {
      buffer.add("$emoji $messageLine");
    }
    Logger(printer: PrettyPrinter(methodCount: 0, printEmojis: false))
        .d(buffer.join("\n"));
  }

  static _Emojis emojis = _Emojis();
}

class _Emojis {
  String ddx = '🦥';
  String info = '💡';
  String warning = '⚠️';
  String robot = '🤖';
  String heart = '❤️';
  String poop = '💩️';
}
