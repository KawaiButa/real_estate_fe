import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'package:real_estate_fe/app/app.locator.dart';
import 'package:real_estate_fe/constants/api.dart';
import 'package:real_estate_fe/models/partner_registration.dart';
import 'package:real_estate_fe/services/auth_service.dart';
import 'package:real_estate_fe/services/http_service.dart';

class PartnerRegistrationService extends HttpService<PartnerRegistration> {
  final authService = locator<AuthService>();

  Future<PartnerRegistration> register(FormData formData) async {
    final response =
        await postWithFiles(Api.partnerRegistration, {}, formData: formData);
    if (response.statusCode != 201) {
      throw Exception("Error when update the data ${response.statusMessage}");
    }
    return PartnerRegistration.fromJson(response.data);
  }

  @override
  PartnerRegistration fromResponse(Response response) {
    // TODO: implement fromResponse
    throw UnimplementedError();
  }

  @override
  PartnerRegistration parser(Map<String, dynamic> hiveMap) {
    // TODO: implement parser
    throw UnimplementedError();
  }
}
