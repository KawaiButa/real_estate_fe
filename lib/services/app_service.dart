import 'package:real_estate_fe/app/app.locator.dart';
import 'package:real_estate_fe/app/app.router.dart';
import 'package:real_estate_fe/models/filter_criteria.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AppService with ListenableServiceMixin {
  int welcomeIndex = 0;
  FilterCriteria _currentFilters = const FilterCriteria(radius: 10);
  FilterCriteria get currentFilters => _currentFilters;
  final _navigationService = locator<NavigationService>();
  bool get isWelcome => _navigationService.currentRoute == Routes.welcomeView;
  AppService() {
    listenToReactiveValues([welcomeIndex]);
  }

  changeIndex(int index) {
    welcomeIndex = index;
    notifyListeners();
  }

  changeFilter(FilterCriteria filter) {
    _currentFilters = filter;
    notifyListeners();
  }
}
