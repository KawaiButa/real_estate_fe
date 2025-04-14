import 'package:flutter/widgets.dart';
import 'package:real_estate_fe/app/app.locator.dart';
import 'package:real_estate_fe/app/app.router.dart';
import 'package:real_estate_fe/models/property.dart';
import 'package:real_estate_fe/models/user.dart';
import 'package:real_estate_fe/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PropertyViewModel extends ReactiveViewModel {
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();
  User? get user => _authService.data;
  final scrollController = ScrollController();
  @override
  List<ListenableServiceMixin> get listenableServices => [_authService];
  navigateToPropertyDetail(Property property) {
    _navigationService.navigateToPropertyDetailView(
        property: property, isOwner: true);
  }

  void navigateToPropertyCreate() async {
    await _navigationService.navigateToPropertyCreationView();
    _authService.fetchProfile();
  }
}
