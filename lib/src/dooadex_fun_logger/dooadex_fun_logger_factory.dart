import '../dooadex_logger_util.dart';
import 'dooadex_fun_logger.dart';

class HeartLogger implements DdxFunLogger {
  HeartLogger(dynamic message) {
    DdxLoggerUtil.createLogger(DdxLoggerUtil.emojis.heart, message);
  }
}

class PoopLogger implements DdxFunLogger {
  PoopLogger(dynamic message) {
    DdxLoggerUtil.createLogger(DdxLoggerUtil.emojis.poop, message);
  }
}
