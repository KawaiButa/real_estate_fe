import 'package:dio/src/response.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:real_estate_fe/app/app.locator.dart';
import 'package:real_estate_fe/app/app.router.dart';
import 'package:real_estate_fe/constants/api.dart';
import 'package:real_estate_fe/models/user.dart';
import 'package:real_estate_fe/services/alert_service.dart';
import 'package:real_estate_fe/services/auth_service.dart';
import 'package:real_estate_fe/services/http_service.dart';
import 'package:real_estate_fe/services/property_service.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileService extends HttpService<User> {
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();
  final _alertService = locator<AlertService>();
  Future<void> toggleFavorite(String propertyId) async {
    if (AuthService.currentUser == null) {
      final result = await _alertService.showConfirm(
          title: "Login",
          text: "You need to login to use this feature. Do you want to login?"
              .tr());
      if (result) _navigationService.navigateToLoginView();
      return;
    }
    final response = await post("${Api.toggleFavorite}/$propertyId", {});
    if (response.statusCode == 201) {
      return;
    }
    throw Exception("Error when toggle favorite");
  }

  Future<void> fetchProfile() async {
    await get(Api.profile);
  }

  @override
  User fromResponse(Response response) {
    return User.fromJson((response.data as Map<String, dynamic>));
  }

  @override
  User parser(Map<String, dynamic> hiveMap) {
    return User.fromJson(hiveMap['data']);
  }
}
