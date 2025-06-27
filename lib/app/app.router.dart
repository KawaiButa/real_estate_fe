// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i28;
import 'package:flutter/material.dart';
import 'package:real_estate_fe/models/chat_session.dart' as _i31;
import 'package:real_estate_fe/models/property.dart' as _i30;
import 'package:real_estate_fe/models/property_type.dart' as _i29;
import 'package:real_estate_fe/models/user.dart' as _i32;
import 'package:real_estate_fe/ui/views/chat_detail/chat_detail_view.dart'
    as _i21;
import 'package:real_estate_fe/ui/views/chat_list/chat_list_view.dart' as _i20;
import 'package:real_estate_fe/ui/views/edit_profile/edit_profile_view.dart'
    as _i15;
import 'package:real_estate_fe/ui/views/edit_property/edit_property_view.dart'
    as _i16;
import 'package:real_estate_fe/ui/views/favorite/favorite_view.dart' as _i12;
import 'package:real_estate_fe/ui/views/full_image_preview/full_image_preview_view.dart'
    as _i4;
import 'package:real_estate_fe/ui/views/guest/guest_view.dart' as _i18;
import 'package:real_estate_fe/ui/views/guide_panorama/guide_panorama_view.dart'
    as _i23;
import 'package:real_estate_fe/ui/views/guide_vertical/guide_vertical_view.dart'
    as _i24;
import 'package:real_estate_fe/ui/views/home/home_view.dart' as _i5;
import 'package:real_estate_fe/ui/views/login/login_view.dart' as _i8;
import 'package:real_estate_fe/ui/views/new_tourview/new_tourview_view.dart'
    as _i19;
import 'package:real_estate_fe/ui/views/panorama_view/panorama_view_view.dart'
    as _i27;
import 'package:real_estate_fe/ui/views/paranoma/paranoma_view.dart' as _i22;
import 'package:real_estate_fe/ui/views/partner_registration/partner_registration_view.dart'
    as _i11;
import 'package:real_estate_fe/ui/views/profile/profile_view.dart' as _i7;
import 'package:real_estate_fe/ui/views/property/property_view.dart' as _i14;
import 'package:real_estate_fe/ui/views/property_creation/property_creation_view.dart'
    as _i13;
import 'package:real_estate_fe/ui/views/property_detail/property_detail_view.dart'
    as _i10;
import 'package:real_estate_fe/ui/views/register/register_view.dart' as _i9;
import 'package:real_estate_fe/ui/views/review/review_view.dart' as _i17;
import 'package:real_estate_fe/ui/views/search/search_view.dart' as _i6;
import 'package:real_estate_fe/ui/views/startup/startup_view.dart' as _i3;
import 'package:real_estate_fe/ui/views/tourview/tourview_view.dart' as _i26;
import 'package:real_estate_fe/ui/views/vertical_capture/vertical_capture_view.dart'
    as _i25;
import 'package:real_estate_fe/ui/views/welcome/welcome_view.dart' as _i2;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i33;

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

  static const propertyCreationView = '/property-creation-view';

  static const propertyView = '/property-view';

  static const editProfileView = '/edit-profile-view';

  static const editPropertyView = '/edit-property-view';

  static const reviewView = '/review-view';

  static const guestView = '/guest-view';

  static const newTourviewView = '/new-tourview-view';

  static const chatListView = '/chat-list-view';

  static const chatDetailView = '/chat-detail-view';

  static const paranomaView = '/paranoma-view';

  static const guidePanoramaView = '/guide-panorama-view';

  static const guideVerticalView = '/guide-vertical-view';

  static const verticalCaptureView = '/vertical-capture-view';

  static const tourviewView = '/tourview-view';

  static const panoramaViewView = '/panorama-view-view';

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
    propertyCreationView,
    propertyView,
    editProfileView,
    editPropertyView,
    reviewView,
    guestView,
    newTourviewView,
    chatListView,
    chatDetailView,
    paranomaView,
    guidePanoramaView,
    guideVerticalView,
    verticalCaptureView,
    tourviewView,
    panoramaViewView,
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
    _i1.RouteDef(
      Routes.propertyCreationView,
      page: _i13.PropertyCreationView,
    ),
    _i1.RouteDef(
      Routes.propertyView,
      page: _i14.PropertyView,
    ),
    _i1.RouteDef(
      Routes.editProfileView,
      page: _i15.EditProfileView,
    ),
    _i1.RouteDef(
      Routes.editPropertyView,
      page: _i16.EditPropertyView,
    ),
    _i1.RouteDef(
      Routes.reviewView,
      page: _i17.ReviewView,
    ),
    _i1.RouteDef(
      Routes.guestView,
      page: _i18.GuestView,
    ),
    _i1.RouteDef(
      Routes.newTourviewView,
      page: _i19.NewTourviewView,
    ),
    _i1.RouteDef(
      Routes.chatListView,
      page: _i20.ChatListView,
    ),
    _i1.RouteDef(
      Routes.chatDetailView,
      page: _i21.ChatDetailView,
    ),
    _i1.RouteDef(
      Routes.paranomaView,
      page: _i22.ParanomaView,
    ),
    _i1.RouteDef(
      Routes.guidePanoramaView,
      page: _i23.GuidePanoramaView,
    ),
    _i1.RouteDef(
      Routes.guideVerticalView,
      page: _i24.GuideVerticalView,
    ),
    _i1.RouteDef(
      Routes.verticalCaptureView,
      page: _i25.VerticalCaptureView,
    ),
    _i1.RouteDef(
      Routes.tourviewView,
      page: _i26.TourviewView,
    ),
    _i1.RouteDef(
      Routes.panoramaViewView,
      page: _i27.PanoramaViewView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.WelcomeView: (data) {
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.WelcomeView(),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
      );
    },
    _i4.FullImagePreviewView: (data) {
      final args = data.getArgs<FullImagePreviewViewArguments>(nullOk: false);
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => _i4.FullImagePreviewView(args.imageUrl,
            boxFit: args.boxFit, key: args.key),
        settings: data,
      );
    },
    _i5.HomeView: (data) {
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.HomeView(),
        settings: data,
      );
    },
    _i6.SearchView: (data) {
      final args = data.getArgs<SearchViewArguments>(
        orElse: () => const SearchViewArguments(),
      );
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => _i6.SearchView(
            key: args.key,
            selectedPropertyType: args.selectedPropertyType,
            query: args.query),
        settings: data,
      );
    },
    _i7.ProfileView: (data) {
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.ProfileView(),
        settings: data,
      );
    },
    _i8.LoginView: (data) {
      final args = data.getArgs<LoginViewArguments>(
        orElse: () => const LoginViewArguments(),
      );
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => _i8.LoginView(key: args.key),
        settings: data,
      );
    },
    _i9.RegisterView: (data) {
      final args = data.getArgs<RegisterViewArguments>(
        orElse: () => const RegisterViewArguments(),
      );
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => _i9.RegisterView(key: args.key),
        settings: data,
      );
    },
    _i10.PropertyDetailView: (data) {
      final args = data.getArgs<PropertyDetailViewArguments>(nullOk: false);
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => _i10.PropertyDetailView(
            key: args.key, property: args.property, isOwner: args.isOwner),
        settings: data,
      );
    },
    _i11.PartnerRegistrationView: (data) {
      final args = data.getArgs<PartnerRegistrationViewArguments>(
        orElse: () => const PartnerRegistrationViewArguments(),
      );
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => _i11.PartnerRegistrationView(key: args.key),
        settings: data,
      );
    },
    _i12.FavoriteView: (data) {
      final args = data.getArgs<FavoriteViewArguments>(
        orElse: () => const FavoriteViewArguments(),
      );
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => _i12.FavoriteView(
            key: args.key,
            selectedPropertyType: args.selectedPropertyType,
            query: args.query),
        settings: data,
      );
    },
    _i13.PropertyCreationView: (data) {
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => _i13.PropertyCreationView(),
        settings: data,
      );
    },
    _i14.PropertyView: (data) {
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => const _i14.PropertyView(),
        settings: data,
      );
    },
    _i15.EditProfileView: (data) {
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => const _i15.EditProfileView(),
        settings: data,
      );
    },
    _i16.EditPropertyView: (data) {
      final args = data.getArgs<EditPropertyViewArguments>(nullOk: false);
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i16.EditPropertyView(property: args.property, key: args.key),
        settings: data,
      );
    },
    _i17.ReviewView: (data) {
      final args = data.getArgs<ReviewViewArguments>(nullOk: false);
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i17.ReviewView(key: args.key, property: args.property),
        settings: data,
      );
    },
    _i18.GuestView: (data) {
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => const _i18.GuestView(),
        settings: data,
      );
    },
    _i19.NewTourviewView: (data) {
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => const _i19.NewTourviewView(),
        settings: data,
      );
    },
    _i20.ChatListView: (data) {
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => const _i20.ChatListView(),
        settings: data,
      );
    },
    _i21.ChatDetailView: (data) {
      final args = data.getArgs<ChatDetailViewArguments>(
        orElse: () => const ChatDetailViewArguments(),
      );
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => _i21.ChatDetailView(
            key: args.key, chatSession: args.chatSession, user: args.user),
        settings: data,
      );
    },
    _i22.ParanomaView: (data) {
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => const _i22.ParanomaView(),
        settings: data,
      );
    },
    _i23.GuidePanoramaView: (data) {
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => const _i23.GuidePanoramaView(),
        settings: data,
      );
    },
    _i24.GuideVerticalView: (data) {
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => const _i24.GuideVerticalView(),
        settings: data,
      );
    },
    _i25.VerticalCaptureView: (data) {
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => const _i25.VerticalCaptureView(),
        settings: data,
      );
    },
    _i26.TourviewView: (data) {
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => const _i26.TourviewView(),
        settings: data,
      );
    },
    _i27.PanoramaViewView: (data) {
      final args = data.getArgs<PanoramaViewViewArguments>(nullOk: false);
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i27.PanoramaViewView(key: args.key, url: args.url),
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

  final _i28.BoxFit? boxFit;

  final _i28.Key? key;

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

  final _i28.Key? key;

  final _i29.PropertyType? selectedPropertyType;

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

  final _i28.Key? key;

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

  final _i28.Key? key;

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
    this.isOwner = false,
  });

  final _i28.Key? key;

  final _i30.Property property;

  final bool isOwner;

  @override
  String toString() {
    return '{"key": "$key", "property": "$property", "isOwner": "$isOwner"}';
  }

  @override
  bool operator ==(covariant PropertyDetailViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.property == property &&
        other.isOwner == isOwner;
  }

  @override
  int get hashCode {
    return key.hashCode ^ property.hashCode ^ isOwner.hashCode;
  }
}

class PartnerRegistrationViewArguments {
  const PartnerRegistrationViewArguments({this.key});

  final _i28.Key? key;

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

  final _i28.Key? key;

  final _i29.PropertyType? selectedPropertyType;

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

class EditPropertyViewArguments {
  const EditPropertyViewArguments({
    required this.property,
    this.key,
  });

  final _i30.Property property;

  final _i28.Key? key;

  @override
  String toString() {
    return '{"property": "$property", "key": "$key"}';
  }

  @override
  bool operator ==(covariant EditPropertyViewArguments other) {
    if (identical(this, other)) return true;
    return other.property == property && other.key == key;
  }

  @override
  int get hashCode {
    return property.hashCode ^ key.hashCode;
  }
}

class ReviewViewArguments {
  const ReviewViewArguments({
    this.key,
    required this.property,
  });

  final _i28.Key? key;

  final _i30.Property property;

  @override
  String toString() {
    return '{"key": "$key", "property": "$property"}';
  }

  @override
  bool operator ==(covariant ReviewViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.property == property;
  }

  @override
  int get hashCode {
    return key.hashCode ^ property.hashCode;
  }
}

class ChatDetailViewArguments {
  const ChatDetailViewArguments({
    this.key,
    this.chatSession,
    this.user,
  });

  final _i28.Key? key;

  final _i31.ChatSession? chatSession;

  final _i32.User? user;

  @override
  String toString() {
    return '{"key": "$key", "chatSession": "$chatSession", "user": "$user"}';
  }

  @override
  bool operator ==(covariant ChatDetailViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.chatSession == chatSession &&
        other.user == user;
  }

  @override
  int get hashCode {
    return key.hashCode ^ chatSession.hashCode ^ user.hashCode;
  }
}

class PanoramaViewViewArguments {
  const PanoramaViewViewArguments({
    this.key,
    required this.url,
  });

  final _i28.Key? key;

  final String url;

  @override
  String toString() {
    return '{"key": "$key", "url": "$url"}';
  }

  @override
  bool operator ==(covariant PanoramaViewViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.url == url;
  }

  @override
  int get hashCode {
    return key.hashCode ^ url.hashCode;
  }
}

extension NavigatorStateExtension on _i33.NavigationService {
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
    _i28.BoxFit? boxFit,
    _i28.Key? key,
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
    _i28.Key? key,
    _i29.PropertyType? selectedPropertyType,
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
    _i28.Key? key,
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
    _i28.Key? key,
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
    _i28.Key? key,
    required _i30.Property property,
    bool isOwner = false,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.propertyDetailView,
        arguments: PropertyDetailViewArguments(
            key: key, property: property, isOwner: isOwner),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPartnerRegistrationView({
    _i28.Key? key,
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
    _i28.Key? key,
    _i29.PropertyType? selectedPropertyType,
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

  Future<dynamic> navigateToPropertyCreationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.propertyCreationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPropertyView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.propertyView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToEditProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.editProfileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToEditPropertyView({
    required _i30.Property property,
    _i28.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.editPropertyView,
        arguments: EditPropertyViewArguments(property: property, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToReviewView({
    _i28.Key? key,
    required _i30.Property property,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.reviewView,
        arguments: ReviewViewArguments(key: key, property: property),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToGuestView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.guestView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNewTourviewView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.newTourviewView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToChatListView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.chatListView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToChatDetailView({
    _i28.Key? key,
    _i31.ChatSession? chatSession,
    _i32.User? user,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.chatDetailView,
        arguments: ChatDetailViewArguments(
            key: key, chatSession: chatSession, user: user),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToParanomaView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.paranomaView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToGuidePanoramaView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.guidePanoramaView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToGuideVerticalView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.guideVerticalView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToVerticalCaptureView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.verticalCaptureView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTourviewView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.tourviewView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPanoramaViewView({
    _i28.Key? key,
    required String url,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.panoramaViewView,
        arguments: PanoramaViewViewArguments(key: key, url: url),
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
    _i28.BoxFit? boxFit,
    _i28.Key? key,
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
    _i28.Key? key,
    _i29.PropertyType? selectedPropertyType,
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
    _i28.Key? key,
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
    _i28.Key? key,
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
    _i28.Key? key,
    required _i30.Property property,
    bool isOwner = false,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.propertyDetailView,
        arguments: PropertyDetailViewArguments(
            key: key, property: property, isOwner: isOwner),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPartnerRegistrationView({
    _i28.Key? key,
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
    _i28.Key? key,
    _i29.PropertyType? selectedPropertyType,
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

  Future<dynamic> replaceWithPropertyCreationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.propertyCreationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPropertyView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.propertyView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithEditProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.editProfileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithEditPropertyView({
    required _i30.Property property,
    _i28.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.editPropertyView,
        arguments: EditPropertyViewArguments(property: property, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithReviewView({
    _i28.Key? key,
    required _i30.Property property,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.reviewView,
        arguments: ReviewViewArguments(key: key, property: property),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithGuestView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.guestView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNewTourviewView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.newTourviewView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithChatListView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.chatListView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithChatDetailView({
    _i28.Key? key,
    _i31.ChatSession? chatSession,
    _i32.User? user,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.chatDetailView,
        arguments: ChatDetailViewArguments(
            key: key, chatSession: chatSession, user: user),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithParanomaView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.paranomaView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithGuidePanoramaView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.guidePanoramaView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithGuideVerticalView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.guideVerticalView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithVerticalCaptureView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.verticalCaptureView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTourviewView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.tourviewView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPanoramaViewView({
    _i28.Key? key,
    required String url,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.panoramaViewView,
        arguments: PanoramaViewViewArguments(key: key, url: url),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
