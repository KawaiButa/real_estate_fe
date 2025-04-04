import 'package:real_estate_fe/constants/env_string.dart';

class Api {
  static String get baseUrl => EnvString.baseUrl;
  static String get property => "/property";
  static String get login => "/auth/login";
  static String get register => "/auth/register";
  static String get propertyTypes => "/properties/types";
  static String get news => "/news";
  static String get toggleFavorite => "/profile/favorite";
  static String get partnerRegistration => "/partner/registration";
  static String get profile => "/profile";
}
