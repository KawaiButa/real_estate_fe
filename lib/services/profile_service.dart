import 'package:dio/dio.dart';
import 'package:real_estate_fe/constants/api.dart';
import 'package:real_estate_fe/models/user.dart';
import 'package:real_estate_fe/services/http_service.dart';

class ProfileService extends HttpService<User> {
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
