import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:real_estate_fe/app/app.bottomsheets.dart';
import 'package:real_estate_fe/app/app.dialogs.dart';
import 'package:real_estate_fe/app/app.locator.dart';
import 'package:real_estate_fe/models/filter_criteria.dart';
import 'package:real_estate_fe/models/property.dart';
import 'package:real_estate_fe/models/property_type.dart';
import 'package:real_estate_fe/services/app_service.dart';
import 'package:real_estate_fe/services/location_service.dart';
import 'package:real_estate_fe/services/property_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SearchViewModel extends ReactiveViewModel {
  final _bottomSheetService = locator<BottomSheetService>();
  final _dialogService = locator<DialogService>();
  final _propertyService = locator<PropertyService>();
  final _locationService = locator<LocationService>();
  final _appService = locator<AppService>();
  final TextEditingController searchController = TextEditingController();

  List<Property>? get properties => _propertyService.data;
  bool _isGridView = true;
  FilterCriteria get filter => _appService.currentFilters;
  @override
  List<ListenableServiceMixin> get listenableServices =>
      [_propertyService, _locationService];
  bool get isGridView => _isGridView;

  List<String> provinces = [];

  void initialise({
    String? query,
    PropertyType? type,
  }) {
    _locationService.getVietnameseProvinces();
    performSearch();
  }

  void toggleView() {
    _isGridView = !_isGridView;
    notifyListeners();
  }

  Future<void> performSearch() async {
    setBusyForObject(properties, true);
    try {
      await _propertyService.fetchProperties(
        minSqm: filter.minSqm,
        minPrice: filter.minPrice,
        maxPrice: filter.maxPrice,
        radius: filter.radius,
        lat: filter.lat,
        lng: filter.lng,
        minBathrooms: filter.minBathrooms,
        city: filter.city,
        orderBy: filter.orderBy,
        orderDirection: filter.orderDirection,
        propertyCategory: filter.propertyType,
      );
    } catch (e) {
      // Handle error
    } finally {
      setBusyForObject(properties, false);
      notifyListeners();
    }
  }

  void showFilterSheet() async {
    _bottomSheetService
        .showCustomSheet(
      variant: BottomSheetType.filter,
      title: 'Bộ lọc tìm kiếm',
      description: 'Áp dụng các bộ lọc để thu hẹp kết quả',
      data: filter,
    )
        .then((result) {
      if (result != null && result.confirmed) {
        _appService.changeFilter(result.data as FilterCriteria);
        performSearch();
      }
    });
  }

  showMapSheet() {
    _dialogService
        .showCustomDialog(
            variant: DialogType.map, title: "Select location".tr())
        .then((result) => performSearch());
  }

  getCurrentLocation() => _locationService.getCurrentLocation();

  void onProvinceChanged(String? newValue) {}

  void changeSelectedLocation(TapPosition tapPosition, LatLng point) =>
      _locationService.changeSelectedLocation(point);
}
