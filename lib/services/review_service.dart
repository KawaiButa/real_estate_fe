import 'package:dio/src/response.dart';
import 'package:real_estate_fe/constants/api.dart';
import 'package:real_estate_fe/models/paginated_list.dart';
import 'package:real_estate_fe/models/paginated_metadata.dart';
import 'package:real_estate_fe/models/property.dart';
import 'package:real_estate_fe/models/review.dart';
import 'package:real_estate_fe/services/http_service.dart';
import 'package:real_estate_fe/ui/views/review/review_viewmodel.dart';

class ReviewService extends HttpService<PaginatedList<Review>> {
  Future<PaginatedList<Review>?> fetchPropertyReviews(
    String propertyId, {
    int page = 1,
    int limit = 10,
    bool? hasMediaFilter,
    int? scoreFilter,
    List<String>? tagsFilter,
    SortReviewBy? sortBy,
  }) async {
    return get(Api.review(propertyId),
        queryParameters: {
          "page": page,
          "page_size": limit,
          "score_filter": scoreFilter,
        },
        forceRefresh: true);
  }

  @override
  fromResponse(Response response) {
    return PaginatedList(
        data: (response.data["items"] as List)
            .map((e) => Review.fromJson(e))
            .toList(),
        metadata: PaginatedMetadata.fromJson(response.data));
  }

  @override
  parser(Map<String, dynamic> hiveMap) {
    return PaginatedList(
        data: (hiveMap["data"]["items"] as List)
            .map((e) => Review.fromJson(e))
            .toList(),
        metadata: PaginatedMetadata.fromJson(hiveMap["data"]));
  }

  List<String> getAvailableTags() {
    return [];
  }

  Future toggleHelpful(String reviewId, isMarkedHelpfulByCurrentUser) async {}

  Future postOwnerResponse(String reviewId, String text) async {}
}
