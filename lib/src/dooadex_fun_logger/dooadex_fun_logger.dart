import './dooadex_fun_logger_factory.dart';

class DdxFunLogger {
  factory DdxFunLogger.heart(dynamic message) = HeartLogger;

  factory DdxFunLogger.poop(dynamic message) = PoopLogger;
}
