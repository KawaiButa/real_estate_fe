import 'package:real_estate_fe/app/app.locator.dart';
import 'package:real_estate_fe/models/property.dart';
import 'package:real_estate_fe/services/auth_service.dart';
import 'package:stacked/stacked.dart';

class PropertyCardModel extends BaseViewModel {
  final _authService = locator<AuthService>();
  toggleFavorite(Property property) async {
    await _authService.toggleFavorite(property.id);
  }
}
