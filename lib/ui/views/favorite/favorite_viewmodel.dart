import 'package:real_estate_fe/app/app.locator.dart';
import 'package:real_estate_fe/models/property.dart';
import 'package:real_estate_fe/models/user.dart';
import 'package:real_estate_fe/services/auth_service.dart';
import 'package:real_estate_fe/services/favorite_service.dart';
import 'package:stacked/stacked.dart';

class FavoriteViewModel extends ReactiveViewModel {
  final _favoriteService = locator<FavoriteService>();
  List<Property> favoritesProperty = [];
  bool _isGridView = true;
  bool get isGridView => _isGridView;
  bool get isLoggedIn => AuthService.currentUser != null;

  @override
  List<ListenableServiceMixin> get listenableServices => [_favoriteService];
  void toggleView() {
    _isGridView = !_isGridView;
    notifyListeners();
  }

  fetchFavoredProperty({bool initial = false}) async {
    final response = await _favoriteService.fetchFavoredProperty(
        page: initial ? _favoriteService.data?.page ?? 1 : 1);
    if (response == null) return;
    if (initial) {
      favoritesProperty.clear();
    }
    favoritesProperty.addAll(response.data);
  }

  void initialise() {
    fetchFavoredProperty(initial: true);
  }
}
