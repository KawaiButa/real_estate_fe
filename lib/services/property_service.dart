import 'package:dio/src/response.dart';
import 'package:real_estate_fe/constants/api.dart';
import 'package:real_estate_fe/models/filter_criteria.dart';
import 'package:real_estate_fe/models/property.dart';
import 'package:real_estate_fe/services/http_service.dart';

class PropertyService extends HttpService<List<Property>> {
  Future<void> fetchProperties({
    double? lat,
    double? lng,
    double? radius,
    double? minPrice,
    double? maxPrice,
    String? propertyCategory,
    String? transactionType,
    int? minBedrooms,
    int? minBathrooms,
    double? minSqm,
    String? status,
    DateTime? createdAfter,
    String? city,
    String? district,
    String? directionFacing,
    String? orderBy,
    String? orderDirection,
    bool forceRefresh = false,
  }) async {
    Map<String, dynamic> queryParameters = {
      if (lat != null) 'lat': lat,
      if (lng != null) 'lng': lng,
      if (radius != null) "radius": radius,
      if (minPrice != null) 'min_price': minPrice,
      if (maxPrice != null) 'max_price': maxPrice,
      if (propertyCategory != null) 'property_category': propertyCategory,
      if (transactionType != null) 'transaction_type': transactionType,
      if (minBedrooms != null) 'min_bedrooms': minBedrooms,
      if (minBathrooms != null) 'min_bathrooms': minBathrooms,
      if (minSqm != null) 'min_sqm': minSqm,
      if (status != null) 'status': status,
      if (createdAfter != null) 'created_after': createdAfter.toIso8601String(),
      if (city != null) 'city': city,
      if (district != null) 'district': district,
      if (directionFacing != null) 'direction_facing': directionFacing,
      if (orderBy != null) 'order_by': orderBy,
      if (orderDirection != null) 'order_direction': orderDirection,
    };

    await get(Api.property,
        queryParameters: queryParameters, forceRefresh: forceRefresh);
  }

  @override
  fromResponse(Response response) {
    return (response.data["items"] as List)
        .map((e) => Property.fromJson(e))
        .toList();
  }

  @override
  parser(Map<String, dynamic> hiveMap) {
    return (hiveMap["data"]["items"] as List)
        .map((e) => Property.fromJson(e))
        .toList();
  }
}
