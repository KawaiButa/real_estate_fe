// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i13;
import 'package:flutter/material.dart';
import 'package:real_estate_fe/models/property.dart' as _i15;
import 'package:real_estate_fe/models/property_type.dart' as _i14;
import 'package:real_estate_fe/ui/views/favorite/favorite_view.dart' as _i12;
import 'package:real_estate_fe/ui/views/full_image_preview/full_image_preview_view.dart'
    as _i4;
import 'package:real_estate_fe/ui/views/home/home_view.dart' as _i5;
import 'package:real_estate_fe/ui/views/login/login_view.dart' as _i8;
import 'package:real_estate_fe/ui/views/partner_registration/partner_registration_view.dart'
    as _i11;
import 'package:real_estate_fe/ui/views/profile/profile_view.dart' as _i7;
import 'package:real_estate_fe/ui/views/property_detail/property_detail_view.dart'
    as _i10;
import 'package:real_estate_fe/ui/views/register/register_view.dart' as _i9;
import 'package:real_estate_fe/ui/views/search/search_view.dart' as _i6;
import 'package:real_estate_fe/ui/views/startup/startup_view.dart' as _i3;
import 'package:real_estate_fe/ui/views/welcome/welcome_view.dart' as _i2;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i16;

class Routes {
  static const welcomeView = '/welcome-view';

  static const startupView = '/startup-view';

  static const fullImagePreviewView = '/full-image-preview-view';

  static const homeView = '/home-view';

  static const searchView = '/search-view';

  static const profileView = '/profile-view';

  static const loginView = '/login-view';

  static const registerView = '/register-view';

  static const propertyDetailView = '/property-detail-view';

  static const partnerRegistrationView = '/partner-registration-view';

  static const favoriteView = '/favorite-view';

  static const all = <String>{
    welcomeView,
    startupView,
    fullImagePreviewView,
    homeView,
    searchView,
    profileView,
    loginView,
    registerView,
    propertyDetailView,
    partnerRegistrationView,
    favoriteView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.welcomeView,
      page: _i2.WelcomeView,
    ),
    _i1.RouteDef(
      Routes.startupView,
      page: _i3.StartupView,
    ),
    _i1.RouteDef(
      Routes.fullImagePreviewView,
      page: _i4.FullImagePreviewView,
    ),
    _i1.RouteDef(
      Routes.homeView,
      page: _i5.HomeView,
    ),
    _i1.RouteDef(
      Routes.searchView,
      page: _i6.SearchView,
    ),
    _i1.RouteDef(
      Routes.profileView,
      page: _i7.ProfileView,
    ),
    _i1.RouteDef(
      Routes.loginView,
      page: _i8.LoginView,
    ),
    _i1.RouteDef(
      Routes.registerView,
      page: _i9.RegisterView,
    ),
    _i1.RouteDef(
      Routes.propertyDetailView,
      page: _i10.PropertyDetailView,
    ),
    _i1.RouteDef(
      Routes.partnerRegistrationView,
      page: _i11.PartnerRegistrationView,
    ),
    _i1.RouteDef(
      Routes.favoriteView,
      page: _i12.FavoriteView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.WelcomeView: (data) {
      return _i13.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.WelcomeView(),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      return _i13.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
      );
    },
    _i4.FullImagePreviewView: (data) {
      final args = data.getArgs<FullImagePreviewViewArguments>(nullOk: false);
      return _i13.MaterialPageRoute<dynamic>(
        builder: (context) => _i4.FullImagePreviewView(args.imageUrl,
            boxFit: args.boxFit, key: args.key),
        settings: data,
      );
    },
    _i5.HomeView: (data) {
      return _i13.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.HomeView(),
        settings: data,
      );
    },
    _i6.SearchView: (data) {
      final args = data.getArgs<SearchViewArguments>(
        orElse: () => const SearchViewArguments(),
      );
      return _i13.MaterialPageRoute<dynamic>(
        builder: (context) => _i6.SearchView(
            key: args.key,
            selectedPropertyType: args.selectedPropertyType,
            query: args.query),
        settings: data,
      );
    },
    _i7.ProfileView: (data) {
      return _i13.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.ProfileView(),
        settings: data,
      );
    },
    _i8.LoginView: (data) {
      final args = data.getArgs<LoginViewArguments>(
        orElse: () => const LoginViewArguments(),
      );
      return _i13.MaterialPageRoute<dynamic>(
        builder: (context) => _i8.LoginView(key: args.key),
        settings: data,
      );
    },
    _i9.RegisterView: (data) {
      final args = data.getArgs<RegisterViewArguments>(
        orElse: () => const RegisterViewArguments(),
      );
      return _i13.MaterialPageRoute<dynamic>(
        builder: (context) => _i9.RegisterView(key: args.key),
        settings: data,
      );
    },
    _i10.PropertyDetailView: (data) {
      final args = data.getArgs<PropertyDetailViewArguments>(nullOk: false);
      return _i13.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i10.PropertyDetailView(key: args.key, property: args.property),
        settings: data,
      );
    },
    _i11.PartnerRegistrationView: (data) {
      final args = data.getArgs<PartnerRegistrationViewArguments>(
        orElse: () => const PartnerRegistrationViewArguments(),
      );
      return _i13.MaterialPageRoute<dynamic>(
        builder: (context) => _i11.PartnerRegistrationView(key: args.key),
        settings: data,
      );
    },
    _i12.FavoriteView: (data) {
      final args = data.getArgs<FavoriteViewArguments>(
        orElse: () => const FavoriteViewArguments(),
      );
      return _i13.MaterialPageRoute<dynamic>(
        builder: (context) => _i12.FavoriteView(
            key: args.key,
            selectedPropertyType: args.selectedPropertyType,
            query: args.query),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class FullImagePreviewViewArguments {
  const FullImagePreviewViewArguments({
    required this.imageUrl,
    this.boxFit,
    this.key,
  });

  final String imageUrl;

  final _i13.BoxFit? boxFit;

  final _i13.Key? key;

  @override
  String toString() {
    return '{"imageUrl": "$imageUrl", "boxFit": "$boxFit", "key": "$key"}';
  }

  @override
  bool operator ==(covariant FullImagePreviewViewArguments other) {
    if (identical(this, other)) return true;
    return other.imageUrl == imageUrl &&
        other.boxFit == boxFit &&
        other.key == key;
  }

  @override
  int get hashCode {
    return imageUrl.hashCode ^ boxFit.hashCode ^ key.hashCode;
  }
}

class SearchViewArguments {
  const SearchViewArguments({
    this.key,
    this.selectedPropertyType,
    this.query,
  });

  final _i13.Key? key;

  final _i14.PropertyType? selectedPropertyType;

  final String? query;

  @override
  String toString() {
    return '{"key": "$key", "selectedPropertyType": "$selectedPropertyType", "query": "$query"}';
  }

  @override
  bool operator ==(covariant SearchViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.selectedPropertyType == selectedPropertyType &&
        other.query == query;
  }

  @override
  int get hashCode {
    return key.hashCode ^ selectedPropertyType.hashCode ^ query.hashCode;
  }
}

class LoginViewArguments {
  const LoginViewArguments({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant LoginViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class RegisterViewArguments {
  const RegisterViewArguments({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant RegisterViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class PropertyDetailViewArguments {
  const PropertyDetailViewArguments({
    this.key,
    required this.property,
  });

  final _i13.Key? key;

  final _i15.Property property;

  @override
  String toString() {
    return '{"key": "$key", "property": "$property"}';
  }

  @override
  bool operator ==(covariant PropertyDetailViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.property == property;
  }

  @override
  int get hashCode {
    return key.hashCode ^ property.hashCode;
  }
}

class PartnerRegistrationViewArguments {
  const PartnerRegistrationViewArguments({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant PartnerRegistrationViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class FavoriteViewArguments {
  const FavoriteViewArguments({
    this.key,
    this.selectedPropertyType,
    this.query,
  });

  final _i13.Key? key;

  final _i14.PropertyType? selectedPropertyType;

  final String? query;

  @override
  String toString() {
    return '{"key": "$key", "selectedPropertyType": "$selectedPropertyType", "query": "$query"}';
  }

  @override
  bool operator ==(covariant FavoriteViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.selectedPropertyType == selectedPropertyType &&
        other.query == query;
  }

  @override
  int get hashCode {
    return key.hashCode ^ selectedPropertyType.hashCode ^ query.hashCode;
  }
}

extension NavigatorStateExtension on _i16.NavigationService {
  Future<dynamic> navigateToWelcomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.welcomeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToFullImagePreviewView({
    required String imageUrl,
    _i13.BoxFit? boxFit,
    _i13.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.fullImagePreviewView,
        arguments: FullImagePreviewViewArguments(
            imageUrl: imageUrl, boxFit: boxFit, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSearchView({
    _i13.Key? key,
    _i14.PropertyType? selectedPropertyType,
    String? query,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.searchView,
        arguments: SearchViewArguments(
            key: key, selectedPropertyType: selectedPropertyType, query: query),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.profileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginView({
    _i13.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.loginView,
        arguments: LoginViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToRegisterView({
    _i13.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.registerView,
        arguments: RegisterViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPropertyDetailView({
    _i13.Key? key,
    required _i15.Property property,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.propertyDetailView,
        arguments: PropertyDetailViewArguments(key: key, property: property),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPartnerRegistrationView({
    _i13.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.partnerRegistrationView,
        arguments: PartnerRegistrationViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToFavoriteView({
    _i13.Key? key,
    _i14.PropertyType? selectedPropertyType,
    String? query,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.favoriteView,
        arguments: FavoriteViewArguments(
            key: key, selectedPropertyType: selectedPropertyType, query: query),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithWelcomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.welcomeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithFullImagePreviewView({
    required String imageUrl,
    _i13.BoxFit? boxFit,
    _i13.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.fullImagePreviewView,
        arguments: FullImagePreviewViewArguments(
            imageUrl: imageUrl, boxFit: boxFit, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSearchView({
    _i13.Key? key,
    _i14.PropertyType? selectedPropertyType,
    String? query,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.searchView,
        arguments: SearchViewArguments(
            key: key, selectedPropertyType: selectedPropertyType, query: query),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.profileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginView({
    _i13.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.loginView,
        arguments: LoginViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithRegisterView({
    _i13.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.registerView,
        arguments: RegisterViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPropertyDetailView({
    _i13.Key? key,
    required _i15.Property property,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.propertyDetailView,
        arguments: PropertyDetailViewArguments(key: key, property: property),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPartnerRegistrationView({
    _i13.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.partnerRegistrationView,
        arguments: PartnerRegistrationViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithFavoriteView({
    _i13.Key? key,
    _i14.PropertyType? selectedPropertyType,
    String? query,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.favoriteView,
        arguments: FavoriteViewArguments(
            key: key, selectedPropertyType: selectedPropertyType, query: query),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
