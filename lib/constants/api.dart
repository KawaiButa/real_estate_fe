import 'package:real_estate_fe/constants/env_string.dart';

class Api {
  static const String chatSession = "/chat_session";
  static String chatSessionById(String id) => "$chatSession/$id";
  static String get baseUrl => EnvString.baseUrl;
  static String get property => "/property";
  static String get login => "/auth/login";
  static String get register => "/auth/register";
  static String get propertyTypes => "/properties/types";
  static String get news => "/news";
  static String get toggleFavorite => "/profile/favorite";
  static String get partnerRegistration => "/partner/registration";
  static String get profile => "/profile";
  static String get favorite => "/profile/favorite";
  static String get banners => "/banners";
  static String get locationPost => "/property/count";
  static String get refreshToken => "/profile/refresh-token";
  static String get action => "/actions";
  static String checkAllow(String propertyId) =>
      "/properties/$propertyId/verifications/allow";
  static String verifyUSer(String propertyId) =>
      "/properties/$propertyId/verifications/verify";
  static String otp(String propertyId) =>
      "/properties/$propertyId/verifications/otp";
  static String review(String propertyId) => "/properties/$propertyId/ratings";
  static String tourview(String propertyId) =>
      "/properties/$propertyId/tourview";
  static String get analyzeProperty => "/chat_message/ai";
  static const String chatMessage = "/chat_message";
  static String chatMessageByUserId(String id) => "/chat_message/user/$id";
  static String chatMessageBySessionId(String id) =>
      "/chat_message/chat_session/$id";
}
