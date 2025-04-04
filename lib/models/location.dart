import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'location.freezed.dart';

@freezed
class Location with _$Location {
  const factory Location({
    required LatLng point,
    String? address,
  }) = _Location;
}
