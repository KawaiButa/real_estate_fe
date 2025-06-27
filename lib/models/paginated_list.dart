import 'package:real_estate_fe/models/paginated_metadata.dart';

class PaginatedList<T> {
  PaginatedList({required this.data, required this.metadata});
  final PaginatedMetadata metadata;
  final List<T> data;

  int get page => (metadata.offset / metadata.limit).ceil() + 1;
  bool get hasNextPage => page * metadata.limit < metadata.total;
}
