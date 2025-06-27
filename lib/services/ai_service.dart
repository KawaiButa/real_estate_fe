import 'package:dio/src/response.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:real_estate_fe/app/app.locator.dart';
import 'package:real_estate_fe/constants/api.dart';
import 'package:real_estate_fe/models/property.dart';
import 'package:real_estate_fe/services/app_service.dart';
import 'package:real_estate_fe/services/http_service.dart';

class AiService extends HttpService<String> {
  final appService = locator<AppService>();
  Future<String> analyzeProperty(Property property) async {
    final response = await postWithFiles(Api.analyzeProperty, {
      "content":
          "#Analyze #${property.id} ${"What do you think about this property?".tr()}",
      "image_list": null,
      "save_message": false
    });
    data = response.data;
    return data ?? "";
  }

  @override
  String fromResponse(Response response) {
    return response.data;
  }

  @override
  String parser(Map<String, dynamic> hiveMap) {
    return hiveMap["data"] as String;
  }

  Future<String> compare(List<Property> properties) async {
    final response = await postWithFiles(Api.analyzeProperty, {
      "content":
          "#Compare ${properties.map((p) => '#${p.id}').join(' ')} ${"Compare these properties".tr()}",
      "image_list": null,
      "save_message": false
    });
    return response.data;
  }
}
