import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_post.freezed.dart';
part 'location_post.g.dart';

@freezed
class LocationPost with _$LocationPost {
  const factory LocationPost({
    required String id,
    required String name,
  }) = _LocationPost;

  factory LocationPost.fromJson(Map<String, dynamic> json) =>
      _$LocationPostFromJson(json);
}
