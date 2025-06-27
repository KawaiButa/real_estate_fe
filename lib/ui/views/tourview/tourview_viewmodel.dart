import 'package:real_estate_fe/app/app.locator.dart';
import 'package:real_estate_fe/app/app.router.dart';
import 'package:real_estate_fe/models/image.dart';
import 'package:real_estate_fe/models/tourview.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class TourviewViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final List<Tourview> _tourRooms = [
    Tourview(
        id: "1",
        propertyId: "1",
        name: 'Grand Canyon Expedition',
        imageId: "1",
        createdAt: DateTime.now(),
        image: const Image(
            id: "1",
            url: 'https://source.unsplash.com/random/400x300?grandcanyon')),
    Tourview(
        id: "2",
        propertyId: "1",
        name: 'Parisian Dreams',
        imageId: "2",
        createdAt: DateTime.now(),
        image: const Image(
            id: "2", url: 'https://source.unsplash.com/random/400x300?paris')),
  ];

  List<Tourview> get tourRooms => _tourRooms;

  void createNewTour() {
    _navigationService.navigateToGuidePanoramaView();
  }

  void viewTour(Tourview room) {
    _navigationService.navigateToPanoramaViewView(url: "");
  }

  void deleteTour(Tourview room) {
    // TODO: Implement logic to delete the selected tour
    _tourRooms.remove(room);
    notifyListeners(); // Update the UI after deletion
    print('Delete Tour: ${room.name}');
  }
}
