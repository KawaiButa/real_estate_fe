import 'package:freezed_annotation/freezed_annotation.dart';
part 'filter_criteria.freezed.dart';

@freezed
class FilterCriteria with _$FilterCriteria {
  const factory FilterCriteria({
    double? minPrice,
    double? maxPrice,
    String? propertyType,
    int? minBedrooms,
    int? minBathrooms,
    String? provinceCode,
    double? lat,
    double? lng,
    double? radius,
    double? minSqm,
    String? city,
    String? orderBy,
    String? orderDirection,
    bool? hasReview,
  }) = _FilterCriteria;
}
