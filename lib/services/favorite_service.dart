import 'package:dio/src/response.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:real_estate_fe/app/app.locator.dart';
import 'package:real_estate_fe/app/app.router.dart';
import 'package:real_estate_fe/constants/api.dart';
import 'package:real_estate_fe/models/paginated_list.dart';
import 'package:real_estate_fe/models/paginated_metadata.dart';
import 'package:real_estate_fe/models/property.dart';
import 'package:real_estate_fe/services/alert_service.dart';
import 'package:real_estate_fe/services/auth_service.dart' show AuthService;
import 'package:real_estate_fe/services/http_service.dart';
import 'package:stacked_services/stacked_services.dart';

class FavoriteService extends HttpService<PaginatedList<Property>> {
  final _alertService = locator<AlertService>();
  final _navigationService = locator<NavigationService>();
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

  Future<PaginatedList<Property>?> fetchFavoredProperty({int page = 1}) async {
    return await get(Api.favorite, queryParameters: {"page": page});
  }

  @override
  fromResponse(Response response) {
    return PaginatedList(
        data: (response.data["items"] as List)
            .map((e) => Property.fromJson(e))
            .toList(),
        metadata: PaginatedMetadata.fromJson(response.data));
  }

  @override
  parser(Map<String, dynamic> hiveMap) {
    return PaginatedList(
        data: (hiveMap["items"] as List)
            .map((e) => Property.fromJson(e))
            .toList(),
        metadata: PaginatedMetadata.fromJson(hiveMap));
  }
}
