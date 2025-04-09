import 'package:dio/dio.dart';
import 'package:real_estate_fe/constants/api.dart';
import 'package:real_estate_fe/models/banner.dart';
import 'package:real_estate_fe/services/http_service.dart';

class BannerService extends HttpService<List<Banner>> {
  Future<List<Banner>?> fetchBanner() async {
    return await get(Api.banners);
  }

  @override
  List<Banner> fromResponse(Response response) {
    return (response.data as List).map((e) => Banner.fromJson(e)).toList();
  }

  @override
  List<Banner> parser(Map<String, dynamic> hiveMap) {
    return (hiveMap["data"] as List).map((e) => Banner.fromJson(e)).toList();
  }
}
