import 'package:dio/src/response.dart';
import 'package:real_estate_fe/app/app.locator.dart';
import 'package:real_estate_fe/constants/api.dart';
import 'package:real_estate_fe/models/property.dart';
import 'package:real_estate_fe/models/property_verification.dart';
import 'package:real_estate_fe/services/http_service.dart';
import 'package:real_estate_fe/services/location_service.dart';

class PropertyVerificationService extends HttpService<PropertyVerification> {
  final _locationService = locator<LocationService>();
  @override
  fromResponse(Response response) {
    return PropertyVerification.fromJson(response.data);
  }

  @override
  parser(Map<String, dynamic> hiveMap) {
    return PropertyVerification.fromJson(hiveMap['data']);
  }

  Future<PropertyVerification?> checkAllowReview(
      {required String propertyId}) async {
    return await get(Api.checkAllow(propertyId));
  }

  Future<PropertyVerification> verifyUser(
      {required String propertyId, required String code}) async {
    if (_locationService.currentPosition == null) {
      await _locationService.getCurrentLocation();
    }
    final response = await post(Api.verifyUSer(propertyId), {
      "code": code,
      "method": "qr_code",
      "lat": _locationService.currentPosition!.latitude,
      "lng": _locationService.currentPosition!.longitude,
    });
    if (response.statusCode == 201) {
      return PropertyVerification.fromJson(response.data);
    }
    throw Exception("Error when validating user in Property");
  }
}
