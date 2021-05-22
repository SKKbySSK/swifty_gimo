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
    Object message, {
    String tag = '',
    Object? error,
    StackTrace? stackTrace,
  }) {
    _prettyPrint(LogLevel.debug, message, tag, error, stackTrace);
  }

  void i(
    Object message, {
    String tag = '',
    Object? error,
    StackTrace? stackTrace,
  }) {
    _prettyPrint(LogLevel.info, message, tag, error, stackTrace);
  }

  void w(
    Object message, {
    String tag = '',
    Object? error,
    StackTrace? stackTrace,
  }) {
    _prettyPrint(LogLevel.warning, message, tag, error, stackTrace);
  }

  void e(
    Object message, {
    String tag = '',
    Object? error,
    StackTrace? stackTrace,
  }) {
    _prettyPrint(LogLevel.error, message, tag, error, stackTrace);
  }

  void _prettyPrint(LogLevel level, Object message, String tag, Object? error,
      StackTrace? stackTrace) {
    final filter = this.filter ?? DefaultLogFilter.instance;
    if (!filter.shouldPrint(level, message, tag, error, stackTrace)) {
      return;
    }

    final writer = this.writer ?? DefaultLogWriter.instance;
    writer.write(level, message, tag, error, stackTrace);
  }
}
