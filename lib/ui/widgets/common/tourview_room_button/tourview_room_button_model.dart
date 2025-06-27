import 'package:real_estate_fe/app/app.locator.dart';
import 'package:real_estate_fe/models/tourview_room.dart';
import 'package:real_estate_fe/services/tourview_service.dart';
import 'package:stacked/stacked.dart';

class TourviewRoomButtonModel extends BaseViewModel {
  final _tourviewService = locator<TourviewService>();
  requestNewTourView(TourviewRoom room) {}
}
