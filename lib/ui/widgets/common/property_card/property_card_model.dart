import 'package:real_estate_fe/app/app.locator.dart';
import 'package:real_estate_fe/models/property.dart';
import 'package:real_estate_fe/services/favorite_service.dart';
import 'package:stacked/stacked.dart';

class PropertyCardModel extends BaseViewModel {
  final _favoriteService = locator<FavoriteService>();
  toggleFavorite(Property property) async {
    await _favoriteService.toggleFavorite(property.id);
  }
}
