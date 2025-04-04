import 'package:real_estate_fe/app/app.locator.dart';
import 'package:real_estate_fe/models/property.dart';
import 'package:real_estate_fe/services/auth_service.dart';
import 'package:stacked/stacked.dart';

class FavoriteViewModel extends ReactiveViewModel {
  final _authService = locator<AuthService>();
  List<Property>? get favoritesProperty => _authService.data?.favorites;
  bool _isGridView = true;
  bool get isGridView => _isGridView;

  @override
  List<ListenableServiceMixin> get listenableServices => [_authService];
  void toggleView() {
    _isGridView = !_isGridView;
    notifyListeners();
  }

  refresh() async {
    await _authService.fetchProfile();
  }

  void initialise() {
    _authService.fetchProfile();
  }
}
