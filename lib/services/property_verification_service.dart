import 'package:dio/src/response.dart';
import 'package:real_estate_fe/constants/api.dart';
import 'package:real_estate_fe/models/property_verification.dart';
import 'package:real_estate_fe/services/http_service.dart';

class PropertyVerificationService extends HttpService<PropertyVerification> {
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
}
