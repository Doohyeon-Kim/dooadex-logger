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
  String gazua = 'đĻĨ';
  String info = 'đĄ';
  String debug = 'đ';
  String warning = 'â ī¸';
  String error = 'đ';
  String exception = 'đĢ';
  String build = 'đ';
  String robot = 'đ¤';
  String heart = 'â¤ī¸';
  String poop = 'đŠī¸';
}
