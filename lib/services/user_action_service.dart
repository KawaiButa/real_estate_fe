import 'package:dio/src/response.dart';
import 'package:real_estate_fe/app/app.locator.dart';
import 'package:real_estate_fe/constants/api.dart';
import 'package:real_estate_fe/models/user_action.dart';
import 'package:real_estate_fe/services/auth_service.dart';
import 'package:real_estate_fe/services/http_service.dart';

class UserActionService extends HttpService<UserAction> {
  final _authService = locator<AuthService>();
  Future<UserAction> createAction({
    required String propertyId,
    required String type,
  }) async {
    final currentUser = _authService.data;
    final response = await post(Api.action, {
      "property_id": propertyId,
      "type": type,
      if (currentUser != null) "user_id": currentUser.id
    });
    if (response.statusCode == 201) return UserAction.fromJson(response.data);
    throw Exception("Error when create user action");
  }

  @override
  fromResponse(Response response) {
    return UserAction.fromJson(response.data);
  }

  @override
  parser(Map<String, dynamic> hiveMap) {
    return UserAction.fromJson(hiveMap["data"]);
  }
}
