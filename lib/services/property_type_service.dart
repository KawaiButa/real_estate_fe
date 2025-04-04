import 'package:dio/src/response.dart';
import 'package:real_estate_fe/constants/api.dart';
import 'package:real_estate_fe/models/property_type.dart';
import 'package:real_estate_fe/services/http_service.dart';

class PropertyTypeService extends HttpService<List<PropertyType>> {
  Future<void> fetchPropertyTypes() async {
    await get(Api.propertyTypes);
  }

  @override
  List<PropertyType> fromResponse(Response response) {
    return (response.data as List)
        .map((e) => PropertyType.fromJson(e))
        .toList();
  }

  @override
  List<PropertyType> parser(Map<String, dynamic> hiveMap) {
    return (hiveMap['data'] as List)
        .map((e) => PropertyType.fromJson(e))
        .toList();
  }
}
