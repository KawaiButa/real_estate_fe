import 'package:dio/src/response.dart';
import 'package:real_estate_fe/constants/api.dart';
import 'package:real_estate_fe/models/location_post.dart';
import 'package:real_estate_fe/services/http_service.dart';

class LocationPostService extends HttpService<List<LocationPost>> {
  fetchLocationPost({String? type}) {
    get(Api.locationPost, queryParameters: {if (type != null) "type": type});
  }

  @override
  List<LocationPost> fromResponse(Response response) {
    return (response.data as List)
        .map((e) => LocationPost.fromJson(e))
        .toList();
  }

  @override
  List<LocationPost> parser(Map<String, dynamic> hiveMap) {
    return (hiveMap["data"] as List)
        .map((e) => LocationPost.fromJson(e))
        .toList();
  }
}
