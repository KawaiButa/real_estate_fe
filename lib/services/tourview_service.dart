import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'package:real_estate_fe/constants/api.dart';
import 'package:real_estate_fe/models/tourview_room.dart';
import 'package:real_estate_fe/services/http_service.dart';

class TourviewService extends HttpService<TourviewRoom> {
  Future<TourviewRoom> createTourView(
      String propertyId, TourviewRoom room) async {
    final List<MultipartFile> multipartImages = await Future.wait(
      room.images.map((file) async => await MultipartFile.fromFile(
            file.path,
            filename: file.path.split('/').last,
          )),
    );

    FormData formData =
        FormData.fromMap({"image_list": multipartImages, "name": room.title});
    final response =
        await postWithFiles(Api.tourview(propertyId), {}, formData: formData);
    if (response.statusCode == 201) return room;
    throw Exception("Error when create property: ${response.statusMessage}");
  }

  @override
  TourviewRoom fromResponse(Response response) {
    // TODO: implement fromResponse
    throw UnimplementedError();
  }

  @override
  TourviewRoom parser(Map<String, dynamic> hiveMap) {
    // TODO: implement parser
    throw UnimplementedError();
  }
}
