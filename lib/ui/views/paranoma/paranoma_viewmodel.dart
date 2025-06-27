import 'package:real_estate_fe/app/app.locator.dart';
import 'package:real_estate_fe/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ParanomaViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  void moveToVerticalCapture() {
    _navigationService.navigateToGuideVerticalView();
  }
}
