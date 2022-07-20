import './gazua_fun_logger_factory.dart';

class GzFunLogger {
  factory GzFunLogger.heart(dynamic message) = HeartLogger;

  factory GzFunLogger.poop(dynamic message) = PoopLogger;
}
