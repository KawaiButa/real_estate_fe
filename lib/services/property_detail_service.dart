import 'package:dio/src/response.dart';
import 'package:real_estate_fe/constants/api.dart';
import 'package:real_estate_fe/models/property.dart';
import 'package:real_estate_fe/services/http_service.dart';

class PropertyDetailService extends HttpService<Property> {
  Future<Property?> fetchPropertyDetail(String id) async {
    return await get("${Api.property}/$id");
  }

  @override
  Property fromResponse(Response response) {
    return Property.fromJson(response.data);
  }

  @override
  Property parser(Map<String, dynamic> hiveMap) {
    return Property.fromJson(hiveMap);
  }

  deleteProperty(String propertyId) async {
    final response = await delete("${Api.property}/$propertyId");
  }
}
