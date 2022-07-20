import '../gazua_logger_util.dart';
import 'gazua_fun_logger.dart';

class HeartLogger implements GzFunLogger {
  HeartLogger(dynamic message) {
    GzLoggerUtil.createLogger(GzLoggerUtil.emojis.heart, message);
  }
}

class PoopLogger implements GzFunLogger {
  PoopLogger(dynamic message) {
    GzLoggerUtil.createLogger(GzLoggerUtil.emojis.poop, message);
  }
}
