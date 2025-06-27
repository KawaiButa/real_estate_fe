import 'package:dartx/dartx.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:real_estate_fe/app/app.bottomsheets.dart';
import 'package:real_estate_fe/app/app.dialogs.dart';
import 'package:real_estate_fe/app/app.locator.dart';
import 'package:real_estate_fe/app/app.router.dart';
import 'package:real_estate_fe/models/filter_criteria.dart';
import 'package:real_estate_fe/models/location.dart';
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
  final _navigationService = locator<NavigationService>();
  final TextEditingController searchController = TextEditingController();
  ScrollController scrollController = ScrollController();
  List<Property> properties = [];
  bool _isGridView = true;
  FilterCriteria get filter => _appService.currentFilters;
  Location? selectedLocation;
  @override
  List<ListenableServiceMixin> get listenableServices =>
      [_propertyService, _locationService];
  bool get isGridView => _isGridView;
  bool isLoadMore = false;
  List<String> provinces = [];
  final RefreshController refreshController = RefreshController();

  Future<void> initialise({
    String? query,
    PropertyType? type,
  }) async {
    try {
      setBusy(true);
      if (_appService.currentFilters.city == null) {
        if (_locationService.currentPosition == null) {
          await _locationService.getCurrentLocation(autoSave: true);
        }
        selectedLocation = Location(
            point: _locationService.currentPosition!,
            address: _locationService.currentAddress);
        _appService.changeFilter(_appService.currentFilters.copyWith(
          lat: selectedLocation?.point.latitude,
          lng: selectedLocation?.point.longitude,
        ));
      } else {
        _appService.changeFilter(
            FilterCriteria(city: _appService.currentFilters.city));
      }
    } finally {
      setBusy(false);
      notifyListeners();
    }
    performSearch();
  }

  void toggleView() {
    _isGridView = !_isGridView;
    notifyListeners();
  }

  Future<void> performSearch({bool initial = true}) async {
    refreshController.refreshCompleted();
    if (initial) {
      setBusyForObject(properties, true);
      properties.clear();
    } else {
      isLoadMore = true;
    }
    try {
      final result = await _propertyService.fetchProperties(
          minSqm: filter.minSqm,
          minPrice: filter.minPrice,
          maxPrice: filter.maxPrice,
          radius: filter.radius,
          lat: filter.lat,
          lng: filter.lng,
          page: initial ? 1 : (_propertyService.data?.page ?? 0) + 1,
          minBathrooms: filter.minBathrooms,
          city: filter.city,
          orderBy: filter.orderBy,
          orderDirection: filter.orderDirection,
          propertyCategory: filter.propertyType,
          hasReview: filter.hasReview,
          forceRefresh: initial);
      properties.addAll(result?.data ?? []);
    } catch (e) {
      if (kDebugMode) rethrow;
    } finally {
      setBusyForObject(properties, false);
    }
  }

  void showFilterSheet() async {
    _bottomSheetService
        .showCustomSheet(
      variant: BottomSheetType.filter,
      title: 'Bộ lọc tìm kiếm',
      description: 'Áp dụng các bộ lọc để thu hẹp kết quả',
      data: filter,
      isScrollControlled: true,
    )
        .then((result) {
      if (result != null && result.confirmed) {
        _appService.changeFilter(result.data);
        performSearch();
      }
    });
  }

  showMapSheet() {
    _dialogService
        .showCustomDialog(
            variant: DialogType.map, title: "Select location".tr(), data: true)
        .then((result) {
      if (result != null) {
        final location = result.data["location"] as Location;
        final radius = result.data["radius"] as double;
        _appService.changeFilter(filter.copyWith(
            lat: location.point.latitude,
            lng: location.point.longitude,
            radius: radius));
        selectedLocation = location;
        performSearch();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  getCurrentLocation() => _locationService.getCurrentLocation();

  void onProvinceChanged(String? newValue) {}

  void changeSelectedLocation(TapPosition tapPosition, LatLng point) =>
      _locationService.changeSelectedLocation(point);

  navigateToPropertyDetail(Property property) {
    _navigationService.navigateToPropertyDetailView(property: property);
  }
}
