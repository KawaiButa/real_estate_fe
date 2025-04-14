import 'package:real_estate_fe/app/app.router.dart';
import 'package:real_estate_fe/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:real_estate_fe/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();
  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    // await _authService.getUserFromLocalStorage();
    _navigationService.navigateToWelcomeView();
  }
}
