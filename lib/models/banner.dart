import 'package:freezed_annotation/freezed_annotation.dart';

part 'banner.freezed.dart';
part 'banner.g.dart';

@freezed
class Banner with _$Banner {
  const factory Banner({
    required String id,
    required String title,
    required String content,
    required String url,
  }) = _Banner;

  factory Banner.fromJson(Map<String, dynamic> json) => _$BannerFromJson(json);
}
