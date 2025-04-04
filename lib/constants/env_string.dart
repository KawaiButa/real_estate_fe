// Environment wrapper class
import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvString {
  static String get apiKey => dotenv.get('API_KEY');
  static String get sentryDsn => dotenv.get('SENTRY_DSN');
  static String get baseUrl => dotenv.get("BACKEND_URL");
}
