/// Configuration file to tweak settings like `environment`, `log-level`
class Env {
  static bool prod = false;

  static const LogLevel errorType = LogLevel.verbose;
}

enum LogLevel { verbose, info, error }
