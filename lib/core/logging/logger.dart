import 'package:logger/logger.dart';

/*
  The LogThis class is a simple class that contains static methods to log messages at different levels. 

  install the logger package by adding the following line to the dependencies section of the pubspec.yaml file:
  logger: ^1.0.0
*/

class LogThis {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: true,
    ),
  );

  static void debug(String message) {
    _logger.d(message);
  }

  static void info(String message) {
    _logger.i(message);
  }

  static void error(String message) {
    _logger.e(message);
  }

  static void warning(String message) {
    _logger.w(message);
  }

  static void fatal(String message) {
    _logger.f(message);
  }

  static void verbose(String message) {
    _logger.t(message);
  }
}
