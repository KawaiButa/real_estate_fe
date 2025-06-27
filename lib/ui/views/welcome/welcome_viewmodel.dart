import 'package:flutter/material.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:real_estate_fe/app/app.locator.dart';
import 'package:real_estate_fe/services/app_service.dart';
import 'package:real_estate_fe/services/auth_service.dart';
import 'package:real_estate_fe/services/banner_service.dart';
import 'package:real_estate_fe/services/location_post_service.dart';
import 'package:real_estate_fe/services/location_service.dart';
import 'package:real_estate_fe/services/property_service.dart';
import 'package:real_estate_fe/services/property_type_service.dart';
import 'package:real_estate_fe/ui/views/favorite/favorite_view.dart';
import 'package:real_estate_fe/ui/views/home/home_view.dart';
import 'package:real_estate_fe/ui/views/profile/profile_view.dart';
import 'package:real_estate_fe/ui/views/search/search_view.dart';
import 'package:stacked/stacked.dart';

class WelcomeViewModel extends ReactiveViewModel {
  final _appService = locator<AppService>();
  final _propertyService = locator<PropertyService>();
  final _bannerService = locator<BannerService>();
  final _locationPostService = locator<LocationPostService>();
  final _authService = locator<AuthService>();
  final refreshController = RefreshController();
  Widget currentView = const HomeView();

  @override
  List<ListenableServiceMixin> get listenableServices => [_appService];
  int get index => _appService.welcomeIndex;

  get onSearch => null;
  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return const HomeView();
      case 1:
        return const SearchView();
      case 3:
        return const FavoriteView();
      case 4:
        return const ProfileView();
      default:
        return const HomeView();
    }
  }

  void setIndex(int value) {
    _appService.changeIndex(value);
  }

  refreshPage() {
    refreshController.refreshCompleted();
    _authService.fetchProfile();
    _authService.refreshToken();
    switch (index) {
      case 0:
        _propertyService.fetchProperties();
        _bannerService.fetchBanner();
        _locationPostService.fetchLocationPost();
        break;
      default:
        break;
    }
  }
}
