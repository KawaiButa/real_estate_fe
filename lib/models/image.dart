import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'image.freezed.dart';
part 'image.g.dart';

@freezed
@HiveType(typeId: 4)
class Image with _$Image {
  const factory Image({
    @HiveField(0) required String id,
    @HiveField(1) required String url,
  }) = _Image;

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
}
