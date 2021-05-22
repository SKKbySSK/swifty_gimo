import 'package:swifty_gimo/logging/log_filter.dart';
import 'package:swifty_gimo/logging/log_writer.dart';

enum LogLevel {
  debug,
  info,
  warning,
  error,
}

class Log {
  Log({
    this.filter,
    this.writer,
  });

  LogFilter? filter;
  LogWriter? writer;

  static final shared = Log();

  void d(
    String message, {
    String tag = '',
    Object? error,
    StackTrace? stackTrace,
  }) {
    _prettyPrint(LogLevel.debug, message, tag, error, stackTrace);
  }

  void i(
    String message, {
    String tag = '',
    Object? error,
    StackTrace? stackTrace,
  }) {
    _prettyPrint(LogLevel.info, message, tag, error, stackTrace);
  }

  void w(
    String message, {
    String tag = '',
    Object? error,
    StackTrace? stackTrace,
  }) {
    _prettyPrint(LogLevel.warning, message, tag, error, stackTrace);
  }

  void e(
    String message, {
    String tag = '',
    Object? error,
    StackTrace? stackTrace,
  }) {
    _prettyPrint(LogLevel.error, message, tag, error, stackTrace);
  }

  void _prettyPrint(LogLevel level, String message, String tag, Object? error,
      StackTrace? stackTrace) {
    final filter = this.filter ?? DefaultLogFilter.instance;
    if (!filter.shouldPrint(level, message, tag, error, stackTrace)) {
      return;
    }

    final writer = this.writer ?? DefaultLogWriter.instance;
    writer.write(level, message, tag, error, stackTrace);
  }
}
