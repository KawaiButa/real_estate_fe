import 'package:flutter/widgets.dart';
import 'package:real_estate_fe/app/app.locator.dart';
import 'package:real_estate_fe/app/app.router.dart';
import 'package:real_estate_fe/models/property.dart';
import 'package:real_estate_fe/models/user.dart';
import 'package:real_estate_fe/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PropertyViewModel extends BaseViewModel {
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();
  User? get user => _authService.data;
  final scrollController = ScrollController();
  navigateToPropertyDetail(Property property) {
    _navigationService.navigateToPropertyDetailView(
        property: property, isOwner: true);
  }

  void navigateToPropertyCreate() =>
      _navigationService.navigateToPropertyCreationView();
}
